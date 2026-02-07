	TITLE	loop.c
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
PUBLIC	_loop_optimize
EXTRN	_init_recog:NEAR
EXTRN	_max_reg_num:NEAR
EXTRN	_alloca:NEAR
EXTRN	_memset:NEAR
EXTRN	_fprintf:NEAR
_BSS	SEGMENT
_max_uid$S768 DD 01H DUP (?)
_max_luid$S769 DD 01H DUP (?)
_moved_once$S778 DD 01H DUP (?)
_old_max_reg$S785 DD 01H DUP (?)
_loop_dump_stream$S787 DD 01H DUP (?)
_uid_luid$S767 DD 01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
$SG863	DB	0aH, 'Loop at %d ignored due to multiple entry points.', 0aH
	DB	00H
_DATA	ENDS
_TEXT	SEGMENT
; File loop.c
_end$ = -8
_last_insn$ = -12
_f$ = 8
_dumpfile$ = 12
_insn$ = -4
_i$ = -16
_loop_optimize PROC NEAR
; Line 249
	push	ebp
	mov	ebp, esp
	sub	esp, 16					; 00000010H
	push	ebx
	push	esi
	push	edi
; Line 255
	mov	eax, DWORD PTR _dumpfile$[ebp]
	mov	DWORD PTR _loop_dump_stream$S787, eax
; Line 257
	call	_init_recog
; Line 259
	call	_max_reg_num
	mov	DWORD PTR _old_max_reg$S785, eax
; Line 261
	mov	eax, DWORD PTR _old_max_reg$S785
	push	eax
	call	_alloca
	add	esp, 4
	mov	DWORD PTR _moved_once$S778, eax
; Line 262
	mov	eax, DWORD PTR _old_max_reg$S785
	push	eax
	push	0
	mov	eax, DWORD PTR _moved_once$S778
	push	eax
	call	_memset
	add	esp, 12					; 0000000cH
; Line 267
	mov	eax, DWORD PTR _f$[ebp]
	mov	DWORD PTR _insn$[ebp], eax
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L838
$L839:
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	DWORD PTR _insn$[ebp], eax
$L838:
	cmp	DWORD PTR _insn$[ebp], 0
	je	$L840
; Line 268
	mov	eax, DWORD PTR _insn$[ebp]
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	DWORD PTR [eax+4], ecx
	jle	$L841
; Line 269
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _i$[ebp], eax
; Line 271
$L841:
	jmp	$L839
$L840:
	mov	eax, DWORD PTR _i$[ebp]
	inc	eax
	mov	DWORD PTR _max_uid$S768, eax
; Line 272
	mov	eax, DWORD PTR _i$[ebp]
	lea	eax, DWORD PTR [eax*4+4]
	push	eax
	call	_alloca
	add	esp, 4
	mov	DWORD PTR _uid_luid$S767, eax
; Line 273
	mov	eax, DWORD PTR _i$[ebp]
	lea	eax, DWORD PTR [eax*4+4]
	push	eax
	push	0
	mov	eax, DWORD PTR _uid_luid$S767
	push	eax
	call	_memset
	add	esp, 12					; 0000000cH
; Line 281
	mov	eax, DWORD PTR _f$[ebp]
	mov	DWORD PTR _insn$[ebp], eax
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L842
$L843:
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	DWORD PTR _insn$[ebp], eax
$L842:
	cmp	DWORD PTR _insn$[ebp], 0
	je	$L844
; Line 283
	mov	eax, DWORD PTR _insn$[ebp]
	mov	DWORD PTR _last_insn$[ebp], eax
; Line 285
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1179648				; 00120000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L846
	mov	eax, DWORD PTR _insn$[ebp]
	cmp	DWORD PTR [eax+20], 0
	jge	$L845
$L846:
; Line 286
	inc	DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _insn$[ebp]
	mov	ecx, DWORD PTR [ecx+4]
	mov	edx, DWORD PTR _uid_luid$S767
	mov	DWORD PTR [edx+ecx*4], eax
; Line 287
	jmp	$L847
$L845:
; Line 289
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _insn$[ebp]
	mov	ecx, DWORD PTR [ecx+4]
	mov	edx, DWORD PTR _uid_luid$S767
	mov	DWORD PTR [edx+ecx*4], eax
$L847:
; Line 290
	jmp	$L843
$L844:
; Line 292
	mov	eax, DWORD PTR _i$[ebp]
	mov	DWORD PTR _max_luid$S769, eax
; Line 299
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L848
$L849:
	inc	DWORD PTR _i$[ebp]
$L848:
	mov	eax, DWORD PTR _max_uid$S768
	cmp	DWORD PTR _i$[ebp], eax
	jge	$L850
; Line 301
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _uid_luid$S767
	mov	eax, DWORD PTR [ecx+eax*4]
	mov	ecx, DWORD PTR _uid_luid$S767
	mov	DWORD PTR [ecx], eax
; Line 302
	mov	eax, DWORD PTR _uid_luid$S767
	cmp	DWORD PTR [eax], 0
	je	$L851
; Line 303
	jmp	$L850
; Line 304
$L851:
	jmp	$L849
$L850:
; Line 305
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L852
$L853:
	inc	DWORD PTR _i$[ebp]
$L852:
	mov	eax, DWORD PTR _max_uid$S768
	cmp	DWORD PTR _i$[ebp], eax
	jge	$L854
; Line 306
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _uid_luid$S767
	cmp	DWORD PTR [ecx+eax*4], 0
	jne	$L855
; Line 307
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _uid_luid$S767
	mov	eax, DWORD PTR [ecx+eax*4-4]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _uid_luid$S767
	mov	DWORD PTR [edx+ecx*4], eax
; Line 313
$L855:
	jmp	$L853
$L854:
	mov	eax, DWORD PTR _last_insn$[ebp]
	mov	DWORD PTR _insn$[ebp], eax
	jmp	$L856
$L857:
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _insn$[ebp], eax
$L856:
	cmp	DWORD PTR _insn$[ebp], 0
	je	$L858
; Line 315
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1179648				; 00120000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L859
	mov	eax, DWORD PTR _insn$[ebp]
	cmp	DWORD PTR [eax+20], -4			; fffffffcH
	jne	$L859
; Line 318
	mov	eax, DWORD PTR _insn$[ebp]
	push	eax
	mov	eax, DWORD PTR _f$[ebp]
	push	eax
	call	_verify_loop
	add	esp, 8
	mov	DWORD PTR _end$[ebp], eax
; Line 319
	cmp	DWORD PTR _end$[ebp], 0
	je	$L860
; Line 321
	call	_max_reg_num
	push	eax
	mov	eax, DWORD PTR _end$[ebp]
	push	eax
	mov	eax, DWORD PTR _insn$[ebp]
	push	eax
	call	_scan_loop
	add	esp, 12					; 0000000cH
; Line 322
	jmp	$L861
$L860:
	cmp	DWORD PTR _loop_dump_stream$S787, 0
	je	$L862
; Line 325
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	push	OFFSET $SG863
	mov	eax, DWORD PTR _loop_dump_stream$S787
	push	eax
	call	_fprintf
	add	esp, 12					; 0000000cH
; Line 326
$L862:
$L861:
; Line 327
$L859:
	jmp	$L857
$L858:
$L829:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_loop_optimize ENDP
_TEXT	ENDS
PUBLIC	_loop_skip_over
EXTRN	_regno_first_uid:DWORD
EXTRN	_regno_last_uid:DWORD
EXTRN	_abort:NEAR
EXTRN	_flag_strength_reduce:DWORD
EXTRN	_memcpy:NEAR
EXTRN	_const0_rtx:DWORD
EXTRN	_may_trap_p:NEAR
EXTRN	_reg_mentioned_p:NEAR
EXTRN	_simplejump_p:NEAR
_BSS	SEGMENT
_loop_has_call$S773 DD 01H DUP (?)
_loop_continue$S774 DD 01H DUP (?)
_n_times_set$S775 DD 01H DUP (?)
_n_times_used$S776 DD 01H DUP (?)
_may_not_optimize$S777 DD 01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
	ORG $+1
$SG894	DB	0aH, 'Loop from %d to %d is phony.', 0aH, 0aH, 00H
$SG908	DB	0aH, 'Loop from %d to %d: %d real insns.', 0aH, 00H
	ORG $+3
$SG910	DB	'Continue at insn %d.', 0aH, 00H
_DATA	ENDS
_TEXT	SEGMENT
_tem1$920 = -60
_loop_start$ = 8
_end$ = 12
_nregs$ = 16
_i$ = -40
_m$933 = -72
_p$ = -56
_regno$934 = -68
_maybe_never$ = -12
_call_passed$ = -16
_loop_top$ = -20
_loop_entry_jump$ = -8
_scan_start$ = -32
_insn_count$ = -28
_tem$ = -24
_temp$ = -4
_movables$ = -52
_last_movable$ = -36
_regno$944 = -76
_threshold$ = -48
_something_before_entry_jump$ = -44
_m$946 = -84
_scan_loop PROC NEAR
; Line 340
	push	ebp
	mov	ebp, esp
	sub	esp, 88					; 00000058H
	push	ebx
	push	esi
	push	edi
; Line 342
	mov	eax, DWORD PTR _loop_start$[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	DWORD PTR _p$[ebp], eax
; Line 344
	mov	DWORD PTR _maybe_never$[ebp], 0
; Line 347
	mov	DWORD PTR _call_passed$[ebp], 0
; Line 350
	mov	DWORD PTR _loop_top$[ebp], 0
; Line 352
	mov	DWORD PTR _loop_entry_jump$[ebp], 0
; Line 360
	mov	DWORD PTR _movables$[ebp], 0
; Line 362
	mov	DWORD PTR _last_movable$[ebp], 0
; Line 367
	cmp	DWORD PTR _loop_has_call$S773, 1
	sbb	eax, eax
	and	eax, 15					; 0000000fH
	add	eax, 15					; 0000000fH
	mov	DWORD PTR _threshold$[ebp], eax
; Line 370
	mov	DWORD PTR _something_before_entry_jump$[ebp], 0
; Line 372
	mov	eax, DWORD PTR _nregs$[ebp]
	add	eax, eax
	push	eax
	call	_alloca
	add	esp, 4
	mov	DWORD PTR _n_times_set$S775, eax
; Line 373
	mov	eax, DWORD PTR _nregs$[ebp]
	add	eax, eax
	push	eax
	call	_alloca
	add	esp, 4
	mov	DWORD PTR _n_times_used$S776, eax
; Line 374
	mov	eax, DWORD PTR _nregs$[ebp]
	push	eax
	call	_alloca
	add	esp, 4
	mov	DWORD PTR _may_not_optimize$S777, eax
; Line 379
$L883:
	mov	eax, DWORD PTR _end$[ebp]
	cmp	DWORD PTR _p$[ebp], eax
	je	$L884
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1114112				; 00110000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L884
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 917504				; 000e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L884
; Line 381
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 983040				; 000f0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L886
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 851968				; 000d0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L885
$L886:
; Line 382
	mov	DWORD PTR _something_before_entry_jump$[ebp], 1
; Line 383
$L885:
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	DWORD PTR _p$[ebp], eax
; Line 384
	jmp	$L883
$L884:
; Line 388
	mov	eax, DWORD PTR _end$[ebp]
	cmp	DWORD PTR _p$[ebp], eax
	jne	$L887
; Line 389
	jmp	$L867
; Line 391
$L887:
	mov	eax, DWORD PTR _p$[ebp]
	mov	DWORD PTR _scan_start$[ebp], eax
; Line 398
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 917504				; 000e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L888
; Line 400
	mov	eax, DWORD PTR _p$[ebp]
	mov	DWORD PTR _loop_entry_jump$[ebp], eax
; Line 401
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	DWORD PTR _loop_top$[ebp], eax
; Line 406
	mov	eax, DWORD PTR _loop_top$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1048576				; 00100000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L890
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1638400				; 00190000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L889
$L890:
; Line 407
	jmp	$L867
; Line 409
$L889:
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _p$[ebp], eax
; Line 416
	cmp	DWORD PTR _p$[ebp], 0
	je	$L892
	mov	eax, DWORD PTR _loop_start$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _uid_luid$S767
	mov	edx, DWORD PTR _p$[ebp]
	mov	edx, DWORD PTR [edx+4]
	mov	ebx, DWORD PTR _uid_luid$S767
	mov	edx, DWORD PTR [ebx+edx*4]
	cmp	DWORD PTR [ecx+eax*4], edx
	jg	$L892
	mov	eax, DWORD PTR _end$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _uid_luid$S767
	mov	edx, DWORD PTR _p$[ebp]
	mov	edx, DWORD PTR [edx+4]
	mov	ebx, DWORD PTR _uid_luid$S767
	mov	edx, DWORD PTR [ebx+edx*4]
	cmp	DWORD PTR [ecx+eax*4], edx
	jg	$L891
$L892:
; Line 418
	cmp	DWORD PTR _loop_dump_stream$S787, 0
	je	$L893
; Line 420
	mov	eax, DWORD PTR _end$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	mov	eax, DWORD PTR _loop_start$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	push	OFFSET $SG894
	mov	eax, DWORD PTR _loop_dump_stream$S787
	push	eax
	call	_fprintf
	add	esp, 16					; 00000010H
; Line 421
$L893:
	jmp	$L867
; Line 425
$L891:
$L896:
	mov	eax, DWORD PTR _loop_top$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1114112				; 00110000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L897
; Line 427
	mov	eax, DWORD PTR _loop_top$[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	DWORD PTR _loop_top$[ebp], eax
; Line 428
	cmp	DWORD PTR _loop_top$[ebp], 0
	jne	$L898
; Line 429
	call	_abort
; Line 430
$L898:
	jmp	$L896
$L897:
; Line 437
	cmp	DWORD PTR _something_before_entry_jump$[ebp], 0
	jne	$L901
	mov	eax, DWORD PTR _loop_entry_jump$[ebp]
	push	eax
	mov	eax, DWORD PTR _end$[ebp]
	push	eax
	mov	eax, DWORD PTR _loop_start$[ebp]
	push	eax
	call	_loop_skip_over
	add	esp, 12					; 0000000cH
	or	eax, eax
	je	$L901
; Line 439
	mov	eax, DWORD PTR _loop_top$[ebp]
	mov	DWORD PTR _scan_start$[ebp], eax
; Line 440
	mov	DWORD PTR _loop_top$[ebp], 0
; Line 442
	jmp	$L902
$L901:
; Line 445
	mov	eax, DWORD PTR _p$[ebp]
	mov	DWORD PTR _scan_start$[ebp], eax
$L902:
; Line 452
$L888:
	mov	eax, DWORD PTR _nregs$[ebp]
	add	eax, eax
	push	eax
	push	0
	mov	eax, DWORD PTR _n_times_set$S775
	push	eax
	call	_memset
	add	esp, 12					; 0000000cH
; Line 453
	mov	eax, DWORD PTR _nregs$[ebp]
	push	eax
	push	0
	mov	eax, DWORD PTR _may_not_optimize$S777
	push	eax
	call	_memset
	add	esp, 12					; 0000000cH
; Line 455
	cmp	DWORD PTR _loop_top$[ebp], 0
	je	$L2536
	mov	eax, DWORD PTR _loop_top$[ebp]
	mov	DWORD PTR -88+[ebp], eax
	jmp	$L2537
$L2536:
	mov	eax, DWORD PTR _loop_start$[ebp]
	mov	DWORD PTR -88+[ebp], eax
$L2537:
	mov	eax, DWORD PTR _nregs$[ebp]
	push	eax
	lea	eax, DWORD PTR _insn_count$[ebp]
	push	eax
	mov	eax, DWORD PTR _may_not_optimize$S777
	push	eax
	mov	eax, DWORD PTR _end$[ebp]
	push	eax
	mov	eax, DWORD PTR -88+[ebp]
	push	eax
	call	_count_loop_regs_set
	add	esp, 20					; 00000014H
; Line 456
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L903
$L904:
	inc	DWORD PTR _i$[ebp]
$L903:
	cmp	DWORD PTR _i$[ebp], 10			; 0000000aH
	jge	$L905
; Line 457
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _may_not_optimize$S777
	mov	BYTE PTR [eax+ecx], 1
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _n_times_set$S775
	mov	WORD PTR [ecx+eax*2], 1
	jmp	$L904
$L905:
; Line 458
	mov	eax, DWORD PTR _nregs$[ebp]
	add	eax, eax
	push	eax
	mov	eax, DWORD PTR _n_times_set$S775
	push	eax
	mov	eax, DWORD PTR _n_times_used$S776
	push	eax
	call	_memcpy
	add	esp, 12					; 0000000cH
; Line 460
	cmp	DWORD PTR _loop_dump_stream$S787, 0
	je	$L907
; Line 463
	mov	eax, DWORD PTR _insn_count$[ebp]
	push	eax
	mov	eax, DWORD PTR _end$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	mov	eax, DWORD PTR _loop_start$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	push	OFFSET $SG908
	mov	eax, DWORD PTR _loop_dump_stream$S787
	push	eax
	call	_fprintf
	add	esp, 20					; 00000014H
; Line 464
	cmp	DWORD PTR _loop_continue$S774, 0
	je	$L909
; Line 466
	mov	eax, DWORD PTR _loop_continue$S774
	mov	eax, DWORD PTR [eax+4]
	push	eax
	push	OFFSET $SG910
	mov	eax, DWORD PTR _loop_dump_stream$S787
	push	eax
	call	_fprintf
	add	esp, 12					; 0000000cH
; Line 467
$L909:
; Line 483
$L907:
	mov	eax, DWORD PTR _scan_start$[ebp]
	mov	DWORD PTR _p$[ebp], eax
; Line 484
$L912:
; Line 486
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	DWORD PTR _p$[ebp], eax
; Line 489
	mov	eax, DWORD PTR _scan_start$[ebp]
	cmp	DWORD PTR _p$[ebp], eax
	jne	$L914
; Line 490
	jmp	$L913
; Line 491
$L914:
	mov	eax, DWORD PTR _end$[ebp]
	cmp	DWORD PTR _p$[ebp], eax
	jne	$L915
; Line 493
	cmp	DWORD PTR _loop_top$[ebp], 0
	je	$L916
; Line 494
	mov	eax, DWORD PTR _loop_top$[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	DWORD PTR _p$[ebp], eax
; Line 495
	jmp	$L917
$L916:
; Line 496
	jmp	$L913
$L917:
; Line 497
	mov	eax, DWORD PTR _scan_start$[ebp]
	cmp	DWORD PTR _p$[ebp], eax
	jne	$L918
; Line 498
	jmp	$L913
; Line 499
$L918:
; Line 500
$L915:
; Line 503
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 851968				; 000d0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L919
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1638400				; 00190000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L919
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L919
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _may_not_optimize$S777
	movsx	eax, BYTE PTR [eax+ecx]
	or	eax, eax
	jne	$L919
; Line 505
	mov	DWORD PTR _tem1$920[ebp], 0
; Line 509
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _old_max_reg$S785
	cmp	DWORD PTR [eax+4], ecx
	jl	$L921
; Line 516
	jmp	$L922
$L921:
; Line 519
	cmp	DWORD PTR _maybe_never$[ebp], 0
	jne	$L924
	mov	eax, DWORD PTR _end$[ebp]
	push	eax
	mov	eax, DWORD PTR _scan_start$[ebp]
	push	eax
	mov	eax, DWORD PTR _loop_start$[ebp]
	push	eax
	mov	eax, DWORD PTR _p$[ebp]
	push	eax
	call	_loop_reg_used_before_p
	add	esp, 16					; 00000010H
	or	eax, eax
	je	$L923
$L924:
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shr	eax, 27					; 0000001bH
	test	al, 1
	je	$L923
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	mov	eax, DWORD PTR _p$[ebp]
	push	eax
	call	_reg_in_basic_block_p
	add	esp, 8
	or	eax, eax
	jne	$L923
; Line 521
	jmp	$L925
$L923:
; Line 537
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	call	_invariant_p
	add	esp, 4
	mov	DWORD PTR _tem$[ebp], eax
	cmp	DWORD PTR _tem$[ebp], 0
	jne	$L928
	mov	eax, DWORD PTR _p$[ebp]
	push	eax
	call	_loop_find_reg_equal
	add	esp, 4
	mov	DWORD PTR _temp$[ebp], eax
	cmp	DWORD PTR _temp$[ebp], 0
	je	$L927
	mov	eax, DWORD PTR _temp$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	call	_invariant_p
	add	esp, 4
	mov	DWORD PTR _tem$[ebp], eax
	cmp	DWORD PTR _tem$[ebp], 0
	je	$L927
$L928:
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _n_times_set$S775
	movsx	eax, WORD PTR [ecx+eax*2]
	cmp	eax, 1
	je	$L929
	mov	eax, DWORD PTR _p$[ebp]
	push	eax
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _n_times_set$S775
	movsx	eax, WORD PTR [ecx+eax*2]
	push	eax
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	call	_consec_sets_invariant_p
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _tem1$920[ebp], eax
	cmp	DWORD PTR _tem1$920[ebp], 0
	je	$L927
$L929:
	cmp	DWORD PTR _maybe_never$[ebp], 0
	jne	$L931
	cmp	DWORD PTR _call_passed$[ebp], 0
	je	$L930
$L931:
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	call	_may_trap_p
	add	esp, 4
	or	eax, eax
	jne	$L927
	mov	eax, DWORD PTR _p$[ebp]
	push	eax
	call	_loop_find_reg_equal
	add	esp, 4
	mov	DWORD PTR _temp$[ebp], eax
	cmp	DWORD PTR _temp$[ebp], 0
	je	$L932
	mov	eax, DWORD PTR _temp$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	call	_may_trap_p
	add	esp, 4
	or	eax, eax
	jne	$L927
$L932:
$L930:
; Line 540
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _regno$934[ebp], eax
; Line 542
	push	40					; 00000028H
	call	_alloca
	add	esp, 4
	mov	DWORD PTR _m$933[ebp], eax
; Line 543
	mov	eax, DWORD PTR _m$933[ebp]
	mov	DWORD PTR [eax+36], 0
; Line 544
	mov	eax, DWORD PTR _p$[ebp]
	mov	ecx, DWORD PTR _m$933[ebp]
	mov	DWORD PTR [ecx], eax
; Line 545
	mov	eax, DWORD PTR _p$[ebp]
	push	eax
	call	_loop_find_reg_equal
	add	esp, 4
	mov	DWORD PTR _temp$[ebp], eax
; Line 546
	cmp	DWORD PTR _temp$[ebp], 0
	je	$L936
; Line 547
	mov	eax, DWORD PTR _temp$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _m$933[ebp]
	mov	DWORD PTR [ecx+4], eax
; Line 548
	jmp	$L937
$L936:
; Line 549
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax+8]
	mov	ecx, DWORD PTR _m$933[ebp]
	mov	DWORD PTR [ecx+4], eax
$L937:
; Line 550
	mov	eax, DWORD PTR _m$933[ebp]
	and	DWORD PTR [eax+20], -3			; fffffffdH
; Line 551
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _n_times_set$S775
	movsx	eax, WORD PTR [ecx+eax*2]
	dec	eax
	mov	ecx, DWORD PTR _m$933[ebp]
	mov	DWORD PTR [ecx+8], eax
; Line 552
	mov	eax, DWORD PTR _m$933[ebp]
	and	DWORD PTR [eax+20], -9			; fffffff7H
; Line 553
	mov	eax, DWORD PTR _m$933[ebp]
	mov	DWORD PTR [eax+32], 0
; Line 554
	mov	eax, DWORD PTR _m$933[ebp]
	and	DWORD PTR [eax+20], -17			; ffffffefH
; Line 555
	mov	eax, DWORD PTR _m$933[ebp]
	mov	DWORD PTR [eax+24], 0
; Line 556
	mov	eax, DWORD PTR _regno$934[ebp]
	mov	ecx, DWORD PTR _m$933[ebp]
	mov	DWORD PTR [ecx+12], eax
; Line 559
	mov	eax, DWORD PTR _tem1$920[ebp]
	or	eax, DWORD PTR _tem$[ebp]
	cmp	eax, 1
	mov	eax, 0
	setg	al
	and	eax, 1
	mov	ecx, DWORD PTR _m$933[ebp]
	mov	ecx, DWORD PTR [ecx+20]
	and	ecx, -2					; fffffffeH
	or	eax, ecx
	mov	ecx, DWORD PTR _m$933[ebp]
	mov	DWORD PTR [ecx+20], eax
; Line 561
	mov	eax, DWORD PTR _regno$934[ebp]
	mov	ecx, DWORD PTR _regno_last_uid
	movsx	eax, WORD PTR [ecx+eax*2]
	mov	ecx, DWORD PTR _uid_luid$S767
	mov	edx, DWORD PTR _end$[ebp]
	mov	edx, DWORD PTR [edx+4]
	mov	ebx, DWORD PTR _uid_luid$S767
	mov	edx, DWORD PTR [ebx+edx*4]
	cmp	DWORD PTR [ecx+eax*4], edx
	jg	$L2540
	mov	eax, DWORD PTR _regno$934[ebp]
	mov	ecx, DWORD PTR _regno_first_uid
	movsx	eax, WORD PTR [ecx+eax*2]
	mov	ecx, DWORD PTR _uid_luid$S767
	mov	edx, DWORD PTR _loop_start$[ebp]
	mov	edx, DWORD PTR [edx+4]
	mov	ebx, DWORD PTR _uid_luid$S767
	mov	edx, DWORD PTR [ebx+edx*4]
	cmp	DWORD PTR [ecx+eax*4], edx
	jge	$L2538
$L2540:
	mov	eax, DWORD PTR _m$933[ebp]
	mov	eax, DWORD PTR [eax+20]
	or	eax, 4
	mov	ecx, DWORD PTR _m$933[ebp]
	mov	DWORD PTR [ecx+20], eax
	jmp	$L2539
$L2538:
	mov	eax, DWORD PTR _m$933[ebp]
	and	DWORD PTR [eax+20], -5			; fffffffbH
$L2539:
; Line 562
	mov	eax, DWORD PTR _m$933[ebp]
	mov	DWORD PTR [eax+28], 0
; Line 564
	mov	eax, DWORD PTR _regno$934[ebp]
	mov	ecx, DWORD PTR _regno_last_uid
	movsx	eax, WORD PTR [ecx+eax*2]
	mov	ecx, DWORD PTR _uid_luid$S767
	mov	eax, DWORD PTR [ecx+eax*4]
	mov	ecx, DWORD PTR _regno$934[ebp]
	mov	edx, DWORD PTR _regno_first_uid
	movsx	ecx, WORD PTR [edx+ecx*2]
	mov	edx, DWORD PTR _uid_luid$S767
	sub	eax, DWORD PTR [edx+ecx*4]
	mov	ecx, DWORD PTR _m$933[ebp]
	mov	WORD PTR [ecx+16], ax
; Line 565
	mov	eax, DWORD PTR _regno$934[ebp]
	mov	ecx, DWORD PTR _n_times_used$S776
	mov	ax, WORD PTR [ecx+eax*2]
	mov	ecx, DWORD PTR _m$933[ebp]
	mov	WORD PTR [ecx+18], ax
; Line 566
	mov	eax, DWORD PTR _regno$934[ebp]
	mov	ecx, DWORD PTR _n_times_set$S775
	mov	WORD PTR [ecx+eax*2], -1
; Line 568
	cmp	DWORD PTR _movables$[ebp], 0
	jne	$L938
; Line 569
	mov	eax, DWORD PTR _m$933[ebp]
	mov	DWORD PTR _movables$[ebp], eax
; Line 570
	jmp	$L939
$L938:
; Line 571
	mov	eax, DWORD PTR _m$933[ebp]
	mov	ecx, DWORD PTR _last_movable$[ebp]
	mov	DWORD PTR [ecx+36], eax
$L939:
; Line 572
	mov	eax, DWORD PTR _m$933[ebp]
	mov	DWORD PTR _last_movable$[ebp], eax
; Line 573
	mov	eax, DWORD PTR _m$933[ebp]
	cmp	DWORD PTR [eax+8], 0
	jle	$L940
; Line 576
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	DWORD PTR _p$[ebp], eax
; Line 578
	mov	eax, DWORD PTR _m$933[ebp]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	mov	eax, DWORD PTR _p$[ebp]
	push	eax
	call	_skip_consec_insns
	add	esp, 8
	mov	DWORD PTR _p$[ebp], eax
; Line 580
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _p$[ebp], eax
; Line 582
$L940:
; Line 590
	jmp	$L941
$L927:
; Line 600
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	ecx, DWORD PTR _const0_rtx
	cmp	DWORD PTR [eax+8], ecx
	jne	$L943
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 851968				; 000d0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L943
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1638400				; 00190000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L943
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2359296				; 00240000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L943
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2293760				; 00230000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L943
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _p$[ebp]
	mov	ecx, DWORD PTR [ecx+16]
	mov	ecx, DWORD PTR [ecx+4]
	cmp	DWORD PTR [eax+4], ecx
	jne	$L943
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	call	_reg_mentioned_p
	add	esp, 8
	or	eax, eax
	jne	$L943
; Line 602
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _regno$944[ebp], eax
; Line 603
	mov	eax, DWORD PTR _regno$944[ebp]
	mov	ecx, DWORD PTR _n_times_set$S775
	movsx	eax, WORD PTR [ecx+eax*2]
	cmp	eax, 2
	jne	$L945
; Line 607
	push	40					; 00000028H
	call	_alloca
	add	esp, 4
	mov	DWORD PTR _m$946[ebp], eax
; Line 608
	mov	eax, DWORD PTR _m$946[ebp]
	mov	DWORD PTR [eax+36], 0
; Line 609
	mov	eax, DWORD PTR _p$[ebp]
	mov	ecx, DWORD PTR _m$946[ebp]
	mov	DWORD PTR [ecx], eax
; Line 610
	mov	eax, DWORD PTR _m$946[ebp]
	and	DWORD PTR [eax+20], -3			; fffffffdH
; Line 611
	mov	eax, DWORD PTR _m$946[ebp]
	mov	DWORD PTR [eax+8], 0
; Line 612
	mov	eax, DWORD PTR _m$946[ebp]
	and	DWORD PTR [eax+20], -9			; fffffff7H
; Line 613
	mov	eax, DWORD PTR _m$946[ebp]
	mov	DWORD PTR [eax+32], 0
; Line 614
	mov	eax, DWORD PTR _m$946[ebp]
	mov	eax, DWORD PTR [eax+20]
	or	eax, 16					; 00000010H
	mov	ecx, DWORD PTR _m$946[ebp]
	mov	DWORD PTR [ecx+20], eax
; Line 632
	mov	eax, DWORD PTR _regno$944[ebp]
	mov	ecx, DWORD PTR _regno_last_uid
	movsx	eax, WORD PTR [ecx+eax*2]
	mov	ecx, DWORD PTR _uid_luid$S767
	mov	edx, DWORD PTR _end$[ebp]
	mov	edx, DWORD PTR [edx+4]
	mov	ebx, DWORD PTR _uid_luid$S767
	mov	edx, DWORD PTR [ebx+edx*4]
	cmp	DWORD PTR [ecx+eax*4], edx
	jg	$L2543
	mov	eax, DWORD PTR _regno$944[ebp]
	mov	ecx, DWORD PTR _regno_first_uid
	movsx	eax, WORD PTR [ecx+eax*2]
	mov	ecx, DWORD PTR _uid_luid$S767
	mov	edx, DWORD PTR _p$[ebp]
	mov	edx, DWORD PTR [edx+4]
	mov	ebx, DWORD PTR _uid_luid$S767
	mov	edx, DWORD PTR [ebx+edx*4]
	cmp	DWORD PTR [ecx+eax*4], edx
	jl	$L2543
	mov	eax, DWORD PTR _regno$944[ebp]
	mov	ecx, DWORD PTR _regno_first_uid
	movsx	eax, WORD PTR [ecx+eax*2]
	mov	ecx, DWORD PTR _uid_luid$S767
	mov	eax, DWORD PTR [ecx+eax*4]
	push	eax
	mov	eax, DWORD PTR _p$[ebp]
	push	eax
	call	_labels_in_range_p
	add	esp, 8
	or	eax, eax
	je	$L2541
$L2543:
	mov	eax, DWORD PTR _m$946[ebp]
	mov	eax, DWORD PTR [eax+20]
	or	eax, 4
	mov	ecx, DWORD PTR _m$946[ebp]
	mov	DWORD PTR [ecx+20], eax
	jmp	$L2542
$L2541:
	mov	eax, DWORD PTR _m$946[ebp]
	and	DWORD PTR [eax+20], -5			; fffffffbH
$L2542:
; Line 633
	cmp	DWORD PTR _maybe_never$[ebp], 0
	je	$L948
	mov	eax, DWORD PTR _m$946[ebp]
	mov	eax, DWORD PTR [eax+20]
	shr	eax, 2
	test	al, 1
	je	$L948
; Line 634
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	mov	ecx, DWORD PTR _m$946[ebp]
	mov	DWORD PTR [ecx+24], eax
; Line 635
	jmp	$L949
$L948:
; Line 636
	mov	eax, DWORD PTR _m$946[ebp]
	mov	DWORD PTR [eax+24], 0
$L949:
; Line 637
	mov	eax, DWORD PTR _regno$944[ebp]
	mov	ecx, DWORD PTR _m$946[ebp]
	mov	DWORD PTR [ecx+12], eax
; Line 638
	mov	eax, DWORD PTR _m$946[ebp]
	and	DWORD PTR [eax+20], -2			; fffffffeH
; Line 639
	mov	eax, DWORD PTR _m$946[ebp]
	mov	DWORD PTR [eax+28], 0
; Line 641
	mov	eax, DWORD PTR _regno$944[ebp]
	mov	ecx, DWORD PTR _regno_last_uid
	movsx	eax, WORD PTR [ecx+eax*2]
	mov	ecx, DWORD PTR _uid_luid$S767
	mov	eax, DWORD PTR [ecx+eax*4]
	mov	ecx, DWORD PTR _regno$944[ebp]
	mov	edx, DWORD PTR _regno_first_uid
	movsx	ecx, WORD PTR [edx+ecx*2]
	mov	edx, DWORD PTR _uid_luid$S767
	sub	eax, DWORD PTR [edx+ecx*4]
	mov	ecx, DWORD PTR _m$946[ebp]
	mov	WORD PTR [ecx+16], ax
; Line 642
	mov	eax, DWORD PTR _m$946[ebp]
	mov	WORD PTR [eax+18], 1
; Line 643
	mov	eax, DWORD PTR _regno$944[ebp]
	mov	ecx, DWORD PTR _n_times_set$S775
	mov	WORD PTR [ecx+eax*2], -1
; Line 645
	cmp	DWORD PTR _movables$[ebp], 0
	jne	$L950
; Line 646
	mov	eax, DWORD PTR _m$946[ebp]
	mov	DWORD PTR _movables$[ebp], eax
; Line 647
	jmp	$L951
$L950:
; Line 648
	mov	eax, DWORD PTR _m$946[ebp]
	mov	ecx, DWORD PTR _last_movable$[ebp]
	mov	DWORD PTR [ecx+36], eax
$L951:
; Line 649
	mov	eax, DWORD PTR _m$946[ebp]
	mov	DWORD PTR _last_movable$[ebp], eax
; Line 651
$L945:
; Line 652
$L943:
$L941:
$L925:
$L922:
; Line 655
	jmp	$L952
$L919:
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 983040				; 000f0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L953
; Line 656
	mov	DWORD PTR _call_passed$[ebp], 1
; Line 662
	jmp	$L954
$L953:
; Line 666
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1114112				; 00110000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L957
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 917504				; 000e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L956
$L957:
	mov	eax, DWORD PTR _p$[ebp]
	mov	ecx, DWORD PTR _end$[ebp]
	cmp	DWORD PTR [eax+12], ecx
	jne	$L958
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 917504				; 000e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L958
	mov	eax, DWORD PTR _p$[ebp]
	push	eax
	call	_simplejump_p
	add	esp, 4
	or	eax, eax
	jne	$L956
$L958:
; Line 667
	mov	DWORD PTR _maybe_never$[ebp], 1
; Line 668
$L956:
$L954:
$L952:
	jmp	$L912
$L913:
; Line 672
	mov	eax, DWORD PTR _movables$[ebp]
	push	eax
	call	_ignore_some_movables
	add	esp, 4
; Line 679
	mov	eax, DWORD PTR _movables$[ebp]
	push	eax
	call	_force_movables
	add	esp, 4
; Line 686
	mov	eax, DWORD PTR _nregs$[ebp]
	push	eax
	mov	eax, DWORD PTR _movables$[ebp]
	push	eax
	call	_combine_movables
	add	esp, 8
; Line 692
	mov	eax, DWORD PTR _nregs$[ebp]
	push	eax
	mov	eax, DWORD PTR _end$[ebp]
	push	eax
	mov	eax, DWORD PTR _loop_start$[ebp]
	push	eax
	mov	eax, DWORD PTR _insn_count$[ebp]
	push	eax
	mov	eax, DWORD PTR _threshold$[ebp]
	push	eax
	mov	eax, DWORD PTR _movables$[ebp]
	push	eax
	call	_move_movables
	add	esp, 24					; 00000018H
; Line 696
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L959
$L960:
	inc	DWORD PTR _i$[ebp]
$L959:
	mov	eax, DWORD PTR _nregs$[ebp]
	cmp	DWORD PTR _i$[ebp], eax
	jge	$L961
; Line 697
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _n_times_set$S775
	movsx	eax, WORD PTR [ecx+eax*2]
	or	eax, eax
	jge	$L962
; Line 698
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _n_times_used$S776
	mov	ax, WORD PTR [ecx+eax*2]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _n_times_set$S775
	mov	WORD PTR [edx+ecx*2], ax
; Line 700
$L962:
	jmp	$L960
$L961:
	cmp	DWORD PTR _flag_strength_reduce, 0
	je	$L963
; Line 702
	mov	eax, DWORD PTR _nregs$[ebp]
	push	eax
	mov	eax, DWORD PTR _end$[ebp]
	push	eax
	mov	eax, DWORD PTR _loop_start$[ebp]
	push	eax
	mov	eax, DWORD PTR _insn_count$[ebp]
	push	eax
	mov	eax, DWORD PTR _loop_top$[ebp]
	push	eax
	mov	eax, DWORD PTR _end$[ebp]
	push	eax
	mov	eax, DWORD PTR _scan_start$[ebp]
	push	eax
	call	_strength_reduce
	add	esp, 28					; 0000001cH
; Line 703
$L963:
$L867:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_scan_loop ENDP
_insn$ = 8
_reg$ = 12
_regno$ = -4
_p$ = -8
_reg_in_basic_block_p PROC NEAR
; Line 711
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
	push	ebx
	push	esi
	push	edi
; Line 712
	mov	eax, DWORD PTR _reg$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _regno$[ebp], eax
; Line 715
	mov	eax, DWORD PTR _regno$[ebp]
	mov	ecx, DWORD PTR _regno_first_uid
	movsx	eax, WORD PTR [ecx+eax*2]
	mov	ecx, DWORD PTR _insn$[ebp]
	cmp	eax, DWORD PTR [ecx+4]
	je	$L969
; Line 716
	sub	eax, eax
	jmp	$L966
; Line 719
$L969:
	mov	eax, DWORD PTR _insn$[ebp]
	mov	DWORD PTR _p$[ebp], eax
	jmp	$L970
$L971:
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	DWORD PTR _p$[ebp], eax
$L970:
	cmp	DWORD PTR _p$[ebp], 0
	je	$L972
; Line 721
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	sar	eax, 16					; 00000010H
	mov	DWORD PTR -12+[ebp], eax
	jmp	$L973
; Line 723
$L977:
; Line 724
	jmp	$L974
; Line 726
$L978:
; Line 729
	mov	eax, DWORD PTR _regno$[ebp]
	mov	ecx, DWORD PTR _regno_last_uid
	movsx	eax, WORD PTR [ecx+eax*2]
	mov	ecx, DWORD PTR _p$[ebp]
	cmp	eax, DWORD PTR [ecx+4]
	jne	$L979
; Line 730
	mov	eax, 1
	jmp	$L966
; Line 731
$L979:
	jmp	$L974
; Line 733
$L980:
; Line 735
	mov	eax, DWORD PTR _regno$[ebp]
	mov	ecx, DWORD PTR _regno_last_uid
	movsx	eax, WORD PTR [ecx+eax*2]
	mov	ecx, DWORD PTR _p$[ebp]
	cmp	eax, DWORD PTR [ecx+4]
	jne	$L981
; Line 736
	mov	eax, 1
	jmp	$L966
; Line 738
$L981:
	sub	eax, eax
	jmp	$L966
; Line 740
$L982:
; Line 743
	sub	eax, eax
	jmp	$L966
; Line 744
	jmp	$L974
$L973:
	sub	DWORD PTR -12+[ebp], 13			; 0000000dH
	cmp	DWORD PTR -12+[ebp], 5
	ja	$L974
	shl	DWORD PTR -12+[ebp], 2
	mov	eax, DWORD PTR -12+[ebp]
	jmp	DWORD PTR $L2544[eax]
$L2544:
	DD	OFFSET $L978
	DD	OFFSET $L980
	DD	OFFSET $L978
	DD	OFFSET $L982
	DD	OFFSET $L982
	DD	OFFSET $L977
$L974:
; Line 745
	jmp	$L971
$L972:
; Line 748
	call	_abort
; Line 749
$L966:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_reg_in_basic_block_p ENDP
_TEXT	ENDS
EXTRN	_find_reg_note:NEAR
_TEXT	SEGMENT
_insn$ = 8
_count$ = 12
_temp$995 = -4
_skip_consec_insns PROC NEAR
; Line 757
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	push	ebx
	push	esi
	push	edi
; Line 758
	jmp	$L986
$L987:
	dec	DWORD PTR _count$[ebp]
$L986:
	cmp	DWORD PTR _count$[ebp], 0
	jle	$L988
; Line 760
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1179648				; 00120000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L989
; Line 761
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	DWORD PTR _insn$[ebp], eax
; Line 762
	jmp	$L990
$L989:
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1048576				; 00100000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L992
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1114112				; 00110000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L991
$L992:
; Line 763
	call	_abort
; Line 764
	jmp	$L993
$L991:
; Line 771
	push	0
	push	7
	mov	eax, DWORD PTR _insn$[ebp]
	push	eax
	call	_find_reg_note
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _temp$995[ebp], eax
	cmp	DWORD PTR _temp$995[ebp], 0
	je	$L996
; Line 772
	mov	eax, DWORD PTR _temp$995[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _insn$[ebp], eax
; Line 774
$L996:
$L997:
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	DWORD PTR _insn$[ebp], eax
; Line 775
$L998:
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1179648				; 00120000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L997
$L999:
; Line 776
$L993:
$L990:
; Line 777
	jmp	$L987
$L988:
; Line 779
	mov	eax, DWORD PTR _insn$[ebp]
	jmp	$L985
; Line 780
$L985:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_skip_consec_insns ENDP
_insn$ = 8
_loop_find_reg_equal PROC NEAR
; Line 789
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 792
	push	0
	push	6
	mov	eax, DWORD PTR _insn$[ebp]
	push	eax
	call	_find_reg_note
	add	esp, 12					; 0000000cH
	or	eax, eax
	je	$L2545
	push	0
	push	5
	mov	eax, DWORD PTR _insn$[ebp]
	push	eax
	call	_find_reg_note
	add	esp, 12					; 0000000cH
	jmp	$L2546
$L2545:
	sub	eax, eax
$L2546:
	jmp	$L1001
; Line 793
$L1001:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_loop_find_reg_equal ENDP
_movables$ = 8
_m$ = -8
_m1$ = -4
_note$1009 = -12
_first_insn$1011 = -16
_ignore_some_movables PROC NEAR
; Line 803
	push	ebp
	mov	ebp, esp
	sub	esp, 16					; 00000010H
	push	ebx
	push	esi
	push	edi
; Line 806
	mov	eax, DWORD PTR _movables$[ebp]
	mov	DWORD PTR _m$[ebp], eax
	jmp	$L1006
$L1007:
	mov	eax, DWORD PTR _m$[ebp]
	mov	eax, DWORD PTR [eax+36]
	mov	DWORD PTR _m$[ebp], eax
$L1006:
	cmp	DWORD PTR _m$[ebp], 0
	je	$L1008
; Line 809
	push	0
	push	6
	mov	eax, DWORD PTR _m$[ebp]
	mov	eax, DWORD PTR [eax]
	push	eax
	call	_find_reg_note
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _note$1009[ebp], eax
; Line 810
	cmp	DWORD PTR _note$1009[ebp], 0
	je	$L1010
; Line 813
	mov	eax, DWORD PTR _note$1009[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _first_insn$1011[ebp], eax
; Line 816
	mov	eax, DWORD PTR _movables$[ebp]
	mov	DWORD PTR _m1$[ebp], eax
	jmp	$L1012
$L1013:
	mov	eax, DWORD PTR _m1$[ebp]
	mov	eax, DWORD PTR [eax+36]
	mov	DWORD PTR _m1$[ebp], eax
$L1012:
	mov	eax, DWORD PTR _m$[ebp]
	cmp	DWORD PTR _m1$[ebp], eax
	je	$L1014
; Line 818
	mov	eax, DWORD PTR _m1$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _uid_luid$S767
	mov	edx, DWORD PTR _first_insn$1011[ebp]
	mov	edx, DWORD PTR [edx+4]
	mov	ebx, DWORD PTR _uid_luid$S767
	mov	edx, DWORD PTR [ebx+edx*4]
	cmp	DWORD PTR [ecx+eax*4], edx
	jl	$L1015
	mov	eax, DWORD PTR _m1$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _uid_luid$S767
	mov	edx, DWORD PTR _m$[ebp]
	mov	edx, DWORD PTR [edx]
	mov	edx, DWORD PTR [edx+4]
	mov	ebx, DWORD PTR _uid_luid$S767
	mov	edx, DWORD PTR [ebx+edx*4]
	cmp	DWORD PTR [ecx+eax*4], edx
	jge	$L1015
; Line 819
	mov	eax, DWORD PTR _m1$[ebp]
	mov	eax, DWORD PTR [eax+20]
	or	eax, 8
	mov	ecx, DWORD PTR _m1$[ebp]
	mov	DWORD PTR [ecx+20], eax
; Line 820
$L1015:
	jmp	$L1013
$L1014:
; Line 821
$L1010:
	jmp	$L1007
$L1008:
; Line 822
$L1003:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_ignore_some_movables ENDP
_regno$1024 = -12
_movables$ = 8
_m$ = -8
_m1$ = -4
_force_movables PROC NEAR
; Line 832
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
	push	ebx
	push	esi
	push	edi
; Line 834
	mov	eax, DWORD PTR _movables$[ebp]
	mov	DWORD PTR _m1$[ebp], eax
	jmp	$L1020
$L1021:
	mov	eax, DWORD PTR _m1$[ebp]
	mov	eax, DWORD PTR [eax+36]
	mov	DWORD PTR _m1$[ebp], eax
$L1020:
	cmp	DWORD PTR _m1$[ebp], 0
	je	$L1022
; Line 836
	mov	eax, DWORD PTR _m1$[ebp]
	mov	eax, DWORD PTR [eax+20]
	shr	eax, 4
	test	al, 1
	jne	$L1023
	mov	eax, DWORD PTR _m1$[ebp]
	mov	eax, DWORD PTR [eax+20]
	shr	eax, 3
	test	al, 1
	jne	$L1023
; Line 838
	mov	eax, DWORD PTR _m1$[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	DWORD PTR _regno$1024[ebp], eax
; Line 839
	mov	eax, DWORD PTR _m1$[ebp]
	mov	eax, DWORD PTR [eax+36]
	mov	DWORD PTR _m$[ebp], eax
	jmp	$L1025
$L1026:
	mov	eax, DWORD PTR _m$[ebp]
	mov	eax, DWORD PTR [eax+36]
	mov	DWORD PTR _m$[ebp], eax
$L1025:
	cmp	DWORD PTR _m$[ebp], 0
	je	$L1027
; Line 847
	mov	eax, DWORD PTR _regno$1024[ebp]
	mov	ecx, DWORD PTR _regno_last_uid
	movsx	eax, WORD PTR [ecx+eax*2]
	mov	ecx, DWORD PTR _m$[ebp]
	mov	ecx, DWORD PTR [ecx]
	cmp	eax, DWORD PTR [ecx+4]
	jne	$L1028
	mov	eax, DWORD PTR _m$[ebp]
	mov	eax, DWORD PTR [eax+20]
	shr	eax, 3
	test	al, 1
	jne	$L1028
; Line 848
	jmp	$L1027
; Line 849
$L1028:
	jmp	$L1026
$L1027:
	cmp	DWORD PTR _m$[ebp], 0
	je	$L1029
	mov	eax, DWORD PTR _m1$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	eax, DWORD PTR [eax+16]
	mov	ecx, DWORD PTR _m$[ebp]
	mov	ecx, DWORD PTR [ecx+4]
	cmp	DWORD PTR [eax+4], ecx
	jne	$L1029
; Line 850
	mov	DWORD PTR _m$[ebp], 0
; Line 854
$L1029:
	cmp	DWORD PTR _m$[ebp], 0
	je	$L1030
; Line 856
	mov	eax, DWORD PTR _m1$[ebp]
	mov	ecx, DWORD PTR _m$[ebp]
	mov	DWORD PTR [ecx+32], eax
; Line 857
	mov	eax, DWORD PTR _m1$[ebp]
	movsx	eax, WORD PTR [eax+16]
	mov	ecx, DWORD PTR _m$[ebp]
	movsx	ecx, WORD PTR [ecx+16]
	add	eax, ecx
	mov	ecx, DWORD PTR _m1$[ebp]
	mov	WORD PTR [ecx+16], ax
; Line 858
	mov	eax, DWORD PTR _m1$[ebp]
	movsx	eax, WORD PTR [eax+18]
	mov	ecx, DWORD PTR _m1$[ebp]
	movsx	ecx, WORD PTR [ecx+18]
	add	eax, ecx
	mov	ecx, DWORD PTR _m1$[ebp]
	mov	WORD PTR [ecx+18], ax
; Line 860
$L1030:
; Line 861
$L1023:
	jmp	$L1021
$L1022:
$L1017:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_force_movables ENDP
_TEXT	ENDS
EXTRN	_rtx_equal_p:NEAR
EXTRN	_mode_class:BYTE
_TEXT	SEGMENT
_movables$ = 8
_nregs$ = 12
_m$ = -12
_matched_regs$ = -8
_mode$ = -4
_m1$1041 = -16
_regno$1042 = -20
_m0$1054 = -24
_m1$1059 = -32
_first$1060 = -28
_last$1061 = -36
_combine_movables PROC NEAR
; Line 870
	push	ebp
	mov	ebp, esp
	sub	esp, 36					; 00000024H
	push	ebx
	push	esi
	push	edi
; Line 872
	mov	eax, DWORD PTR _nregs$[ebp]
	push	eax
	call	_alloca
	add	esp, 4
	mov	DWORD PTR _matched_regs$[ebp], eax
; Line 879
	mov	eax, DWORD PTR _movables$[ebp]
	mov	DWORD PTR _m$[ebp], eax
	jmp	$L1037
$L1038:
	mov	eax, DWORD PTR _m$[ebp]
	mov	eax, DWORD PTR [eax+36]
	mov	DWORD PTR _m$[ebp], eax
$L1037:
	cmp	DWORD PTR _m$[ebp], 0
	je	$L1039
; Line 880
	mov	eax, DWORD PTR _m$[ebp]
	cmp	DWORD PTR [eax+28], 0
	jne	$L1040
	mov	eax, DWORD PTR _m$[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	ecx, DWORD PTR _n_times_used$S776
	movsx	eax, WORD PTR [ecx+eax*2]
	cmp	eax, 1
	jne	$L1040
	mov	eax, DWORD PTR _m$[ebp]
	mov	eax, DWORD PTR [eax+20]
	shr	eax, 4
	test	al, 1
	jne	$L1040
; Line 883
	mov	eax, DWORD PTR _m$[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	DWORD PTR _regno$1042[ebp], eax
; Line 885
	mov	eax, DWORD PTR _nregs$[ebp]
	push	eax
	push	0
	mov	eax, DWORD PTR _matched_regs$[ebp]
	push	eax
	call	_memset
	add	esp, 12					; 0000000cH
; Line 886
	mov	eax, DWORD PTR _regno$1042[ebp]
	mov	ecx, DWORD PTR _matched_regs$[ebp]
	mov	BYTE PTR [eax+ecx], 1
; Line 888
	mov	eax, DWORD PTR _m$[ebp]
	mov	eax, DWORD PTR [eax+36]
	mov	DWORD PTR _m1$1041[ebp], eax
	jmp	$L1043
$L1044:
	mov	eax, DWORD PTR _m1$1041[ebp]
	mov	eax, DWORD PTR [eax+36]
	mov	DWORD PTR _m1$1041[ebp], eax
$L1043:
	cmp	DWORD PTR _m1$1041[ebp], 0
	je	$L1045
; Line 910
	mov	eax, DWORD PTR _m1$1041[ebp]
	cmp	DWORD PTR [eax+28], 0
	jne	$L1046
	mov	eax, DWORD PTR _m1$1041[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	ecx, DWORD PTR _n_times_used$S776
	movsx	eax, WORD PTR [ecx+eax*2]
	cmp	eax, 1
	jne	$L1046
	mov	eax, DWORD PTR _m1$1041[ebp]
	mov	eax, DWORD PTR [eax+20]
	shr	eax, 2
	test	al, 1
	jne	$L1046
	mov	eax, DWORD PTR _m1$1041[ebp]
	mov	eax, DWORD PTR [eax+20]
	shr	eax, 4
	test	al, 1
	jne	$L1046
	mov	eax, DWORD PTR _m1$1041[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	ecx, DWORD PTR _matched_regs$[ebp]
	movsx	eax, BYTE PTR [eax+ecx]
	or	eax, eax
	jne	$L1047
	mov	eax, DWORD PTR _m1$1041[ebp]
	mov	eax, DWORD PTR [eax]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	mov	ecx, DWORD PTR _m$[ebp]
	mov	ecx, DWORD PTR [ecx]
	mov	ecx, DWORD PTR [ecx+16]
	mov	ecx, DWORD PTR [ecx+4]
	mov	ecx, DWORD PTR [ecx]
	shl	ecx, 8
	and	ecx, -16777216				; ff000000H
	cmp	eax, ecx
	jne	$L1046
	mov	eax, DWORD PTR _m1$1041[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1049
	mov	eax, DWORD PTR _m1$1041[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _matched_regs$[ebp]
	movsx	eax, BYTE PTR [eax+ecx]
	or	eax, eax
	jne	$L1048
$L1049:
	mov	eax, DWORD PTR _movables$[ebp]
	push	eax
	mov	eax, DWORD PTR _m1$1041[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	mov	eax, DWORD PTR _m$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	call	_rtx_equal_for_loop_p
	add	esp, 12					; 0000000cH
	or	eax, eax
	jne	$L1048
	mov	eax, DWORD PTR _m$[ebp]
	mov	eax, DWORD PTR [eax]
	cmp	DWORD PTR [eax+28], 0
	je	$L1046
	mov	eax, DWORD PTR _m1$1041[ebp]
	mov	eax, DWORD PTR [eax]
	cmp	DWORD PTR [eax+28], 0
	je	$L1046
	mov	eax, DWORD PTR _m$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	eax, DWORD PTR [eax+28]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	mov	ecx, 50331648				; 03000000H
	and	ecx, -16777216				; ff000000H
	cmp	eax, ecx
	jne	$L1046
	mov	eax, DWORD PTR _m1$1041[ebp]
	mov	eax, DWORD PTR [eax]
	mov	eax, DWORD PTR [eax+28]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	mov	ecx, 50331648				; 03000000H
	and	ecx, -16777216				; ff000000H
	cmp	eax, ecx
	jne	$L1046
	mov	eax, DWORD PTR _m1$1041[ebp]
	mov	eax, DWORD PTR [eax]
	mov	eax, DWORD PTR [eax+28]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	mov	eax, DWORD PTR _m$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	eax, DWORD PTR [eax+28]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	call	_rtx_equal_p
	add	esp, 8
	or	eax, eax
	je	$L1046
$L1048:
$L1047:
; Line 912
	mov	eax, DWORD PTR _m1$1041[ebp]
	movsx	eax, WORD PTR [eax+16]
	mov	ecx, DWORD PTR _m$[ebp]
	movsx	ecx, WORD PTR [ecx+16]
	add	eax, ecx
	mov	ecx, DWORD PTR _m$[ebp]
	mov	WORD PTR [ecx+16], ax
; Line 913
	mov	eax, DWORD PTR _m1$1041[ebp]
	movsx	eax, WORD PTR [eax+18]
	mov	ecx, DWORD PTR _m$[ebp]
	movsx	ecx, WORD PTR [ecx+18]
	add	eax, ecx
	mov	ecx, DWORD PTR _m$[ebp]
	mov	WORD PTR [ecx+18], ax
; Line 914
	mov	eax, DWORD PTR _m$[ebp]
	mov	ecx, DWORD PTR _m1$1041[ebp]
	mov	DWORD PTR [ecx+28], eax
; Line 915
	mov	eax, DWORD PTR _m1$1041[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	ecx, DWORD PTR _matched_regs$[ebp]
	mov	BYTE PTR [eax+ecx], 1
; Line 917
$L1046:
	jmp	$L1044
$L1045:
; Line 923
$L1040:
	jmp	$L1038
$L1039:
; Line 924
	mov	DWORD PTR _mode$[ebp], 0
	jmp	$L1050
$L1051:
	inc	DWORD PTR _mode$[ebp]
$L1050:
	cmp	DWORD PTR _mode$[ebp], 28		; 0000001cH
	jge	$L1052
; Line 925
	mov	eax, DWORD PTR _mode$[ebp]
	cmp	DWORD PTR _mode_class[eax*4], 1
	jne	$L1053
; Line 927
	mov	DWORD PTR _m0$1054[ebp], 0
; Line 931
	mov	eax, DWORD PTR _movables$[ebp]
	mov	DWORD PTR _m$[ebp], eax
	jmp	$L1055
$L1056:
	mov	eax, DWORD PTR _m$[ebp]
	mov	eax, DWORD PTR [eax+36]
	mov	DWORD PTR _m$[ebp], eax
$L1055:
	cmp	DWORD PTR _m$[ebp], 0
	je	$L1057
; Line 933
	mov	eax, DWORD PTR _m$[ebp]
	mov	eax, DWORD PTR [eax+20]
	shr	eax, 4
	test	al, 1
	je	$L1058
	mov	eax, DWORD PTR _m$[ebp]
	mov	eax, DWORD PTR [eax+20]
	shr	eax, 2
	test	al, 1
	jne	$L1058
	mov	eax, DWORD PTR _m$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	eax, DWORD PTR [eax+12]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	cmp	eax, DWORD PTR _mode$[ebp]
	jne	$L1058
; Line 936
	mov	eax, DWORD PTR _m$[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	ecx, DWORD PTR _regno_first_uid
	movsx	eax, WORD PTR [ecx+eax*2]
	mov	ecx, DWORD PTR _uid_luid$S767
	mov	eax, DWORD PTR [ecx+eax*4]
	mov	DWORD PTR _first$1060[ebp], eax
; Line 937
	mov	eax, DWORD PTR _m$[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	ecx, DWORD PTR _regno_last_uid
	movsx	eax, WORD PTR [ecx+eax*2]
	mov	ecx, DWORD PTR _uid_luid$S767
	mov	eax, DWORD PTR [ecx+eax*4]
	mov	DWORD PTR _last$1061[ebp], eax
; Line 939
	cmp	DWORD PTR _m0$1054[ebp], 0
	jne	$L1062
; Line 942
	mov	eax, DWORD PTR _m$[ebp]
	mov	DWORD PTR _m0$1054[ebp], eax
; Line 943
	jmp	$L1056
; Line 948
$L1062:
; Line 949
	mov	eax, DWORD PTR _m0$1054[ebp]
	mov	eax, DWORD PTR [eax]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	mov	ecx, DWORD PTR _m$[ebp]
	mov	ecx, DWORD PTR [ecx]
	mov	ecx, DWORD PTR [ecx+16]
	mov	ecx, DWORD PTR [ecx+4]
	mov	ecx, DWORD PTR [ecx]
	shl	ecx, 8
	and	ecx, -16777216				; ff000000H
	cmp	eax, ecx
	je	$L1063
; Line 950
	jmp	$L1056
; Line 954
$L1063:
	mov	eax, DWORD PTR _movables$[ebp]
	mov	DWORD PTR _m1$1059[ebp], eax
	jmp	$L1064
$L1065:
	mov	eax, DWORD PTR _m1$1059[ebp]
	mov	eax, DWORD PTR [eax+36]
	mov	DWORD PTR _m1$1059[ebp], eax
$L1064:
	mov	eax, DWORD PTR _m1$1059[ebp]
	cmp	DWORD PTR _m$[ebp], eax
	je	$L1066
; Line 955
	mov	eax, DWORD PTR _m1$1059[ebp]
	cmp	DWORD PTR _m0$1054[ebp], eax
	je	$L1068
	mov	eax, DWORD PTR _m1$1059[ebp]
	mov	eax, DWORD PTR [eax+20]
	shr	eax, 4
	test	al, 1
	je	$L1067
	mov	eax, DWORD PTR _m1$1059[ebp]
	mov	ecx, DWORD PTR _m0$1054[ebp]
	cmp	DWORD PTR [eax+28], ecx
	jne	$L1067
$L1068:
; Line 957
	mov	eax, DWORD PTR _m1$1059[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	ecx, DWORD PTR _regno_first_uid
	movsx	eax, WORD PTR [ecx+eax*2]
	mov	ecx, DWORD PTR _uid_luid$S767
	mov	edx, DWORD PTR _last$1061[ebp]
	cmp	DWORD PTR [ecx+eax*4], edx
	jg	$L1069
	mov	eax, DWORD PTR _m1$1059[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	ecx, DWORD PTR _regno_last_uid
	movsx	eax, WORD PTR [ecx+eax*2]
	mov	ecx, DWORD PTR _uid_luid$S767
	mov	edx, DWORD PTR _first$1060[ebp]
	cmp	DWORD PTR [ecx+eax*4], edx
	jl	$L1069
; Line 958
	jmp	$overlap$1070
; Line 961
$L1069:
$L1067:
	jmp	$L1065
$L1066:
	mov	eax, DWORD PTR _m0$1054[ebp]
	movsx	eax, WORD PTR [eax+16]
	mov	ecx, DWORD PTR _m$[ebp]
	movsx	ecx, WORD PTR [ecx+16]
	add	eax, ecx
	mov	ecx, DWORD PTR _m0$1054[ebp]
	mov	WORD PTR [ecx+16], ax
; Line 962
	mov	eax, DWORD PTR _m0$1054[ebp]
	movsx	eax, WORD PTR [eax+18]
	mov	ecx, DWORD PTR _m$[ebp]
	movsx	ecx, WORD PTR [ecx+18]
	add	eax, ecx
	mov	ecx, DWORD PTR _m0$1054[ebp]
	mov	WORD PTR [ecx+18], ax
; Line 963
	mov	eax, DWORD PTR _m0$1054[ebp]
	mov	ecx, DWORD PTR _m$[ebp]
	mov	DWORD PTR [ecx+28], eax
; Line 965
$overlap$1070:
; Line 967
$L1058:
	jmp	$L1056
$L1057:
; Line 968
$L1053:
	jmp	$L1051
$L1052:
$L1033:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_combine_movables ENDP
_x$ = 8
_y$ = 12
_movables$ = 16
_xn$ = -8
_yn$ = -16
_mx$ = -4
_my$ = -12
_regs_match_p PROC NEAR
; Line 976
	push	ebp
	mov	ebp, esp
	sub	esp, 16					; 00000010H
	push	ebx
	push	esi
	push	edi
; Line 977
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _xn$[ebp], eax
; Line 978
	mov	eax, DWORD PTR _y$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _yn$[ebp], eax
; Line 981
	mov	eax, DWORD PTR _movables$[ebp]
	mov	DWORD PTR _mx$[ebp], eax
	jmp	$L1080
$L1081:
	mov	eax, DWORD PTR _mx$[ebp]
	mov	eax, DWORD PTR [eax+36]
	mov	DWORD PTR _mx$[ebp], eax
$L1080:
	cmp	DWORD PTR _mx$[ebp], 0
	je	$L1082
; Line 982
	mov	eax, DWORD PTR _mx$[ebp]
	mov	ecx, DWORD PTR _xn$[ebp]
	cmp	DWORD PTR [eax+12], ecx
	jne	$L1083
; Line 983
	jmp	$L1082
; Line 985
$L1083:
	jmp	$L1081
$L1082:
	mov	eax, DWORD PTR _movables$[ebp]
	mov	DWORD PTR _my$[ebp], eax
	jmp	$L1084
$L1085:
	mov	eax, DWORD PTR _my$[ebp]
	mov	eax, DWORD PTR [eax+36]
	mov	DWORD PTR _my$[ebp], eax
$L1084:
	cmp	DWORD PTR _my$[ebp], 0
	je	$L1086
; Line 986
	mov	eax, DWORD PTR _my$[ebp]
	mov	ecx, DWORD PTR _yn$[ebp]
	cmp	DWORD PTR [eax+12], ecx
	jne	$L1087
; Line 987
	jmp	$L1086
; Line 989
$L1087:
	jmp	$L1085
$L1086:
; Line 992
	cmp	DWORD PTR _mx$[ebp], 0
	je	$L2547
	cmp	DWORD PTR _my$[ebp], 0
	je	$L2547
	mov	eax, DWORD PTR _my$[ebp]
	mov	ecx, DWORD PTR _mx$[ebp]
	mov	ecx, DWORD PTR [ecx+28]
	cmp	DWORD PTR [eax+28], ecx
	jne	$L2550
	mov	eax, DWORD PTR _mx$[ebp]
	cmp	DWORD PTR [eax+28], 0
	jne	$L2549
$L2550:
	mov	eax, DWORD PTR _mx$[ebp]
	mov	ecx, DWORD PTR _my$[ebp]
	cmp	DWORD PTR [eax+28], ecx
	je	$L2549
	mov	eax, DWORD PTR _my$[ebp]
	mov	ecx, DWORD PTR _mx$[ebp]
	cmp	DWORD PTR [eax+28], ecx
	jne	$L2547
$L2549:
	mov	eax, 1
	jmp	$L2548
$L2547:
	sub	eax, eax
$L2548:
	jmp	$L1075
; Line 993
$L1075:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_regs_match_p ENDP
_TEXT	ENDS
EXTRN	_rtx_length:BYTE
EXTRN	_rtx_format:BYTE
EXTRN	_strcmp:NEAR
_TEXT	SEGMENT
_x$ = 8
_y$ = 12
_movables$ = 16
_i$ = -16
_j$ = -4
_code$ = -8
_fmt$ = -12
_rtx_equal_for_loop_p PROC NEAR
; Line 1002
	push	ebp
	mov	ebp, esp
	sub	esp, 20					; 00000014H
	push	ebx
	push	esi
	push	edi
; Line 1008
	mov	eax, DWORD PTR _x$[ebp]
	cmp	DWORD PTR _y$[ebp], eax
	jne	$L1096
; Line 1009
	mov	eax, 1
	jmp	$L1091
; Line 1010
$L1096:
	cmp	DWORD PTR _x$[ebp], 0
	je	$L1098
	cmp	DWORD PTR _y$[ebp], 0
	jne	$L1097
$L1098:
; Line 1011
	sub	eax, eax
	jmp	$L1091
; Line 1013
$L1097:
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	sar	eax, 16					; 00000010H
	mov	DWORD PTR _code$[ebp], eax
; Line 1015
	mov	eax, DWORD PTR _y$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	sar	eax, 16					; 00000010H
	cmp	eax, DWORD PTR _code$[ebp]
	je	$L1099
; Line 1016
	sub	eax, eax
	jmp	$L1091
; Line 1021
$L1099:
	mov	eax, DWORD PTR _y$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	mov	ecx, DWORD PTR _x$[ebp]
	mov	ecx, DWORD PTR [ecx]
	shl	ecx, 8
	and	ecx, -16777216				; ff000000H
	cmp	eax, ecx
	je	$L1100
; Line 1022
	sub	eax, eax
	jmp	$L1091
; Line 1030
$L1100:
	cmp	DWORD PTR _code$[ebp], 34		; 00000022H
	jne	$L1101
; Line 1033
	mov	eax, DWORD PTR _y$[ebp]
	mov	ecx, DWORD PTR _x$[ebp]
	mov	ecx, DWORD PTR [ecx+4]
	cmp	DWORD PTR [eax+4], ecx
	jne	$L2554
	sub	eax, eax
	mov	ecx, DWORD PTR _y$[ebp]
	mov	ecx, DWORD PTR [ecx]
	shr	ecx, 30					; 0000001eH
	mov	edx, DWORD PTR _x$[ebp]
	mov	edx, DWORD PTR [edx]
	shr	edx, 30					; 0000001eH
	and	edx, 1
	xor	ecx, edx
	and	ecx, 1
	cmp	eax, ecx
	je	$L2553
$L2554:
	mov	eax, DWORD PTR _movables$[ebp]
	push	eax
	mov	eax, DWORD PTR _y$[ebp]
	push	eax
	mov	eax, DWORD PTR _x$[ebp]
	push	eax
	call	_regs_match_p
	add	esp, 12					; 0000000cH
	or	eax, eax
	je	$L2551
$L2553:
	mov	eax, 1
	jmp	$L2552
$L2551:
	sub	eax, eax
$L2552:
	jmp	$L1091
; Line 1035
$L1101:
	cmp	DWORD PTR _code$[ebp], 38		; 00000026H
	jne	$L1102
; Line 1036
	mov	eax, DWORD PTR _y$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _x$[ebp]
	sub	eax, DWORD PTR [ecx+4]
	cmp	eax, 1
	sbb	eax, eax
	neg	eax
	jmp	$L1091
; Line 1037
$L1102:
	cmp	DWORD PTR _code$[ebp], 39		; 00000027H
	jne	$L1103
; Line 1038
	mov	eax, DWORD PTR _y$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _x$[ebp]
	sub	eax, DWORD PTR [ecx+4]
	cmp	eax, 1
	sbb	eax, eax
	neg	eax
	jmp	$L1091
; Line 1043
$L1103:
	mov	eax, DWORD PTR _code$[ebp]
	mov	eax, DWORD PTR _rtx_format[eax*4]
	mov	DWORD PTR _fmt$[ebp], eax
; Line 1044
	mov	eax, DWORD PTR _code$[ebp]
	mov	eax, DWORD PTR _rtx_length[eax*4]
	dec	eax
	mov	DWORD PTR _i$[ebp], eax
	jmp	$L1104
$L1105:
	dec	DWORD PTR _i$[ebp]
$L1104:
	cmp	DWORD PTR _i$[ebp], 0
	jl	$L1106
; Line 1046
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _fmt$[ebp]
	movsx	eax, BYTE PTR [eax+ecx]
	mov	DWORD PTR -20+[ebp], eax
	jmp	$L1107
; Line 1048
$L1111:
; Line 1049
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _y$[ebp]
	mov	edx, DWORD PTR _i$[ebp]
	mov	ebx, DWORD PTR _x$[ebp]
	mov	edx, DWORD PTR [ebx+edx*4+4]
	cmp	DWORD PTR [ecx+eax*4+4], edx
	je	$L1112
; Line 1050
	sub	eax, eax
	jmp	$L1091
; Line 1051
$L1112:
	jmp	$L1108
; Line 1053
$L1113:
; Line 1055
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _y$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+4]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _x$[ebp]
	mov	ecx, DWORD PTR [edx+ecx*4+4]
	mov	ecx, DWORD PTR [ecx]
	cmp	DWORD PTR [eax], ecx
	je	$L1114
; Line 1056
	sub	eax, eax
	jmp	$L1091
; Line 1059
$L1114:
	mov	DWORD PTR _j$[ebp], 0
	jmp	$L1115
$L1116:
	inc	DWORD PTR _j$[ebp]
$L1115:
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+4]
	mov	ecx, DWORD PTR _j$[ebp]
	cmp	DWORD PTR [eax], ecx
	jbe	$L1117
; Line 1060
	mov	eax, DWORD PTR _movables$[ebp]
	push	eax
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _y$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+4]
	mov	ecx, DWORD PTR _j$[ebp]
	mov	eax, DWORD PTR [eax+ecx*4+4]
	push	eax
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+4]
	mov	ecx, DWORD PTR _j$[ebp]
	mov	eax, DWORD PTR [eax+ecx*4+4]
	push	eax
	call	_rtx_equal_for_loop_p
	add	esp, 12					; 0000000cH
	or	eax, eax
	jne	$L1118
; Line 1061
	sub	eax, eax
	jmp	$L1091
; Line 1062
$L1118:
	jmp	$L1116
$L1117:
	jmp	$L1108
; Line 1064
$L1119:
; Line 1065
	mov	eax, DWORD PTR _movables$[ebp]
	push	eax
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _y$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+4]
	push	eax
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+4]
	push	eax
	call	_rtx_equal_for_loop_p
	add	esp, 12					; 0000000cH
	or	eax, eax
	jne	$L1120
; Line 1066
	sub	eax, eax
	jmp	$L1091
; Line 1067
$L1120:
	jmp	$L1108
; Line 1069
$L1121:
; Line 1070
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _y$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+4]
	push	eax
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+4]
	push	eax
	call	_strcmp
	add	esp, 8
	or	eax, eax
	je	$L1123
; Line 1071
	sub	eax, eax
	jmp	$L1091
; Line 1072
$L1123:
	jmp	$L1108
; Line 1074
$L1124:
; Line 1076
	jmp	$L1108
; Line 1078
$L1125:
; Line 1079
	jmp	$L1108
; Line 1084
$L1126:
; Line 1085
	call	_abort
; Line 1086
	jmp	$L1108
$L1107:
	cmp	DWORD PTR -20+[ebp], 105		; 00000069H
	jg	$L2555
	je	$L1111
	cmp	DWORD PTR -20+[ebp], 48			; 00000030H
	je	$L1108
	cmp	DWORD PTR -20+[ebp], 69			; 00000045H
	je	$L1113
	cmp	DWORD PTR -20+[ebp], 101		; 00000065H
	je	$L1119
	jmp	$L1126
$L2555:
	cmp	DWORD PTR -20+[ebp], 115		; 00000073H
	je	$L1121
	cmp	DWORD PTR -20+[ebp], 117		; 00000075H
	je	$L1108
	jmp	$L1126
$L1108:
; Line 1087
	jmp	$L1105
$L1106:
; Line 1088
	mov	eax, 1
	jmp	$L1091
; Line 1089
$L1091:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_rtx_equal_for_loop_p ENDP
_TEXT	ENDS
EXTRN	_mode_size:BYTE
EXTRN	_delete_insn:NEAR
EXTRN	_gen_rtx:NEAR
EXTRN	_emit_call_insn_before:NEAR
EXTRN	_emit_insn_before:NEAR
_BSS	SEGMENT
_num_movables$S782 DD 01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
	ORG $+2
$SG1143	DB	'Insn %d: regno %d (life %d), ', 00H
	ORG $+2
$SG1145	DB	'consec %d, ', 00H
$SG1147	DB	'cond ', 00H
	ORG $+2
$SG1149	DB	'force ', 00H
	ORG $+1
$SG1151	DB	'global ', 00H
$SG1153	DB	'done ', 00H
	ORG $+2
$SG1155	DB	'matches %d ', 00H
$SG1157	DB	'forces %d ', 00H
	ORG $+1
$SG1166	DB	'savings %d ', 00H
$SG1169	DB	'halved since already moved ', 00H
$SG1202	DB	' moved to %d', 00H
	ORG $+3
$SG1225	DB	'not desirable', 00H
	ORG $+2
$SG1228	DB	'not safe', 00H
	ORG $+3
$SG1230	DB	0aH, 00H
_DATA	ENDS
_TEXT	SEGMENT
_temp$1217 = -76
_regno$1162 = -24
_p$1163 = -32
_savings$1164 = -28
_count$1172 = -40
_tail$1237 = -80
_m1$1173 = -44
_first$1174 = -36
_i1$1178 = -52
_temp$1179 = -48
_fn_address$1182 = -60
_fn_reg$1183 = -56
_body$1187 = -68
_n$1188 = -64
_movables$ = 8
_threshold$ = 12
_insn_count$ = 16
_loop_start$ = 20
_end$ = 24
_reg$1196 = -72
_nregs$ = 28
_new_start$ = -16
_m$ = -8
_p$ = -20
_reg_map$ = -12
_already_moved$ = -4
_move_movables PROC NEAR
; Line 1103
	push	ebp
	mov	ebp, esp
	sub	esp, 80					; 00000050H
	push	ebx
	push	esi
	push	edi
; Line 1104
	mov	DWORD PTR _new_start$[ebp], 0
; Line 1110
	mov	eax, DWORD PTR _nregs$[ebp]
	shl	eax, 2
	push	eax
	call	_alloca
	add	esp, 4
	mov	DWORD PTR _reg_map$[ebp], eax
; Line 1111
	mov	eax, DWORD PTR _nregs$[ebp]
	push	eax
	call	_alloca
	add	esp, 4
	mov	DWORD PTR _already_moved$[ebp], eax
; Line 1113
	mov	eax, DWORD PTR _nregs$[ebp]
	push	eax
	push	0
	mov	eax, DWORD PTR _already_moved$[ebp]
	push	eax
	call	_memset
	add	esp, 12					; 0000000cH
; Line 1114
	mov	eax, DWORD PTR _nregs$[ebp]
	shl	eax, 2
	push	eax
	push	0
	mov	eax, DWORD PTR _reg_map$[ebp]
	push	eax
	call	_memset
	add	esp, 12					; 0000000cH
; Line 1116
	mov	DWORD PTR _num_movables$S782, 0
; Line 1118
	mov	eax, DWORD PTR _movables$[ebp]
	mov	DWORD PTR _m$[ebp], eax
	jmp	$L1139
$L1140:
	mov	eax, DWORD PTR _m$[ebp]
	mov	eax, DWORD PTR [eax+36]
	mov	DWORD PTR _m$[ebp], eax
$L1139:
	cmp	DWORD PTR _m$[ebp], 0
	je	$L1141
; Line 1122
	cmp	DWORD PTR _loop_dump_stream$S787, 0
	je	$L1142
; Line 1125
	mov	eax, DWORD PTR _m$[ebp]
	movsx	eax, WORD PTR [eax+16]
	push	eax
	mov	eax, DWORD PTR _m$[ebp]
	mov	eax, DWORD PTR [eax+12]
	push	eax
	mov	eax, DWORD PTR _m$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	push	OFFSET $SG1143
	mov	eax, DWORD PTR _loop_dump_stream$S787
	push	eax
	call	_fprintf
	add	esp, 20					; 00000014H
; Line 1126
	mov	eax, DWORD PTR _m$[ebp]
	cmp	DWORD PTR [eax+8], 0
	jle	$L1144
; Line 1127
	mov	eax, DWORD PTR _m$[ebp]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	push	OFFSET $SG1145
	mov	eax, DWORD PTR _loop_dump_stream$S787
	push	eax
	call	_fprintf
	add	esp, 12					; 0000000cH
; Line 1128
$L1144:
	mov	eax, DWORD PTR _m$[ebp]
	test	BYTE PTR [eax+20], 1
	je	$L1146
; Line 1129
	push	OFFSET $SG1147
	mov	eax, DWORD PTR _loop_dump_stream$S787
	push	eax
	call	_fprintf
	add	esp, 8
; Line 1130
$L1146:
	mov	eax, DWORD PTR _m$[ebp]
	mov	eax, DWORD PTR [eax+20]
	shr	eax, 1
	test	al, 1
	je	$L1148
; Line 1131
	push	OFFSET $SG1149
	mov	eax, DWORD PTR _loop_dump_stream$S787
	push	eax
	call	_fprintf
	add	esp, 8
; Line 1132
$L1148:
	mov	eax, DWORD PTR _m$[ebp]
	mov	eax, DWORD PTR [eax+20]
	shr	eax, 2
	test	al, 1
	je	$L1150
; Line 1133
	push	OFFSET $SG1151
	mov	eax, DWORD PTR _loop_dump_stream$S787
	push	eax
	call	_fprintf
	add	esp, 8
; Line 1134
$L1150:
	mov	eax, DWORD PTR _m$[ebp]
	mov	eax, DWORD PTR [eax+20]
	shr	eax, 3
	test	al, 1
	je	$L1152
; Line 1135
	push	OFFSET $SG1153
	mov	eax, DWORD PTR _loop_dump_stream$S787
	push	eax
	call	_fprintf
	add	esp, 8
; Line 1136
$L1152:
	mov	eax, DWORD PTR _m$[ebp]
	cmp	DWORD PTR [eax+28], 0
	je	$L1154
; Line 1138
	mov	eax, DWORD PTR _m$[ebp]
	mov	eax, DWORD PTR [eax+28]
	mov	eax, DWORD PTR [eax]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	push	OFFSET $SG1155
	mov	eax, DWORD PTR _loop_dump_stream$S787
	push	eax
	call	_fprintf
	add	esp, 12					; 0000000cH
; Line 1139
$L1154:
	mov	eax, DWORD PTR _m$[ebp]
	cmp	DWORD PTR [eax+32], 0
	je	$L1156
; Line 1141
	mov	eax, DWORD PTR _m$[ebp]
	mov	eax, DWORD PTR [eax+32]
	mov	eax, DWORD PTR [eax]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	push	OFFSET $SG1157
	mov	eax, DWORD PTR _loop_dump_stream$S787
	push	eax
	call	_fprintf
	add	esp, 12					; 0000000cH
; Line 1142
$L1156:
; Line 1145
$L1142:
	inc	DWORD PTR _num_movables$S782
; Line 1157
	mov	eax, DWORD PTR _m$[ebp]
	mov	eax, DWORD PTR [eax+20]
	shr	eax, 3
	test	al, 1
	jne	$L1158
	mov	eax, DWORD PTR _m$[ebp]
	test	BYTE PTR [eax+20], 1
	je	$L1159
	mov	eax, DWORD PTR _m$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	call	_invariant_p
	add	esp, 4
	cmp	eax, 1
	jne	$L1158
	mov	eax, DWORD PTR _m$[ebp]
	cmp	DWORD PTR [eax+8], 0
	je	$L1160
	mov	eax, DWORD PTR _m$[ebp]
	mov	eax, DWORD PTR [eax]
	push	eax
	mov	eax, DWORD PTR _m$[ebp]
	mov	eax, DWORD PTR [eax+8]
	inc	eax
	push	eax
	mov	eax, DWORD PTR _m$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	call	_consec_sets_invariant_p
	add	esp, 12					; 0000000cH
	cmp	eax, 1
	jne	$L1158
$L1160:
$L1159:
	mov	eax, DWORD PTR _m$[ebp]
	cmp	DWORD PTR [eax+32], 0
	je	$L1161
	mov	eax, DWORD PTR _m$[ebp]
	mov	eax, DWORD PTR [eax+32]
	mov	eax, DWORD PTR [eax+20]
	shr	eax, 3
	test	al, 1
	je	$L1158
$L1161:
; Line 1161
	mov	eax, DWORD PTR _m$[ebp]
	movsx	eax, WORD PTR [eax+18]
	mov	DWORD PTR _savings$1164[ebp], eax
; Line 1166
	mov	eax, DWORD PTR _m$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _p$1163[ebp], eax
; Line 1167
	mov	eax, DWORD PTR _m$[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	DWORD PTR _regno$1162[ebp], eax
; Line 1169
	cmp	DWORD PTR _loop_dump_stream$S787, 0
	je	$L1165
; Line 1170
	mov	eax, DWORD PTR _savings$1164[ebp]
	push	eax
	push	OFFSET $SG1166
	mov	eax, DWORD PTR _loop_dump_stream$S787
	push	eax
	call	_fprintf
	add	esp, 12					; 0000000cH
; Line 1172
$L1165:
	mov	eax, DWORD PTR _regno$1162[ebp]
	mov	ecx, DWORD PTR _moved_once$S778
	movsx	eax, BYTE PTR [eax+ecx]
	or	eax, eax
	je	$L1167
; Line 1174
	shl	DWORD PTR _insn_count$[ebp], 1
; Line 1176
	cmp	DWORD PTR _loop_dump_stream$S787, 0
	je	$L1168
; Line 1177
	push	OFFSET $SG1169
	mov	eax, DWORD PTR _loop_dump_stream$S787
	push	eax
	call	_fprintf
	add	esp, 8
; Line 1178
$L1168:
; Line 1193
$L1167:
; Line 1196
	mov	eax, DWORD PTR _regno$1162[ebp]
	mov	ecx, DWORD PTR _already_moved$[ebp]
	movsx	eax, BYTE PTR [eax+ecx]
	or	eax, eax
	jne	$L1171
	mov	eax, DWORD PTR _m$[ebp]
	movsx	eax, WORD PTR [eax+16]
	imul	eax, DWORD PTR _savings$1164[ebp]
	imul	eax, DWORD PTR _threshold$[ebp]
	cmp	eax, DWORD PTR _insn_count$[ebp]
	jge	$L1171
	mov	eax, DWORD PTR _m$[ebp]
	cmp	DWORD PTR [eax+32], 0
	je	$L1170
	mov	eax, DWORD PTR _m$[ebp]
	mov	eax, DWORD PTR [eax+32]
	mov	eax, DWORD PTR [eax+20]
	shr	eax, 3
	test	al, 1
	je	$L1170
	mov	eax, DWORD PTR _m$[ebp]
	mov	eax, DWORD PTR [eax+32]
	mov	eax, DWORD PTR [eax+12]
	mov	ecx, DWORD PTR _n_times_used$S776
	movsx	eax, WORD PTR [ecx+eax*2]
	cmp	eax, 1
	jne	$L1170
$L1171:
; Line 1204
	mov	eax, DWORD PTR _m$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _count$1172[ebp], eax
	jmp	$L1175
$L1176:
	dec	DWORD PTR _count$1172[ebp]
$L1175:
	cmp	DWORD PTR _count$1172[ebp], 0
	jl	$L1177
; Line 1211
	push	0
	push	7
	mov	eax, DWORD PTR _p$1163[ebp]
	push	eax
	call	_find_reg_note
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _temp$1179[ebp], eax
	cmp	DWORD PTR _temp$1179[ebp], 0
	je	$L1180
; Line 1212
	mov	eax, DWORD PTR _temp$1179[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _p$1163[ebp], eax
; Line 1217
$L1180:
; Line 1218
	push	0
	push	6
	mov	eax, DWORD PTR _p$1163[ebp]
	push	eax
	call	_find_reg_note
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _temp$1179[ebp], eax
	cmp	DWORD PTR _temp$1179[ebp], 0
	je	$L1181
; Line 1220
	mov	DWORD PTR _fn_address$1182[ebp], 0
; Line 1221
	mov	DWORD PTR _fn_reg$1183[ebp], 0
; Line 1222
	mov	DWORD PTR _first$1174[ebp], 0
; Line 1224
	mov	eax, DWORD PTR _temp$1179[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _temp$1179[ebp], eax
	jmp	$L1184
$L1185:
	mov	eax, DWORD PTR _temp$1179[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	DWORD PTR _temp$1179[ebp], eax
$L1184:
	mov	eax, DWORD PTR _temp$1179[ebp]
	cmp	DWORD PTR _p$1163[ebp], eax
	je	$L1186
; Line 1226
	mov	eax, DWORD PTR _temp$1179[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	DWORD PTR _body$1187[ebp], eax
; Line 1237
	mov	eax, DWORD PTR _temp$1179[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 983040				; 000f0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1189
	mov	eax, DWORD PTR _body$1187[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1638400				; 00190000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1189
	mov	eax, DWORD PTR _body$1187[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1189
	push	0
	push	3
	mov	eax, DWORD PTR _temp$1179[ebp]
	push	eax
	call	_find_reg_note
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _n$1188[ebp], eax
	cmp	DWORD PTR _n$1188[ebp], 0
	je	$L1189
; Line 1239
	mov	eax, DWORD PTR _body$1187[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _fn_reg$1183[ebp], eax
; Line 1240
	mov	eax, DWORD PTR _fn_reg$1183[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1190
; Line 1241
	mov	eax, DWORD PTR _body$1187[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _fn_reg$1183[ebp], eax
; Line 1242
$L1190:
	mov	eax, DWORD PTR _n$1188[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _fn_address$1182[ebp], eax
; Line 1243
	jmp	$L1185
; Line 1248
$L1189:
; Line 1249
	mov	eax, DWORD PTR _temp$1179[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 983040				; 000f0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1191
	cmp	DWORD PTR _fn_address$1182[ebp], 0
	je	$L1191
; Line 1250
	mov	eax, DWORD PTR _fn_address$1182[ebp]
	push	eax
	mov	eax, DWORD PTR _fn_reg$1183[ebp]
	push	eax
	mov	eax, DWORD PTR _body$1187[ebp]
	push	eax
	call	_replace_call_address
	add	esp, 12					; 0000000cH
; Line 1251
$L1191:
	mov	eax, DWORD PTR _temp$1179[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 983040				; 000f0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1192
; Line 1252
	mov	eax, DWORD PTR _loop_start$[ebp]
	push	eax
	mov	eax, DWORD PTR _body$1187[ebp]
	push	eax
	call	_emit_call_insn_before
	add	esp, 8
	mov	DWORD PTR _i1$1178[ebp], eax
; Line 1253
	jmp	$L1193
$L1192:
; Line 1254
	mov	eax, DWORD PTR _loop_start$[ebp]
	push	eax
	mov	eax, DWORD PTR _body$1187[ebp]
	push	eax
	call	_emit_insn_before
	add	esp, 8
	mov	DWORD PTR _i1$1178[ebp], eax
$L1193:
; Line 1255
	cmp	DWORD PTR _first$1174[ebp], 0
	jne	$L1194
; Line 1256
	mov	eax, DWORD PTR _i1$1178[ebp]
	mov	DWORD PTR _first$1174[ebp], eax
; Line 1257
$L1194:
	mov	eax, DWORD PTR _temp$1179[ebp]
	mov	eax, DWORD PTR [eax+28]
	mov	ecx, DWORD PTR _i1$1178[ebp]
	mov	DWORD PTR [ecx+28], eax
; Line 1258
	mov	eax, DWORD PTR _temp$1179[ebp]
	push	eax
	call	_delete_insn
	add	esp, 4
; Line 1259
	jmp	$L1185
$L1186:
; Line 1261
$L1181:
	mov	eax, DWORD PTR _m$[ebp]
	cmp	DWORD PTR [eax+24], 0
	je	$L1195
; Line 1265
	mov	eax, DWORD PTR _p$1163[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _reg$1196[ebp], eax
; Line 1272
	mov	eax, DWORD PTR _loop_start$[ebp]
	push	eax
	mov	eax, 1
	mov	ecx, DWORD PTR _m$[ebp]
	mov	ecx, DWORD PTR [ecx+24]
	mov	ecx, DWORD PTR _mode_size[ecx*4]
	shl	ecx, 3
	shl	eax, cl
	dec	eax
	push	eax
	push	0
	push	30					; 0000001eH
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	push	eax
	mov	eax, DWORD PTR _reg$1196[ebp]
	push	eax
	mov	eax, DWORD PTR _reg$1196[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	push	eax
	push	53					; 00000035H
	call	_gen_rtx
	add	esp, 16					; 00000010H
	push	eax
	mov	eax, DWORD PTR _reg$1196[ebp]
	push	eax
	push	0
	push	25					; 00000019H
	call	_gen_rtx
	add	esp, 16					; 00000010H
	push	eax
	call	_emit_insn_before
	add	esp, 8
	mov	DWORD PTR _i1$1178[ebp], eax
; Line 1274
	jmp	$L1197
$L1195:
	mov	eax, DWORD PTR _p$1163[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 983040				; 000f0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1198
; Line 1275
	mov	eax, DWORD PTR _loop_start$[ebp]
	push	eax
	mov	eax, DWORD PTR _p$1163[ebp]
	mov	eax, DWORD PTR [eax+16]
	push	eax
	call	_emit_call_insn_before
	add	esp, 8
	mov	DWORD PTR _i1$1178[ebp], eax
; Line 1276
	jmp	$L1199
$L1198:
; Line 1277
	mov	eax, DWORD PTR _loop_start$[ebp]
	push	eax
	mov	eax, DWORD PTR _p$1163[ebp]
	mov	eax, DWORD PTR [eax+16]
	push	eax
	call	_emit_insn_before
	add	esp, 8
	mov	DWORD PTR _i1$1178[ebp], eax
$L1199:
$L1197:
; Line 1279
	cmp	DWORD PTR _new_start$[ebp], 0
	jne	$L1200
; Line 1280
	mov	eax, DWORD PTR _i1$1178[ebp]
	mov	DWORD PTR _new_start$[ebp], eax
; Line 1282
$L1200:
	cmp	DWORD PTR _loop_dump_stream$S787, 0
	je	$L1201
; Line 1283
	mov	eax, DWORD PTR _i1$1178[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	push	OFFSET $SG1202
	mov	eax, DWORD PTR _loop_dump_stream$S787
	push	eax
	call	_fprintf
	add	esp, 12					; 0000000cH
; Line 1287
$L1201:
	mov	eax, DWORD PTR _p$1163[ebp]
	mov	eax, DWORD PTR [eax+28]
	mov	ecx, DWORD PTR _i1$1178[ebp]
	mov	DWORD PTR [ecx+28], eax
; Line 1292
	mov	eax, DWORD PTR _i1$1178[ebp]
	cmp	DWORD PTR [eax+28], 0
	jne	$L1203
	mov	eax, DWORD PTR _m$[ebp]
	mov	eax, DWORD PTR [eax+20]
	shr	eax, 4
	test	al, 1
	jne	$L1203
	mov	eax, DWORD PTR _m$[ebp]
	mov	eax, DWORD PTR [eax+20]
	shr	eax, 2
	test	al, 1
	jne	$L1203
	mov	eax, DWORD PTR _p$1163[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2490368				; 00260000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1204
	mov	eax, DWORD PTR _p$1163[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2555904				; 00270000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1204
	mov	eax, DWORD PTR _p$1163[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1204
	mov	eax, DWORD PTR _p$1163[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2097152				; 00200000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1203
$L1204:
; Line 1295
	mov	eax, DWORD PTR _i1$1178[ebp]
	mov	eax, DWORD PTR [eax+28]
	push	eax
	mov	eax, DWORD PTR _p$1163[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	push	3
	push	2
	call	_gen_rtx
	add	esp, 16					; 00000010H
	mov	ecx, DWORD PTR _i1$1178[ebp]
	mov	DWORD PTR [ecx+28], eax
; Line 1300
$L1203:
	push	0
	push	6
	mov	eax, DWORD PTR _i1$1178[ebp]
	push	eax
	call	_find_reg_note
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _temp$1179[ebp], eax
	cmp	DWORD PTR _temp$1179[ebp], 0
	je	$L1205
; Line 1302
	mov	eax, DWORD PTR _first$1174[ebp]
	mov	ecx, DWORD PTR _temp$1179[ebp]
	mov	DWORD PTR [ecx+4], eax
; Line 1303
	push	0
	push	7
	mov	eax, DWORD PTR _first$1174[ebp]
	push	eax
	call	_find_reg_note
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _temp$1179[ebp], eax
; Line 1304
	mov	eax, DWORD PTR _i1$1178[ebp]
	mov	ecx, DWORD PTR _temp$1179[ebp]
	mov	DWORD PTR [ecx+4], eax
; Line 1307
$L1205:
	mov	eax, DWORD PTR _p$1163[ebp]
	push	eax
	call	_delete_insn
	add	esp, 4
; Line 1308
$L1206:
	mov	eax, DWORD PTR _p$1163[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	DWORD PTR _p$1163[ebp], eax
; Line 1309
$L1207:
	cmp	DWORD PTR _p$1163[ebp], 0
	je	$L1209
	mov	eax, DWORD PTR _p$1163[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1179648				; 00120000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1206
$L1209:
$L1208:
; Line 1310
	jmp	$L1176
$L1177:
; Line 1313
	sub	DWORD PTR _threshold$[ebp], 3
; Line 1317
	mov	eax, DWORD PTR _regno$1162[ebp]
	mov	ecx, DWORD PTR _already_moved$[ebp]
	mov	BYTE PTR [eax+ecx], 1
; Line 1320
	mov	eax, DWORD PTR _regno$1162[ebp]
	mov	ecx, DWORD PTR _moved_once$S778
	mov	BYTE PTR [eax+ecx], 1
; Line 1323
	mov	eax, DWORD PTR _m$[ebp]
	mov	eax, DWORD PTR [eax+20]
	shr	eax, 4
	test	al, 1
	jne	$L1210
; Line 1324
	mov	eax, DWORD PTR _regno$1162[ebp]
	mov	ecx, DWORD PTR _n_times_set$S775
	mov	WORD PTR [ecx+eax*2], 0
; Line 1326
$L1210:
	mov	eax, DWORD PTR _m$[ebp]
	mov	eax, DWORD PTR [eax+20]
	or	eax, 8
	mov	ecx, DWORD PTR _m$[ebp]
	mov	DWORD PTR [ecx+20], eax
; Line 1332
	mov	eax, DWORD PTR _regno$1162[ebp]
	mov	ecx, DWORD PTR _regno_first_uid
	movsx	eax, WORD PTR [ecx+eax*2]
	mov	ecx, DWORD PTR _uid_luid$S767
	mov	edx, DWORD PTR _loop_start$[ebp]
	mov	edx, DWORD PTR [edx+4]
	mov	ebx, DWORD PTR _uid_luid$S767
	mov	edx, DWORD PTR [ebx+edx*4]
	cmp	DWORD PTR [ecx+eax*4], edx
	jle	$L1211
; Line 1336
	mov	eax, DWORD PTR _loop_start$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _regno$1162[ebp]
	mov	edx, DWORD PTR _regno_first_uid
	mov	WORD PTR [edx+ecx*2], ax
; Line 1337
$L1211:
	mov	eax, DWORD PTR _regno$1162[ebp]
	mov	ecx, DWORD PTR _regno_last_uid
	movsx	eax, WORD PTR [ecx+eax*2]
	mov	ecx, DWORD PTR _uid_luid$S767
	mov	edx, DWORD PTR _end$[ebp]
	mov	edx, DWORD PTR [edx+4]
	mov	ebx, DWORD PTR _uid_luid$S767
	mov	edx, DWORD PTR [ebx+edx*4]
	cmp	DWORD PTR [ecx+eax*4], edx
	jge	$L1212
; Line 1338
	mov	eax, DWORD PTR _end$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _regno$1162[ebp]
	mov	edx, DWORD PTR _regno_last_uid
	mov	WORD PTR [edx+ecx*2], ax
; Line 1342
$L1212:
	mov	eax, DWORD PTR _m$[ebp]
	mov	eax, DWORD PTR [eax+36]
	mov	DWORD PTR _m1$1173[ebp], eax
	jmp	$L1213
$L1214:
	mov	eax, DWORD PTR _m1$1173[ebp]
	mov	eax, DWORD PTR [eax+36]
	mov	DWORD PTR _m1$1173[ebp], eax
$L1213:
	cmp	DWORD PTR _m1$1173[ebp], 0
	je	$L1215
; Line 1343
	mov	eax, DWORD PTR _m1$1173[ebp]
	mov	ecx, DWORD PTR _m$[ebp]
	cmp	DWORD PTR [eax+28], ecx
	jne	$L1216
; Line 1349
	mov	eax, DWORD PTR _m$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _m1$1173[ebp]
	mov	ecx, DWORD PTR [ecx+12]
	mov	edx, DWORD PTR _reg_map$[ebp]
	mov	DWORD PTR [edx+ecx*4], eax
; Line 1352
	mov	eax, DWORD PTR _m1$1173[ebp]
	mov	eax, DWORD PTR [eax+20]
	or	eax, 8
	mov	ecx, DWORD PTR _m1$1173[ebp]
	mov	DWORD PTR [ecx+20], eax
; Line 1356
	push	0
	push	6
	mov	eax, DWORD PTR _m1$1173[ebp]
	mov	eax, DWORD PTR [eax]
	push	eax
	call	_find_reg_note
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _temp$1217[ebp], eax
	cmp	DWORD PTR _temp$1217[ebp], 0
	je	$L1218
; Line 1359
	mov	eax, DWORD PTR _temp$1217[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _temp$1217[ebp], eax
	jmp	$L1219
$L1220:
	mov	eax, DWORD PTR _temp$1217[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	DWORD PTR _temp$1217[ebp], eax
$L1219:
	mov	eax, DWORD PTR _m1$1173[ebp]
	mov	ecx, DWORD PTR _temp$1217[ebp]
	cmp	DWORD PTR [eax], ecx
	je	$L1221
; Line 1360
	mov	eax, DWORD PTR _temp$1217[ebp]
	push	eax
	call	_delete_insn
	add	esp, 4
	jmp	$L1220
$L1221:
; Line 1362
$L1218:
	mov	eax, DWORD PTR _m1$1173[ebp]
	mov	eax, DWORD PTR [eax]
	push	eax
	call	_delete_insn
	add	esp, 4
; Line 1366
	mov	eax, DWORD PTR _m1$1173[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	ecx, DWORD PTR _already_moved$[ebp]
	mov	BYTE PTR [eax+ecx], 1
; Line 1370
	mov	eax, DWORD PTR _m$[ebp]
	mov	eax, DWORD PTR [eax+20]
	shr	eax, 4
	test	al, 1
	jne	$L1222
; Line 1371
	mov	eax, DWORD PTR _m1$1173[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	ecx, DWORD PTR _n_times_set$S775
	mov	WORD PTR [ecx+eax*2], 0
; Line 1372
$L1222:
; Line 1373
$L1216:
	jmp	$L1214
$L1215:
; Line 1374
	jmp	$L1223
$L1170:
	cmp	DWORD PTR _loop_dump_stream$S787, 0
	je	$L1224
; Line 1375
	push	OFFSET $SG1225
	mov	eax, DWORD PTR _loop_dump_stream$S787
	push	eax
	call	_fprintf
	add	esp, 8
; Line 1376
$L1224:
$L1223:
; Line 1377
	jmp	$L1226
$L1158:
	cmp	DWORD PTR _loop_dump_stream$S787, 0
	je	$L1227
	mov	eax, DWORD PTR _m$[ebp]
	cmp	DWORD PTR [eax+28], 0
	jne	$L1227
; Line 1378
	push	OFFSET $SG1228
	mov	eax, DWORD PTR _loop_dump_stream$S787
	push	eax
	call	_fprintf
	add	esp, 8
; Line 1380
$L1227:
$L1226:
	cmp	DWORD PTR _loop_dump_stream$S787, 0
	je	$L1229
; Line 1381
	push	OFFSET $SG1230
	mov	eax, DWORD PTR _loop_dump_stream$S787
	push	eax
	call	_fprintf
	add	esp, 8
; Line 1382
$L1229:
	jmp	$L1140
$L1141:
; Line 1384
	cmp	DWORD PTR _new_start$[ebp], 0
	jne	$L1231
; Line 1385
	mov	eax, DWORD PTR _loop_start$[ebp]
	mov	DWORD PTR _new_start$[ebp], eax
; Line 1389
$L1231:
	mov	eax, DWORD PTR _new_start$[ebp]
	mov	DWORD PTR _p$[ebp], eax
	jmp	$L1232
$L1233:
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	DWORD PTR _p$[ebp], eax
$L1232:
	mov	eax, DWORD PTR _end$[ebp]
	cmp	DWORD PTR _p$[ebp], eax
	je	$L1234
; Line 1391
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 851968				; 000d0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1236
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 917504				; 000e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1236
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 983040				; 000f0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1235
$L1236:
; Line 1395
	mov	eax, DWORD PTR _nregs$[ebp]
	push	eax
	mov	eax, DWORD PTR _reg_map$[ebp]
	push	eax
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax+16]
	push	eax
	call	_replace_regs
	add	esp, 12					; 0000000cH
; Line 1397
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax+28]
	mov	DWORD PTR _tail$1237[ebp], eax
	jmp	$L1238
$L1239:
	mov	eax, DWORD PTR _tail$1237[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _tail$1237[ebp], eax
$L1238:
	cmp	DWORD PTR _tail$1237[ebp], 0
	je	$L1240
; Line 1399
	mov	eax, DWORD PTR _tail$1237[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	mov	ecx, 83886080				; 05000000H
	and	ecx, -16777216				; ff000000H
	cmp	eax, ecx
	je	$L1242
	mov	eax, DWORD PTR _tail$1237[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	mov	ecx, 50331648				; 03000000H
	and	ecx, -16777216				; ff000000H
	cmp	eax, ecx
	jne	$L1241
$L1242:
; Line 1400
	mov	eax, DWORD PTR _nregs$[ebp]
	push	eax
	mov	eax, DWORD PTR _reg_map$[ebp]
	push	eax
	mov	eax, DWORD PTR _tail$1237[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	call	_replace_regs
	add	esp, 12					; 0000000cH
; Line 1401
$L1241:
	jmp	$L1239
$L1240:
; Line 1402
$L1235:
	jmp	$L1233
$L1234:
$L1133:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_move_movables ENDP
_TEXT	ENDS
EXTRN	_prev_real_insn:NEAR
EXTRN	_next_real_insn:NEAR
EXTRN	_copy_rtx:NEAR
EXTRN	_gen_label_rtx:NEAR
EXTRN	_sets_cc0_p:NEAR
EXTRN	_emit_label_after:NEAR
EXTRN	_emit_jump_insn_before:NEAR
EXTRN	_invert_jump:NEAR
_TEXT	SEGMENT
_start$ = 8
_end$ = 12
_loop_entry_jump$ = 16
_entry_insn$ = -12
_endtest$ = -8
_endtestjump$ = -4
_p$ = -16
_newlab$1264 = -24
_new_jump$1265 = -20
_new$1270 = -28
_loop_skip_over PROC NEAR
; Line 1414
	push	ebp
	mov	ebp, esp
	sub	esp, 28					; 0000001cH
	push	ebx
	push	esi
	push	edi
; Line 1418
	mov	eax, DWORD PTR _loop_entry_jump$[ebp]
	mov	eax, DWORD PTR [eax+32]
	mov	DWORD PTR _p$[ebp], eax
; Line 1421
$L1252:
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 851968				; 000d0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1253
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 917504				; 000e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1253
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 983040				; 000f0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1253
; Line 1422
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	DWORD PTR _p$[ebp], eax
	jmp	$L1252
$L1253:
; Line 1423
	mov	eax, DWORD PTR _p$[ebp]
	mov	DWORD PTR _entry_insn$[ebp], eax
; Line 1426
	jmp	$L1254
$L1255:
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	DWORD PTR _p$[ebp], eax
$L1254:
	cmp	DWORD PTR _p$[ebp], 0
	je	$L1256
; Line 1427
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1179648				; 00120000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1257
; Line 1428
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 851968				; 000d0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1260
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax+16]
	push	eax
	call	_sets_cc0_p
	add	esp, 4
	or	eax, eax
	je	$L1259
$L1260:
; Line 1429
	jmp	$L1256
; Line 1430
$L1259:
$L1257:
	jmp	$L1255
$L1256:
	cmp	DWORD PTR _p$[ebp], 0
	je	$L1262
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 851968				; 000d0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1261
$L1262:
; Line 1431
	sub	eax, eax
	jmp	$L1246
; Line 1432
$L1261:
	mov	eax, DWORD PTR _p$[ebp]
	mov	DWORD PTR _endtest$[ebp], eax
; Line 1433
	mov	eax, DWORD PTR _p$[ebp]
	push	eax
	call	_next_real_insn
	add	esp, 4
	mov	DWORD PTR _endtestjump$[ebp], eax
; Line 1441
	mov	eax, DWORD PTR _endtest$[ebp]
	mov	eax, DWORD PTR [eax+16]
	push	eax
	call	_sets_cc0_p
	add	esp, 4
	or	eax, eax
	jle	$L1263
	mov	eax, DWORD PTR _end$[ebp]
	push	eax
	call	_prev_real_insn
	add	esp, 4
	cmp	eax, DWORD PTR _endtestjump$[ebp]
	jne	$L1263
	mov	eax, DWORD PTR _endtestjump$[ebp]
	mov	eax, DWORD PTR [eax+32]
	push	eax
	call	_prev_real_insn
	add	esp, 4
	cmp	eax, DWORD PTR _loop_entry_jump$[ebp]
	jne	$L1263
; Line 1448
	mov	eax, DWORD PTR _entry_insn$[ebp]
	mov	DWORD PTR _p$[ebp], eax
	jmp	$L1266
$L1267:
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	DWORD PTR _p$[ebp], eax
$L1266:
	mov	eax, DWORD PTR _endtest$[ebp]
	cmp	DWORD PTR _p$[ebp], eax
	je	$L1268
; Line 1449
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 851968				; 000d0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1269
; Line 1451
	mov	eax, DWORD PTR _start$[ebp]
	push	eax
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax+16]
	push	eax
	call	_copy_rtx
	add	esp, 4
	push	eax
	call	_emit_insn_before
	add	esp, 8
	mov	DWORD PTR _new$1270[ebp], eax
; Line 1452
	mov	eax, DWORD PTR _p$[ebp]
	cmp	DWORD PTR [eax+28], 0
	je	$L1271
; Line 1453
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax+28]
	push	eax
	call	_copy_rtx
	add	esp, 4
	mov	ecx, DWORD PTR _new$1270[ebp]
	mov	DWORD PTR [ecx+28], eax
; Line 1454
$L1271:
; Line 1457
$L1269:
	jmp	$L1267
$L1268:
	mov	eax, DWORD PTR _start$[ebp]
	push	eax
	mov	eax, DWORD PTR _endtest$[ebp]
	mov	eax, DWORD PTR [eax+16]
	push	eax
	call	_copy_rtx
	add	esp, 4
	push	eax
	call	_emit_insn_before
	add	esp, 8
; Line 1461
	call	_gen_label_rtx
	mov	DWORD PTR _newlab$1264[ebp], eax
; Line 1462
	mov	eax, DWORD PTR _end$[ebp]
	push	eax
	mov	eax, DWORD PTR _newlab$1264[ebp]
	push	eax
	call	_emit_label_after
	add	esp, 8
; Line 1463
	mov	eax, DWORD PTR _start$[ebp]
	push	eax
	mov	eax, DWORD PTR _endtestjump$[ebp]
	mov	eax, DWORD PTR [eax+16]
	push	eax
	call	_copy_rtx
	add	esp, 4
	push	eax
	call	_emit_jump_insn_before
	add	esp, 8
; Line 1464
	mov	eax, DWORD PTR _start$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _new_jump$1265[ebp], eax
; Line 1465
	mov	eax, DWORD PTR _endtestjump$[ebp]
	mov	eax, DWORD PTR [eax+32]
	mov	ecx, DWORD PTR _new_jump$1265[ebp]
	mov	DWORD PTR [ecx+32], eax
; Line 1466
	mov	eax, DWORD PTR _endtestjump$[ebp]
	mov	eax, DWORD PTR [eax+32]
	inc	DWORD PTR [eax+20]
; Line 1467
	mov	eax, DWORD PTR _newlab$1264[ebp]
	push	eax
	mov	eax, DWORD PTR _new_jump$1265[ebp]
	push	eax
	call	_invert_jump
	add	esp, 8
; Line 1469
	mov	eax, DWORD PTR _loop_entry_jump$[ebp]
	push	eax
	call	_delete_insn
	add	esp, 4
; Line 1471
	mov	eax, 1
	jmp	$L1246
; Line 1474
$L1263:
	sub	eax, eax
	jmp	$L1246
; Line 1475
$L1246:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_loop_skip_over ENDP
_i$ = -12
_fmt$ = -8
_j$1295 = -16
_x$ = 8
_reg_map$ = 12
_nregs$ = 16
_code$ = -4
_replace_regs PROC NEAR
; Line 1487
	push	ebp
	mov	ebp, esp
	sub	esp, 20					; 00000014H
	push	ebx
	push	esi
	push	edi
; Line 1492
	cmp	DWORD PTR _x$[ebp], 0
	jne	$L1282
; Line 1493
	mov	eax, DWORD PTR _x$[ebp]
	jmp	$L1278
; Line 1495
$L1282:
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	sar	eax, 16					; 00000010H
	mov	DWORD PTR _code$[ebp], eax
; Line 1496
	mov	eax, DWORD PTR _code$[ebp]
	mov	DWORD PTR -20+[ebp], eax
	jmp	$L1283
; Line 1498
$L1287:
; Line 1505
	mov	eax, DWORD PTR _x$[ebp]
	jmp	$L1278
; Line 1507
$L1288:
; Line 1509
	mov	eax, DWORD PTR _x$[ebp]
	mov	ecx, DWORD PTR _nregs$[ebp]
	cmp	DWORD PTR [eax+4], ecx
	jge	$L1289
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _reg_map$[ebp]
	cmp	DWORD PTR [ecx+eax*4], 0
	je	$L1289
; Line 1510
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _reg_map$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4]
	jmp	$L1278
; Line 1511
$L1289:
	mov	eax, DWORD PTR _x$[ebp]
	jmp	$L1278
; Line 1512
	jmp	$L1284
$L1283:
	cmp	DWORD PTR -20+[ebp], 30			; 0000001eH
	jl	$L1284
	cmp	DWORD PTR -20+[ebp], 33			; 00000021H
	jle	$L1287
	cmp	DWORD PTR -20+[ebp], 34			; 00000022H
	je	$L1288
	cmp	DWORD PTR -20+[ebp], 38			; 00000026H
	jl	$L1284
	cmp	DWORD PTR -20+[ebp], 40			; 00000028H
	jle	$L1287
	jmp	$L1284
$L1284:
; Line 1514
	mov	eax, DWORD PTR _code$[ebp]
	mov	eax, DWORD PTR _rtx_format[eax*4]
	mov	DWORD PTR _fmt$[ebp], eax
; Line 1515
	mov	eax, DWORD PTR _code$[ebp]
	mov	eax, DWORD PTR _rtx_length[eax*4]
	dec	eax
	mov	DWORD PTR _i$[ebp], eax
	jmp	$L1290
$L1291:
	dec	DWORD PTR _i$[ebp]
$L1290:
	cmp	DWORD PTR _i$[ebp], 0
	jl	$L1292
; Line 1517
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _fmt$[ebp]
	movsx	eax, BYTE PTR [eax+ecx]
	cmp	eax, 101				; 00000065H
	jne	$L1293
; Line 1518
	mov	eax, DWORD PTR _nregs$[ebp]
	push	eax
	mov	eax, DWORD PTR _reg_map$[ebp]
	push	eax
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+4]
	push	eax
	call	_replace_regs
	add	esp, 12					; 0000000cH
	mov	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _x$[ebp]
	mov	DWORD PTR [edx+ecx*4+4], eax
; Line 1519
$L1293:
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _fmt$[ebp]
	movsx	eax, BYTE PTR [eax+ecx]
	cmp	eax, 69					; 00000045H
	jne	$L1294
; Line 1522
	mov	DWORD PTR _j$1295[ebp], 0
	jmp	$L1296
$L1297:
	inc	DWORD PTR _j$1295[ebp]
$L1296:
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+4]
	mov	ecx, DWORD PTR _j$1295[ebp]
	cmp	DWORD PTR [eax], ecx
	jbe	$L1298
; Line 1523
	mov	eax, DWORD PTR _nregs$[ebp]
	push	eax
	mov	eax, DWORD PTR _reg_map$[ebp]
	push	eax
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+4]
	mov	ecx, DWORD PTR _j$1295[ebp]
	mov	eax, DWORD PTR [eax+ecx*4+4]
	push	eax
	call	_replace_regs
	add	esp, 12					; 0000000cH
	mov	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _x$[ebp]
	mov	ecx, DWORD PTR [edx+ecx*4+4]
	mov	edx, DWORD PTR _j$1295[ebp]
	mov	DWORD PTR [ecx+edx*4+4], eax
	jmp	$L1297
$L1298:
; Line 1525
$L1294:
	jmp	$L1291
$L1292:
; Line 1526
	mov	eax, DWORD PTR _x$[ebp]
	jmp	$L1278
; Line 1527
$L1278:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_replace_regs ENDP
_x$ = 8
_reg$ = 12
_addr$ = 16
_code$ = -4
_i$ = -12
_fmt$ = -8
_j$1321 = -16
_replace_call_address PROC NEAR
; Line 1535
	push	ebp
	mov	ebp, esp
	sub	esp, 20					; 00000014H
	push	ebx
	push	esi
	push	edi
; Line 1540
	cmp	DWORD PTR _x$[ebp], 0
	jne	$L1306
; Line 1541
	jmp	$L1302
; Line 1542
$L1306:
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	sar	eax, 16					; 00000010H
	mov	DWORD PTR _code$[ebp], eax
; Line 1543
	mov	eax, DWORD PTR _code$[ebp]
	mov	DWORD PTR -20+[ebp], eax
	jmp	$L1307
; Line 1545
$L1311:
; Line 1553
	jmp	$L1302
; Line 1555
$L1312:
; Line 1557
	mov	eax, DWORD PTR _addr$[ebp]
	push	eax
	mov	eax, DWORD PTR _reg$[ebp]
	push	eax
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	call	_replace_call_address
	add	esp, 12					; 0000000cH
; Line 1558
	jmp	$L1302
; Line 1560
$L1313:
; Line 1562
	mov	eax, DWORD PTR _addr$[ebp]
	push	eax
	mov	eax, DWORD PTR _reg$[ebp]
	push	eax
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	call	_replace_call_address
	add	esp, 12					; 0000000cH
; Line 1563
	jmp	$L1302
; Line 1565
$L1314:
; Line 1568
	mov	eax, DWORD PTR _x$[ebp]
	mov	ecx, DWORD PTR _reg$[ebp]
	cmp	DWORD PTR [eax+4], ecx
	je	$L1315
; Line 1569
	call	_abort
; Line 1570
$L1315:
	mov	eax, DWORD PTR _addr$[ebp]
	mov	ecx, DWORD PTR _x$[ebp]
	mov	DWORD PTR [ecx+4], eax
; Line 1571
	jmp	$L1302
; Line 1572
	jmp	$L1308
$L1307:
	sub	DWORD PTR -20+[ebp], 25			; 00000019H
	cmp	DWORD PTR -20+[ebp], 15			; 0000000fH
	ja	$L1308
	shl	DWORD PTR -20+[ebp], 2
	mov	eax, DWORD PTR -20+[ebp]
	jmp	DWORD PTR $L2556[eax]
$L2556:
	DD	OFFSET $L1312
	DD	OFFSET $L1308
	DD	OFFSET $L1308
	DD	OFFSET $L1313
	DD	OFFSET $L1308
	DD	OFFSET $L1311
	DD	OFFSET $L1311
	DD	OFFSET $L1311
	DD	OFFSET $L1311
	DD	OFFSET $L1311
	DD	OFFSET $L1308
	DD	OFFSET $L1308
	DD	OFFSET $L1314
	DD	OFFSET $L1311
	DD	OFFSET $L1311
	DD	OFFSET $L1311
$L1308:
; Line 1574
	mov	eax, DWORD PTR _code$[ebp]
	mov	eax, DWORD PTR _rtx_format[eax*4]
	mov	DWORD PTR _fmt$[ebp], eax
; Line 1575
	mov	eax, DWORD PTR _code$[ebp]
	mov	eax, DWORD PTR _rtx_length[eax*4]
	dec	eax
	mov	DWORD PTR _i$[ebp], eax
	jmp	$L1316
$L1317:
	dec	DWORD PTR _i$[ebp]
$L1316:
	cmp	DWORD PTR _i$[ebp], 0
	jl	$L1318
; Line 1577
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _fmt$[ebp]
	movsx	eax, BYTE PTR [eax+ecx]
	cmp	eax, 101				; 00000065H
	jne	$L1319
; Line 1578
	mov	eax, DWORD PTR _addr$[ebp]
	push	eax
	mov	eax, DWORD PTR _reg$[ebp]
	push	eax
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+4]
	push	eax
	call	_replace_call_address
	add	esp, 12					; 0000000cH
; Line 1579
$L1319:
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _fmt$[ebp]
	movsx	eax, BYTE PTR [eax+ecx]
	cmp	eax, 69					; 00000045H
	jne	$L1320
; Line 1582
	mov	DWORD PTR _j$1321[ebp], 0
	jmp	$L1322
$L1323:
	inc	DWORD PTR _j$1321[ebp]
$L1322:
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+4]
	mov	ecx, DWORD PTR _j$1321[ebp]
	cmp	DWORD PTR [eax], ecx
	jbe	$L1324
; Line 1583
	mov	eax, DWORD PTR _addr$[ebp]
	push	eax
	mov	eax, DWORD PTR _reg$[ebp]
	push	eax
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+4]
	mov	ecx, DWORD PTR _j$1321[ebp]
	mov	eax, DWORD PTR [eax+ecx*4+4]
	push	eax
	call	_replace_call_address
	add	esp, 12					; 0000000cH
	jmp	$L1323
$L1324:
; Line 1585
$L1320:
	jmp	$L1317
$L1318:
; Line 1586
$L1302:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_replace_call_address ENDP
_TEXT	ENDS
EXTRN	_rtx_varies_p:NEAR
_TEXT	SEGMENT
_j$1345 = -20
_x$ = 8
_code$ = -4
_i$ = -12
_fmt$ = -8
_value$ = -16
_count_nonfixed_reads PROC NEAR
; Line 1594
	push	ebp
	mov	ebp, esp
	sub	esp, 24					; 00000018H
	push	ebx
	push	esi
	push	edi
; Line 1600
	cmp	DWORD PTR _x$[ebp], 0
	jne	$L1332
; Line 1601
	sub	eax, eax
	jmp	$L1327
; Line 1603
$L1332:
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	sar	eax, 16					; 00000010H
	mov	DWORD PTR _code$[ebp], eax
; Line 1604
	mov	eax, DWORD PTR _code$[ebp]
	mov	DWORD PTR -24+[ebp], eax
	jmp	$L1333
; Line 1606
$L1337:
; Line 1614
	sub	eax, eax
	jmp	$L1327
; Line 1616
$L1338:
; Line 1617
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	call	_count_nonfixed_reads
	add	esp, 4
	mov	ebx, eax
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	call	_rtx_varies_p
	add	esp, 4
	add	eax, ebx
	jmp	$L1327
; Line 1618
	jmp	$L1334
$L1333:
	cmp	DWORD PTR -24+[ebp], 30			; 0000001eH
	jl	$L1334
	cmp	DWORD PTR -24+[ebp], 34			; 00000022H
	jle	$L1337
	cmp	DWORD PTR -24+[ebp], 37			; 00000025H
	je	$L1338
	cmp	DWORD PTR -24+[ebp], 38			; 00000026H
	jl	$L1334
	cmp	DWORD PTR -24+[ebp], 40			; 00000028H
	jle	$L1337
	jmp	$L1334
$L1334:
; Line 1620
	mov	DWORD PTR _value$[ebp], 0
; Line 1621
	mov	eax, DWORD PTR _code$[ebp]
	mov	eax, DWORD PTR _rtx_format[eax*4]
	mov	DWORD PTR _fmt$[ebp], eax
; Line 1622
	mov	eax, DWORD PTR _code$[ebp]
	mov	eax, DWORD PTR _rtx_length[eax*4]
	dec	eax
	mov	DWORD PTR _i$[ebp], eax
	jmp	$L1340
$L1341:
	dec	DWORD PTR _i$[ebp]
$L1340:
	cmp	DWORD PTR _i$[ebp], 0
	jl	$L1342
; Line 1624
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _fmt$[ebp]
	movsx	eax, BYTE PTR [eax+ecx]
	cmp	eax, 101				; 00000065H
	jne	$L1343
; Line 1625
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+4]
	push	eax
	call	_count_nonfixed_reads
	add	esp, 4
	add	DWORD PTR _value$[ebp], eax
; Line 1626
$L1343:
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _fmt$[ebp]
	movsx	eax, BYTE PTR [eax+ecx]
	cmp	eax, 69					; 00000045H
	jne	$L1344
; Line 1629
	mov	DWORD PTR _j$1345[ebp], 0
	jmp	$L1346
$L1347:
	inc	DWORD PTR _j$1345[ebp]
$L1346:
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+4]
	mov	ecx, DWORD PTR _j$1345[ebp]
	cmp	DWORD PTR [eax], ecx
	jbe	$L1348
; Line 1630
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+4]
	mov	ecx, DWORD PTR _j$1345[ebp]
	mov	eax, DWORD PTR [eax+ecx*4+4]
	push	eax
	call	_count_nonfixed_reads
	add	esp, 4
	add	DWORD PTR _value$[ebp], eax
	jmp	$L1347
$L1348:
; Line 1632
$L1344:
	jmp	$L1341
$L1342:
; Line 1633
	mov	eax, DWORD PTR _value$[ebp]
	jmp	$L1327
; Line 1634
$L1327:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_count_nonfixed_reads ENDP
_TEXT	ENDS
EXTRN	_note_stores:NEAR
_BSS	SEGMENT
_unknown_address_altered$S770 DD 01H DUP (?)
_unknown_aggregate_altered$S771 DD 01H DUP (?)
_fixed_aggregate_altered$S772 DD 01H DUP (?)
_loop_store_addrs_idx$S781 DD 01H DUP (?)
_num_mem_sets$S783 DD 01H DUP (?)
_loops_enclosed$S784 DD 01H DUP (?)
_BSS	ENDS
_TEXT	SEGMENT
_f$ = 8
_start$ = 12
_level$ = -12
_insn$ = -4
_end$ = -8
_verify_loop PROC NEAR
; Line 1687
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
	push	ebx
	push	esi
	push	edi
; Line 1688
	mov	DWORD PTR _level$[ebp], 1
; Line 1694
	mov	DWORD PTR _unknown_address_altered$S770, 0
; Line 1695
	mov	DWORD PTR _unknown_aggregate_altered$S771, 0
; Line 1696
	mov	DWORD PTR _fixed_aggregate_altered$S772, 0
; Line 1697
	mov	DWORD PTR _loop_has_call$S773, 0
; Line 1698
	mov	DWORD PTR _loop_store_addrs_idx$S781, 0
; Line 1700
	mov	DWORD PTR _num_mem_sets$S783, 0
; Line 1701
	mov	DWORD PTR _loops_enclosed$S784, 1
; Line 1702
	mov	DWORD PTR _loop_continue$S774, 0
; Line 1704
	mov	eax, DWORD PTR _start$[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	DWORD PTR _insn$[ebp], eax
	jmp	$L1355
$L1356:
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	DWORD PTR _insn$[ebp], eax
$L1355:
	cmp	DWORD PTR _level$[ebp], 0
	jle	$L1357
; Line 1706
	cmp	DWORD PTR _insn$[ebp], 0
	jne	$L1358
; Line 1708
	sub	eax, eax
	jmp	$L1351
; Line 1709
$L1358:
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1179648				; 00120000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1359
; Line 1711
	mov	eax, DWORD PTR _insn$[ebp]
	cmp	DWORD PTR [eax+20], -4			; fffffffcH
	jne	$L1360
; Line 1713
	inc	DWORD PTR _level$[ebp]
; Line 1715
	inc	DWORD PTR _loops_enclosed$S784
; Line 1717
	jmp	$L1361
$L1360:
	mov	eax, DWORD PTR _insn$[ebp]
	cmp	DWORD PTR [eax+20], -5			; fffffffbH
	jne	$L1362
; Line 1719
	dec	DWORD PTR _level$[ebp]
; Line 1720
	jne	$L1363
; Line 1722
	mov	eax, DWORD PTR _insn$[ebp]
	mov	DWORD PTR _end$[ebp], eax
; Line 1723
	jmp	$L1357
; Line 1725
$L1363:
; Line 1726
	jmp	$L1364
$L1362:
	mov	eax, DWORD PTR _insn$[ebp]
	cmp	DWORD PTR [eax+20], -8			; fffffff8H
	jne	$L1365
; Line 1728
	cmp	DWORD PTR _level$[ebp], 1
	jne	$L1366
; Line 1729
	mov	eax, DWORD PTR _insn$[ebp]
	mov	DWORD PTR _loop_continue$S774, eax
; Line 1730
$L1366:
; Line 1735
	jmp	$L1367
$L1365:
	mov	eax, DWORD PTR _insn$[ebp]
	cmp	DWORD PTR [eax+20], -7			; fffffff9H
	jne	$L1368
; Line 1736
	sub	eax, eax
	jmp	$L1351
; Line 1737
$L1368:
$L1367:
$L1364:
$L1361:
; Line 1738
	jmp	$L1369
$L1359:
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 983040				; 000f0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1370
; Line 1740
	mov	DWORD PTR _unknown_address_altered$S770, 1
; Line 1741
	mov	DWORD PTR _loop_has_call$S773, 1
; Line 1745
	jmp	$L1371
$L1370:
; Line 1747
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 851968				; 000d0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1373
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 917504				; 000e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1372
$L1373:
; Line 1748
	push	OFFSET _note_addr_stored
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+16]
	push	eax
	call	_note_stores
	add	esp, 8
; Line 1749
$L1372:
$L1371:
$L1369:
; Line 1750
	jmp	$L1356
$L1357:
; Line 1755
	mov	eax, DWORD PTR _f$[ebp]
	mov	DWORD PTR _insn$[ebp], eax
	jmp	$L1375
$L1376:
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	DWORD PTR _insn$[ebp], eax
$L1375:
	cmp	DWORD PTR _insn$[ebp], 0
	je	$L1377
; Line 1765
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 917504				; 000e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1378
	mov	eax, DWORD PTR _insn$[ebp]
	mov	ecx, DWORD PTR _max_uid$S768
	cmp	DWORD PTR [eax+4], ecx
	jge	$L1378
	mov	eax, DWORD PTR _start$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _uid_luid$S767
	mov	edx, DWORD PTR _insn$[ebp]
	mov	edx, DWORD PTR [edx+4]
	mov	ebx, DWORD PTR _uid_luid$S767
	mov	edx, DWORD PTR [ebx+edx*4]
	cmp	DWORD PTR [ecx+eax*4], edx
	jg	$L1379
	mov	eax, DWORD PTR _end$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _uid_luid$S767
	mov	edx, DWORD PTR _insn$[ebp]
	mov	edx, DWORD PTR [edx+4]
	mov	ebx, DWORD PTR _uid_luid$S767
	mov	edx, DWORD PTR [ebx+edx*4]
	cmp	DWORD PTR [ecx+eax*4], edx
	jge	$L1378
$L1379:
	mov	eax, DWORD PTR _end$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _uid_luid$S767
	mov	eax, DWORD PTR [ecx+eax*4]
	push	eax
	mov	eax, DWORD PTR _start$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _uid_luid$S767
	mov	eax, DWORD PTR [ecx+eax*4]
	push	eax
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+16]
	push	eax
	call	_can_jump_into_range_p
	add	esp, 12					; 0000000cH
	or	eax, eax
	je	$L1378
; Line 1766
	sub	eax, eax
	jmp	$L1351
; Line 1785
$L1378:
	jmp	$L1376
$L1377:
	mov	eax, DWORD PTR _end$[ebp]
	jmp	$L1351
; Line 1786
$L1351:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_verify_loop ENDP
_x$ = 8
_beg$ = 12
_end$ = 16
_code$ = -4
_i$ = -12
_fmt$ = -8
_luid$1388 = -16
_j$1396 = -20
_can_jump_into_range_p PROC NEAR
; Line 1795
	push	ebp
	mov	ebp, esp
	sub	esp, 20					; 00000014H
	push	ebx
	push	esi
	push	edi
; Line 1796
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	sar	eax, 16					; 00000010H
	mov	DWORD PTR _code$[ebp], eax
; Line 1800
	cmp	DWORD PTR _code$[ebp], 38		; 00000026H
	jne	$L1387
; Line 1802
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _uid_luid$S767
	mov	eax, DWORD PTR [ecx+eax*4]
	mov	DWORD PTR _luid$1388[ebp], eax
; Line 1803
	mov	eax, DWORD PTR _luid$1388[ebp]
	cmp	DWORD PTR _beg$[ebp], eax
	jge	$L2557
	mov	eax, DWORD PTR _luid$1388[ebp]
	cmp	DWORD PTR _end$[ebp], eax
	jle	$L2557
	mov	eax, 1
	jmp	$L2558
$L2557:
	sub	eax, eax
$L2558:
	jmp	$L1383
; Line 1806
$L1387:
	mov	eax, DWORD PTR _code$[ebp]
	mov	eax, DWORD PTR _rtx_format[eax*4]
	mov	DWORD PTR _fmt$[ebp], eax
; Line 1807
	mov	eax, DWORD PTR _code$[ebp]
	mov	eax, DWORD PTR _rtx_length[eax*4]
	dec	eax
	mov	DWORD PTR _i$[ebp], eax
	jmp	$L1389
$L1390:
	dec	DWORD PTR _i$[ebp]
$L1389:
	cmp	DWORD PTR _i$[ebp], 0
	jl	$L1391
; Line 1809
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _fmt$[ebp]
	movsx	eax, BYTE PTR [eax+ecx]
	cmp	eax, 101				; 00000065H
	jne	$L1392
; Line 1811
	mov	eax, DWORD PTR _end$[ebp]
	push	eax
	mov	eax, DWORD PTR _beg$[ebp]
	push	eax
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+4]
	push	eax
	call	_can_jump_into_range_p
	add	esp, 12					; 0000000cH
	or	eax, eax
	je	$L1393
; Line 1812
	mov	eax, 1
	jmp	$L1383
; Line 1813
$L1393:
; Line 1814
	jmp	$L1394
$L1392:
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _fmt$[ebp]
	movsx	eax, BYTE PTR [eax+ecx]
	cmp	eax, 69					; 00000045H
	jne	$L1395
; Line 1817
	mov	DWORD PTR _j$1396[ebp], 0
	jmp	$L1397
$L1398:
	inc	DWORD PTR _j$1396[ebp]
$L1397:
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+4]
	mov	ecx, DWORD PTR _j$1396[ebp]
	cmp	DWORD PTR [eax], ecx
	jbe	$L1399
; Line 1818
	mov	eax, DWORD PTR _end$[ebp]
	push	eax
	mov	eax, DWORD PTR _beg$[ebp]
	push	eax
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+4]
	mov	ecx, DWORD PTR _j$1396[ebp]
	mov	eax, DWORD PTR [eax+ecx*4+4]
	push	eax
	call	_can_jump_into_range_p
	add	esp, 12					; 0000000cH
	or	eax, eax
	je	$L1400
; Line 1819
	mov	eax, 1
	jmp	$L1383
; Line 1820
$L1400:
	jmp	$L1398
$L1399:
; Line 1821
$L1395:
$L1394:
	jmp	$L1390
$L1391:
; Line 1823
	sub	eax, eax
	jmp	$L1383
; Line 1824
$L1383:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_can_jump_into_range_p ENDP
_insn$ = 8
_end$ = 12
_labels_in_range_p PROC NEAR
; Line 1833
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 1834
$L1405:
	cmp	DWORD PTR _insn$[ebp], 0
	je	$L1406
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _uid_luid$S767
	mov	edx, DWORD PTR _end$[ebp]
	cmp	DWORD PTR [ecx+eax*4], edx
	jg	$L1406
; Line 1836
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1114112				; 00110000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1407
; Line 1837
	sub	eax, eax
	jmp	$L1403
; Line 1838
$L1407:
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	DWORD PTR _insn$[ebp], eax
; Line 1839
	jmp	$L1405
$L1406:
; Line 1841
	sub	eax, eax
	jmp	$L1403
; Line 1842
$L1403:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_labels_in_range_p ENDP
_TEXT	ENDS
EXTRN	_rtx_addr_varies_p:NEAR
_BSS	SEGMENT
_loop_store_addrs$S779 DD 0aH DUP (?)
_loop_store_widths$S780 DD 0aH DUP (?)
_BSS	ENDS
_TEXT	SEGMENT
_x$ = 8
_i$1420 = -8
_addr$1421 = -4
_note_addr_stored PROC NEAR
; Line 1849
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	push	ebx
	push	esi
	push	edi
; Line 1850
	cmp	DWORD PTR _x$[ebp], 0
	je	$L1411
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2424832				; 00250000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1410
$L1411:
; Line 1851
	jmp	$L1409
; Line 1855
$L1410:
	inc	DWORD PTR _num_mem_sets$S783
; Line 1856
	cmp	DWORD PTR _unknown_address_altered$S770, 0
	je	$L1412
; Line 1857
	jmp	$L1409
; Line 1859
$L1412:
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	mov	ecx, 436207616				; 1a000000H
	and	ecx, -16777216				; ff000000H
	cmp	eax, ecx
	jne	$L1413
; Line 1860
	mov	DWORD PTR _unknown_address_altered$S770, 1
; Line 1861
	jmp	$L1414
$L1413:
	mov	eax, DWORD PTR _x$[ebp]
	push	eax
	call	_rtx_addr_varies_p
	add	esp, 4
	or	eax, eax
	je	$L1416
; Line 1863
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2883584				; 002c0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1417
; Line 1864
	mov	DWORD PTR _unknown_aggregate_altered$S771, 1
; Line 1865
	jmp	$L1418
$L1417:
; Line 1866
	mov	DWORD PTR _unknown_address_altered$S770, 1
$L1418:
; Line 1868
	jmp	$L1419
$L1416:
; Line 1871
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _addr$1421[ebp], eax
; Line 1873
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shr	eax, 28					; 0000001cH
	test	al, 1
	je	$L1422
; Line 1874
	mov	DWORD PTR _fixed_aggregate_altered$S772, 1
; Line 1875
$L1422:
	mov	DWORD PTR _i$1420[ebp], 0
	jmp	$L1423
$L1424:
	inc	DWORD PTR _i$1420[ebp]
$L1423:
	mov	eax, DWORD PTR _i$1420[ebp]
	cmp	DWORD PTR _loop_store_addrs_idx$S781, eax
	jle	$L1425
; Line 1876
	mov	eax, DWORD PTR _addr$1421[ebp]
	push	eax
	mov	eax, DWORD PTR _i$1420[ebp]
	mov	eax, DWORD PTR _loop_store_addrs$S779[eax*4]
	push	eax
	call	_rtx_equal_p
	add	esp, 8
	or	eax, eax
	je	$L1426
; Line 1878
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	sar	eax, 22					; 00000016H
	mov	ecx, DWORD PTR _i$1420[ebp]
	mov	ecx, DWORD PTR _loop_store_widths$S780[ecx*4]
	cmp	DWORD PTR _mode_size[eax], ecx
	jle	$L1427
; Line 1879
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	sar	eax, 22					; 00000016H
	mov	eax, DWORD PTR _mode_size[eax]
	mov	ecx, DWORD PTR _i$1420[ebp]
	mov	DWORD PTR _loop_store_widths$S780[ecx*4], eax
; Line 1880
$L1427:
	jmp	$L1425
; Line 1882
$L1426:
	jmp	$L1424
$L1425:
	cmp	DWORD PTR _i$1420[ebp], 10		; 0000000aH
	jne	$L1428
; Line 1883
	mov	DWORD PTR _unknown_address_altered$S770, 1
; Line 1884
	jmp	$L1429
$L1428:
	mov	eax, DWORD PTR _i$1420[ebp]
	cmp	DWORD PTR _loop_store_addrs_idx$S781, eax
	jne	$L1430
; Line 1886
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	sar	eax, 22					; 00000016H
	mov	eax, DWORD PTR _mode_size[eax]
	mov	ecx, DWORD PTR _i$1420[ebp]
	mov	DWORD PTR _loop_store_widths$S780[ecx*4], eax
; Line 1887
	mov	eax, DWORD PTR _addr$1421[ebp]
	mov	ecx, DWORD PTR _loop_store_addrs_idx$S781
	mov	DWORD PTR _loop_store_addrs$S779[ecx*4], eax
	inc	DWORD PTR _loop_store_addrs_idx$S781
; Line 1889
$L1430:
$L1429:
$L1419:
$L1414:
; Line 1890
$L1409:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_note_addr_stored ENDP
_TEXT	ENDS
PUBLIC	_addr_overlap_p
EXTRN	_frame_pointer_rtx:DWORD
EXTRN	_arg_pointer_rtx:DWORD
_TEXT	SEGMENT
_j$1472 = -24
_tem$1476 = -28
_x$ = 8
_i$ = -16
_code$ = -8
_fmt$ = -12
_conditional$ = -4
_tem$1467 = -20
_invariant_p PROC NEAR
; Line 1909
	push	ebp
	mov	ebp, esp
	sub	esp, 32					; 00000020H
	push	ebx
	push	esi
	push	edi
; Line 1913
	mov	DWORD PTR _conditional$[ebp], 0
; Line 1915
	cmp	DWORD PTR _x$[ebp], 0
	jne	$L1437
; Line 1916
	mov	eax, 1
	jmp	$L1432
; Line 1917
$L1437:
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	sar	eax, 16					; 00000010H
	mov	DWORD PTR _code$[ebp], eax
; Line 1918
	mov	eax, DWORD PTR _code$[ebp]
	mov	DWORD PTR -32+[ebp], eax
	jmp	$L1438
; Line 1920
$L1442:
; Line 1925
	mov	eax, 1
	jmp	$L1432
; Line 1927
$L1443:
; Line 1929
	sub	eax, eax
	jmp	$L1432
; Line 1931
$L1444:
; Line 1934
	mov	eax, DWORD PTR _x$[ebp]
	cmp	DWORD PTR _frame_pointer_rtx, eax
	je	$L1446
	mov	eax, DWORD PTR _arg_pointer_rtx
	cmp	DWORD PTR _x$[ebp], eax
	jne	$L1445
$L1446:
; Line 1935
	mov	eax, 1
	jmp	$L1432
; Line 1936
$L1445:
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _n_times_set$S775
	movsx	eax, WORD PTR [ecx+eax*2]
	cmp	eax, -1
	jne	$L1447
; Line 1937
	mov	eax, 2
	jmp	$L1432
; Line 1938
$L1447:
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _n_times_set$S775
	movsx	eax, WORD PTR [ecx+eax*2]
	cmp	eax, 1
	sbb	eax, eax
	neg	eax
	jmp	$L1432
; Line 1940
$L1448:
; Line 1945
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2555904				; 00270000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1449
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shr	eax, 26					; 0000001aH
	test	al, 1
	je	$L1449
; Line 1946
	mov	eax, 1
	jmp	$L1432
; Line 1949
$L1449:
	cmp	DWORD PTR _unknown_address_altered$S770, 0
	je	$L1450
; Line 1950
	sub	eax, eax
	jmp	$L1432
; Line 1952
$L1450:
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shr	eax, 27					; 0000001bH
	test	al, 1
	je	$L1451
; Line 1953
	sub	eax, eax
	jmp	$L1432
; Line 1962
$L1451:
; Line 1964
	cmp	DWORD PTR _unknown_aggregate_altered$S771, 0
	je	$L1452
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shr	eax, 28					; 0000001cH
	test	al, 1
	jne	$L1453
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2883584				; 002c0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1453
	mov	eax, DWORD PTR _x$[ebp]
	push	eax
	call	_rtx_addr_varies_p
	add	esp, 4
	or	eax, eax
	je	$L1452
$L1453:
; Line 1965
	sub	eax, eax
	jmp	$L1432
; Line 1969
$L1452:
; Line 1970
	cmp	DWORD PTR _fixed_aggregate_altered$S772, 0
	je	$L1454
	mov	eax, DWORD PTR _x$[ebp]
	push	eax
	call	_rtx_addr_varies_p
	add	esp, 4
	or	eax, eax
	je	$L1454
; Line 1971
	sub	eax, eax
	jmp	$L1432
; Line 1973
$L1454:
; Line 1975
	cmp	DWORD PTR _loop_store_addrs_idx$S781, 0
	je	$L1455
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shr	eax, 28					; 0000001cH
	test	al, 1
	jne	$L1455
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2883584				; 002c0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1455
	mov	eax, DWORD PTR _x$[ebp]
	push	eax
	call	_rtx_addr_varies_p
	add	esp, 4
	or	eax, eax
	je	$L1455
; Line 1976
	sub	eax, eax
	jmp	$L1432
; Line 1978
$L1455:
	mov	eax, DWORD PTR _loop_store_addrs_idx$S781
	dec	eax
	mov	DWORD PTR _i$[ebp], eax
	jmp	$L1456
$L1457:
	dec	DWORD PTR _i$[ebp]
$L1456:
	cmp	DWORD PTR _i$[ebp], 0
	jl	$L1458
; Line 1979
	mov	eax, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _loop_store_widths$S780[eax*4]
	push	eax
	mov	eax, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _loop_store_addrs$S779[eax*4]
	push	eax
	mov	eax, DWORD PTR _x$[ebp]
	push	eax
	call	_addr_overlap_p
	add	esp, 12					; 0000000cH
	or	eax, eax
	je	$L1460
; Line 1980
	sub	eax, eax
	jmp	$L1432
; Line 1983
$L1460:
	jmp	$L1457
$L1458:
	jmp	$L1439
; Line 1985
$L1461:
; Line 1987
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shr	eax, 27					; 0000001bH
	test	al, 1
	je	$L1462
; Line 1988
	sub	eax, eax
	jmp	$L1432
; Line 1989
$L1462:
	jmp	$L1439
$L1438:
	sub	DWORD PTR -32+[ebp], 22			; 00000016H
	cmp	DWORD PTR -32+[ebp], 18			; 00000012H
	ja	$L1439
	shl	DWORD PTR -32+[ebp], 2
	mov	eax, DWORD PTR -32+[ebp]
	jmp	DWORD PTR $L2559[eax]
$L2559:
	DD	OFFSET $L1461
	DD	OFFSET $L1439
	DD	OFFSET $L1439
	DD	OFFSET $L1439
	DD	OFFSET $L1439
	DD	OFFSET $L1439
	DD	OFFSET $L1439
	DD	OFFSET $L1439
	DD	OFFSET $L1442
	DD	OFFSET $L1442
	DD	OFFSET $L1442
	DD	OFFSET $L1443
	DD	OFFSET $L1444
	DD	OFFSET $L1439
	DD	OFFSET $L1439
	DD	OFFSET $L1448
	DD	OFFSET $L1442
	DD	OFFSET $L1442
	DD	OFFSET $L1443
$L1439:
; Line 1991
	mov	eax, DWORD PTR _code$[ebp]
	mov	eax, DWORD PTR _rtx_format[eax*4]
	mov	DWORD PTR _fmt$[ebp], eax
; Line 1992
	mov	eax, DWORD PTR _code$[ebp]
	mov	eax, DWORD PTR _rtx_length[eax*4]
	dec	eax
	mov	DWORD PTR _i$[ebp], eax
	jmp	$L1463
$L1464:
	dec	DWORD PTR _i$[ebp]
$L1463:
	cmp	DWORD PTR _i$[ebp], 0
	jl	$L1465
; Line 1994
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _fmt$[ebp]
	movsx	eax, BYTE PTR [eax+ecx]
	cmp	eax, 101				; 00000065H
	jne	$L1466
; Line 1996
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+4]
	push	eax
	call	_invariant_p
	add	esp, 4
	mov	DWORD PTR _tem$1467[ebp], eax
; Line 1997
	cmp	DWORD PTR _tem$1467[ebp], 0
	jne	$L1468
; Line 1998
	sub	eax, eax
	jmp	$L1432
; Line 1999
$L1468:
	cmp	DWORD PTR _tem$1467[ebp], 2
	jne	$L1469
; Line 2000
	mov	DWORD PTR _conditional$[ebp], 1
; Line 2001
$L1469:
; Line 2002
	jmp	$L1470
$L1466:
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _fmt$[ebp]
	movsx	eax, BYTE PTR [eax+ecx]
	cmp	eax, 69					; 00000045H
	jne	$L1471
; Line 2005
	mov	DWORD PTR _j$1472[ebp], 0
	jmp	$L1473
$L1474:
	inc	DWORD PTR _j$1472[ebp]
$L1473:
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+4]
	mov	ecx, DWORD PTR _j$1472[ebp]
	cmp	DWORD PTR [eax], ecx
	jbe	$L1475
; Line 2007
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+4]
	mov	ecx, DWORD PTR _j$1472[ebp]
	mov	eax, DWORD PTR [eax+ecx*4+4]
	push	eax
	call	_invariant_p
	add	esp, 4
	mov	DWORD PTR _tem$1476[ebp], eax
; Line 2008
	cmp	DWORD PTR _tem$1476[ebp], 0
	jne	$L1477
; Line 2009
	sub	eax, eax
	jmp	$L1432
; Line 2010
$L1477:
	cmp	DWORD PTR _tem$1476[ebp], 2
	jne	$L1478
; Line 2011
	mov	DWORD PTR _conditional$[ebp], 1
; Line 2012
$L1478:
	jmp	$L1474
$L1475:
; Line 2015
$L1471:
$L1470:
	jmp	$L1464
$L1465:
; Line 2017
	mov	eax, DWORD PTR _conditional$[ebp]
	inc	eax
	jmp	$L1432
; Line 2018
$L1432:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_invariant_p ENDP
_TEXT	ENDS
EXTRN	_refers_to_mem_p:NEAR
_TEXT	SEGMENT
_other$ = 8
_base$ = 12
_size$ = 16
_start$ = -8
_end$ = -4
_addr_overlap_p PROC NEAR
; Line 2028
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	push	ebx
	push	esi
	push	edi
; Line 2029
	mov	DWORD PTR _start$[ebp], 0
; Line 2031
	mov	eax, DWORD PTR _base$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2097152				; 00200000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1485
; Line 2032
	mov	eax, DWORD PTR _base$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _base$[ebp], eax
; Line 2033
$L1485:
; Line 2034
	mov	eax, DWORD PTR _base$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2883584				; 002c0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1486
	mov	eax, DWORD PTR _base$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1486
; Line 2036
	mov	eax, DWORD PTR _base$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _start$[ebp], eax
; Line 2037
	mov	eax, DWORD PTR _base$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _base$[ebp], eax
; Line 2040
$L1486:
	mov	eax, DWORD PTR _start$[ebp]
	add	eax, DWORD PTR _size$[ebp]
	mov	DWORD PTR _end$[ebp], eax
; Line 2041
	mov	eax, DWORD PTR _end$[ebp]
	push	eax
	mov	eax, DWORD PTR _start$[ebp]
	push	eax
	mov	eax, DWORD PTR _base$[ebp]
	push	eax
	mov	eax, DWORD PTR _other$[ebp]
	push	eax
	call	_refers_to_mem_p
	add	esp, 16					; 00000010H
	jmp	$L1482
; Line 2042
$L1482:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_addr_overlap_p ENDP
_reg$ = 8
_n_sets$ = 12
_insn$ = 16
_p$ = -28
_regno$ = -16
_temp$ = -8
_count$ = -4
_old$ = -12
_value$ = -20
_this$ = -24
_code$1503 = -32
_consec_sets_invariant_p PROC NEAR
; Line 2058
	push	ebp
	mov	ebp, esp
	sub	esp, 32					; 00000020H
	push	ebx
	push	esi
	push	edi
; Line 2059
	mov	eax, DWORD PTR _insn$[ebp]
	mov	DWORD PTR _p$[ebp], eax
; Line 2060
	mov	eax, DWORD PTR _reg$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _regno$[ebp], eax
; Line 2063
	mov	eax, DWORD PTR _n_sets$[ebp]
	dec	eax
	mov	DWORD PTR _count$[ebp], eax
; Line 2064
	mov	eax, DWORD PTR _regno$[ebp]
	mov	ecx, DWORD PTR _n_times_set$S775
	movsx	eax, WORD PTR [ecx+eax*2]
	mov	DWORD PTR _old$[ebp], eax
; Line 2065
	mov	DWORD PTR _value$[ebp], 0
; Line 2069
	cmp	DWORD PTR _n_sets$[ebp], 127		; 0000007fH
	jne	$L1499
; Line 2070
	sub	eax, eax
	jmp	$L1491
; Line 2072
$L1499:
	mov	eax, DWORD PTR _regno$[ebp]
	mov	ecx, DWORD PTR _n_times_set$S775
	mov	WORD PTR [ecx+eax*2], 0
; Line 2074
$L1501:
	cmp	DWORD PTR _count$[ebp], 0
	jle	$L1502
; Line 2077
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	DWORD PTR _p$[ebp], eax
; Line 2078
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	sar	eax, 16					; 00000010H
	mov	DWORD PTR _code$1503[ebp], eax
; Line 2081
	cmp	DWORD PTR _code$1503[ebp], 13		; 0000000dH
	jne	$L1504
	push	0
	push	7
	mov	eax, DWORD PTR _p$[ebp]
	push	eax
	call	_find_reg_note
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _temp$[ebp], eax
	cmp	DWORD PTR _temp$[ebp], 0
	je	$L1504
; Line 2082
	mov	eax, DWORD PTR _temp$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _p$[ebp], eax
; Line 2084
$L1504:
	mov	DWORD PTR _this$[ebp], 0
; Line 2087
	cmp	DWORD PTR _code$1503[ebp], 13		; 0000000dH
	jne	$L1505
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1638400				; 00190000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1505
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1505
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _regno$[ebp]
	cmp	DWORD PTR [eax+4], ecx
	jne	$L1505
; Line 2089
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	call	_invariant_p
	add	esp, 4
	mov	DWORD PTR _this$[ebp], eax
; Line 2090
	cmp	DWORD PTR _this$[ebp], 0
	je	$L1506
; Line 2091
	mov	eax, DWORD PTR _this$[ebp]
	or	DWORD PTR _value$[ebp], eax
; Line 2092
	jmp	$L1507
$L1506:
	mov	eax, DWORD PTR _p$[ebp]
	push	eax
	call	_loop_find_reg_equal
	add	esp, 4
	mov	DWORD PTR _temp$[ebp], eax
	cmp	DWORD PTR _temp$[ebp], 0
	je	$L1508
; Line 2094
	mov	eax, DWORD PTR _temp$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	call	_invariant_p
	add	esp, 4
	mov	DWORD PTR _this$[ebp], eax
; Line 2095
	cmp	DWORD PTR _this$[ebp], 0
	je	$L1509
; Line 2096
	mov	eax, DWORD PTR _this$[ebp]
	or	DWORD PTR _value$[ebp], eax
; Line 2097
$L1509:
; Line 2098
$L1508:
$L1507:
; Line 2099
$L1505:
	cmp	DWORD PTR _this$[ebp], 0
	je	$L1510
; Line 2100
	dec	DWORD PTR _count$[ebp]
; Line 2101
	jmp	$L1511
$L1510:
	cmp	DWORD PTR _code$1503[ebp], 18		; 00000012H
	je	$L1512
; Line 2103
	mov	eax, DWORD PTR _old$[ebp]
	mov	ecx, DWORD PTR _regno$[ebp]
	mov	edx, DWORD PTR _n_times_set$S775
	mov	WORD PTR [edx+ecx*2], ax
; Line 2104
	sub	eax, eax
	jmp	$L1491
; Line 2106
$L1512:
$L1511:
	jmp	$L1501
$L1502:
; Line 2108
	mov	eax, DWORD PTR _old$[ebp]
	mov	ecx, DWORD PTR _regno$[ebp]
	mov	edx, DWORD PTR _n_times_set$S775
	mov	WORD PTR [edx+ecx*2], ax
; Line 2110
	mov	eax, DWORD PTR _value$[ebp]
	and	eax, 2
	inc	eax
	jmp	$L1491
; Line 2111
$L1491:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_consec_sets_invariant_p ENDP
_TEXT	ENDS
EXTRN	_reg_used_between_p:NEAR
_TEXT	SEGMENT
_regno$1543 = -28
_i$1550 = -32
_x$1554 = -36
_regno$1562 = -40
_from$ = 8
_to$ = 12
_may_not_move$ = 16
_count_ptr$ = 20
_nregs$ = 24
_last_set$ = -16
_insn$ = -8
_count$ = -4
_dest$ = -12
_regno$1528 = -20
_regno$1531 = -24
_count_loop_regs_set PROC NEAR
; Line 2163
	push	ebp
	mov	ebp, esp
	sub	esp, 40					; 00000028H
	push	ebx
	push	esi
	push	edi
; Line 2164
	mov	eax, DWORD PTR _nregs$[ebp]
	shl	eax, 2
	push	eax
	call	_alloca
	add	esp, 4
	mov	DWORD PTR _last_set$[ebp], eax
; Line 2166
	mov	DWORD PTR _count$[ebp], 0
; Line 2169
	mov	eax, DWORD PTR _nregs$[ebp]
	shl	eax, 2
	push	eax
	push	0
	mov	eax, DWORD PTR _last_set$[ebp]
	push	eax
	call	_memset
	add	esp, 12					; 0000000cH
; Line 2170
	mov	eax, DWORD PTR _from$[ebp]
	mov	DWORD PTR _insn$[ebp], eax
	jmp	$L1523
$L1524:
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	DWORD PTR _insn$[ebp], eax
$L1523:
	mov	eax, DWORD PTR _to$[ebp]
	cmp	DWORD PTR _insn$[ebp], eax
	je	$L1525
; Line 2172
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 983040				; 000f0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1526
; Line 2181
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1835008				; 001c0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1527
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2424832				; 00250000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1527
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1527
; Line 2184
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _regno$1528[ebp], eax
; Line 2185
	mov	eax, DWORD PTR _regno$1528[ebp]
	mov	ecx, DWORD PTR _may_not_move$[ebp]
	mov	BYTE PTR [eax+ecx], 1
; Line 2187
	jmp	$L1529
$L1527:
; Line 2190
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1638400				; 00190000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1530
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1835008				; 001c0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1530
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2424832				; 00250000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1530
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1530
; Line 2193
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _regno$1531[ebp], eax
; Line 2194
	mov	eax, DWORD PTR _regno$1531[ebp]
	mov	ecx, DWORD PTR _may_not_move$[ebp]
	mov	BYTE PTR [eax+ecx], 1
; Line 2196
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _may_not_move$[ebp]
	mov	BYTE PTR [eax+ecx], 1
; Line 2197
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _n_times_set$S775
	movsx	eax, WORD PTR [ecx+eax*2]
	cmp	eax, 127				; 0000007fH
	jge	$L1532
; Line 2198
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _n_times_set$S775
	inc	WORD PTR [ecx+eax*2]
; Line 2199
$L1532:
; Line 2200
$L1530:
$L1529:
; Line 2201
$L1526:
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 851968				; 000d0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1534
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 917504				; 000e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1533
$L1534:
; Line 2203
	inc	DWORD PTR _count$[ebp]
; Line 2205
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1769472				; 001b0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1535
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1535
; Line 2208
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _may_not_move$[ebp]
	mov	BYTE PTR [eax+ecx], 1
; Line 2209
	jmp	$L1536
$L1535:
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1638400				; 00190000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1537
; Line 2211
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _dest$[ebp], eax
; Line 2215
$L1539:
	mov	eax, DWORD PTR _dest$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2293760				; 00230000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1541
	mov	eax, DWORD PTR _dest$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 5898240				; 005a0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1541
	mov	eax, DWORD PTR _dest$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 5832704				; 00590000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1541
	mov	eax, DWORD PTR _dest$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2359296				; 00240000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1540
$L1541:
; Line 2216
	mov	eax, DWORD PTR _dest$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _dest$[ebp], eax
	jmp	$L1539
$L1540:
; Line 2217
	mov	eax, DWORD PTR _dest$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1542
; Line 2219
	mov	eax, DWORD PTR _dest$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _regno$1543[ebp], eax
; Line 2224
	mov	eax, DWORD PTR _regno$1543[ebp]
	mov	ecx, DWORD PTR _n_times_set$S775
	movsx	eax, WORD PTR [ecx+eax*2]
	or	eax, eax
	jle	$L1544
	mov	eax, DWORD PTR _regno$1543[ebp]
	mov	ecx, DWORD PTR _last_set$[ebp]
	cmp	DWORD PTR [ecx+eax*4], 0
	jne	$L1544
; Line 2225
	mov	eax, DWORD PTR _regno$1543[ebp]
	mov	ecx, DWORD PTR _may_not_move$[ebp]
	mov	BYTE PTR [eax+ecx], 1
; Line 2229
$L1544:
; Line 2230
	mov	eax, DWORD PTR _regno$1543[ebp]
	mov	ecx, DWORD PTR _last_set$[ebp]
	cmp	DWORD PTR [ecx+eax*4], 0
	je	$L1546
	mov	eax, DWORD PTR _insn$[ebp]
	push	eax
	mov	eax, DWORD PTR _regno$1543[ebp]
	mov	ecx, DWORD PTR _last_set$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4]
	push	eax
	mov	eax, DWORD PTR _dest$[ebp]
	push	eax
	call	_reg_used_between_p
	add	esp, 12					; 0000000cH
	or	eax, eax
	je	$L1546
; Line 2231
	mov	eax, DWORD PTR _regno$1543[ebp]
	mov	ecx, DWORD PTR _may_not_move$[ebp]
	mov	BYTE PTR [eax+ecx], 1
; Line 2232
$L1546:
	mov	eax, DWORD PTR _regno$1543[ebp]
	mov	ecx, DWORD PTR _n_times_set$S775
	movsx	eax, WORD PTR [ecx+eax*2]
	cmp	eax, 127				; 0000007fH
	jge	$L1547
; Line 2233
	mov	eax, DWORD PTR _regno$1543[ebp]
	mov	ecx, DWORD PTR _n_times_set$S775
	inc	WORD PTR [ecx+eax*2]
; Line 2234
$L1547:
	mov	eax, DWORD PTR _insn$[ebp]
	mov	ecx, DWORD PTR _regno$1543[ebp]
	mov	edx, DWORD PTR _last_set$[ebp]
	mov	DWORD PTR [edx+ecx*4], eax
; Line 2236
$L1542:
; Line 2237
	jmp	$L1548
$L1537:
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1310720				; 00140000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1549
; Line 2240
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	dec	eax
	mov	DWORD PTR _i$1550[ebp], eax
	jmp	$L1551
$L1552:
	dec	DWORD PTR _i$1550[ebp]
$L1551:
	cmp	DWORD PTR _i$1550[ebp], 0
	jl	$L1553
; Line 2242
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _i$1550[ebp]
	mov	eax, DWORD PTR [eax+ecx*4+4]
	mov	DWORD PTR _x$1554[ebp], eax
; Line 2243
	mov	eax, DWORD PTR _x$1554[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1769472				; 001b0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1555
	mov	eax, DWORD PTR _x$1554[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1555
; Line 2246
	mov	eax, DWORD PTR _x$1554[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _may_not_move$[ebp]
	mov	BYTE PTR [eax+ecx], 1
; Line 2247
$L1555:
	mov	eax, DWORD PTR _x$1554[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1638400				; 00190000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1556
; Line 2249
	mov	eax, DWORD PTR _x$1554[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _dest$[ebp], eax
; Line 2253
$L1558:
	mov	eax, DWORD PTR _dest$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2293760				; 00230000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1560
	mov	eax, DWORD PTR _dest$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 5898240				; 005a0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1560
	mov	eax, DWORD PTR _dest$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 5832704				; 00590000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1560
	mov	eax, DWORD PTR _dest$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2359296				; 00240000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1559
$L1560:
; Line 2254
	mov	eax, DWORD PTR _dest$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _dest$[ebp], eax
	jmp	$L1558
$L1559:
; Line 2255
	mov	eax, DWORD PTR _dest$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1561
; Line 2257
	mov	eax, DWORD PTR _dest$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _regno$1562[ebp], eax
; Line 2258
	mov	eax, DWORD PTR _regno$1562[ebp]
	mov	ecx, DWORD PTR _n_times_set$S775
	movsx	eax, WORD PTR [ecx+eax*2]
	cmp	eax, 127				; 0000007fH
	jge	$L1563
; Line 2259
	mov	eax, DWORD PTR _regno$1562[ebp]
	mov	ecx, DWORD PTR _n_times_set$S775
	inc	WORD PTR [ecx+eax*2]
; Line 2260
$L1563:
	mov	eax, DWORD PTR _regno$1562[ebp]
	mov	ecx, DWORD PTR _may_not_move$[ebp]
	mov	BYTE PTR [eax+ecx], 1
; Line 2261
	mov	eax, DWORD PTR _insn$[ebp]
	mov	ecx, DWORD PTR _regno$1562[ebp]
	mov	edx, DWORD PTR _last_set$[ebp]
	mov	DWORD PTR [edx+ecx*4], eax
; Line 2263
$L1561:
; Line 2264
$L1556:
	jmp	$L1552
$L1553:
; Line 2266
$L1549:
$L1548:
$L1536:
; Line 2267
$L1533:
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1114112				; 00110000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1565
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 917504				; 000e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1564
$L1565:
; Line 2268
	mov	eax, DWORD PTR _nregs$[ebp]
	shl	eax, 2
	push	eax
	push	0
	mov	eax, DWORD PTR _last_set$[ebp]
	push	eax
	call	_memset
	add	esp, 12					; 0000000cH
; Line 2269
$L1564:
	jmp	$L1524
$L1525:
; Line 2270
	mov	eax, DWORD PTR _count$[ebp]
	mov	ecx, DWORD PTR _count_ptr$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 2271
$L1518:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_count_loop_regs_set ENDP
_TEXT	ENDS
EXTRN	_reg_overlap_mentioned_p:NEAR
_TEXT	SEGMENT
_insn$ = 8
_loop_start$ = 12
_scan_start$ = 16
_loop_end$ = 20
_reg$ = -4
_p$ = -8
_loop_reg_used_before_p PROC NEAR
; Line 2282
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	push	ebx
	push	esi
	push	edi
; Line 2283
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _reg$[ebp], eax
; Line 2288
	mov	eax, DWORD PTR _scan_start$[ebp]
	mov	DWORD PTR _p$[ebp], eax
	jmp	$L1573
$L1574:
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	DWORD PTR _p$[ebp], eax
$L1573:
	mov	eax, DWORD PTR _insn$[ebp]
	cmp	DWORD PTR _p$[ebp], eax
	je	$L1575
; Line 2292
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 851968				; 000d0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1578
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 983040				; 000f0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1578
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 917504				; 000e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1577
$L1578:
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax+16]
	push	eax
	mov	eax, DWORD PTR _reg$[ebp]
	push	eax
	call	_reg_overlap_mentioned_p
	add	esp, 8
	or	eax, eax
	je	$L1577
; Line 2293
	mov	eax, 1
	jmp	$L1570
; Line 2295
$L1577:
	mov	eax, DWORD PTR _loop_end$[ebp]
	cmp	DWORD PTR _p$[ebp], eax
	jne	$L1579
; Line 2296
	mov	eax, DWORD PTR _loop_start$[ebp]
	mov	DWORD PTR _p$[ebp], eax
; Line 2297
$L1579:
	jmp	$L1574
$L1575:
; Line 2299
	sub	eax, eax
	jmp	$L1570
; Line 2300
$L1570:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_loop_reg_used_before_p ENDP
_TEXT	ENDS
PUBLIC	_other_reg_use_p
EXTRN	_reg_set_between_p:NEAR
EXTRN	_call_used_regs:TBYTE
EXTRN	_cc0_rtx:DWORD
EXTRN	_const1_rtx:DWORD
EXTRN	_print_rtl:NEAR
EXTRN	_gen_reg_rtx:NEAR
EXTRN	_emit_insn_after:NEAR
_BSS	SEGMENT
_induct_var$S1588 DD 01H DUP (?)
_induct_struct$S1589 DD 01H DUP (?)
_class_struct$S1590 DD 01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
	ORG $+2
$SG1621	DB	'Insn %d: possible biv, reg %d,', 00H
	ORG $+1
$SG1623	DB	' const = %d', 0aH, 00H
	ORG $+3
$SG1625	DB	' const = ', 00H
	ORG $+2
$SG1627	DB	0aH, 00H
	ORG $+2
$SG1636	DB	'Reg %d: biv discarded, not induct', 0aH, 00H
	ORG $+1
$SG1642	DB	'Reg %d: biv discarded, count error', 0aH, 00H
$SG1645	DB	'Reg %d: biv verified', 0aH, 00H
	ORG $+2
$SG1663	DB	'Biv %d initialized at insn %d: ', 00H
$SG1669	DB	'initial value ', 00H
	ORG $+1
$SG1672	DB	'%d', 0aH, 00H
$SG1674	DB	0aH, 00H
	ORG $+2
$SG1677	DB	'complex initial value', 0aH, 00H
	ORG $+1
$SG1726	DB	'Cannot eliminate biv %d.', 0aH, 00H
	ORG $+2
$SG1727	DB	'First use: insn %d, last use: insn %d.', 0aH, 00H
$SG1740	DB	'giv of insn %d combined with that of %d.', 0aH, 00H
	ORG $+2
$SG1743	DB	'giv of insn %d, no benefit', 0aH, 00H
$SG1746	DB	'giv of insn %d not worth while, %d vs %d.', 0aH, 00H
	ORG $+1
$SG1755	DB	'giv of insn %d: would need a multiply.', 0aH, 00H
$SG1792	DB	'giv at %d reduced to reg %d', 0aH, 00H
	ORG $+3
$SG1815	DB	'Reg %d: biv eliminated', 0aH, 00H
$SG1828	DB	0aH, 00H
_DATA	ENDS
_TEXT	SEGMENT
_inc_val$ = -44
_mult_val$ = -16
_reg$1794 = -160
_dest_regno$ = -20
_tv$1731 = -128
_biv_found$ = -32
_maybe_never$ = -8
_iv_list$ = -24
_code$1798 = -164
_bl$ = -12
_backbl$ = -4
_threshold$ = -40
_v1$1801 = -168
_reg_map$ = -36
_call_seen$ = -28
_v$1617 = -52
_success$1748 = -132
_src_regno$1689 = -92
_add_val$1690 = -76
_mult_val$1691 = -80
_benefit$1692 = -72
_tail$1821 = -172
_regnote$1693 = -68
_forces$1694 = -88
_tv$1759 = -136
_forces2$1695 = -84
_new_reg$1761 = -140
_count$1700 = -96
_v$1701 = -104
_temp$1702 = -100
_iv$1767 = -148
_before_insn$1768 = -144
_v$1716 = -124
_benefit$1717 = -112
_dest$1653 = -56
_replaceable$1718 = -108
_all_reduced$1719 = -116
_scan_start$ = 8
_final_value$1720 = -120
_end$ = 12
_loop_top$ = 16
_count$1786 = -152
_insn_count$ = 20
_after_insn$1787 = -156
_dest_regno$1659 = -60
_loop_start$ = 24
_loop_end$ = 28
_src$1661 = -64
_nregs$ = 32
_p$ = -48
_strength_reduce PROC NEAR
; Line 2470
	push	ebp
	mov	ebp, esp
	sub	esp, 172				; 000000acH
	push	ebx
	push	esi
	push	edi
; Line 2477
	mov	DWORD PTR _maybe_never$[ebp], 0
; Line 2479
	mov	DWORD PTR _iv_list$[ebp], 0
; Line 2487
	cmp	DWORD PTR _loop_has_call$S773, 1
	sbb	eax, eax
	and	eax, 17					; 00000011H
	add	eax, 17					; 00000011H
	mov	DWORD PTR _threshold$[ebp], eax
; Line 2492
	mov	eax, DWORD PTR _nregs$[ebp]
	shl	eax, 2
	push	eax
	call	_alloca
	add	esp, 4
	mov	DWORD PTR _induct_var$S1588, eax
; Line 2493
	mov	eax, DWORD PTR _nregs$[ebp]
	shl	eax, 2
	push	eax
	push	0
	mov	eax, DWORD PTR _induct_var$S1588
	push	eax
	call	_memset
	add	esp, 12					; 0000000cH
; Line 2495
	mov	eax, DWORD PTR _nregs$[ebp]
	shl	eax, 2
	push	eax
	call	_alloca
	add	esp, 4
	mov	DWORD PTR _induct_struct$S1589, eax
; Line 2496
	mov	eax, DWORD PTR _nregs$[ebp]
	shl	eax, 2
	push	eax
	push	0
	mov	eax, DWORD PTR _induct_struct$S1589
	push	eax
	call	_memset
	add	esp, 12					; 0000000cH
; Line 2498
	mov	eax, DWORD PTR _nregs$[ebp]
	shl	eax, 2
	push	eax
	call	_alloca
	add	esp, 4
	mov	DWORD PTR _class_struct$S1590, eax
; Line 2499
	mov	eax, DWORD PTR _nregs$[ebp]
	shl	eax, 2
	push	eax
	push	0
	mov	eax, DWORD PTR _class_struct$S1590
	push	eax
	call	_memset
	add	esp, 12					; 0000000cH
; Line 2503
	mov	eax, DWORD PTR _loop_start$[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	DWORD PTR _p$[ebp], eax
	jmp	$L1611
$L1612:
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	DWORD PTR _p$[ebp], eax
$L1611:
	mov	eax, DWORD PTR _end$[ebp]
	cmp	DWORD PTR _p$[ebp], eax
	je	$L1613
; Line 2507
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 851968				; 000d0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1614
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1638400				; 00190000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1614
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1614
; Line 2509
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _dest_regno$[ebp], eax
; Line 2511
	mov	eax, DWORD PTR _dest_regno$[ebp]
	mov	ecx, DWORD PTR _induct_var$S1588
	cmp	DWORD PTR [ecx+eax*4], 2
	je	$L1615
	cmp	DWORD PTR _dest_regno$[ebp], 10		; 0000000aH
	jl	$L1615
; Line 2514
	lea	eax, DWORD PTR _mult_val$[ebp]
	push	eax
	lea	eax, DWORD PTR _inc_val$[ebp]
	push	eax
	mov	eax, DWORD PTR _dest_regno$[ebp]
	push	eax
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	call	_basic_induction_var
	add	esp, 16					; 00000010H
	or	eax, eax
	je	$L1616
; Line 2520
	push	72					; 00000048H
	call	_alloca
	add	esp, 4
	mov	DWORD PTR _v$1617[ebp], eax
; Line 2522
	mov	eax, DWORD PTR _p$[ebp]
	mov	ecx, DWORD PTR _v$1617[ebp]
	mov	DWORD PTR [ecx], eax
; Line 2523
	mov	eax, DWORD PTR _dest_regno$[ebp]
	mov	ecx, DWORD PTR _v$1617[ebp]
	mov	DWORD PTR [ecx+8], eax
; Line 2524
	mov	eax, DWORD PTR _dest_regno$[ebp]
	mov	ecx, DWORD PTR _v$1617[ebp]
	mov	DWORD PTR [ecx+16], eax
; Line 2525
	mov	eax, DWORD PTR _mult_val$[ebp]
	mov	ecx, DWORD PTR _v$1617[ebp]
	mov	DWORD PTR [ecx+28], eax
; Line 2526
	mov	eax, DWORD PTR _inc_val$[ebp]
	mov	ecx, DWORD PTR _v$1617[ebp]
	mov	DWORD PTR [ecx+32], eax
; Line 2527
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	mov	ecx, DWORD PTR _v$1617[ebp]
	mov	DWORD PTR [ecx+24], eax
; Line 2532
	mov	eax, DWORD PTR _dest_regno$[ebp]
	mov	ecx, DWORD PTR _class_struct$S1590
	mov	eax, DWORD PTR [ecx+eax*4]
	mov	DWORD PTR _bl$[ebp], eax
; Line 2533
	cmp	DWORD PTR _bl$[ebp], 0
	je	$L1618
; Line 2535
	mov	eax, DWORD PTR _bl$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	ecx, DWORD PTR _v$1617[ebp]
	mov	DWORD PTR [ecx+56], eax
; Line 2536
	mov	eax, DWORD PTR _v$1617[ebp]
	mov	ecx, DWORD PTR _bl$[ebp]
	mov	DWORD PTR [ecx+8], eax
; Line 2537
	mov	eax, DWORD PTR _bl$[ebp]
	inc	DWORD PTR [eax+4]
; Line 2539
	jmp	$L1619
$L1618:
; Line 2543
	push	40					; 00000028H
	call	_alloca
	add	esp, 4
	mov	DWORD PTR _bl$[ebp], eax
; Line 2545
	mov	eax, DWORD PTR _dest_regno$[ebp]
	mov	ecx, DWORD PTR _bl$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 2546
	mov	eax, DWORD PTR _v$1617[ebp]
	mov	ecx, DWORD PTR _bl$[ebp]
	mov	DWORD PTR [ecx+8], eax
; Line 2547
	mov	eax, DWORD PTR _v$1617[ebp]
	mov	DWORD PTR [eax+56], 0
; Line 2548
	mov	eax, DWORD PTR _bl$[ebp]
	mov	DWORD PTR [eax+16], 0
; Line 2549
	mov	eax, DWORD PTR _bl$[ebp]
	mov	DWORD PTR [eax+4], 1
; Line 2550
	mov	eax, DWORD PTR _bl$[ebp]
	mov	DWORD PTR [eax+12], 0
; Line 2553
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _bl$[ebp]
	mov	DWORD PTR [ecx+24], eax
; Line 2555
	mov	eax, DWORD PTR _bl$[ebp]
	mov	DWORD PTR [eax+32], 0
; Line 2556
	mov	eax, DWORD PTR _bl$[ebp]
	mov	BYTE PTR [eax+36], 0
; Line 2557
	mov	eax, DWORD PTR _bl$[ebp]
	mov	BYTE PTR [eax+37], 0
; Line 2560
	mov	eax, DWORD PTR _iv_list$[ebp]
	mov	ecx, DWORD PTR _bl$[ebp]
	mov	DWORD PTR [ecx+28], eax
; Line 2561
	mov	eax, DWORD PTR _bl$[ebp]
	mov	DWORD PTR _iv_list$[ebp], eax
; Line 2564
	mov	eax, DWORD PTR _bl$[ebp]
	mov	ecx, DWORD PTR _dest_regno$[ebp]
	mov	edx, DWORD PTR _class_struct$S1590
	mov	DWORD PTR [edx+ecx*4], eax
; Line 2565
$L1619:
; Line 2567
	mov	eax, DWORD PTR _dest_regno$[ebp]
	mov	ecx, DWORD PTR _induct_var$S1588
	mov	DWORD PTR [ecx+eax*4], 1
; Line 2569
	cmp	DWORD PTR _loop_dump_stream$S787, 0
	je	$L1620
; Line 2573
	mov	eax, DWORD PTR _dest_regno$[ebp]
	push	eax
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	push	OFFSET $SG1621
	mov	eax, DWORD PTR _loop_dump_stream$S787
	push	eax
	call	_fprintf
	add	esp, 16					; 00000010H
; Line 2574
	mov	eax, DWORD PTR _inc_val$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1622
; Line 2576
	mov	eax, DWORD PTR _inc_val$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	push	OFFSET $SG1623
	mov	eax, DWORD PTR _loop_dump_stream$S787
	push	eax
	call	_fprintf
	add	esp, 12					; 0000000cH
; Line 2577
	jmp	$L1624
$L1622:
; Line 2579
	push	OFFSET $SG1625
	mov	eax, DWORD PTR _loop_dump_stream$S787
	push	eax
	call	_fprintf
	add	esp, 8
; Line 2580
	mov	eax, DWORD PTR _inc_val$[ebp]
	push	eax
	mov	eax, DWORD PTR _loop_dump_stream$S787
	push	eax
	call	_print_rtl
	add	esp, 8
; Line 2581
	push	OFFSET $SG1627
	mov	eax, DWORD PTR _loop_dump_stream$S787
	push	eax
	call	_fprintf
	add	esp, 8
; Line 2582
$L1624:
; Line 2584
$L1620:
; Line 2585
	jmp	$L1628
$L1616:
; Line 2586
	mov	eax, DWORD PTR _dest_regno$[ebp]
	mov	ecx, DWORD PTR _induct_var$S1588
	mov	DWORD PTR [ecx+eax*4], 2
$L1628:
; Line 2588
$L1615:
; Line 2589
$L1614:
	jmp	$L1612
$L1613:
; Line 2594
	mov	DWORD PTR _biv_found$[ebp], 0
; Line 2596
	mov	eax, DWORD PTR _iv_list$[ebp]
	mov	DWORD PTR _bl$[ebp], eax
	mov	eax, DWORD PTR _bl$[ebp]
	mov	DWORD PTR _backbl$[ebp], eax
	jmp	$L1629
$L1630:
	mov	eax, DWORD PTR _bl$[ebp]
	mov	DWORD PTR _backbl$[ebp], eax
	mov	eax, DWORD PTR _bl$[ebp]
	mov	eax, DWORD PTR [eax+28]
	mov	DWORD PTR _bl$[ebp], eax
$L1629:
	cmp	DWORD PTR _bl$[ebp], 0
	je	$L1631
; Line 2598
	mov	eax, DWORD PTR _bl$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	ecx, DWORD PTR _induct_var$S1588
	cmp	DWORD PTR [ecx+eax*4], 1
	je	$L1632
; Line 2602
	mov	eax, DWORD PTR _bl$[ebp]
	cmp	DWORD PTR _backbl$[ebp], eax
	jne	$L1633
; Line 2603
	mov	eax, DWORD PTR _bl$[ebp]
	mov	eax, DWORD PTR [eax+28]
	mov	DWORD PTR _iv_list$[ebp], eax
; Line 2604
	jmp	$L1634
$L1633:
; Line 2605
	mov	eax, DWORD PTR _bl$[ebp]
	mov	eax, DWORD PTR [eax+28]
	mov	ecx, DWORD PTR _backbl$[ebp]
	mov	DWORD PTR [ecx+28], eax
$L1634:
; Line 2607
	cmp	DWORD PTR _loop_dump_stream$S787, 0
	je	$L1635
; Line 2609
	mov	eax, DWORD PTR _bl$[ebp]
	mov	eax, DWORD PTR [eax]
	push	eax
	push	OFFSET $SG1636
	mov	eax, DWORD PTR _loop_dump_stream$S787
	push	eax
	call	_fprintf
	add	esp, 12					; 0000000cH
; Line 2610
$L1635:
; Line 2611
	jmp	$L1637
$L1632:
	mov	eax, DWORD PTR _bl$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	ecx, DWORD PTR _n_times_set$S775
	movsx	eax, WORD PTR [ecx+eax*2]
	mov	ecx, DWORD PTR _bl$[ebp]
	cmp	eax, DWORD PTR [ecx+4]
	je	$L1638
; Line 2617
	mov	eax, DWORD PTR _bl$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	ecx, DWORD PTR _induct_var$S1588
	mov	DWORD PTR [ecx+eax*4], 2
; Line 2619
	mov	eax, DWORD PTR _bl$[ebp]
	cmp	DWORD PTR _backbl$[ebp], eax
	jne	$L1639
; Line 2620
	mov	eax, DWORD PTR _bl$[ebp]
	mov	eax, DWORD PTR [eax+28]
	mov	DWORD PTR _iv_list$[ebp], eax
; Line 2621
	jmp	$L1640
$L1639:
; Line 2622
	mov	eax, DWORD PTR _bl$[ebp]
	mov	eax, DWORD PTR [eax+28]
	mov	ecx, DWORD PTR _backbl$[ebp]
	mov	DWORD PTR [ecx+28], eax
$L1640:
; Line 2624
	cmp	DWORD PTR _loop_dump_stream$S787, 0
	je	$L1641
; Line 2626
	mov	eax, DWORD PTR _bl$[ebp]
	mov	eax, DWORD PTR [eax]
	push	eax
	push	OFFSET $SG1642
	mov	eax, DWORD PTR _loop_dump_stream$S787
	push	eax
	call	_fprintf
	add	esp, 12					; 0000000cH
; Line 2627
$L1641:
; Line 2628
	jmp	$L1643
$L1638:
; Line 2632
	inc	DWORD PTR _biv_found$[ebp]
; Line 2634
	cmp	DWORD PTR _loop_dump_stream$S787, 0
	je	$L1644
; Line 2635
	mov	eax, DWORD PTR _bl$[ebp]
	mov	eax, DWORD PTR [eax]
	push	eax
	push	OFFSET $SG1645
	mov	eax, DWORD PTR _loop_dump_stream$S787
	push	eax
	call	_fprintf
	add	esp, 12					; 0000000cH
; Line 2636
$L1644:
$L1643:
$L1637:
; Line 2637
	jmp	$L1630
$L1631:
; Line 2640
	cmp	DWORD PTR _iv_list$[ebp], 0
	jne	$L1646
; Line 2641
	jmp	$L1598
; Line 2647
$L1646:
	mov	DWORD PTR _call_seen$[ebp], 0
; Line 2648
	mov	eax, DWORD PTR _loop_start$[ebp]
	mov	DWORD PTR _p$[ebp], eax
; Line 2649
$L1648:
	cmp	DWORD PTR _biv_found$[ebp], 0
	je	$L1649
; Line 2651
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _p$[ebp], eax
; Line 2652
	cmp	DWORD PTR _p$[ebp], 0
	jne	$L1650
; Line 2653
	jmp	$L1649
; Line 2655
$L1650:
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 983040				; 000f0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1651
; Line 2656
	mov	DWORD PTR _call_seen$[ebp], 1
; Line 2658
$L1651:
; Line 2659
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 851968				; 000d0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1652
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1638400				; 00190000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1652
; Line 2661
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _dest$1653[ebp], eax
; Line 2666
$L1655:
	mov	eax, DWORD PTR _dest$1653[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2293760				; 00230000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1657
	mov	eax, DWORD PTR _dest$1653[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 5898240				; 005a0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1657
	mov	eax, DWORD PTR _dest$1653[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 5832704				; 00590000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1657
	mov	eax, DWORD PTR _dest$1653[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2359296				; 00240000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1656
$L1657:
; Line 2667
	mov	eax, DWORD PTR _dest$1653[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _dest$1653[ebp], eax
	jmp	$L1655
$L1656:
; Line 2669
	mov	eax, DWORD PTR _dest$1653[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1658
; Line 2671
	mov	eax, DWORD PTR _dest$1653[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _dest_regno$1659[ebp], eax
; Line 2673
	mov	eax, DWORD PTR _dest_regno$1659[ebp]
	mov	ecx, DWORD PTR _induct_var$S1588
	cmp	DWORD PTR [ecx+eax*4], 1
	jne	$L1660
	mov	eax, DWORD PTR _dest_regno$1659[ebp]
	mov	ecx, DWORD PTR _class_struct$S1590
	mov	eax, DWORD PTR [ecx+eax*4]
	cmp	DWORD PTR [eax+32], 0
	jne	$L1660
; Line 2677
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _src$1661[ebp], eax
; Line 2681
	mov	eax, DWORD PTR _p$[ebp]
	mov	ecx, DWORD PTR _dest_regno$1659[ebp]
	mov	edx, DWORD PTR _class_struct$S1590
	mov	ecx, DWORD PTR [edx+ecx*4]
	mov	DWORD PTR [ecx+32], eax
; Line 2683
	cmp	DWORD PTR _loop_dump_stream$S787, 0
	je	$L1662
; Line 2685
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	mov	eax, DWORD PTR _dest_regno$1659[ebp]
	push	eax
	push	OFFSET $SG1663
	mov	eax, DWORD PTR _loop_dump_stream$S787
	push	eax
	call	_fprintf
	add	esp, 16					; 00000010H
; Line 2688
$L1662:
; Line 2695
	mov	eax, DWORD PTR _src$1661[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2490368				; 00260000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1666
	mov	eax, DWORD PTR _src$1661[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2555904				; 00270000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1666
	mov	eax, DWORD PTR _src$1661[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1666
	mov	eax, DWORD PTR _src$1661[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2097152				; 00200000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1666
	mov	eax, DWORD PTR _src$1661[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1665
	mov	eax, DWORD PTR _src$1661[ebp]
	cmp	DWORD PTR [eax+4], 10			; 0000000aH
	jge	$L1667
	mov	eax, DWORD PTR _src$1661[ebp]
	mov	eax, DWORD PTR [eax+4]
	movsx	eax, BYTE PTR _call_used_regs[eax]
	or	eax, eax
	je	$L1667
	cmp	DWORD PTR _call_seen$[ebp], 0
	jne	$L1665
$L1667:
	mov	eax, DWORD PTR _loop_start$[ebp]
	push	eax
	mov	eax, DWORD PTR _p$[ebp]
	push	eax
	mov	eax, DWORD PTR _src$1661[ebp]
	push	eax
	call	_reg_set_between_p
	add	esp, 12					; 0000000cH
	or	eax, eax
	jne	$L1665
$L1666:
; Line 2697
	mov	eax, DWORD PTR _src$1661[ebp]
	mov	ecx, DWORD PTR _dest_regno$1659[ebp]
	mov	edx, DWORD PTR _class_struct$S1590
	mov	ecx, DWORD PTR [edx+ecx*4]
	mov	DWORD PTR [ecx+24], eax
; Line 2699
	cmp	DWORD PTR _loop_dump_stream$S787, 0
	je	$L1668
; Line 2700
	push	OFFSET $SG1669
	mov	eax, DWORD PTR _loop_dump_stream$S787
	push	eax
	call	_fprintf
	add	esp, 8
; Line 2701
$L1668:
	cmp	DWORD PTR _loop_dump_stream$S787, 0
	je	$L1670
; Line 2703
	mov	eax, DWORD PTR _src$1661[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1671
; Line 2704
	mov	eax, DWORD PTR _src$1661[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	push	OFFSET $SG1672
	mov	eax, DWORD PTR _loop_dump_stream$S787
	push	eax
	call	_fprintf
	add	esp, 12					; 0000000cH
; Line 2705
	jmp	$L1673
$L1671:
; Line 2707
	mov	eax, DWORD PTR _src$1661[ebp]
	push	eax
	mov	eax, DWORD PTR _loop_dump_stream$S787
	push	eax
	call	_print_rtl
	add	esp, 8
; Line 2708
	push	OFFSET $SG1674
	mov	eax, DWORD PTR _loop_dump_stream$S787
	push	eax
	call	_fprintf
	add	esp, 8
; Line 2709
$L1673:
; Line 2711
$L1670:
; Line 2712
	jmp	$L1675
$L1665:
; Line 2717
	cmp	DWORD PTR _loop_dump_stream$S787, 0
	je	$L1676
; Line 2718
	push	OFFSET $SG1677
	mov	eax, DWORD PTR _loop_dump_stream$S787
	push	eax
	call	_fprintf
	add	esp, 8
; Line 2719
$L1676:
$L1675:
; Line 2721
	dec	DWORD PTR _biv_found$[ebp]
; Line 2723
$L1660:
; Line 2724
$L1658:
; Line 2725
	jmp	$L1678
$L1652:
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1114112				; 00110000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1679
; Line 2726
	jmp	$L1649
; Line 2727
$L1679:
$L1678:
	jmp	$L1648
$L1649:
; Line 2734
	mov	eax, DWORD PTR _scan_start$[ebp]
	mov	DWORD PTR _p$[ebp], eax
; Line 2735
$L1681:
; Line 2737
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	DWORD PTR _p$[ebp], eax
; Line 2740
	mov	eax, DWORD PTR _scan_start$[ebp]
	cmp	DWORD PTR _p$[ebp], eax
	jne	$L1683
; Line 2741
	jmp	$L1682
; Line 2742
$L1683:
	mov	eax, DWORD PTR _end$[ebp]
	cmp	DWORD PTR _p$[ebp], eax
	jne	$L1684
; Line 2744
	cmp	DWORD PTR _loop_top$[ebp], 0
	je	$L1685
; Line 2745
	mov	eax, DWORD PTR _loop_top$[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	DWORD PTR _p$[ebp], eax
; Line 2746
	jmp	$L1686
$L1685:
; Line 2747
	jmp	$L1682
$L1686:
; Line 2748
	mov	eax, DWORD PTR _scan_start$[ebp]
	cmp	DWORD PTR _p$[ebp], eax
	jne	$L1687
; Line 2749
	jmp	$L1682
; Line 2750
$L1687:
; Line 2753
$L1684:
; Line 2756
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 851968				; 000d0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1688
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1638400				; 00190000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1688
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1688
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _may_not_optimize$S777
	movsx	eax, BYTE PTR [eax+ecx]
	or	eax, eax
	jne	$L1688
; Line 2762
	mov	DWORD PTR _regnote$1693[ebp], 0
; Line 2763
	mov	DWORD PTR _forces$1694[ebp], 0
; Line 2764
	mov	DWORD PTR _forces2$1695[ebp], 0
; Line 2766
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _dest_regno$[ebp], eax
; Line 2767
	cmp	DWORD PTR _dest_regno$[ebp], 10		; 0000000aH
	jge	$L1696
; Line 2768
	jmp	$L1681
; Line 2770
$L1696:
; Line 2791
	lea	eax, DWORD PTR _forces2$1695[ebp]
	push	eax
	lea	eax, DWORD PTR _forces$1694[ebp]
	push	eax
	lea	eax, DWORD PTR _mult_val$1691[ebp]
	push	eax
	lea	eax, DWORD PTR _add_val$1690[ebp]
	push	eax
	lea	eax, DWORD PTR _src_regno$1689[ebp]
	push	eax
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	call	_general_induction_var
	add	esp, 24					; 00000018H
	mov	DWORD PTR _benefit$1692[ebp], eax
	cmp	DWORD PTR _benefit$1692[ebp], 0
	jne	$L1698
	mov	eax, DWORD PTR _p$[ebp]
	push	eax
	call	_loop_find_reg_equal
	add	esp, 4
	mov	DWORD PTR _regnote$1693[ebp], eax
	cmp	DWORD PTR _regnote$1693[ebp], 0
	je	$L1697
	lea	eax, DWORD PTR _forces2$1695[ebp]
	push	eax
	lea	eax, DWORD PTR _forces$1694[ebp]
	push	eax
	lea	eax, DWORD PTR _mult_val$1691[ebp]
	push	eax
	lea	eax, DWORD PTR _add_val$1690[ebp]
	push	eax
	lea	eax, DWORD PTR _src_regno$1689[ebp]
	push	eax
	mov	eax, DWORD PTR _regnote$1693[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	call	_general_induction_var
	add	esp, 24					; 00000018H
	mov	DWORD PTR _benefit$1692[ebp], eax
	cmp	DWORD PTR _benefit$1692[ebp], 0
	je	$L1697
$L1698:
	mov	eax, DWORD PTR _old_max_reg$S785
	cmp	DWORD PTR _dest_regno$[ebp], eax
	jge	$L1697
	mov	eax, DWORD PTR _dest_regno$[ebp]
	cmp	DWORD PTR _src_regno$1689[ebp], eax
	je	$L1697
	mov	eax, DWORD PTR _dest_regno$[ebp]
	mov	ecx, DWORD PTR _n_times_set$S775
	movsx	eax, WORD PTR [ecx+eax*2]
	cmp	eax, 1
	je	$L1699
	lea	eax, DWORD PTR _mult_val$1691[ebp]
	push	eax
	lea	eax, DWORD PTR _add_val$1690[ebp]
	push	eax
	mov	eax, DWORD PTR _dest_regno$[ebp]
	push	eax
	mov	eax, DWORD PTR _src_regno$1689[ebp]
	push	eax
	mov	eax, DWORD PTR _p$[ebp]
	push	eax
	mov	eax, DWORD PTR _benefit$1692[ebp]
	push	eax
	call	_consec_sets_giv
	add	esp, 24					; 00000018H
	mov	DWORD PTR _benefit$1692[ebp], eax
	cmp	DWORD PTR _benefit$1692[ebp], 0
	je	$L1697
$L1699:
; Line 2795
	push	72					; 00000048H
	call	_alloca
	add	esp, 4
	mov	DWORD PTR _v$1701[ebp], eax
; Line 2799
	mov	eax, DWORD PTR _loop_end$[ebp]
	push	eax
	push	0
	mov	eax, DWORD PTR _maybe_never$[ebp]
	push	eax
	push	1
	mov	eax, DWORD PTR _forces2$1695[ebp]
	push	eax
	mov	eax, DWORD PTR _forces$1694[ebp]
	push	eax
	mov	eax, DWORD PTR _benefit$1692[ebp]
	push	eax
	mov	eax, DWORD PTR _add_val$1690[ebp]
	push	eax
	mov	eax, DWORD PTR _mult_val$1691[ebp]
	push	eax
	mov	eax, DWORD PTR _dest_regno$[ebp]
	push	eax
	mov	eax, DWORD PTR _src_regno$1689[ebp]
	push	eax
	mov	eax, DWORD PTR _p$[ebp]
	push	eax
	mov	eax, DWORD PTR _v$1701[ebp]
	push	eax
	call	_record_giv
	add	esp, 52					; 00000034H
; Line 2802
	mov	eax, DWORD PTR _v$1701[ebp]
	mov	eax, DWORD PTR [eax+40]
	dec	eax
	mov	DWORD PTR _count$1700[ebp], eax
	jmp	$L1703
$L1704:
	dec	DWORD PTR _count$1700[ebp]
$L1703:
	cmp	DWORD PTR _count$1700[ebp], 0
	jl	$L1705
; Line 2807
	push	0
	push	7
	mov	eax, DWORD PTR _p$[ebp]
	push	eax
	call	_find_reg_note
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _temp$1702[ebp], eax
	cmp	DWORD PTR _temp$1702[ebp], 0
	je	$L1706
; Line 2811
	add	DWORD PTR _benefit$1692[ebp], 15	; 0000000fH
; Line 2812
	mov	eax, DWORD PTR _temp$1702[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _p$[ebp], eax
; Line 2815
$L1706:
$L1707:
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	DWORD PTR _p$[ebp], eax
; Line 2816
$L1708:
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1179648				; 00120000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1707
$L1709:
; Line 2817
	jmp	$L1704
$L1705:
; Line 2819
$L1697:
; Line 2825
$L1688:
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 851968				; 000d0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1710
; Line 2826
	mov	eax, DWORD PTR _loop_end$[ebp]
	push	eax
	mov	eax, DWORD PTR _maybe_never$[ebp]
	push	eax
	mov	eax, DWORD PTR _p$[ebp]
	push	eax
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax+16]
	push	eax
	call	_find_mem_givs
	add	esp, 16					; 00000010H
; Line 2832
$L1710:
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1114112				; 00110000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1712
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 917504				; 000e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1711
$L1712:
; Line 2833
	mov	DWORD PTR _maybe_never$[ebp], 1
; Line 2834
$L1711:
	jmp	$L1681
$L1682:
; Line 2839
	mov	eax, DWORD PTR _loop_start$[ebp]
	push	eax
	mov	eax, DWORD PTR _insn_count$[ebp]
	push	eax
	mov	eax, DWORD PTR _iv_list$[ebp]
	push	eax
	mov	eax, DWORD PTR _loop_end$[ebp]
	push	eax
	call	_check_dbra_loop
	add	esp, 16					; 00000010H
; Line 2842
	mov	eax, DWORD PTR _nregs$[ebp]
	shl	eax, 2
	push	eax
	call	_alloca
	add	esp, 4
	mov	DWORD PTR _reg_map$[ebp], eax
; Line 2843
	mov	eax, DWORD PTR _nregs$[ebp]
	shl	eax, 2
	push	eax
	push	0
	mov	eax, DWORD PTR _reg_map$[ebp]
	push	eax
	call	_memset
	add	esp, 12					; 0000000cH
; Line 2848
	mov	eax, DWORD PTR _iv_list$[ebp]
	mov	DWORD PTR _bl$[ebp], eax
	jmp	$L1713
$L1714:
	mov	eax, DWORD PTR _bl$[ebp]
	mov	eax, DWORD PTR [eax+28]
	mov	DWORD PTR _bl$[ebp], eax
$L1713:
	cmp	DWORD PTR _bl$[ebp], 0
	je	$L1715
; Line 2854
	mov	DWORD PTR _final_value$1720[ebp], 0
; Line 2878
	mov	eax, DWORD PTR _bl$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	ecx, DWORD PTR _regno_last_uid
	movsx	eax, WORD PTR [ecx+eax*2]
	mov	ecx, DWORD PTR _uid_luid$S767
	mov	edx, DWORD PTR _loop_end$[ebp]
	mov	edx, DWORD PTR [edx+4]
	mov	ebx, DWORD PTR _uid_luid$S767
	mov	edx, DWORD PTR [ebx+edx*4]
	cmp	DWORD PTR [ecx+eax*4], edx
	jge	$L1723
	mov	eax, DWORD PTR _bl$[ebp]
	cmp	DWORD PTR [eax+32], 0
	je	$L1723
	mov	eax, DWORD PTR _bl$[ebp]
	mov	eax, DWORD PTR [eax+32]
	mov	ecx, DWORD PTR _max_uid$S768
	cmp	DWORD PTR [eax+4], ecx
	jge	$L1723
	mov	eax, DWORD PTR _bl$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	ecx, DWORD PTR _regno_first_uid
	movsx	eax, WORD PTR [ecx+eax*2]
	mov	ecx, DWORD PTR _uid_luid$S767
	mov	edx, DWORD PTR _bl$[ebp]
	mov	edx, DWORD PTR [edx+32]
	mov	edx, DWORD PTR [edx+4]
	mov	ebx, DWORD PTR _uid_luid$S767
	mov	edx, DWORD PTR [ebx+edx*4]
	cmp	DWORD PTR [ecx+eax*4], edx
	jl	$L1723
	mov	eax, DWORD PTR _bl$[ebp]
	mov	eax, DWORD PTR [eax+32]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	mov	eax, DWORD PTR _bl$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	call	_reg_mentioned_p
	add	esp, 8
	or	eax, eax
	jne	$L1723
	mov	eax, DWORD PTR _bl$[ebp]
	movsx	eax, BYTE PTR [eax+37]
	or	eax, eax
	je	$L1722
$L1723:
	mov	eax, DWORD PTR _loop_end$[ebp]
	push	eax
	mov	eax, DWORD PTR _bl$[ebp]
	push	eax
	call	_final_biv_value
	add	esp, 8
	mov	DWORD PTR _final_value$1720[ebp], eax
	cmp	DWORD PTR _final_value$1720[ebp], 0
	je	$L1721
$L1722:
; Line 2879
	mov	eax, DWORD PTR _end$[ebp]
	push	eax
	mov	eax, DWORD PTR _loop_start$[ebp]
	push	eax
	mov	eax, DWORD PTR _bl$[ebp]
	push	eax
	call	_check_eliminate_biv
	add	esp, 12					; 0000000cH
; Line 2880
	jmp	$L1724
$L1721:
; Line 2882
	cmp	DWORD PTR _loop_dump_stream$S787, 0
	je	$L1725
; Line 2886
	mov	eax, DWORD PTR _bl$[ebp]
	mov	eax, DWORD PTR [eax]
	push	eax
	push	OFFSET $SG1726
	mov	eax, DWORD PTR _loop_dump_stream$S787
	push	eax
	call	_fprintf
	add	esp, 12					; 0000000cH
; Line 2890
	mov	eax, DWORD PTR _bl$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	ecx, DWORD PTR _regno_last_uid
	movsx	eax, WORD PTR [ecx+eax*2]
	push	eax
	mov	eax, DWORD PTR _bl$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	ecx, DWORD PTR _regno_first_uid
	movsx	eax, WORD PTR [ecx+eax*2]
	push	eax
	push	OFFSET $SG1727
	mov	eax, DWORD PTR _loop_dump_stream$S787
	push	eax
	call	_fprintf
	add	esp, 16					; 00000010H
; Line 2892
$L1725:
$L1724:
; Line 2897
	mov	DWORD PTR _all_reduced$1719[ebp], 1
; Line 2901
	mov	eax, DWORD PTR _bl$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	DWORD PTR _v$1716[ebp], eax
	jmp	$L1728
$L1729:
	mov	eax, DWORD PTR _v$1716[ebp]
	mov	eax, DWORD PTR [eax+56]
	mov	DWORD PTR _v$1716[ebp], eax
$L1728:
	cmp	DWORD PTR _v$1716[ebp], 0
	je	$L1730
; Line 2905
	mov	eax, DWORD PTR _v$1716[ebp]
	movsx	eax, BYTE PTR [eax+45]
	or	eax, eax
	je	$L1732
; Line 2906
	jmp	$L1729
; Line 2908
$L1732:
	mov	eax, DWORD PTR _v$1716[ebp]
	mov	eax, DWORD PTR [eax+36]
	mov	DWORD PTR _benefit$1717[ebp], eax
; Line 2909
	mov	eax, DWORD PTR _v$1716[ebp]
	movsx	eax, BYTE PTR [eax+44]
	mov	DWORD PTR _replaceable$1718[ebp], eax
; Line 2913
	cmp	DWORD PTR _replaceable$1718[ebp], 0
	jne	$L1733
	mov	eax, DWORD PTR _bl$[ebp]
	movsx	eax, BYTE PTR [eax+36]
	or	eax, eax
	jne	$L1733
; Line 2914
	sub	DWORD PTR _benefit$1717[ebp], 2
; Line 2918
$L1733:
	sub	eax, eax
	mov	ecx, DWORD PTR _bl$[ebp]
	sub	eax, DWORD PTR [ecx+4]
	neg	eax
	sub	DWORD PTR _benefit$1717[ebp], eax
; Line 2924
	mov	eax, DWORD PTR _v$1716[ebp]
	mov	eax, DWORD PTR [eax+56]
	mov	DWORD PTR _tv$1731[ebp], eax
	jmp	$L1734
$L1735:
	mov	eax, DWORD PTR _tv$1731[ebp]
	mov	eax, DWORD PTR [eax+56]
	mov	DWORD PTR _tv$1731[ebp], eax
$L1734:
	cmp	DWORD PTR _tv$1731[ebp], 0
	je	$L1736
; Line 2929
	mov	eax, DWORD PTR _tv$1731[ebp]
	movsx	eax, BYTE PTR [eax+45]
	or	eax, eax
	jne	$L1737
	mov	eax, DWORD PTR _tv$1731[ebp]
	mov	ecx, DWORD PTR _v$1716[ebp]
	mov	ecx, DWORD PTR [ecx+8]
	cmp	DWORD PTR [eax+8], ecx
	jne	$L1737
	mov	eax, DWORD PTR _v$1716[ebp]
	mov	eax, DWORD PTR [eax+28]
	push	eax
	mov	eax, DWORD PTR _tv$1731[ebp]
	mov	eax, DWORD PTR [eax+28]
	push	eax
	call	_rtx_equal_p
	add	esp, 8
	or	eax, eax
	je	$L1737
	mov	eax, DWORD PTR _v$1716[ebp]
	mov	eax, DWORD PTR [eax+32]
	push	eax
	mov	eax, DWORD PTR _tv$1731[ebp]
	mov	eax, DWORD PTR [eax+32]
	push	eax
	call	_rtx_equal_p
	add	esp, 8
	or	eax, eax
	je	$L1737
; Line 2931
	mov	eax, DWORD PTR _tv$1731[ebp]
	mov	eax, DWORD PTR [eax+36]
	add	DWORD PTR _benefit$1717[ebp], eax
; Line 2932
	mov	eax, DWORD PTR _tv$1731[ebp]
	movsx	eax, BYTE PTR [eax+44]
	or	eax, eax
	jne	$L1738
; Line 2933
	sub	DWORD PTR _benefit$1717[ebp], 2
; Line 2934
$L1738:
	mov	eax, DWORD PTR _tv$1731[ebp]
	mov	eax, DWORD PTR [eax+48]
	mov	ecx, DWORD PTR _v$1716[ebp]
	add	DWORD PTR [ecx+48], eax
; Line 2935
	mov	eax, DWORD PTR _tv$1731[ebp]
	mov	eax, DWORD PTR [eax+52]
	mov	ecx, DWORD PTR _v$1716[ebp]
	add	DWORD PTR [ecx+52], eax
; Line 2936
	mov	eax, DWORD PTR _tv$1731[ebp]
	mov	BYTE PTR [eax+45], 1
; Line 2939
	mov	eax, DWORD PTR _v$1716[ebp]
	mov	eax, DWORD PTR [eax+68]
	mov	ecx, DWORD PTR _tv$1731[ebp]
	mov	DWORD PTR [ecx+68], eax
; Line 2940
	mov	eax, DWORD PTR _tv$1731[ebp]
	mov	ecx, DWORD PTR _v$1716[ebp]
	mov	DWORD PTR [ecx+68], eax
; Line 2942
	cmp	DWORD PTR _loop_dump_stream$S787, 0
	je	$L1739
; Line 2945
	mov	eax, DWORD PTR _tv$1731[ebp]
	mov	eax, DWORD PTR [eax]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	mov	eax, DWORD PTR _v$1716[ebp]
	mov	eax, DWORD PTR [eax]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	push	OFFSET $SG1740
	mov	eax, DWORD PTR _loop_dump_stream$S787
	push	eax
	call	_fprintf
	add	esp, 16					; 00000010H
; Line 2946
$L1739:
; Line 2947
$L1737:
	jmp	$L1735
$L1736:
; Line 2976
	cmp	DWORD PTR _benefit$1717[ebp], 0
	jg	$L1741
; Line 2978
	cmp	DWORD PTR _loop_dump_stream$S787, 0
	je	$L1742
; Line 2980
	mov	eax, DWORD PTR _v$1716[ebp]
	mov	eax, DWORD PTR [eax]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	push	OFFSET $SG1743
	mov	eax, DWORD PTR _loop_dump_stream$S787
	push	eax
	call	_fprintf
	add	esp, 12					; 0000000cH
; Line 2981
$L1742:
	mov	eax, DWORD PTR _v$1716[ebp]
	mov	BYTE PTR [eax+45], 1
; Line 2982
	mov	DWORD PTR _all_reduced$1719[ebp], 0
; Line 2985
$L1741:
	mov	eax, DWORD PTR _v$1716[ebp]
	mov	eax, DWORD PTR [eax+48]
	imul	eax, DWORD PTR _benefit$1717[ebp]
	imul	eax, DWORD PTR _threshold$[ebp]
	cmp	eax, DWORD PTR _insn_count$[ebp]
	jge	$L1744
; Line 2987
	cmp	DWORD PTR _loop_dump_stream$S787, 0
	je	$L1745
; Line 2991
	mov	eax, DWORD PTR _insn_count$[ebp]
	push	eax
	mov	eax, DWORD PTR _v$1716[ebp]
	mov	eax, DWORD PTR [eax+48]
	imul	eax, DWORD PTR _benefit$1717[ebp]
	imul	eax, DWORD PTR _threshold$[ebp]
	push	eax
	mov	eax, DWORD PTR _v$1716[ebp]
	mov	eax, DWORD PTR [eax]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	push	OFFSET $SG1746
	mov	eax, DWORD PTR _loop_dump_stream$S787
	push	eax
	call	_fprintf
	add	esp, 20					; 00000014H
; Line 2992
$L1745:
	mov	eax, DWORD PTR _v$1716[ebp]
	mov	BYTE PTR [eax+45], 1
; Line 2993
	mov	DWORD PTR _all_reduced$1719[ebp], 0
; Line 2999
$L1744:
	mov	eax, DWORD PTR _v$1716[ebp]
	movsx	eax, BYTE PTR [eax+45]
	or	eax, eax
	jne	$L1747
; Line 3001
	mov	DWORD PTR _success$1748[ebp], 1
; Line 3003
	mov	eax, DWORD PTR _bl$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _tv$1731[ebp], eax
	jmp	$L1749
$L1750:
	mov	eax, DWORD PTR _tv$1731[ebp]
	mov	eax, DWORD PTR [eax+56]
	mov	DWORD PTR _tv$1731[ebp], eax
$L1749:
	cmp	DWORD PTR _tv$1731[ebp], 0
	je	$L1751
; Line 3004
	mov	eax, DWORD PTR _tv$1731[ebp]
	mov	ecx, DWORD PTR _const1_rtx
	cmp	DWORD PTR [eax+28], ecx
	jne	$L1752
; Line 3005
	mov	eax, DWORD PTR _v$1716[ebp]
	mov	eax, DWORD PTR [eax+28]
	push	eax
	mov	eax, DWORD PTR _tv$1731[ebp]
	mov	eax, DWORD PTR [eax+32]
	push	eax
	call	_product_cheap_p
	add	esp, 8
	and	DWORD PTR _success$1748[ebp], eax
; Line 3007
$L1752:
	jmp	$L1750
$L1751:
	cmp	DWORD PTR _success$1748[ebp], 0
	jne	$L1753
; Line 3009
	cmp	DWORD PTR _loop_dump_stream$S787, 0
	je	$L1754
; Line 3012
	mov	eax, DWORD PTR _v$1716[ebp]
	mov	eax, DWORD PTR [eax]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	push	OFFSET $SG1755
	mov	eax, DWORD PTR _loop_dump_stream$S787
	push	eax
	call	_fprintf
	add	esp, 12					; 0000000cH
; Line 3013
$L1754:
	mov	eax, DWORD PTR _v$1716[ebp]
	mov	BYTE PTR [eax+45], 1
; Line 3014
	mov	DWORD PTR _all_reduced$1719[ebp], 0
; Line 3016
$L1753:
; Line 3017
$L1747:
	jmp	$L1729
$L1730:
; Line 3021
	mov	eax, DWORD PTR _bl$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	DWORD PTR _v$1716[ebp], eax
	jmp	$L1756
$L1757:
	mov	eax, DWORD PTR _v$1716[ebp]
	mov	eax, DWORD PTR [eax+56]
	mov	DWORD PTR _v$1716[ebp], eax
$L1756:
	cmp	DWORD PTR _v$1716[ebp], 0
	je	$L1758
; Line 3024
	mov	eax, DWORD PTR _v$1716[ebp]
	movsx	eax, BYTE PTR [eax+45]
	or	eax, eax
	jne	$L1760
; Line 3029
	mov	eax, DWORD PTR _v$1716[ebp]
	cmp	DWORD PTR [eax+12], 0
	jne	$L1762
; Line 3030
	push	4
	call	_gen_reg_rtx
	add	esp, 4
	mov	DWORD PTR _new_reg$1761[ebp], eax
; Line 3031
	jmp	$L1763
$L1762:
; Line 3032
	mov	eax, DWORD PTR _v$1716[ebp]
	mov	eax, DWORD PTR [eax]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	push	eax
	call	_gen_reg_rtx
	add	esp, 4
	mov	DWORD PTR _new_reg$1761[ebp], eax
$L1763:
; Line 3040
	mov	eax, DWORD PTR _bl$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _tv$1759[ebp], eax
	jmp	$L1764
$L1765:
	mov	eax, DWORD PTR _tv$1759[ebp]
	mov	eax, DWORD PTR [eax+56]
	mov	DWORD PTR _tv$1759[ebp], eax
$L1764:
	cmp	DWORD PTR _tv$1759[ebp], 0
	je	$L1766
; Line 3043
	mov	eax, DWORD PTR _tv$1759[ebp]
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _before_insn$1768[ebp], eax
; Line 3047
	mov	eax, DWORD PTR _v$1716[ebp]
	mov	DWORD PTR _iv$1767[ebp], eax
	jmp	$L1769
$L1770:
	mov	eax, DWORD PTR _iv$1767[ebp]
	mov	eax, DWORD PTR [eax+68]
	mov	DWORD PTR _iv$1767[ebp], eax
$L1769:
	cmp	DWORD PTR _iv$1767[ebp], 0
	je	$L1771
; Line 3055
	mov	eax, DWORD PTR _tv$1759[ebp]
	mov	eax, DWORD PTR [eax]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _uid_luid$S767
	mov	edx, DWORD PTR _iv$1767[ebp]
	mov	edx, DWORD PTR [edx]
	mov	edx, DWORD PTR [edx+4]
	mov	ebx, DWORD PTR _uid_luid$S767
	mov	edx, DWORD PTR [ebx+edx*4]
	cmp	DWORD PTR [ecx+eax*4], edx
	jg	$L1772
	mov	eax, DWORD PTR _iv$1767[ebp]
	cmp	DWORD PTR [eax+60], 0
	je	$L1774
	mov	eax, DWORD PTR _iv$1767[ebp]
	mov	eax, DWORD PTR [eax+60]
	mov	eax, DWORD PTR [eax]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _uid_luid$S767
	mov	edx, DWORD PTR _tv$1759[ebp]
	mov	edx, DWORD PTR [edx]
	mov	edx, DWORD PTR [edx+4]
	mov	ebx, DWORD PTR _uid_luid$S767
	mov	edx, DWORD PTR [ebx+edx*4]
	cmp	DWORD PTR [ecx+eax*4], edx
	jle	$L1773
$L1774:
	mov	eax, DWORD PTR _iv$1767[ebp]
	cmp	DWORD PTR [eax+64], 0
	je	$L1772
	mov	eax, DWORD PTR _iv$1767[ebp]
	mov	eax, DWORD PTR [eax+64]
	mov	eax, DWORD PTR [eax]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _uid_luid$S767
	mov	edx, DWORD PTR _tv$1759[ebp]
	mov	edx, DWORD PTR [edx]
	mov	edx, DWORD PTR [edx+4]
	mov	ebx, DWORD PTR _uid_luid$S767
	mov	edx, DWORD PTR [ebx+edx*4]
	cmp	DWORD PTR [ecx+eax*4], edx
	jg	$L1772
$L1773:
; Line 3057
	mov	eax, DWORD PTR _iv$1767[ebp]
	mov	eax, DWORD PTR [eax]
	mov	eax, DWORD PTR [eax+12]
	mov	DWORD PTR _before_insn$1768[ebp], eax
; Line 3058
	jmp	$L1771
; Line 3060
$L1772:
	jmp	$L1770
$L1771:
; Line 3062
	mov	eax, DWORD PTR _tv$1759[ebp]
	mov	ecx, DWORD PTR _const1_rtx
	cmp	DWORD PTR [eax+28], ecx
	jne	$L1775
; Line 3064
	mov	eax, DWORD PTR _before_insn$1768[ebp]
	push	eax
	mov	eax, DWORD PTR _new_reg$1761[ebp]
	push	eax
	mov	eax, DWORD PTR _v$1716[ebp]
	mov	eax, DWORD PTR [eax+28]
	push	eax
	mov	eax, DWORD PTR _tv$1759[ebp]
	mov	eax, DWORD PTR [eax+32]
	push	eax
	call	_emit_iv_inc
	add	esp, 16					; 00000010H
; Line 3065
	jmp	$L1776
$L1775:
; Line 3069
	mov	eax, DWORD PTR _before_insn$1768[ebp]
	push	eax
	mov	eax, DWORD PTR _new_reg$1761[ebp]
	push	eax
	mov	eax, DWORD PTR _v$1716[ebp]
	mov	eax, DWORD PTR [eax+32]
	push	eax
	mov	eax, DWORD PTR _v$1716[ebp]
	mov	eax, DWORD PTR [eax+28]
	push	eax
	mov	eax, DWORD PTR _tv$1759[ebp]
	mov	eax, DWORD PTR [eax+32]
	push	eax
	call	_emit_iv_init_code
	add	esp, 20					; 00000014H
$L1776:
; Line 3070
	jmp	$L1765
$L1766:
; Line 3075
	mov	eax, DWORD PTR _loop_start$[ebp]
	push	eax
	mov	eax, DWORD PTR _new_reg$1761[ebp]
	push	eax
	mov	eax, DWORD PTR _v$1716[ebp]
	mov	eax, DWORD PTR [eax+32]
	push	eax
	mov	eax, DWORD PTR _v$1716[ebp]
	mov	eax, DWORD PTR [eax+28]
	push	eax
	mov	eax, DWORD PTR _bl$[ebp]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	call	_emit_iv_init_code
	add	esp, 20					; 00000014H
; Line 3081
	mov	eax, DWORD PTR _bl$[ebp]
	mov	eax, DWORD PTR [eax+24]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1777
	mov	eax, DWORD PTR _bl$[ebp]
	mov	eax, DWORD PTR [eax+24]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _regno_last_uid
	movsx	eax, WORD PTR [ecx+eax*2]
	mov	ecx, DWORD PTR _uid_luid$S767
	mov	edx, DWORD PTR _loop_start$[ebp]
	mov	edx, DWORD PTR [edx+4]
	mov	ebx, DWORD PTR _uid_luid$S767
	mov	edx, DWORD PTR [ebx+edx*4]
	cmp	DWORD PTR [ecx+eax*4], edx
	jge	$L1777
; Line 3083
	mov	eax, DWORD PTR _loop_start$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _uid_luid$S767
	mov	eax, DWORD PTR [ecx+eax*4]
	mov	ecx, DWORD PTR _bl$[ebp]
	mov	ecx, DWORD PTR [ecx+24]
	mov	ecx, DWORD PTR [ecx+4]
	mov	edx, DWORD PTR _regno_last_uid
	movsx	ecx, WORD PTR [edx+ecx*2]
	mov	edx, DWORD PTR _uid_luid$S767
	mov	DWORD PTR [edx+ecx*4], eax
; Line 3091
$L1777:
	mov	eax, DWORD PTR _v$1716[ebp]
	mov	DWORD PTR _tv$1759[ebp], eax
	jmp	$L1778
$L1779:
	mov	eax, DWORD PTR _tv$1759[ebp]
	mov	eax, DWORD PTR [eax+68]
	mov	DWORD PTR _tv$1759[ebp], eax
$L1778:
	cmp	DWORD PTR _tv$1759[ebp], 0
	je	$L1780
; Line 3094
	mov	eax, DWORD PTR _new_reg$1761[ebp]
	mov	ecx, DWORD PTR _tv$1759[ebp]
	mov	DWORD PTR [ecx+4], eax
; Line 3096
	mov	eax, DWORD PTR _tv$1759[ebp]
	cmp	DWORD PTR [eax+12], 0
	jne	$L1781
; Line 3100
	mov	eax, DWORD PTR _new_reg$1761[ebp]
	mov	ecx, DWORD PTR _tv$1759[ebp]
	mov	ecx, DWORD PTR [ecx+20]
	mov	DWORD PTR [ecx], eax
; Line 3102
	jmp	$L1782
$L1781:
	mov	eax, DWORD PTR _tv$1759[ebp]
	movsx	eax, BYTE PTR [eax+44]
	or	eax, eax
	je	$L1783
; Line 3104
	mov	eax, DWORD PTR _new_reg$1761[ebp]
	mov	ecx, DWORD PTR _tv$1759[ebp]
	mov	ecx, DWORD PTR [ecx+16]
	mov	edx, DWORD PTR _reg_map$[ebp]
	mov	DWORD PTR [edx+ecx*4], eax
; Line 3114
	mov	eax, DWORD PTR _tv$1759[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	ecx, DWORD PTR _regno_last_uid
	movsx	eax, WORD PTR [ecx+eax*2]
	mov	ecx, DWORD PTR _uid_luid$S767
	mov	edx, DWORD PTR _loop_end$[ebp]
	mov	edx, DWORD PTR [edx+4]
	mov	ebx, DWORD PTR _uid_luid$S767
	mov	edx, DWORD PTR [ebx+edx*4]
	cmp	DWORD PTR [ecx+eax*4], edx
	jle	$L1784
; Line 3121
	mov	eax, DWORD PTR _loop_end$[ebp]
	push	eax
	mov	eax, DWORD PTR _new_reg$1761[ebp]
	push	eax
	mov	eax, DWORD PTR _tv$1759[ebp]
	mov	eax, DWORD PTR [eax]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	push	0
	push	25					; 00000019H
	call	_gen_rtx
	add	esp, 16					; 00000010H
	push	eax
	call	_emit_insn_after
	add	esp, 8
; Line 3122
	call	_abort
; Line 3124
$L1784:
; Line 3125
	jmp	$L1785
$L1783:
; Line 3131
	mov	eax, DWORD PTR _tv$1759[ebp]
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _after_insn$1787[ebp], eax
; Line 3133
	mov	eax, DWORD PTR _tv$1759[ebp]
	mov	eax, DWORD PTR [eax+40]
	mov	DWORD PTR _count$1786[ebp], eax
	jmp	$L1788
$L1789:
	dec	DWORD PTR _count$1786[ebp]
$L1788:
	cmp	DWORD PTR _count$1786[ebp], 0
	jle	$L1790
; Line 3134
	mov	eax, DWORD PTR _after_insn$1787[ebp]
	push	eax
	call	_next_real_insn
	add	esp, 4
	mov	DWORD PTR _after_insn$1787[ebp], eax
	jmp	$L1789
$L1790:
; Line 3141
	mov	eax, DWORD PTR _after_insn$1787[ebp]
	push	eax
	mov	eax, DWORD PTR _new_reg$1761[ebp]
	push	eax
	mov	eax, DWORD PTR _tv$1759[ebp]
	mov	eax, DWORD PTR [eax]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	push	0
	push	25					; 00000019H
	call	_gen_rtx
	add	esp, 16					; 00000010H
	push	eax
	call	_emit_insn_after
	add	esp, 8
; Line 3142
$L1785:
$L1782:
; Line 3147
	mov	eax, DWORD PTR _tv$1759[ebp]
	cmp	DWORD PTR [eax+12], 1
	sbb	eax, eax
	inc	eax
	push	eax
	mov	eax, DWORD PTR _tv$1759[ebp]
	push	eax
	call	_delete_insn_forces
	add	esp, 8
; Line 3149
	cmp	DWORD PTR _loop_dump_stream$S787, 0
	je	$L1791
; Line 3151
	mov	eax, DWORD PTR _new_reg$1761[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	mov	eax, DWORD PTR _tv$1759[ebp]
	mov	eax, DWORD PTR [eax]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	push	OFFSET $SG1792
	mov	eax, DWORD PTR _loop_dump_stream$S787
	push	eax
	call	_fprintf
	add	esp, 16					; 00000010H
; Line 3152
$L1791:
	jmp	$L1779
$L1780:
; Line 3168
$L1760:
	jmp	$L1757
$L1758:
; Line 3176
	cmp	DWORD PTR _all_reduced$1719[ebp], 1
	jne	$L1793
	mov	eax, DWORD PTR _bl$[ebp]
	movsx	eax, BYTE PTR [eax+36]
	or	eax, eax
	je	$L1793
; Line 3179
	mov	eax, DWORD PTR _bl$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _reg$1794[ebp], eax
; Line 3181
	mov	eax, DWORD PTR _loop_start$[ebp]
	mov	DWORD PTR _p$[ebp], eax
	jmp	$L1795
$L1796:
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	DWORD PTR _p$[ebp], eax
$L1795:
	mov	eax, DWORD PTR _end$[ebp]
	cmp	DWORD PTR _p$[ebp], eax
	je	$L1797
; Line 3183
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	sar	eax, 16					; 00000010H
	mov	DWORD PTR _code$1798[ebp], eax
; Line 3186
	cmp	DWORD PTR _code$1798[ebp], 13		; 0000000dH
	je	$L1800
	cmp	DWORD PTR _code$1798[ebp], 14		; 0000000eH
	je	$L1800
	cmp	DWORD PTR _code$1798[ebp], 15		; 0000000fH
	jne	$L1799
$L1800:
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax+16]
	push	eax
	mov	eax, DWORD PTR _reg$1794[ebp]
	push	eax
	call	_reg_mentioned_p
	add	esp, 8
	or	eax, eax
	je	$L1799
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	ecx, DWORD PTR _cc0_rtx
	cmp	DWORD PTR [eax+4], ecx
	jne	$L1799
; Line 3195
	mov	eax, DWORD PTR _bl$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	DWORD PTR _v1$1801[ebp], eax
	jmp	$L1802
$L1803:
	mov	eax, DWORD PTR _v1$1801[ebp]
	mov	eax, DWORD PTR [eax+56]
	mov	DWORD PTR _v1$1801[ebp], eax
$L1802:
	cmp	DWORD PTR _v1$1801[ebp], 0
	je	$L1804
; Line 3196
	mov	eax, DWORD PTR _v1$1801[ebp]
	mov	ecx, DWORD PTR _p$[ebp]
	cmp	DWORD PTR [eax], ecx
	jne	$L1805
; Line 3204
	mov	eax, DWORD PTR _v1$1801[ebp]
	cmp	DWORD PTR [eax+12], 1
	je	$L1808
	mov	eax, DWORD PTR _v1$1801[ebp]
	cmp	DWORD PTR [eax+12], 0
	jne	$L1807
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax+16]
	push	eax
	mov	eax, DWORD PTR _v1$1801[ebp]
	mov	eax, DWORD PTR [eax+20]
	mov	eax, DWORD PTR [eax]
	push	eax
	mov	eax, DWORD PTR _reg$1794[ebp]
	push	eax
	call	_other_reg_use_p
	add	esp, 12					; 0000000cH
	or	eax, eax
	jne	$L1807
$L1808:
; Line 3205
	jmp	$L1804
; Line 3206
$L1807:
; Line 3207
$L1805:
	jmp	$L1803
$L1804:
	cmp	DWORD PTR _v1$1801[ebp], 0
	jne	$L1809
; Line 3208
	mov	eax, DWORD PTR _loop_start$[ebp]
	push	eax
	mov	eax, DWORD PTR _bl$[ebp]
	push	eax
	mov	eax, DWORD PTR _p$[ebp]
	push	eax
	call	_eliminate_biv
	add	esp, 12					; 0000000cH
; Line 3209
$L1809:
; Line 3210
$L1799:
	jmp	$L1796
$L1797:
; Line 3215
	mov	eax, DWORD PTR _bl$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _v$1716[ebp], eax
	jmp	$L1810
$L1811:
	mov	eax, DWORD PTR _v$1716[ebp]
	mov	eax, DWORD PTR [eax+56]
	mov	DWORD PTR _v$1716[ebp], eax
$L1810:
	cmp	DWORD PTR _v$1716[ebp], 0
	je	$L1812
; Line 3216
	mov	eax, DWORD PTR _v$1716[ebp]
	mov	eax, DWORD PTR [eax]
	push	eax
	call	_delete_insn
	add	esp, 4
	jmp	$L1811
$L1812:
; Line 3226
	cmp	DWORD PTR _final_value$1720[ebp], 0
	je	$L1813
; Line 3228
	mov	eax, DWORD PTR _loop_end$[ebp]
	push	eax
	mov	eax, DWORD PTR _final_value$1720[ebp]
	push	eax
	mov	eax, DWORD PTR _reg$1794[ebp]
	push	eax
	push	0
	push	25					; 00000019H
	call	_gen_rtx
	add	esp, 16					; 00000010H
	push	eax
	call	_emit_insn_after
	add	esp, 8
; Line 3230
$L1813:
	cmp	DWORD PTR _loop_dump_stream$S787, 0
	je	$L1814
; Line 3232
	mov	eax, DWORD PTR _bl$[ebp]
	mov	eax, DWORD PTR [eax]
	push	eax
	push	OFFSET $SG1815
	mov	eax, DWORD PTR _loop_dump_stream$S787
	push	eax
	call	_fprintf
	add	esp, 12					; 0000000cH
; Line 3233
$L1814:
; Line 3234
$L1793:
	jmp	$L1714
$L1715:
; Line 3239
	mov	eax, DWORD PTR _loop_start$[ebp]
	mov	DWORD PTR _p$[ebp], eax
	jmp	$L1816
$L1817:
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	DWORD PTR _p$[ebp], eax
$L1816:
	mov	eax, DWORD PTR _end$[ebp]
	cmp	DWORD PTR _p$[ebp], eax
	je	$L1818
; Line 3241
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 851968				; 000d0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1820
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 917504				; 000e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1820
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 983040				; 000f0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1819
$L1820:
; Line 3245
	mov	eax, DWORD PTR _nregs$[ebp]
	push	eax
	mov	eax, DWORD PTR _reg_map$[ebp]
	push	eax
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax+16]
	push	eax
	call	_replace_regs
	add	esp, 12					; 0000000cH
; Line 3247
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax+28]
	mov	DWORD PTR _tail$1821[ebp], eax
	jmp	$L1822
$L1823:
	mov	eax, DWORD PTR _tail$1821[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _tail$1821[ebp], eax
$L1822:
	cmp	DWORD PTR _tail$1821[ebp], 0
	je	$L1824
; Line 3249
	mov	eax, DWORD PTR _tail$1821[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	mov	ecx, 83886080				; 05000000H
	and	ecx, -16777216				; ff000000H
	cmp	eax, ecx
	je	$L1826
	mov	eax, DWORD PTR _tail$1821[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	mov	ecx, 50331648				; 03000000H
	and	ecx, -16777216				; ff000000H
	cmp	eax, ecx
	jne	$L1825
$L1826:
; Line 3250
	mov	eax, DWORD PTR _nregs$[ebp]
	push	eax
	mov	eax, DWORD PTR _reg_map$[ebp]
	push	eax
	mov	eax, DWORD PTR _tail$1821[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	call	_replace_regs
	add	esp, 12					; 0000000cH
; Line 3251
$L1825:
	jmp	$L1823
$L1824:
; Line 3253
$L1819:
	jmp	$L1817
$L1818:
	cmp	DWORD PTR _loop_dump_stream$S787, 0
	je	$L1827
; Line 3254
	push	OFFSET $SG1828
	mov	eax, DWORD PTR _loop_dump_stream$S787
	push	eax
	call	_fprintf
	add	esp, 8
; Line 3255
$L1827:
$L1598:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_strength_reduce ENDP
_reg$ = 8
_expr$ = 12
_in$ = 16
_fmt$ = -8
_i$ = -12
_code$ = -4
_j$1849 = -16
_other_reg_use_p PROC NEAR
; Line 3263
	push	ebp
	mov	ebp, esp
	sub	esp, 20					; 00000014H
	push	ebx
	push	esi
	push	edi
; Line 3268
	cmp	DWORD PTR _in$[ebp], 0
	je	$L1837
	mov	eax, DWORD PTR _expr$[ebp]
	cmp	DWORD PTR _in$[ebp], eax
	jne	$L1836
$L1837:
; Line 3269
	sub	eax, eax
	jmp	$L1832
; Line 3271
$L1836:
	mov	eax, DWORD PTR _in$[ebp]
	cmp	DWORD PTR _reg$[ebp], eax
	jne	$L1838
; Line 3272
	mov	eax, 1
	jmp	$L1832
; Line 3274
$L1838:
	mov	eax, DWORD PTR _in$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	sar	eax, 16					; 00000010H
	mov	DWORD PTR _code$[ebp], eax
; Line 3276
	mov	eax, DWORD PTR _code$[ebp]
	mov	DWORD PTR -20+[ebp], eax
	jmp	$L1839
; Line 3279
$L1843:
; Line 3280
	mov	eax, DWORD PTR _reg$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L2560
	mov	eax, DWORD PTR _reg$[ebp]
	mov	ecx, DWORD PTR _in$[ebp]
	mov	ecx, DWORD PTR [ecx+4]
	cmp	DWORD PTR [eax+4], ecx
	jne	$L2560
	mov	eax, 1
	jmp	$L2561
$L2560:
	sub	eax, eax
$L2561:
	jmp	$L1832
; Line 3284
$L1844:
; Line 3290
	sub	eax, eax
	jmp	$L1832
; Line 3291
	jmp	$L1840
$L1839:
	sub	DWORD PTR -20+[ebp], 17			; 00000011H
	cmp	DWORD PTR -20+[ebp], 23			; 00000017H
	ja	$L1840
	shl	DWORD PTR -20+[ebp], 2
	mov	eax, DWORD PTR -20+[ebp]
	jmp	DWORD PTR $L2562[eax]
$L2562:
	DD	OFFSET $L1844
	DD	OFFSET $L1840
	DD	OFFSET $L1840
	DD	OFFSET $L1840
	DD	OFFSET $L1840
	DD	OFFSET $L1840
	DD	OFFSET $L1840
	DD	OFFSET $L1840
	DD	OFFSET $L1840
	DD	OFFSET $L1840
	DD	OFFSET $L1840
	DD	OFFSET $L1840
	DD	OFFSET $L1840
	DD	OFFSET $L1844
	DD	OFFSET $L1844
	DD	OFFSET $L1840
	DD	OFFSET $L1844
	DD	OFFSET $L1843
	DD	OFFSET $L1840
	DD	OFFSET $L1840
	DD	OFFSET $L1840
	DD	OFFSET $L1840
	DD	OFFSET $L1844
	DD	OFFSET $L1844
$L1840:
; Line 3293
	mov	eax, DWORD PTR _code$[ebp]
	mov	eax, DWORD PTR _rtx_format[eax*4]
	mov	DWORD PTR _fmt$[ebp], eax
; Line 3295
	mov	eax, DWORD PTR _code$[ebp]
	mov	eax, DWORD PTR _rtx_length[eax*4]
	dec	eax
	mov	DWORD PTR _i$[ebp], eax
	jmp	$L1845
$L1846:
	dec	DWORD PTR _i$[ebp]
$L1845:
	cmp	DWORD PTR _i$[ebp], 0
	jl	$L1847
; Line 3297
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _fmt$[ebp]
	movsx	eax, BYTE PTR [eax+ecx]
	cmp	eax, 69					; 00000045H
	jne	$L1848
; Line 3300
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _in$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+4]
	mov	eax, DWORD PTR [eax]
	dec	eax
	mov	DWORD PTR _j$1849[ebp], eax
	jmp	$L1850
$L1851:
	dec	DWORD PTR _j$1849[ebp]
$L1850:
	cmp	DWORD PTR _j$1849[ebp], 0
	jl	$L1852
; Line 3301
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _in$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+4]
	mov	ecx, DWORD PTR _j$1849[ebp]
	mov	eax, DWORD PTR [eax+ecx*4+4]
	push	eax
	mov	eax, DWORD PTR _expr$[ebp]
	push	eax
	mov	eax, DWORD PTR _reg$[ebp]
	push	eax
	call	_other_reg_use_p
	add	esp, 12					; 0000000cH
	or	eax, eax
	je	$L1853
; Line 3302
	mov	eax, 1
	jmp	$L1832
; Line 3303
$L1853:
	jmp	$L1851
$L1852:
; Line 3304
	jmp	$L1854
$L1848:
; Line 3305
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _fmt$[ebp]
	movsx	eax, BYTE PTR [eax+ecx]
	cmp	eax, 101				; 00000065H
	jne	$L1855
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _in$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+4]
	push	eax
	mov	eax, DWORD PTR _expr$[ebp]
	push	eax
	mov	eax, DWORD PTR _reg$[ebp]
	push	eax
	call	_other_reg_use_p
	add	esp, 12					; 0000000cH
	or	eax, eax
	je	$L1855
; Line 3306
	mov	eax, 1
	jmp	$L1832
; Line 3307
$L1855:
$L1854:
	jmp	$L1846
$L1847:
; Line 3308
	sub	eax, eax
	jmp	$L1832
; Line 3309
$L1832:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_other_reg_use_p ENDP
_TEXT	ENDS
EXTRN	_oballoc:NEAR
_TEXT	SEGMENT
_x$ = 8
_insn$ = 12
_maybe_never$ = 16
_loop_end$ = 20
_i$ = -16
_j$ = -4
_code$ = -8
_fmt$ = -12
_src_regno$1872 = -40
_add_val$1873 = -24
_mult_val$1874 = -28
_benefit$1875 = -20
_forces$1876 = -36
_forces2$1877 = -32
_v$1879 = -44
_find_mem_givs PROC NEAR
; Line 3321
	push	ebp
	mov	ebp, esp
	sub	esp, 48					; 00000030H
	push	ebx
	push	esi
	push	edi
; Line 3326
	cmp	DWORD PTR _x$[ebp], 0
	jne	$L1865
; Line 3327
	jmp	$L1860
; Line 3329
$L1865:
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	sar	eax, 16					; 00000010H
	mov	DWORD PTR _code$[ebp], eax
; Line 3330
	mov	eax, DWORD PTR _code$[ebp]
	mov	DWORD PTR -48+[ebp], eax
	jmp	$L1866
; Line 3332
$L1870:
; Line 3344
	jmp	$L1860
; Line 3346
$L1871:
; Line 3352
	mov	DWORD PTR _forces$1876[ebp], 0
; Line 3353
	mov	DWORD PTR _forces2$1877[ebp], 0
; Line 3357
	lea	eax, DWORD PTR _forces2$1877[ebp]
	push	eax
	lea	eax, DWORD PTR _forces$1876[ebp]
	push	eax
	lea	eax, DWORD PTR _mult_val$1874[ebp]
	push	eax
	lea	eax, DWORD PTR _add_val$1873[ebp]
	push	eax
	lea	eax, DWORD PTR _src_regno$1872[ebp]
	push	eax
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	call	_general_induction_var
	add	esp, 24					; 00000018H
	mov	DWORD PTR _benefit$1875[ebp], eax
; Line 3358
	cmp	DWORD PTR _benefit$1875[ebp], 0
	jle	$L1878
; Line 3362
	push	72					; 00000048H
	call	_oballoc
	add	esp, 4
	mov	DWORD PTR _v$1879[ebp], eax
; Line 3366
	mov	eax, DWORD PTR _loop_end$[ebp]
	push	eax
	mov	eax, DWORD PTR _x$[ebp]
	add	eax, 4
	push	eax
	mov	eax, DWORD PTR _maybe_never$[ebp]
	push	eax
	push	0
	mov	eax, DWORD PTR _forces2$1877[ebp]
	push	eax
	mov	eax, DWORD PTR _forces$1876[ebp]
	push	eax
	mov	eax, DWORD PTR _benefit$1875[ebp]
	push	eax
	mov	eax, DWORD PTR _add_val$1873[ebp]
	push	eax
	mov	eax, DWORD PTR _mult_val$1874[ebp]
	push	eax
	push	0
	mov	eax, DWORD PTR _src_regno$1872[ebp]
	push	eax
	mov	eax, DWORD PTR _insn$[ebp]
	push	eax
	mov	eax, DWORD PTR _v$1879[ebp]
	push	eax
	call	_record_giv
	add	esp, 52					; 00000034H
; Line 3368
$L1878:
	jmp	$L1860
; Line 3370
	jmp	$L1867
$L1866:
	sub	DWORD PTR -48+[ebp], 23			; 00000017H
	cmp	DWORD PTR -48+[ebp], 17			; 00000011H
	ja	$L1867
	shl	DWORD PTR -48+[ebp], 2
	mov	eax, DWORD PTR -48+[ebp]
	jmp	DWORD PTR $L2563[eax]
$L2563:
	DD	OFFSET $L1870
	DD	OFFSET $L1870
	DD	OFFSET $L1867
	DD	OFFSET $L1870
	DD	OFFSET $L1870
	DD	OFFSET $L1867
	DD	OFFSET $L1867
	DD	OFFSET $L1870
	DD	OFFSET $L1870
	DD	OFFSET $L1870
	DD	OFFSET $L1870
	DD	OFFSET $L1870
	DD	OFFSET $L1867
	DD	OFFSET $L1867
	DD	OFFSET $L1871
	DD	OFFSET $L1870
	DD	OFFSET $L1870
	DD	OFFSET $L1870
$L1867:
; Line 3374
	mov	eax, DWORD PTR _code$[ebp]
	mov	eax, DWORD PTR _rtx_format[eax*4]
	mov	DWORD PTR _fmt$[ebp], eax
; Line 3375
	mov	eax, DWORD PTR _code$[ebp]
	mov	eax, DWORD PTR _rtx_length[eax*4]
	dec	eax
	mov	DWORD PTR _i$[ebp], eax
	jmp	$L1881
$L1882:
	dec	DWORD PTR _i$[ebp]
$L1881:
	cmp	DWORD PTR _i$[ebp], 0
	jl	$L1883
; Line 3376
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _fmt$[ebp]
	movsx	eax, BYTE PTR [eax+ecx]
	cmp	eax, 101				; 00000065H
	jne	$L1884
; Line 3377
	mov	eax, DWORD PTR _loop_end$[ebp]
	push	eax
	mov	eax, DWORD PTR _maybe_never$[ebp]
	push	eax
	mov	eax, DWORD PTR _insn$[ebp]
	push	eax
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+4]
	push	eax
	call	_find_mem_givs
	add	esp, 16					; 00000010H
; Line 3378
	jmp	$L1885
$L1884:
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _fmt$[ebp]
	movsx	eax, BYTE PTR [eax+ecx]
	cmp	eax, 69					; 00000045H
	jne	$L1886
; Line 3379
	mov	DWORD PTR _j$[ebp], 0
	jmp	$L1887
$L1888:
	inc	DWORD PTR _j$[ebp]
$L1887:
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+4]
	mov	ecx, DWORD PTR _j$[ebp]
	cmp	DWORD PTR [eax], ecx
	jbe	$L1889
; Line 3380
	mov	eax, DWORD PTR _loop_end$[ebp]
	push	eax
	mov	eax, DWORD PTR _maybe_never$[ebp]
	push	eax
	mov	eax, DWORD PTR _insn$[ebp]
	push	eax
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+4]
	mov	ecx, DWORD PTR _j$[ebp]
	mov	eax, DWORD PTR [eax+ecx*4+4]
	push	eax
	call	_find_mem_givs
	add	esp, 16					; 00000010H
	jmp	$L1888
$L1889:
; Line 3381
$L1886:
$L1885:
	jmp	$L1882
$L1883:
$L1860:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_find_mem_givs ENDP
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+2
$SG1931	DB	'Insn %d: giv reg %d', 00H
$SG1933	DB	'Insn %d: dest address', 00H
	ORG $+2
$SG1934	DB	' src reg %d benefit %d', 00H
	ORG $+1
$SG1935	DB	' used %d lifetime %d', 00H
	ORG $+3
$SG1937	DB	' replaceable', 00H
	ORG $+3
$SG1939	DB	' mult %d', 00H
	ORG $+3
$SG1941	DB	' mult ', 00H
	ORG $+1
$SG1943	DB	' add %d', 00H
$SG1945	DB	' add ', 00H
	ORG $+2
$SG1947	DB	' forces insn %d', 00H
$SG1949	DB	' forces insn %d', 00H
$SG1951	DB	' consec %d', 00H
	ORG $+1
$SG1953	DB	0aH, 00H
_DATA	ENDS
_TEXT	SEGMENT
_v$ = 8
_insn$ = 12
_src_regno$ = 16
_dest_regno$ = 20
_mult_val$ = 24
_add_val$ = 28
_benefit$ = 32
_forces$ = 36
_forces2$ = 40
_type$ = 44
_maybe_never$ = 48
_location$ = 52
_loop_end$ = 56
_b$ = -8
_bl$ = -4
_record_giv PROC NEAR
; Line 3411
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	push	ebx
	push	esi
	push	edi
; Line 3415
	mov	eax, DWORD PTR _insn$[ebp]
	mov	ecx, DWORD PTR _v$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 3416
	mov	eax, DWORD PTR _src_regno$[ebp]
	mov	ecx, DWORD PTR _v$[ebp]
	mov	DWORD PTR [ecx+8], eax
; Line 3417
	mov	eax, DWORD PTR _type$[ebp]
	mov	ecx, DWORD PTR _v$[ebp]
	mov	DWORD PTR [ecx+12], eax
; Line 3418
	mov	eax, DWORD PTR _dest_regno$[ebp]
	mov	ecx, DWORD PTR _v$[ebp]
	mov	DWORD PTR [ecx+16], eax
; Line 3419
	mov	eax, DWORD PTR _mult_val$[ebp]
	mov	ecx, DWORD PTR _v$[ebp]
	mov	DWORD PTR [ecx+28], eax
; Line 3420
	mov	eax, DWORD PTR _add_val$[ebp]
	mov	ecx, DWORD PTR _v$[ebp]
	mov	DWORD PTR [ecx+32], eax
; Line 3421
	mov	eax, DWORD PTR _benefit$[ebp]
	mov	ecx, DWORD PTR _v$[ebp]
	mov	DWORD PTR [ecx+36], eax
; Line 3422
	mov	eax, DWORD PTR _location$[ebp]
	mov	ecx, DWORD PTR _v$[ebp]
	mov	DWORD PTR [ecx+20], eax
; Line 3424
	cmp	DWORD PTR _type$[ebp], 0
	jne	$L1906
; Line 3426
	mov	eax, DWORD PTR _location$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	mov	ecx, DWORD PTR _v$[ebp]
	mov	DWORD PTR [ecx+24], eax
; Line 3427
	mov	eax, DWORD PTR _v$[ebp]
	mov	DWORD PTR [eax+40], 0
; Line 3428
	mov	eax, DWORD PTR _v$[ebp]
	mov	DWORD PTR [eax+48], 1
; Line 3429
	mov	eax, DWORD PTR _v$[ebp]
	mov	DWORD PTR [eax+52], 1
; Line 3431
	jmp	$L1907
$L1906:
; Line 3433
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	mov	ecx, DWORD PTR _v$[ebp]
	mov	DWORD PTR [ecx+24], eax
; Line 3434
	mov	eax, DWORD PTR _dest_regno$[ebp]
	mov	ecx, DWORD PTR _n_times_set$S775
	movsx	eax, WORD PTR [ecx+eax*2]
	dec	eax
	mov	ecx, DWORD PTR _v$[ebp]
	mov	DWORD PTR [ecx+40], eax
; Line 3436
	mov	eax, DWORD PTR _dest_regno$[ebp]
	mov	ecx, DWORD PTR _regno_last_uid
	movsx	eax, WORD PTR [ecx+eax*2]
	mov	ecx, DWORD PTR _uid_luid$S767
	mov	eax, DWORD PTR [ecx+eax*4]
	mov	ecx, DWORD PTR _dest_regno$[ebp]
	mov	edx, DWORD PTR _regno_first_uid
	movsx	ecx, WORD PTR [edx+ecx*2]
	mov	edx, DWORD PTR _uid_luid$S767
	sub	eax, DWORD PTR [edx+ecx*4]
	mov	ecx, DWORD PTR _v$[ebp]
	mov	DWORD PTR [ecx+48], eax
; Line 3437
	mov	eax, DWORD PTR _dest_regno$[ebp]
	mov	ecx, DWORD PTR _n_times_used$S776
	movsx	eax, WORD PTR [ecx+eax*2]
	mov	ecx, DWORD PTR _v$[ebp]
	mov	DWORD PTR [ecx+52], eax
; Line 3438
$L1907:
; Line 3440
	mov	eax, DWORD PTR _v$[ebp]
	mov	DWORD PTR [eax+68], 0
; Line 3441
	mov	eax, DWORD PTR _v$[ebp]
	mov	DWORD PTR [eax+60], 0
; Line 3442
	mov	eax, DWORD PTR _v$[ebp]
	mov	DWORD PTR [eax+64], 0
; Line 3443
	mov	eax, DWORD PTR _v$[ebp]
	mov	BYTE PTR [eax+45], 0
; Line 3444
	mov	eax, DWORD PTR _v$[ebp]
	mov	DWORD PTR [eax+4], 0
; Line 3452
	cmp	DWORD PTR _forces$[ebp], 0
	je	$L1908
; Line 3454
	mov	eax, DWORD PTR _forces$[ebp]
	mov	eax, DWORD PTR [eax+36]
	mov	ecx, DWORD PTR _v$[ebp]
	add	DWORD PTR [ecx+36], eax
; Line 3461
	mov	eax, DWORD PTR _forces$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	ecx, DWORD PTR _regno_last_uid
	movsx	eax, WORD PTR [ecx+eax*2]
	mov	ecx, DWORD PTR _insn$[ebp]
	cmp	eax, DWORD PTR [ecx+4]
	je	$L1910
	mov	eax, DWORD PTR _forces$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	ecx, DWORD PTR _regno_last_uid
	movsx	eax, WORD PTR [ecx+eax*2]
	mov	ecx, DWORD PTR _uid_luid$S767
	mov	eax, DWORD PTR [ecx+eax*4]
	mov	ecx, DWORD PTR _forces$[ebp]
	mov	ecx, DWORD PTR [ecx+16]
	mov	edx, DWORD PTR _regno_first_uid
	movsx	ecx, WORD PTR [edx+ecx*2]
	mov	edx, DWORD PTR _uid_luid$S767
	sub	eax, DWORD PTR [edx+ecx*4]
	mov	ecx, DWORD PTR _insn$[ebp]
	mov	ecx, DWORD PTR [ecx+4]
	mov	edx, DWORD PTR _uid_luid$S767
	mov	ecx, DWORD PTR [edx+ecx*4]
	mov	edx, DWORD PTR _forces$[ebp]
	mov	edx, DWORD PTR [edx]
	mov	edx, DWORD PTR [edx+4]
	mov	ebx, DWORD PTR _uid_luid$S767
	sub	ecx, DWORD PTR [ebx+edx*4]
	cmp	eax, ecx
	jne	$L1909
$L1910:
	mov	eax, DWORD PTR _insn$[ebp]
	push	eax
	mov	eax, DWORD PTR _forces$[ebp]
	mov	eax, DWORD PTR [eax]
	push	eax
	mov	eax, DWORD PTR _forces$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	call	_reg_used_between_p
	add	esp, 12					; 0000000cH
	or	eax, eax
	jne	$L1909
; Line 3463
	mov	eax, DWORD PTR _forces$[ebp]
	mov	ecx, DWORD PTR _v$[ebp]
	mov	DWORD PTR [ecx+60], eax
; Line 3464
	mov	eax, DWORD PTR _forces$[ebp]
	mov	BYTE PTR [eax+45], 1
; Line 3466
$L1909:
; Line 3468
$L1908:
	cmp	DWORD PTR _forces2$[ebp], 0
	je	$L1911
; Line 3470
	mov	eax, DWORD PTR _forces2$[ebp]
	mov	eax, DWORD PTR [eax+36]
	mov	ecx, DWORD PTR _v$[ebp]
	add	DWORD PTR [ecx+36], eax
; Line 3477
	mov	eax, DWORD PTR _forces2$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	ecx, DWORD PTR _regno_last_uid
	movsx	eax, WORD PTR [ecx+eax*2]
	mov	ecx, DWORD PTR _insn$[ebp]
	cmp	eax, DWORD PTR [ecx+4]
	je	$L1913
	mov	eax, DWORD PTR _forces2$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	ecx, DWORD PTR _regno_last_uid
	movsx	eax, WORD PTR [ecx+eax*2]
	mov	ecx, DWORD PTR _uid_luid$S767
	mov	eax, DWORD PTR [ecx+eax*4]
	mov	ecx, DWORD PTR _forces2$[ebp]
	mov	ecx, DWORD PTR [ecx+16]
	mov	edx, DWORD PTR _regno_first_uid
	movsx	ecx, WORD PTR [edx+ecx*2]
	mov	edx, DWORD PTR _uid_luid$S767
	sub	eax, DWORD PTR [edx+ecx*4]
	mov	ecx, DWORD PTR _insn$[ebp]
	mov	ecx, DWORD PTR [ecx+4]
	mov	edx, DWORD PTR _uid_luid$S767
	mov	ecx, DWORD PTR [edx+ecx*4]
	mov	edx, DWORD PTR _forces2$[ebp]
	mov	edx, DWORD PTR [edx]
	mov	edx, DWORD PTR [edx+4]
	mov	ebx, DWORD PTR _uid_luid$S767
	sub	ecx, DWORD PTR [ebx+edx*4]
	cmp	eax, ecx
	jne	$L1912
$L1913:
	mov	eax, DWORD PTR _insn$[ebp]
	push	eax
	mov	eax, DWORD PTR _forces2$[ebp]
	mov	eax, DWORD PTR [eax]
	push	eax
	mov	eax, DWORD PTR _forces2$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	call	_reg_used_between_p
	add	esp, 12					; 0000000cH
	or	eax, eax
	jne	$L1912
; Line 3479
	mov	eax, DWORD PTR _v$[ebp]
	cmp	DWORD PTR [eax+60], 0
	je	$L1914
; Line 3480
	mov	eax, DWORD PTR _forces2$[ebp]
	mov	ecx, DWORD PTR _v$[ebp]
	mov	DWORD PTR [ecx+64], eax
; Line 3481
	jmp	$L1915
$L1914:
; Line 3482
	mov	eax, DWORD PTR _forces2$[ebp]
	mov	ecx, DWORD PTR _v$[ebp]
	mov	DWORD PTR [ecx+60], eax
$L1915:
; Line 3483
	mov	eax, DWORD PTR _forces2$[ebp]
	mov	BYTE PTR [eax+45], 1
; Line 3485
$L1912:
; Line 3487
$L1911:
	cmp	DWORD PTR _type$[ebp], 1
	jne	$L1916
; Line 3489
	mov	eax, DWORD PTR _dest_regno$[ebp]
	mov	ecx, DWORD PTR _induct_var$S1588
	mov	DWORD PTR [ecx+eax*4], 3
; Line 3490
	mov	eax, DWORD PTR _v$[ebp]
	mov	ecx, DWORD PTR _dest_regno$[ebp]
	mov	edx, DWORD PTR _induct_struct$S1589
	mov	DWORD PTR [edx+ecx*4], eax
; Line 3495
$L1916:
	mov	eax, DWORD PTR _src_regno$[ebp]
	mov	ecx, DWORD PTR _class_struct$S1590
	mov	eax, DWORD PTR [ecx+eax*4]
	mov	DWORD PTR _bl$[ebp], eax
; Line 3496
	cmp	DWORD PTR _bl$[ebp], 0
	je	$L1917
; Line 3498
	mov	eax, DWORD PTR _bl$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	ecx, DWORD PTR _v$[ebp]
	mov	DWORD PTR [ecx+56], eax
; Line 3499
	mov	eax, DWORD PTR _v$[ebp]
	mov	ecx, DWORD PTR _bl$[ebp]
	mov	DWORD PTR [ecx+16], eax
; Line 3502
	cmp	DWORD PTR _type$[ebp], 1
	jne	$L1918
; Line 3503
	mov	eax, DWORD PTR _bl$[ebp]
	inc	DWORD PTR [eax+12]
; Line 3504
$L1918:
	mov	eax, DWORD PTR _benefit$[ebp]
	mov	ecx, DWORD PTR _bl$[ebp]
	add	DWORD PTR [ecx+20], eax
; Line 3506
	jmp	$L1919
$L1917:
; Line 3508
	call	_abort
$L1919:
; Line 3510
	cmp	DWORD PTR _type$[ebp], 0
	jne	$L1920
; Line 3511
	mov	eax, DWORD PTR _v$[ebp]
	mov	BYTE PTR [eax+44], 1
; Line 3512
	jmp	$L1921
$L1920:
; Line 3532
	mov	eax, DWORD PTR _dest_regno$[ebp]
	mov	ecx, DWORD PTR _regno_first_uid
	movsx	eax, WORD PTR [ecx+eax*2]
	mov	ecx, DWORD PTR _insn$[ebp]
	cmp	eax, DWORD PTR [ecx+4]
	jne	$L1922
	mov	eax, DWORD PTR _dest_regno$[ebp]
	mov	ecx, DWORD PTR _regno_last_uid
	movsx	eax, WORD PTR [ecx+eax*2]
	mov	ecx, DWORD PTR _uid_luid$S767
	mov	edx, DWORD PTR _loop_end$[ebp]
	mov	edx, DWORD PTR [edx+4]
	mov	ebx, DWORD PTR _uid_luid$S767
	mov	edx, DWORD PTR [ebx+edx*4]
	cmp	DWORD PTR [ecx+eax*4], edx
	jge	$L1922
	cmp	DWORD PTR _maybe_never$[ebp], 0
	je	$L1923
	mov	eax, DWORD PTR _insn$[ebp]
	push	eax
	mov	eax, DWORD PTR _dest_regno$[ebp]
	push	eax
	call	_last_use_this_basic_block
	add	esp, 8
	or	eax, eax
	je	$L1922
$L1923:
; Line 3534
	mov	eax, DWORD PTR _v$[ebp]
	mov	BYTE PTR [eax+44], 1
; Line 3535
	mov	eax, DWORD PTR _bl$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _b$[ebp], eax
	jmp	$L1924
$L1925:
	mov	eax, DWORD PTR _b$[ebp]
	mov	eax, DWORD PTR [eax+56]
	mov	DWORD PTR _b$[ebp], eax
$L1924:
	cmp	DWORD PTR _b$[ebp], 0
	je	$L1926
; Line 3540
	mov	eax, DWORD PTR _dest_regno$[ebp]
	mov	ecx, DWORD PTR _regno_first_uid
	movsx	eax, WORD PTR [ecx+eax*2]
	mov	ecx, DWORD PTR _uid_luid$S767
	mov	edx, DWORD PTR _b$[ebp]
	mov	edx, DWORD PTR [edx]
	mov	edx, DWORD PTR [edx+4]
	mov	ebx, DWORD PTR _uid_luid$S767
	mov	edx, DWORD PTR [ebx+edx*4]
	cmp	DWORD PTR [ecx+eax*4], edx
	jg	$L1927
	mov	eax, DWORD PTR _dest_regno$[ebp]
	mov	ecx, DWORD PTR _regno_last_uid
	movsx	eax, WORD PTR [ecx+eax*2]
	mov	ecx, DWORD PTR _uid_luid$S767
	mov	edx, DWORD PTR _b$[ebp]
	mov	edx, DWORD PTR [edx]
	mov	edx, DWORD PTR [edx+4]
	mov	ebx, DWORD PTR _uid_luid$S767
	mov	edx, DWORD PTR [ebx+edx*4]
	cmp	DWORD PTR [ecx+eax*4], edx
	jl	$L1927
; Line 3542
	mov	eax, DWORD PTR _v$[ebp]
	mov	BYTE PTR [eax+44], 0
; Line 3543
	jmp	$L1926
; Line 3545
$L1927:
	jmp	$L1925
$L1926:
; Line 3547
	jmp	$L1928
$L1922:
; Line 3548
	mov	eax, DWORD PTR _v$[ebp]
	mov	BYTE PTR [eax+44], 0
$L1928:
; Line 3549
$L1921:
; Line 3551
	cmp	DWORD PTR _loop_dump_stream$S787, 0
	je	$L1929
; Line 3553
	cmp	DWORD PTR _type$[ebp], 1
	jne	$L1930
; Line 3555
	mov	eax, DWORD PTR _dest_regno$[ebp]
	push	eax
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	push	OFFSET $SG1931
	mov	eax, DWORD PTR _loop_dump_stream$S787
	push	eax
	call	_fprintf
	add	esp, 16					; 00000010H
; Line 3556
	jmp	$L1932
$L1930:
; Line 3558
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	push	OFFSET $SG1933
	mov	eax, DWORD PTR _loop_dump_stream$S787
	push	eax
	call	_fprintf
	add	esp, 12					; 0000000cH
$L1932:
; Line 3561
	mov	eax, DWORD PTR _v$[ebp]
	mov	eax, DWORD PTR [eax+36]
	push	eax
	mov	eax, DWORD PTR _src_regno$[ebp]
	push	eax
	push	OFFSET $SG1934
	mov	eax, DWORD PTR _loop_dump_stream$S787
	push	eax
	call	_fprintf
	add	esp, 16					; 00000010H
; Line 3563
	mov	eax, DWORD PTR _v$[ebp]
	mov	eax, DWORD PTR [eax+48]
	push	eax
	mov	eax, DWORD PTR _v$[ebp]
	mov	eax, DWORD PTR [eax+52]
	push	eax
	push	OFFSET $SG1935
	mov	eax, DWORD PTR _loop_dump_stream$S787
	push	eax
	call	_fprintf
	add	esp, 16					; 00000010H
; Line 3565
	mov	eax, DWORD PTR _v$[ebp]
	movsx	eax, BYTE PTR [eax+44]
	or	eax, eax
	je	$L1936
; Line 3566
	push	OFFSET $SG1937
	mov	eax, DWORD PTR _loop_dump_stream$S787
	push	eax
	call	_fprintf
	add	esp, 8
; Line 3568
$L1936:
	mov	eax, DWORD PTR _mult_val$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1938
; Line 3570
	mov	eax, DWORD PTR _mult_val$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	push	OFFSET $SG1939
	mov	eax, DWORD PTR _loop_dump_stream$S787
	push	eax
	call	_fprintf
	add	esp, 12					; 0000000cH
; Line 3571
	jmp	$L1940
$L1938:
; Line 3573
	push	OFFSET $SG1941
	mov	eax, DWORD PTR _loop_dump_stream$S787
	push	eax
	call	_fprintf
	add	esp, 8
; Line 3574
	mov	eax, DWORD PTR _mult_val$[ebp]
	push	eax
	mov	eax, DWORD PTR _loop_dump_stream$S787
	push	eax
	call	_print_rtl
	add	esp, 8
; Line 3575
$L1940:
; Line 3577
	mov	eax, DWORD PTR _add_val$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1942
; Line 3579
	mov	eax, DWORD PTR _add_val$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	push	OFFSET $SG1943
	mov	eax, DWORD PTR _loop_dump_stream$S787
	push	eax
	call	_fprintf
	add	esp, 12					; 0000000cH
; Line 3580
	jmp	$L1944
$L1942:
; Line 3582
	push	OFFSET $SG1945
	mov	eax, DWORD PTR _loop_dump_stream$S787
	push	eax
	call	_fprintf
	add	esp, 8
; Line 3583
	mov	eax, DWORD PTR _add_val$[ebp]
	push	eax
	mov	eax, DWORD PTR _loop_dump_stream$S787
	push	eax
	call	_print_rtl
	add	esp, 8
; Line 3584
$L1944:
; Line 3587
$L1929:
	cmp	DWORD PTR _loop_dump_stream$S787, 0
	je	$L1946
	mov	eax, DWORD PTR _v$[ebp]
	cmp	DWORD PTR [eax+60], 0
	je	$L1946
; Line 3588
	mov	eax, DWORD PTR _v$[ebp]
	mov	eax, DWORD PTR [eax+60]
	mov	eax, DWORD PTR [eax]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	push	OFFSET $SG1947
	mov	eax, DWORD PTR _loop_dump_stream$S787
	push	eax
	call	_fprintf
	add	esp, 12					; 0000000cH
; Line 3589
$L1946:
	cmp	DWORD PTR _loop_dump_stream$S787, 0
	je	$L1948
	mov	eax, DWORD PTR _v$[ebp]
	cmp	DWORD PTR [eax+64], 0
	je	$L1948
; Line 3590
	mov	eax, DWORD PTR _v$[ebp]
	mov	eax, DWORD PTR [eax+64]
	mov	eax, DWORD PTR [eax]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	push	OFFSET $SG1949
	mov	eax, DWORD PTR _loop_dump_stream$S787
	push	eax
	call	_fprintf
	add	esp, 12					; 0000000cH
; Line 3591
$L1948:
	cmp	DWORD PTR _loop_dump_stream$S787, 0
	je	$L1950
	mov	eax, DWORD PTR _v$[ebp]
	cmp	DWORD PTR [eax+40], 0
	je	$L1950
; Line 3592
	mov	eax, DWORD PTR _v$[ebp]
	mov	eax, DWORD PTR [eax+40]
	push	eax
	push	OFFSET $SG1951
	mov	eax, DWORD PTR _loop_dump_stream$S787
	push	eax
	call	_fprintf
	add	esp, 12					; 0000000cH
; Line 3593
$L1950:
	cmp	DWORD PTR _loop_dump_stream$S787, 0
	je	$L1952
; Line 3594
	push	OFFSET $SG1953
	mov	eax, DWORD PTR _loop_dump_stream$S787
	push	eax
	call	_fprintf
	add	esp, 8
; Line 3595
$L1952:
$L1903:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_record_giv ENDP
_v$ = 8
_this_too$ = 12
_x$ = -12
_p$ = -16
_count$ = -4
_insn$ = -8
_first$1967 = -20
_delete_insn_forces PROC NEAR
; Line 3604
	push	ebp
	mov	ebp, esp
	sub	esp, 20					; 00000014H
	push	ebx
	push	esi
	push	edi
; Line 3609
	cmp	DWORD PTR _this_too$[ebp], 0
	je	$L1961
; Line 3611
	mov	eax, DWORD PTR _v$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _insn$[ebp], eax
; Line 3612
	mov	eax, DWORD PTR _v$[ebp]
	mov	eax, DWORD PTR [eax+40]
	mov	DWORD PTR _count$[ebp], eax
	jmp	$L1962
$L1963:
	dec	DWORD PTR _count$[ebp]
$L1962:
	cmp	DWORD PTR _count$[ebp], 0
	jl	$L1964
; Line 3617
	push	0
	push	7
	mov	eax, DWORD PTR _insn$[ebp]
	push	eax
	call	_find_reg_note
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _x$[ebp], eax
	cmp	DWORD PTR _x$[ebp], 0
	je	$L1965
; Line 3618
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _insn$[ebp], eax
; Line 3620
$L1965:
	push	0
	push	6
	mov	eax, DWORD PTR _insn$[ebp]
	push	eax
	call	_find_reg_note
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _x$[ebp], eax
	cmp	DWORD PTR _x$[ebp], 0
	je	$L1966
; Line 3624
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _first$1967[ebp], eax
; Line 3625
	mov	eax, DWORD PTR _insn$[ebp]
	mov	DWORD PTR _p$[ebp], eax
	jmp	$L1968
$L1969:
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _p$[ebp], eax
$L1968:
	mov	eax, DWORD PTR _first$1967[ebp]
	cmp	DWORD PTR _p$[ebp], eax
	je	$L1970
; Line 3626
	mov	eax, DWORD PTR _p$[ebp]
	push	eax
	call	_delete_insn
	add	esp, 4
	jmp	$L1969
$L1970:
; Line 3628
	mov	eax, DWORD PTR _p$[ebp]
	push	eax
	call	_delete_insn
	add	esp, 4
; Line 3630
	jmp	$L1971
$L1966:
; Line 3631
	mov	eax, DWORD PTR _insn$[ebp]
	push	eax
	call	_delete_insn
	add	esp, 4
$L1971:
; Line 3633
$L1972:
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	DWORD PTR _insn$[ebp], eax
; Line 3634
$L1973:
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1179648				; 00120000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1972
$L1974:
; Line 3635
	jmp	$L1963
$L1964:
; Line 3638
$L1961:
	mov	eax, DWORD PTR _v$[ebp]
	cmp	DWORD PTR [eax+60], 0
	je	$L1975
; Line 3639
	push	1
	mov	eax, DWORD PTR _v$[ebp]
	mov	eax, DWORD PTR [eax+60]
	push	eax
	call	_delete_insn_forces
	add	esp, 8
; Line 3640
$L1975:
	mov	eax, DWORD PTR _v$[ebp]
	cmp	DWORD PTR [eax+64], 0
	je	$L1976
; Line 3641
	push	1
	mov	eax, DWORD PTR _v$[ebp]
	mov	eax, DWORD PTR [eax+64]
	push	eax
	call	_delete_insn_forces
	add	esp, 8
; Line 3642
$L1976:
$L1956:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_delete_insn_forces ENDP
_x$ = 8
_dest_regno$ = 12
_inc_val$ = 16
_mult_val$ = 20
_code$ = -4
_arg$ = -8
_basic_induction_var PROC NEAR
; Line 3663
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
	push	ebx
	push	esi
	push	edi
; Line 3667
	cmp	DWORD PTR _x$[ebp], 0
	jne	$L1984
; Line 3668
	sub	eax, eax
	jmp	$L1981
; Line 3669
$L1984:
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	sar	eax, 16					; 00000010H
	mov	DWORD PTR _code$[ebp], eax
; Line 3670
	mov	eax, DWORD PTR _code$[ebp]
	mov	DWORD PTR -12+[ebp], eax
	jmp	$L1985
; Line 3672
$L1989:
; Line 3674
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1990
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _dest_regno$[ebp]
	cmp	DWORD PTR [eax+4], ecx
	jne	$L1990
; Line 3675
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _arg$[ebp], eax
; Line 3676
	jmp	$L1991
$L1990:
; Line 3677
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1992
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	ecx, DWORD PTR _dest_regno$[ebp]
	cmp	DWORD PTR [eax+4], ecx
	jne	$L1992
; Line 3678
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _arg$[ebp], eax
; Line 3679
	jmp	$L1993
$L1992:
; Line 3680
	sub	eax, eax
	jmp	$L1981
$L1993:
$L1991:
; Line 3682
	mov	eax, DWORD PTR _arg$[ebp]
	push	eax
	call	_invariant_p
	add	esp, 4
	cmp	eax, 1
	jne	$L1994
; Line 3683
	mov	eax, DWORD PTR _arg$[ebp]
	mov	ecx, DWORD PTR _inc_val$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 3684
	jmp	$L1995
$L1994:
; Line 3685
	sub	eax, eax
	jmp	$L1981
$L1995:
; Line 3687
	mov	eax, DWORD PTR _const1_rtx
	mov	ecx, DWORD PTR _mult_val$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 3688
	mov	eax, 1
	jmp	$L1981
; Line 3690
$L1996:
; Line 3693
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1997
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _dest_regno$[ebp]
	cmp	DWORD PTR [eax+4], ecx
	jne	$L1997
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1997
; Line 3695
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+4]
	neg	eax
	push	eax
	push	0
	push	30					; 0000001eH
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	mov	ecx, DWORD PTR _inc_val$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 3696
	jmp	$L1998
$L1997:
; Line 3697
	sub	eax, eax
	jmp	$L1981
$L1998:
; Line 3698
	mov	eax, DWORD PTR _const1_rtx
	mov	ecx, DWORD PTR _mult_val$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 3699
	mov	eax, 1
	jmp	$L1981
; Line 3705
$L1999:
; Line 3706
	mov	eax, DWORD PTR _x$[ebp]
	push	eax
	call	_invariant_p
	add	esp, 4
	or	eax, eax
	jne	$L2000
; Line 3707
	sub	eax, eax
	jmp	$L1981
; Line 3708
$L2000:
$L2001:
; Line 3711
	cmp	DWORD PTR _loops_enclosed$S784, 1
	jne	$L2002
; Line 3713
	mov	eax, DWORD PTR _x$[ebp]
	mov	ecx, DWORD PTR _inc_val$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 3714
	mov	eax, DWORD PTR _const0_rtx
	mov	ecx, DWORD PTR _mult_val$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 3715
	mov	eax, 1
	jmp	$L1981
; Line 3717
	jmp	$L2003
$L2002:
; Line 3718
	sub	eax, eax
	jmp	$L1981
$L2003:
; Line 3720
$L2004:
; Line 3721
	sub	eax, eax
	jmp	$L1981
; Line 3722
	jmp	$L1986
$L1985:
	sub	DWORD PTR -12+[ebp], 30			; 0000001eH
	cmp	DWORD PTR -12+[ebp], 15			; 0000000fH
	ja	$L2004
	shl	DWORD PTR -12+[ebp], 2
	mov	eax, DWORD PTR -12+[ebp]
	jmp	DWORD PTR $L2564[eax]
$L2564:
	DD	OFFSET $L2001
	DD	OFFSET $L2004
	DD	OFFSET $L2001
	DD	OFFSET $L2004
	DD	OFFSET $L1999
	DD	OFFSET $L2004
	DD	OFFSET $L2004
	DD	OFFSET $L2004
	DD	OFFSET $L2004
	DD	OFFSET $L2001
	DD	OFFSET $L2004
	DD	OFFSET $L2004
	DD	OFFSET $L2004
	DD	OFFSET $L2004
	DD	OFFSET $L1989
	DD	OFFSET $L1996
$L1986:
; Line 3723
$L1981:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_basic_induction_var ENDP
_TEXT	ENDS
EXTRN	_plus_constant:NEAR
EXTRN	_nonmemory_operand:NEAR
_TEXT	SEGMENT
_x$ = 8
_src_regno$ = 12
_add_val$ = 16
_mult_val$ = 20
_forces$ = 24
_forces2$ = 28
_code$ = -4
_arg$ = -24
_g$ = -8
_v$ = -16
_subexp$ = -20
_tem$ = -12
_m0$2025 = -32
_m1$2026 = -28
_general_induction_var PROC NEAR
; Line 3757
	push	ebp
	mov	ebp, esp
	sub	esp, 40					; 00000028H
	push	ebx
	push	esi
	push	edi
; Line 3760
	mov	DWORD PTR _g$[ebp], 0
; Line 3761
	mov	DWORD PTR _v$[ebp], 0
; Line 3762
	mov	DWORD PTR _subexp$[ebp], 0
; Line 3765
	cmp	DWORD PTR _x$[ebp], 0
	jne	$L2018
; Line 3766
	sub	eax, eax
	jmp	$L2011
; Line 3768
$L2018:
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	sar	eax, 16					; 00000010H
	mov	DWORD PTR _code$[ebp], eax
; Line 3769
	mov	eax, DWORD PTR _code$[ebp]
	mov	DWORD PTR -36+[ebp], eax
	jmp	$L2019
; Line 3771
$L2023:
; Line 3773
	sub	eax, eax
	jmp	$L2011
; Line 3775
$L2024:
; Line 3780
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	mov	DWORD PTR _m0$2025[ebp], eax
; Line 3781
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	mov	DWORD PTR _m1$2026[ebp], eax
; Line 3782
	cmp	DWORD PTR _m0$2025[ebp], 0
	je	$L2027
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	cmp	eax, DWORD PTR _m0$2025[ebp]
	je	$L2027
; Line 3783
	sub	eax, eax
	jmp	$L2011
; Line 3784
$L2027:
	cmp	DWORD PTR _m1$2026[ebp], 0
	je	$L2028
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	cmp	eax, DWORD PTR _m1$2026[ebp]
	je	$L2028
; Line 3785
	sub	eax, eax
	jmp	$L2011
; Line 3786
$L2028:
; Line 3787
$L2029:
; Line 3792
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L2030
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _induct_var$S1588
	cmp	DWORD PTR [ecx+eax*4], 1
	jne	$L2030
; Line 3794
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _src_regno$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 3795
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _arg$[ebp], eax
; Line 3798
	jmp	$L2031
$L2030:
; Line 3799
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L2032
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _induct_var$S1588
	cmp	DWORD PTR [ecx+eax*4], 1
	jne	$L2032
; Line 3801
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _src_regno$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 3802
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _arg$[ebp], eax
; Line 3810
	jmp	$L2033
$L2032:
; Line 3813
	mov	eax, DWORD PTR _forces2$[ebp]
	push	eax
	mov	eax, DWORD PTR _forces$[ebp]
	push	eax
	mov	eax, DWORD PTR _mult_val$[ebp]
	push	eax
	mov	eax, DWORD PTR _add_val$[ebp]
	push	eax
	mov	eax, DWORD PTR _src_regno$[ebp]
	push	eax
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	call	_general_induction_var
	add	esp, 24					; 00000018H
	or	eax, eax
	je	$L2565
	cmp	DWORD PTR _code$[ebp], 45		; 0000002dH
	je	$L2565
	mov	DWORD PTR _tem$[ebp], 1
	jmp	$L2566
$L2565:
	mov	DWORD PTR _tem$[ebp], 0
$L2566:
	cmp	DWORD PTR _tem$[ebp], 0
	je	$L2034
; Line 3818
	mov	DWORD PTR _subexp$[ebp], 1
; Line 3819
	push	72					; 00000048H
	call	_alloca
	add	esp, 4
	mov	DWORD PTR _g$[ebp], eax
; Line 3820
	mov	eax, DWORD PTR _mult_val$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	ecx, DWORD PTR _g$[ebp]
	mov	DWORD PTR [ecx+28], eax
; Line 3821
	mov	eax, DWORD PTR _add_val$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	ecx, DWORD PTR _g$[ebp]
	mov	DWORD PTR [ecx+32], eax
; Line 3823
	mov	eax, DWORD PTR _g$[ebp]
	mov	BYTE PTR [eax+44], 1
; Line 3826
	cmp	DWORD PTR _tem$[ebp], 4
	jne	$L2035
; Line 3827
	mov	eax, DWORD PTR _g$[ebp]
	mov	DWORD PTR [eax+36], 2
; Line 3828
	jmp	$L2036
$L2035:
; Line 3829
	mov	eax, DWORD PTR _tem$[ebp]
	mov	ecx, DWORD PTR _g$[ebp]
	mov	DWORD PTR [ecx+36], eax
$L2036:
; Line 3830
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _arg$[ebp], eax
; Line 3832
	jmp	$L2037
$L2034:
; Line 3834
	mov	eax, DWORD PTR _forces2$[ebp]
	push	eax
	mov	eax, DWORD PTR _forces$[ebp]
	push	eax
	mov	eax, DWORD PTR _mult_val$[ebp]
	push	eax
	mov	eax, DWORD PTR _add_val$[ebp]
	push	eax
	mov	eax, DWORD PTR _src_regno$[ebp]
	push	eax
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	call	_general_induction_var
	add	esp, 24					; 00000018H
	mov	DWORD PTR _tem$[ebp], eax
	cmp	DWORD PTR _tem$[ebp], 0
	je	$L2038
; Line 3839
	mov	DWORD PTR _subexp$[ebp], 1
; Line 3840
	push	72					; 00000048H
	call	_alloca
	add	esp, 4
	mov	DWORD PTR _g$[ebp], eax
; Line 3841
	mov	eax, DWORD PTR _mult_val$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	ecx, DWORD PTR _g$[ebp]
	mov	DWORD PTR [ecx+28], eax
; Line 3842
	mov	eax, DWORD PTR _add_val$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	ecx, DWORD PTR _g$[ebp]
	mov	DWORD PTR [ecx+32], eax
; Line 3844
	mov	eax, DWORD PTR _g$[ebp]
	mov	BYTE PTR [eax+44], 1
; Line 3847
	cmp	DWORD PTR _tem$[ebp], 4
	jne	$L2039
; Line 3848
	mov	eax, DWORD PTR _g$[ebp]
	mov	DWORD PTR [eax+36], 2
; Line 3849
	jmp	$L2040
$L2039:
; Line 3850
	mov	eax, DWORD PTR _tem$[ebp]
	mov	ecx, DWORD PTR _g$[ebp]
	mov	DWORD PTR [ecx+36], eax
$L2040:
; Line 3851
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _arg$[ebp], eax
; Line 3859
	jmp	$L2041
$L2038:
; Line 3860
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L2042
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _induct_var$S1588
	cmp	DWORD PTR [ecx+eax*4], 3
	jne	$L2042
; Line 3862
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _induct_struct$S1589
	mov	eax, DWORD PTR [ecx+eax*4]
	mov	DWORD PTR _g$[ebp], eax
; Line 3863
	mov	eax, DWORD PTR _g$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	ecx, DWORD PTR _src_regno$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 3864
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _arg$[ebp], eax
; Line 3866
	jmp	$L2043
$L2042:
; Line 3868
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L2044
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _induct_var$S1588
	cmp	DWORD PTR [ecx+eax*4], 3
	jne	$L2044
	cmp	DWORD PTR _code$[ebp], 45		; 0000002dH
	je	$L2044
; Line 3870
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _induct_struct$S1589
	mov	eax, DWORD PTR [ecx+eax*4]
	mov	DWORD PTR _g$[ebp], eax
; Line 3871
	mov	eax, DWORD PTR _g$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	ecx, DWORD PTR _src_regno$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 3872
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _arg$[ebp], eax
; Line 3874
	jmp	$L2045
$L2044:
; Line 3875
	sub	eax, eax
	jmp	$L2011
$L2045:
$L2043:
$L2041:
$L2037:
$L2033:
$L2031:
; Line 3878
	jmp	$L2020
; Line 3881
$L2046:
; Line 3891
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L2047
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _induct_var$S1588
	cmp	DWORD PTR [ecx+eax*4], 1
	jne	$L2047
; Line 3893
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _src_regno$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 3894
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _arg$[ebp], eax
; Line 3897
	jmp	$L2048
$L2047:
; Line 3898
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L2049
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _induct_var$S1588
	cmp	DWORD PTR [ecx+eax*4], 3
	jne	$L2049
; Line 3900
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _induct_struct$S1589
	mov	eax, DWORD PTR [ecx+eax*4]
	mov	DWORD PTR _g$[ebp], eax
; Line 3901
	mov	eax, DWORD PTR _g$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	ecx, DWORD PTR _src_regno$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 3902
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _arg$[ebp], eax
; Line 3904
	jmp	$L2050
$L2049:
; Line 3905
	sub	eax, eax
	jmp	$L2011
$L2050:
$L2048:
; Line 3908
	jmp	$L2020
; Line 3910
$L2051:
; Line 3911
	sub	eax, eax
	jmp	$L2011
; Line 3912
	jmp	$L2020
$L2019:
	sub	DWORD PTR -36+[ebp], 44			; 0000002cH
	cmp	DWORD PTR -36+[ebp], 17			; 00000011H
	ja	$L2051
	shl	DWORD PTR -36+[ebp], 2
	mov	eax, DWORD PTR -36+[ebp]
	jmp	DWORD PTR $L2567[eax]
$L2567:
	DD	OFFSET $L2029
	DD	OFFSET $L2029
	DD	OFFSET $L2023
	DD	OFFSET $L2024
	DD	OFFSET $L2046
	DD	OFFSET $L2051
	DD	OFFSET $L2024
	DD	OFFSET $L2046
	DD	OFFSET $L2051
	DD	OFFSET $L2051
	DD	OFFSET $L2051
	DD	OFFSET $L2051
	DD	OFFSET $L2051
	DD	OFFSET $L2046
	DD	OFFSET $L2046
	DD	OFFSET $L2051
	DD	OFFSET $L2046
	DD	OFFSET $L2046
$L2020:
; Line 3919
	mov	eax, DWORD PTR _arg$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L2052
; Line 3925
	jmp	$L2053
$L2052:
; Line 3927
	mov	eax, DWORD PTR _arg$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L2054
	mov	eax, DWORD PTR _arg$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _induct_var$S1588
	cmp	DWORD PTR [ecx+eax*4], 3
	jne	$L2054
	mov	eax, DWORD PTR _arg$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _induct_struct$S1589
	mov	eax, DWORD PTR [ecx+eax*4]
	mov	ecx, DWORD PTR _src_regno$[ebp]
	mov	ecx, DWORD PTR [ecx]
	cmp	DWORD PTR [eax+8], ecx
	jne	$L2054
; Line 3929
	mov	eax, DWORD PTR _arg$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _induct_struct$S1589
	mov	eax, DWORD PTR [ecx+eax*4]
	mov	DWORD PTR _v$[ebp], eax
; Line 3934
	jmp	$L2055
$L2054:
	mov	eax, DWORD PTR _arg$[ebp]
	push	eax
	call	_invariant_p
	add	esp, 4
	cmp	eax, 1
	jne	$L2056
; Line 3938
	jmp	$L2057
$L2056:
; Line 3939
	sub	eax, eax
	jmp	$L2011
$L2057:
$L2055:
$L2053:
; Line 3944
	cmp	DWORD PTR _g$[ebp], 0
	je	$L2060
	mov	eax, DWORD PTR _g$[ebp]
	movsx	eax, BYTE PTR [eax+44]
	or	eax, eax
	je	$L2059
$L2060:
	cmp	DWORD PTR _v$[ebp], 0
	je	$L2058
	mov	eax, DWORD PTR _v$[ebp]
	movsx	eax, BYTE PTR [eax+44]
	or	eax, eax
	jne	$L2058
$L2059:
; Line 3945
	sub	eax, eax
	jmp	$L2011
; Line 3954
$L2058:
	mov	eax, DWORD PTR _code$[ebp]
	mov	DWORD PTR -40+[ebp], eax
	jmp	$L2061
; Line 3956
$L2065:
; Line 3957
	cmp	DWORD PTR _v$[ebp], 0
	je	$L2066
	cmp	DWORD PTR _g$[ebp], 0
	je	$L2066
; Line 3959
	mov	eax, DWORD PTR _g$[ebp]
	mov	eax, DWORD PTR [eax+28]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L2067
; Line 3961
	mov	eax, DWORD PTR _g$[ebp]
	mov	ecx, DWORD PTR _const0_rtx
	cmp	DWORD PTR [eax+28], ecx
	jne	$L2068
; Line 3962
	mov	eax, DWORD PTR _v$[ebp]
	mov	eax, DWORD PTR [eax+28]
	mov	ecx, DWORD PTR _mult_val$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 3963
	jmp	$L2069
$L2068:
	mov	eax, DWORD PTR _v$[ebp]
	mov	eax, DWORD PTR [eax+28]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L2070
; Line 3966
	mov	eax, DWORD PTR _v$[ebp]
	mov	eax, DWORD PTR [eax+28]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _g$[ebp]
	mov	ecx, DWORD PTR [ecx+28]
	add	eax, DWORD PTR [ecx+4]
	push	eax
	push	0
	push	30					; 0000001eH
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	mov	ecx, DWORD PTR _mult_val$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 3967
	jmp	$L2071
$L2070:
; Line 3968
	sub	eax, eax
	jmp	$L2011
$L2071:
$L2069:
; Line 3970
	jmp	$L2072
$L2067:
	mov	eax, DWORD PTR _v$[ebp]
	mov	ecx, DWORD PTR _const0_rtx
	cmp	DWORD PTR [eax+28], ecx
	jne	$L2073
; Line 3971
	mov	eax, DWORD PTR _g$[ebp]
	mov	eax, DWORD PTR [eax+28]
	mov	ecx, DWORD PTR _mult_val$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 3972
	jmp	$L2074
$L2073:
; Line 3973
	sub	eax, eax
	jmp	$L2011
$L2074:
$L2072:
; Line 3975
	mov	eax, DWORD PTR _g$[ebp]
	mov	eax, DWORD PTR [eax+32]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L2075
; Line 3977
	mov	eax, DWORD PTR _g$[ebp]
	mov	ecx, DWORD PTR _const0_rtx
	cmp	DWORD PTR [eax+32], ecx
	jne	$L2076
; Line 3978
	mov	eax, DWORD PTR _v$[ebp]
	mov	eax, DWORD PTR [eax+32]
	mov	ecx, DWORD PTR _add_val$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 3979
	jmp	$L2077
$L2076:
	mov	eax, DWORD PTR _v$[ebp]
	mov	eax, DWORD PTR [eax+32]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L2078
; Line 3982
	mov	eax, DWORD PTR _g$[ebp]
	mov	eax, DWORD PTR [eax+32]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _v$[ebp]
	mov	ecx, DWORD PTR [ecx+32]
	add	eax, DWORD PTR [ecx+4]
	push	eax
	push	0
	push	30					; 0000001eH
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	mov	ecx, DWORD PTR _add_val$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 3983
	jmp	$L2079
$L2078:
; Line 3984
	sub	eax, eax
	jmp	$L2011
$L2079:
$L2077:
; Line 3986
	jmp	$L2080
$L2075:
	mov	eax, DWORD PTR _v$[ebp]
	mov	ecx, DWORD PTR _const0_rtx
	cmp	DWORD PTR [eax+32], ecx
	jne	$L2081
; Line 3987
	mov	eax, DWORD PTR _g$[ebp]
	mov	eax, DWORD PTR [eax+32]
	mov	ecx, DWORD PTR _add_val$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 3988
	jmp	$L2082
$L2081:
; Line 3989
	sub	eax, eax
	jmp	$L2011
$L2082:
$L2080:
; Line 3991
	cmp	DWORD PTR _subexp$[ebp], 0
	je	$L2083
; Line 3994
	mov	eax, DWORD PTR _forces2$[ebp]
	cmp	DWORD PTR [eax], 0
	jne	$L2084
; Line 3995
	mov	eax, DWORD PTR _v$[ebp]
	mov	ecx, DWORD PTR _forces2$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 3996
$L2084:
	mov	eax, DWORD PTR _g$[ebp]
	mov	eax, DWORD PTR [eax+36]
	inc	eax
	jmp	$L2011
; Line 3998
	jmp	$L2085
$L2083:
; Line 4000
	mov	eax, DWORD PTR _g$[ebp]
	mov	ecx, DWORD PTR _forces$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 4001
	mov	eax, DWORD PTR _v$[ebp]
	mov	ecx, DWORD PTR _forces2$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 4002
	mov	eax, 1
	jmp	$L2011
; Line 4003
$L2085:
; Line 4005
	jmp	$L2086
$L2066:
	cmp	DWORD PTR _v$[ebp], 0
	je	$L2087
; Line 4007
	mov	eax, DWORD PTR _v$[ebp]
	mov	eax, DWORD PTR [eax+28]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L2088
; Line 4009
	mov	eax, DWORD PTR _v$[ebp]
	mov	eax, DWORD PTR [eax+28]
	mov	eax, DWORD PTR [eax+4]
	inc	eax
	push	eax
	push	0
	push	30					; 0000001eH
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	mov	ecx, DWORD PTR _mult_val$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 4010
	jmp	$L2089
$L2088:
; Line 4011
	sub	eax, eax
	jmp	$L2011
$L2089:
; Line 4012
	mov	eax, DWORD PTR _v$[ebp]
	mov	eax, DWORD PTR [eax+32]
	mov	ecx, DWORD PTR _add_val$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 4013
	mov	eax, DWORD PTR _v$[ebp]
	mov	ecx, DWORD PTR _forces$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 4014
	mov	eax, 1
	jmp	$L2011
; Line 4016
	jmp	$L2090
$L2087:
	cmp	DWORD PTR _g$[ebp], 0
	je	$L2091
; Line 4018
	mov	eax, DWORD PTR _g$[ebp]
	mov	eax, DWORD PTR [eax+28]
	mov	ecx, DWORD PTR _mult_val$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 4020
	mov	eax, DWORD PTR _g$[ebp]
	mov	eax, DWORD PTR [eax+32]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L2093
	mov	eax, DWORD PTR _arg$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	push	eax
	mov	eax, DWORD PTR _arg$[ebp]
	push	eax
	call	_nonmemory_operand
	add	esp, 8
	or	eax, eax
	je	$L2093
; Line 4021
	mov	eax, DWORD PTR _g$[ebp]
	mov	eax, DWORD PTR [eax+32]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	mov	eax, DWORD PTR _arg$[ebp]
	push	eax
	call	_plus_constant
	add	esp, 8
	mov	ecx, DWORD PTR _add_val$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 4022
	jmp	$L2094
$L2093:
; Line 4023
	mov	eax, DWORD PTR _arg$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L2095
	mov	eax, DWORD PTR _g$[ebp]
	mov	eax, DWORD PTR [eax+32]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	push	eax
	mov	eax, DWORD PTR _g$[ebp]
	mov	eax, DWORD PTR [eax+32]
	push	eax
	call	_nonmemory_operand
	add	esp, 8
	or	eax, eax
	je	$L2095
; Line 4024
	mov	eax, DWORD PTR _arg$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	mov	eax, DWORD PTR _g$[ebp]
	mov	eax, DWORD PTR [eax+32]
	push	eax
	call	_plus_constant
	add	esp, 8
	mov	ecx, DWORD PTR _add_val$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 4025
	jmp	$L2096
$L2095:
; Line 4027
	sub	eax, eax
	jmp	$L2011
$L2096:
$L2094:
; Line 4029
	cmp	DWORD PTR _subexp$[ebp], 0
	je	$L2097
; Line 4031
	mov	eax, DWORD PTR _g$[ebp]
	mov	eax, DWORD PTR [eax+36]
	inc	eax
	jmp	$L2011
; Line 4032
	jmp	$L2098
$L2097:
; Line 4034
	mov	eax, DWORD PTR _g$[ebp]
	mov	ecx, DWORD PTR _forces$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 4035
	mov	eax, 1
	jmp	$L2011
; Line 4036
$L2098:
; Line 4038
	jmp	$L2099
$L2091:
; Line 4040
	mov	eax, DWORD PTR _const1_rtx
	mov	ecx, DWORD PTR _mult_val$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 4041
	mov	eax, DWORD PTR _arg$[ebp]
	mov	ecx, DWORD PTR _add_val$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 4042
	mov	eax, 1
	jmp	$L2011
; Line 4043
$L2099:
$L2090:
$L2086:
; Line 4046
$L2100:
; Line 4047
	cmp	DWORD PTR _v$[ebp], 0
	je	$L2101
	cmp	DWORD PTR _g$[ebp], 0
	je	$L2101
; Line 4051
	mov	eax, DWORD PTR _g$[ebp]
	mov	eax, DWORD PTR [eax+28]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L2102
; Line 4053
	mov	eax, DWORD PTR _g$[ebp]
	mov	ecx, DWORD PTR _const0_rtx
	cmp	DWORD PTR [eax+28], ecx
	jne	$L2103
; Line 4057
	sub	eax, eax
	jmp	$L2011
; Line 4058
	jmp	$L2104
$L2103:
	mov	eax, DWORD PTR _v$[ebp]
	mov	eax, DWORD PTR [eax+28]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L2105
; Line 4061
	mov	eax, DWORD PTR _g$[ebp]
	mov	eax, DWORD PTR [eax+28]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _v$[ebp]
	mov	ecx, DWORD PTR [ecx+28]
	sub	eax, DWORD PTR [ecx+4]
	push	eax
	push	0
	push	30					; 0000001eH
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	mov	ecx, DWORD PTR _mult_val$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 4062
	jmp	$L2106
$L2105:
; Line 4063
	sub	eax, eax
	jmp	$L2011
$L2106:
$L2104:
; Line 4065
	jmp	$L2107
$L2102:
	mov	eax, DWORD PTR _v$[ebp]
	mov	ecx, DWORD PTR _const0_rtx
	cmp	DWORD PTR [eax+28], ecx
	jne	$L2108
; Line 4066
	mov	eax, DWORD PTR _g$[ebp]
	mov	eax, DWORD PTR [eax+28]
	mov	ecx, DWORD PTR _mult_val$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 4067
	jmp	$L2109
$L2108:
; Line 4068
	sub	eax, eax
	jmp	$L2011
$L2109:
$L2107:
; Line 4070
	mov	eax, DWORD PTR _g$[ebp]
	mov	eax, DWORD PTR [eax+32]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L2110
; Line 4072
	mov	eax, DWORD PTR _g$[ebp]
	mov	ecx, DWORD PTR _const0_rtx
	cmp	DWORD PTR [eax+32], ecx
	jne	$L2111
; Line 4076
	sub	eax, eax
	jmp	$L2011
; Line 4077
	jmp	$L2112
$L2111:
	mov	eax, DWORD PTR _v$[ebp]
	mov	eax, DWORD PTR [eax+32]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L2113
; Line 4080
	mov	eax, DWORD PTR _g$[ebp]
	mov	eax, DWORD PTR [eax+32]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _v$[ebp]
	mov	ecx, DWORD PTR [ecx+32]
	sub	eax, DWORD PTR [ecx+4]
	push	eax
	push	0
	push	30					; 0000001eH
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	mov	ecx, DWORD PTR _add_val$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 4081
	jmp	$L2114
$L2113:
; Line 4082
	sub	eax, eax
	jmp	$L2011
$L2114:
$L2112:
; Line 4084
	jmp	$L2115
$L2110:
	mov	eax, DWORD PTR _v$[ebp]
	mov	ecx, DWORD PTR _const0_rtx
	cmp	DWORD PTR [eax+32], ecx
	jne	$L2116
; Line 4085
	mov	eax, DWORD PTR _g$[ebp]
	mov	eax, DWORD PTR [eax+32]
	mov	ecx, DWORD PTR _add_val$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 4086
	jmp	$L2117
$L2116:
; Line 4087
	sub	eax, eax
	jmp	$L2011
$L2117:
$L2115:
; Line 4089
	cmp	DWORD PTR _subexp$[ebp], 0
	je	$L2118
; Line 4092
	mov	eax, DWORD PTR _forces2$[ebp]
	cmp	DWORD PTR [eax], 0
	jne	$L2119
; Line 4093
	mov	eax, DWORD PTR _v$[ebp]
	mov	ecx, DWORD PTR _forces2$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 4094
$L2119:
	mov	eax, DWORD PTR _g$[ebp]
	mov	eax, DWORD PTR [eax+36]
	inc	eax
	jmp	$L2011
; Line 4096
	jmp	$L2120
$L2118:
; Line 4098
	mov	eax, DWORD PTR _g$[ebp]
	mov	ecx, DWORD PTR _forces$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 4099
	mov	eax, DWORD PTR _v$[ebp]
	mov	ecx, DWORD PTR _forces2$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 4100
	mov	eax, 1
	jmp	$L2011
; Line 4101
$L2120:
; Line 4103
	jmp	$L2121
$L2101:
	cmp	DWORD PTR _v$[ebp], 0
	je	$L2122
; Line 4105
	mov	eax, DWORD PTR _v$[ebp]
	mov	eax, DWORD PTR [eax+28]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L2123
; Line 4106
	sub	eax, eax
	jmp	$L2011
; Line 4107
$L2123:
	mov	eax, DWORD PTR _x$[ebp]
	mov	ecx, DWORD PTR _arg$[ebp]
	cmp	DWORD PTR [eax+4], ecx
	jne	$L2124
; Line 4110
	mov	eax, DWORD PTR _v$[ebp]
	mov	eax, DWORD PTR [eax+28]
	mov	eax, DWORD PTR [eax+4]
	dec	eax
	push	eax
	push	0
	push	30					; 0000001eH
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	mov	ecx, DWORD PTR _mult_val$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 4111
	mov	eax, DWORD PTR _v$[ebp]
	mov	eax, DWORD PTR [eax+32]
	mov	ecx, DWORD PTR _add_val$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 4113
	jmp	$L2125
$L2124:
; Line 4116
	mov	eax, 1
	mov	ecx, DWORD PTR _v$[ebp]
	mov	ecx, DWORD PTR [ecx+28]
	sub	eax, DWORD PTR [ecx+4]
	push	eax
	push	0
	push	30					; 0000001eH
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	mov	ecx, DWORD PTR _mult_val$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 4117
	mov	eax, DWORD PTR _v$[ebp]
	mov	eax, DWORD PTR [eax+32]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L2126
; Line 4119
	mov	eax, DWORD PTR _v$[ebp]
	mov	eax, DWORD PTR [eax+32]
	mov	eax, DWORD PTR [eax+4]
	neg	eax
	push	eax
	push	0
	push	30					; 0000001eH
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	mov	ecx, DWORD PTR _add_val$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 4120
	jmp	$L2127
$L2126:
; Line 4121
	sub	eax, eax
	jmp	$L2011
$L2127:
; Line 4122
$L2125:
; Line 4123
	mov	eax, DWORD PTR _v$[ebp]
	mov	ecx, DWORD PTR _forces$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 4124
	mov	eax, 1
	jmp	$L2011
; Line 4126
	jmp	$L2128
$L2122:
	cmp	DWORD PTR _g$[ebp], 0
	je	$L2129
; Line 4128
	mov	eax, DWORD PTR _x$[ebp]
	mov	ecx, DWORD PTR _arg$[ebp]
	cmp	DWORD PTR [eax+8], ecx
	jne	$L2130
; Line 4129
	mov	eax, DWORD PTR _g$[ebp]
	mov	eax, DWORD PTR [eax+28]
	mov	ecx, DWORD PTR _mult_val$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 4130
	jmp	$L2131
$L2130:
; Line 4132
	mov	eax, DWORD PTR _g$[ebp]
	mov	eax, DWORD PTR [eax+28]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L2132
; Line 4134
	mov	eax, DWORD PTR _g$[ebp]
	mov	eax, DWORD PTR [eax+28]
	mov	eax, DWORD PTR [eax+4]
	neg	eax
	push	eax
	push	0
	push	30					; 0000001eH
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	mov	ecx, DWORD PTR _mult_val$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 4135
	jmp	$L2133
$L2132:
; Line 4136
	sub	eax, eax
	jmp	$L2011
$L2133:
; Line 4137
$L2131:
; Line 4138
	mov	eax, DWORD PTR _g$[ebp]
	mov	eax, DWORD PTR [eax+32]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L2134
; Line 4140
	mov	eax, DWORD PTR _g$[ebp]
	mov	ecx, DWORD PTR _const0_rtx
	cmp	DWORD PTR [eax+32], ecx
	jne	$L2135
; Line 4142
	mov	eax, DWORD PTR _x$[ebp]
	mov	ecx, DWORD PTR _arg$[ebp]
	cmp	DWORD PTR [eax+8], ecx
	jne	$L2136
; Line 4145
	mov	eax, DWORD PTR _arg$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L2137
; Line 4147
	mov	eax, DWORD PTR _arg$[ebp]
	mov	eax, DWORD PTR [eax+4]
	neg	eax
	push	eax
	push	0
	push	30					; 0000001eH
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	mov	ecx, DWORD PTR _add_val$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 4148
	jmp	$L2138
$L2137:
; Line 4149
	sub	eax, eax
	jmp	$L2011
$L2138:
; Line 4151
	jmp	$L2139
$L2136:
; Line 4152
	mov	eax, DWORD PTR _arg$[ebp]
	mov	ecx, DWORD PTR _add_val$[ebp]
	mov	DWORD PTR [ecx], eax
$L2139:
; Line 4154
	jmp	$L2140
$L2135:
	mov	eax, DWORD PTR _arg$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L2141
; Line 4156
	mov	eax, DWORD PTR _x$[ebp]
	mov	ecx, DWORD PTR _arg$[ebp]
	cmp	DWORD PTR [eax+8], ecx
	jne	$L2142
; Line 4159
	mov	eax, DWORD PTR _g$[ebp]
	mov	eax, DWORD PTR [eax+32]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _arg$[ebp]
	sub	eax, DWORD PTR [ecx+4]
	push	eax
	push	0
	push	30					; 0000001eH
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	mov	ecx, DWORD PTR _add_val$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 4160
	jmp	$L2143
$L2142:
; Line 4163
	mov	eax, DWORD PTR _g$[ebp]
	mov	eax, DWORD PTR [eax+32]
	mov	eax, DWORD PTR [eax+4]
	neg	eax
	push	eax
	mov	eax, DWORD PTR _arg$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	push	0
	push	30					; 0000001eH
	call	_gen_rtx
	add	esp, 16					; 00000010H
	mov	ecx, DWORD PTR _add_val$[ebp]
	mov	DWORD PTR [ecx], eax
$L2143:
; Line 4165
	jmp	$L2144
$L2141:
; Line 4166
	sub	eax, eax
	jmp	$L2011
$L2144:
$L2140:
; Line 4168
	jmp	$L2145
$L2134:
; Line 4170
	sub	eax, eax
	jmp	$L2011
$L2145:
; Line 4172
	cmp	DWORD PTR _subexp$[ebp], 0
	je	$L2146
; Line 4174
	mov	eax, DWORD PTR _g$[ebp]
	mov	eax, DWORD PTR [eax+36]
	inc	eax
	jmp	$L2011
; Line 4175
	jmp	$L2147
$L2146:
; Line 4177
	mov	eax, DWORD PTR _g$[ebp]
	mov	ecx, DWORD PTR _forces$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 4178
	mov	eax, 1
	jmp	$L2011
; Line 4179
$L2147:
; Line 4181
	jmp	$L2148
$L2129:
	mov	eax, DWORD PTR _arg$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L2149
; Line 4183
	mov	eax, DWORD PTR _x$[ebp]
	mov	ecx, DWORD PTR _arg$[ebp]
	cmp	DWORD PTR [eax+8], ecx
	jne	$L2150
; Line 4185
	mov	eax, DWORD PTR _arg$[ebp]
	mov	eax, DWORD PTR [eax+4]
	neg	eax
	push	eax
	push	0
	push	30					; 0000001eH
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	mov	ecx, DWORD PTR _add_val$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 4186
	mov	eax, DWORD PTR _const1_rtx
	mov	ecx, DWORD PTR _mult_val$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 4188
	jmp	$L2151
$L2150:
; Line 4190
	mov	eax, DWORD PTR _arg$[ebp]
	mov	ecx, DWORD PTR _add_val$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 4191
	push	-1
	push	0
	push	30					; 0000001eH
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	mov	ecx, DWORD PTR _mult_val$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 4192
$L2151:
; Line 4193
	mov	eax, 1
	jmp	$L2011
; Line 4195
	jmp	$L2152
$L2149:
; Line 4196
	sub	eax, eax
	jmp	$L2011
$L2152:
$L2148:
$L2128:
$L2121:
; Line 4199
$L2153:
; Line 4201
	cmp	DWORD PTR _v$[ebp], 0
	je	$L2154
	cmp	DWORD PTR _g$[ebp], 0
	je	$L2154
; Line 4204
	sub	eax, eax
	jmp	$L2011
; Line 4206
	jmp	$L2155
$L2154:
	cmp	DWORD PTR _v$[ebp], 0
	je	$L2156
; Line 4209
	sub	eax, eax
	jmp	$L2011
; Line 4211
	jmp	$L2157
$L2156:
	cmp	DWORD PTR _g$[ebp], 0
	je	$L2158
; Line 4215
	mov	eax, DWORD PTR _g$[ebp]
	mov	eax, DWORD PTR [eax+28]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L2159
; Line 4217
	mov	eax, DWORD PTR _g$[ebp]
	mov	ecx, DWORD PTR _const0_rtx
	cmp	DWORD PTR [eax+28], ecx
	jne	$L2160
; Line 4218
	mov	eax, DWORD PTR _const0_rtx
	mov	ecx, DWORD PTR _mult_val$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 4219
	jmp	$L2161
$L2160:
	mov	eax, DWORD PTR _g$[ebp]
	mov	ecx, DWORD PTR _const1_rtx
	cmp	DWORD PTR [eax+28], ecx
	jne	$L2162
; Line 4220
	mov	eax, DWORD PTR _arg$[ebp]
	mov	ecx, DWORD PTR _mult_val$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 4221
	jmp	$L2163
$L2162:
	mov	eax, DWORD PTR _arg$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L2164
; Line 4223
	mov	eax, DWORD PTR _g$[ebp]
	mov	eax, DWORD PTR [eax+28]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _arg$[ebp]
	imul	eax, DWORD PTR [ecx+4]
	push	eax
	push	0
	push	30					; 0000001eH
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	mov	ecx, DWORD PTR _mult_val$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 4224
	jmp	$L2165
$L2164:
; Line 4225
	sub	eax, eax
	jmp	$L2011
$L2165:
$L2163:
$L2161:
; Line 4227
	jmp	$L2166
$L2159:
; Line 4229
	sub	eax, eax
	jmp	$L2011
$L2166:
; Line 4231
	mov	eax, DWORD PTR _g$[ebp]
	mov	eax, DWORD PTR [eax+32]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L2167
; Line 4233
	mov	eax, DWORD PTR _g$[ebp]
	mov	ecx, DWORD PTR _const0_rtx
	cmp	DWORD PTR [eax+32], ecx
	jne	$L2168
; Line 4234
	mov	eax, DWORD PTR _const0_rtx
	mov	ecx, DWORD PTR _add_val$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 4235
	jmp	$L2169
$L2168:
	mov	eax, DWORD PTR _g$[ebp]
	mov	ecx, DWORD PTR _const1_rtx
	cmp	DWORD PTR [eax+32], ecx
	jne	$L2170
; Line 4236
	mov	eax, DWORD PTR _arg$[ebp]
	mov	ecx, DWORD PTR _add_val$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 4237
	jmp	$L2171
$L2170:
	mov	eax, DWORD PTR _arg$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L2172
; Line 4239
	mov	eax, DWORD PTR _g$[ebp]
	mov	eax, DWORD PTR [eax+32]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _arg$[ebp]
	imul	eax, DWORD PTR [ecx+4]
	push	eax
	push	0
	push	30					; 0000001eH
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	mov	ecx, DWORD PTR _add_val$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 4240
	jmp	$L2173
$L2172:
; Line 4241
	sub	eax, eax
	jmp	$L2011
$L2173:
$L2171:
$L2169:
; Line 4243
	jmp	$L2174
$L2167:
; Line 4245
	sub	eax, eax
	jmp	$L2011
$L2174:
; Line 4247
	cmp	DWORD PTR _subexp$[ebp], 0
	je	$L2175
; Line 4249
	mov	eax, DWORD PTR _g$[ebp]
	mov	eax, DWORD PTR [eax+36]
	add	eax, 4
	jmp	$L2011
; Line 4250
	jmp	$L2176
$L2175:
; Line 4252
	mov	eax, DWORD PTR _g$[ebp]
	mov	ecx, DWORD PTR _forces$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 4253
	mov	eax, 4
	jmp	$L2011
; Line 4254
$L2176:
; Line 4256
	jmp	$L2177
$L2158:
; Line 4258
	mov	eax, DWORD PTR _arg$[ebp]
	mov	ecx, DWORD PTR _mult_val$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 4259
	mov	eax, DWORD PTR _const0_rtx
	mov	ecx, DWORD PTR _add_val$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 4260
	mov	eax, 4
	jmp	$L2011
; Line 4261
$L2177:
$L2157:
$L2155:
; Line 4264
$L2178:
; Line 4266
	sub	eax, eax
	jmp	$L2011
; Line 4269
$L2179:
; Line 4271
	cmp	DWORD PTR _v$[ebp], 0
	je	$L2180
	cmp	DWORD PTR _g$[ebp], 0
	je	$L2180
; Line 4274
	sub	eax, eax
	jmp	$L2011
; Line 4276
	jmp	$L2181
$L2180:
	cmp	DWORD PTR _v$[ebp], 0
	je	$L2182
; Line 4279
	sub	eax, eax
	jmp	$L2011
; Line 4281
	jmp	$L2183
$L2182:
	cmp	DWORD PTR _g$[ebp], 0
	je	$L2184
; Line 4285
	mov	eax, DWORD PTR _g$[ebp]
	mov	eax, DWORD PTR [eax+28]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L2185
; Line 4287
	mov	eax, DWORD PTR _g$[ebp]
	mov	ecx, DWORD PTR _const0_rtx
	cmp	DWORD PTR [eax+28], ecx
	jne	$L2186
; Line 4288
	mov	eax, DWORD PTR _const0_rtx
	mov	ecx, DWORD PTR _mult_val$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 4289
	jmp	$L2187
$L2186:
	mov	eax, DWORD PTR _arg$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L2188
	mov	eax, DWORD PTR _arg$[ebp]
	cmp	DWORD PTR [eax+4], 0
	jl	$L2188
; Line 4292
	mov	eax, DWORD PTR _g$[ebp]
	mov	eax, DWORD PTR [eax+28]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, eax
	add	eax, eax
	sub	eax, ecx
	mov	ecx, DWORD PTR _arg$[ebp]
	mov	cl, BYTE PTR [ecx+4]
	shl	eax, cl
	push	eax
	push	0
	push	30					; 0000001eH
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	mov	ecx, DWORD PTR _mult_val$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 4293
	jmp	$L2189
$L2188:
; Line 4294
	sub	eax, eax
	jmp	$L2011
$L2189:
$L2187:
; Line 4296
	jmp	$L2190
$L2185:
; Line 4298
	sub	eax, eax
	jmp	$L2011
$L2190:
; Line 4300
	mov	eax, DWORD PTR _g$[ebp]
	mov	eax, DWORD PTR [eax+32]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L2191
; Line 4302
	mov	eax, DWORD PTR _g$[ebp]
	mov	ecx, DWORD PTR _const0_rtx
	cmp	DWORD PTR [eax+32], ecx
	jne	$L2192
; Line 4303
	mov	eax, DWORD PTR _const0_rtx
	mov	ecx, DWORD PTR _add_val$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 4304
	jmp	$L2193
$L2192:
	mov	eax, DWORD PTR _arg$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L2194
; Line 4307
	mov	eax, DWORD PTR _g$[ebp]
	mov	eax, DWORD PTR [eax+32]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, eax
	add	eax, eax
	sub	eax, ecx
	mov	ecx, DWORD PTR _arg$[ebp]
	mov	cl, BYTE PTR [ecx+4]
	shl	eax, cl
	push	eax
	push	0
	push	30					; 0000001eH
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	mov	ecx, DWORD PTR _add_val$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 4308
	jmp	$L2195
$L2194:
; Line 4309
	sub	eax, eax
	jmp	$L2011
$L2195:
$L2193:
; Line 4311
	jmp	$L2196
$L2191:
; Line 4313
	sub	eax, eax
	jmp	$L2011
$L2196:
; Line 4315
	cmp	DWORD PTR _subexp$[ebp], 0
	je	$L2197
; Line 4317
	mov	eax, DWORD PTR _g$[ebp]
	mov	eax, DWORD PTR [eax+36]
	add	eax, 2
	jmp	$L2011
; Line 4318
	jmp	$L2198
$L2197:
; Line 4320
	mov	eax, DWORD PTR _g$[ebp]
	mov	ecx, DWORD PTR _forces$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 4321
	mov	eax, 2
	jmp	$L2011
; Line 4322
$L2198:
; Line 4325
$L2184:
$L2183:
$L2181:
	mov	eax, DWORD PTR _arg$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L2199
	mov	eax, DWORD PTR _arg$[ebp]
	cmp	DWORD PTR [eax+4], 0
	jl	$L2199
; Line 4326
	mov	eax, 1
	mov	ecx, DWORD PTR _arg$[ebp]
	mov	cl, BYTE PTR [ecx+4]
	shl	eax, cl
	push	eax
	push	0
	push	30					; 0000001eH
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	mov	ecx, DWORD PTR _mult_val$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 4327
	jmp	$L2200
$L2199:
; Line 4328
	sub	eax, eax
	jmp	$L2011
$L2200:
; Line 4329
	mov	eax, DWORD PTR _const0_rtx
	mov	ecx, DWORD PTR _add_val$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 4330
	mov	eax, 2
	jmp	$L2011
; Line 4333
$L2201:
; Line 4335
	sub	eax, eax
	jmp	$L2011
; Line 4338
$L2202:
; Line 4339
	call	_abort
; Line 4340
	sub	eax, eax
	jmp	$L2011
; Line 4341
	jmp	$L2062
$L2061:
	sub	DWORD PTR -40+[ebp], 44			; 0000002cH
	cmp	DWORD PTR -40+[ebp], 17			; 00000011H
	ja	$L2202
	shl	DWORD PTR -40+[ebp], 2
	mov	eax, DWORD PTR -40+[ebp]
	jmp	DWORD PTR $L2568[eax]
$L2568:
	DD	OFFSET $L2065
	DD	OFFSET $L2100
	DD	OFFSET $L2202
	DD	OFFSET $L2153
	DD	OFFSET $L2178
	DD	OFFSET $L2202
	DD	OFFSET $L2153
	DD	OFFSET $L2178
	DD	OFFSET $L2202
	DD	OFFSET $L2202
	DD	OFFSET $L2202
	DD	OFFSET $L2202
	DD	OFFSET $L2202
	DD	OFFSET $L2179
	DD	OFFSET $L2179
	DD	OFFSET $L2202
	DD	OFFSET $L2201
	DD	OFFSET $L2201
$L2062:
; Line 4342
$L2011:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_general_induction_var ENDP
_first_benefit$ = 8
_p$ = 12
_src_regno$ = 16
_dest_regno$ = 20
_add_val$ = 24
_mult_val$ = 28
_count$ = -4
_benefit$ = -8
_code$ = -16
_forces$ = -32
_forces2$ = -20
_temp$ = -12
_tem$ = -28
_v$ = -24
_consec_sets_giv PROC NEAR
; Line 4372
	push	ebp
	mov	ebp, esp
	sub	esp, 32					; 00000020H
	push	ebx
	push	esi
	push	edi
; Line 4374
	mov	eax, DWORD PTR _first_benefit$[ebp]
	mov	DWORD PTR _benefit$[ebp], eax
; Line 4382
	push	72					; 00000048H
	call	_oballoc
	add	esp, 4
	mov	DWORD PTR _v$[ebp], eax
; Line 4383
	mov	eax, DWORD PTR _src_regno$[ebp]
	mov	ecx, DWORD PTR _v$[ebp]
	mov	DWORD PTR [ecx+8], eax
; Line 4384
	mov	eax, DWORD PTR _mult_val$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	ecx, DWORD PTR _v$[ebp]
	mov	DWORD PTR [ecx+28], eax
; Line 4385
	mov	eax, DWORD PTR _add_val$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	ecx, DWORD PTR _v$[ebp]
	mov	DWORD PTR [ecx+32], eax
; Line 4387
	mov	eax, DWORD PTR _dest_regno$[ebp]
	mov	ecx, DWORD PTR _induct_var$S1588
	mov	DWORD PTR [ecx+eax*4], 3
; Line 4388
	mov	eax, DWORD PTR _v$[ebp]
	mov	ecx, DWORD PTR _dest_regno$[ebp]
	mov	edx, DWORD PTR _induct_struct$S1589
	mov	DWORD PTR [edx+ecx*4], eax
; Line 4390
	mov	eax, DWORD PTR _dest_regno$[ebp]
	mov	ecx, DWORD PTR _n_times_set$S775
	movsx	eax, WORD PTR [ecx+eax*2]
	dec	eax
	mov	DWORD PTR _count$[ebp], eax
; Line 4392
$L2219:
	cmp	DWORD PTR _count$[ebp], 0
	jle	$L2220
; Line 4394
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	DWORD PTR _p$[ebp], eax
; Line 4395
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	sar	eax, 16					; 00000010H
	mov	DWORD PTR _code$[ebp], eax
; Line 4398
	cmp	DWORD PTR _code$[ebp], 13		; 0000000dH
	jne	$L2221
	push	0
	push	7
	mov	eax, DWORD PTR _p$[ebp]
	push	eax
	call	_find_reg_note
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _temp$[ebp], eax
	cmp	DWORD PTR _temp$[ebp], 0
	je	$L2221
; Line 4399
	mov	eax, DWORD PTR _temp$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _p$[ebp], eax
; Line 4401
$L2221:
; Line 4412
	cmp	DWORD PTR _code$[ebp], 13		; 0000000dH
	jne	$L2222
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1638400				; 00190000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L2222
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L2222
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _dest_regno$[ebp]
	cmp	DWORD PTR [eax+4], ecx
	jne	$L2222
	lea	eax, DWORD PTR _forces2$[ebp]
	push	eax
	lea	eax, DWORD PTR _forces$[ebp]
	push	eax
	mov	eax, DWORD PTR _mult_val$[ebp]
	push	eax
	mov	eax, DWORD PTR _add_val$[ebp]
	push	eax
	lea	eax, DWORD PTR _src_regno$[ebp]
	push	eax
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	call	_general_induction_var
	add	esp, 24					; 00000018H
	mov	DWORD PTR _tem$[ebp], eax
	cmp	DWORD PTR _tem$[ebp], 0
	jne	$L2223
	mov	eax, DWORD PTR _p$[ebp]
	push	eax
	call	_loop_find_reg_equal
	add	esp, 4
	mov	DWORD PTR _temp$[ebp], eax
	cmp	DWORD PTR _temp$[ebp], 0
	je	$L2222
	lea	eax, DWORD PTR _forces2$[ebp]
	push	eax
	lea	eax, DWORD PTR _forces$[ebp]
	push	eax
	mov	eax, DWORD PTR _mult_val$[ebp]
	push	eax
	mov	eax, DWORD PTR _add_val$[ebp]
	push	eax
	lea	eax, DWORD PTR _src_regno$[ebp]
	push	eax
	mov	eax, DWORD PTR _temp$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	call	_general_induction_var
	add	esp, 24					; 00000018H
	mov	DWORD PTR _tem$[ebp], eax
	cmp	DWORD PTR _tem$[ebp], 0
	je	$L2222
$L2223:
	mov	eax, DWORD PTR _v$[ebp]
	mov	ecx, DWORD PTR _src_regno$[ebp]
	cmp	DWORD PTR [eax+8], ecx
	jne	$L2222
; Line 4414
	dec	DWORD PTR _count$[ebp]
; Line 4415
	mov	eax, DWORD PTR _tem$[ebp]
	add	DWORD PTR _benefit$[ebp], eax
; Line 4416
	mov	eax, DWORD PTR _mult_val$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	ecx, DWORD PTR _v$[ebp]
	mov	DWORD PTR [ecx+28], eax
; Line 4417
	mov	eax, DWORD PTR _add_val$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	ecx, DWORD PTR _v$[ebp]
	mov	DWORD PTR [ecx+32], eax
; Line 4419
	jmp	$L2224
$L2222:
	cmp	DWORD PTR _code$[ebp], 18		; 00000012H
	je	$L2225
; Line 4421
	mov	eax, DWORD PTR _dest_regno$[ebp]
	mov	ecx, DWORD PTR _induct_var$S1588
	mov	DWORD PTR [ecx+eax*4], 0
; Line 4422
	sub	eax, eax
	jmp	$L2209
; Line 4424
$L2225:
$L2224:
	jmp	$L2219
$L2220:
; Line 4426
	mov	eax, DWORD PTR _benefit$[ebp]
	jmp	$L2209
; Line 4427
$L2209:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_consec_sets_giv ENDP
_TEXT	ENDS
EXTRN	_start_sequence:NEAR
EXTRN	_gen_sequence:NEAR
EXTRN	_expand_mult:NEAR
EXTRN	_emit_move_insn:NEAR
EXTRN	_end_sequence:NEAR
_TEXT	SEGMENT
_mode$ = 8
_op0$ = 12
_op1$ = 16
_target$ = 20
_saved$ = -8
_result$ = -12
_temp$ = -4
_gen_iv_mult PROC NEAR
; Line 4438
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
	push	ebx
	push	esi
	push	edi
; Line 4443
	call	_start_sequence
	mov	DWORD PTR _saved$[ebp], eax
; Line 4449
	push	0
	mov	eax, DWORD PTR _target$[ebp]
	push	eax
	mov	eax, DWORD PTR _op1$[ebp]
	push	eax
	mov	eax, DWORD PTR _op0$[ebp]
	push	eax
	mov	eax, DWORD PTR _mode$[ebp]
	push	eax
	call	_expand_mult
	add	esp, 20					; 00000014H
	mov	DWORD PTR _temp$[ebp], eax
; Line 4452
	cmp	DWORD PTR _target$[ebp], 0
	je	$L2235
	mov	eax, DWORD PTR _target$[ebp]
	cmp	DWORD PTR _temp$[ebp], eax
	je	$L2235
; Line 4453
	mov	eax, DWORD PTR _temp$[ebp]
	push	eax
	mov	eax, DWORD PTR _target$[ebp]
	push	eax
	call	_emit_move_insn
	add	esp, 8
; Line 4455
$L2235:
	call	_gen_sequence
	mov	DWORD PTR _result$[ebp], eax
; Line 4456
	mov	eax, DWORD PTR _saved$[ebp]
	push	eax
	call	_end_sequence
	add	esp, 4
; Line 4458
	mov	eax, DWORD PTR _result$[ebp]
	jmp	$L2231
; Line 4459
$L2231:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_gen_iv_mult ENDP
_TEXT	ENDS
EXTRN	_expand_mult_add:NEAR
_TEXT	SEGMENT
_reg$ = 20
_insert_before$ = 24
_seq$ = -4
_result$ = -8
_b$ = 8
_m$ = 12
_a$ = 16
_emit_iv_init_code PROC NEAR
; Line 4473
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	push	ebx
	push	esi
	push	edi
; Line 4478
	mov	eax, DWORD PTR _a$[ebp]
	push	eax
	call	_copy_rtx
	add	esp, 4
	mov	DWORD PTR _a$[ebp], eax
; Line 4479
	mov	eax, DWORD PTR _b$[ebp]
	push	eax
	call	_copy_rtx
	add	esp, 4
	mov	DWORD PTR _b$[ebp], eax
; Line 4481
	call	_start_sequence
; Line 4482
	push	0
	mov	eax, DWORD PTR _reg$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	push	eax
	mov	eax, DWORD PTR _a$[ebp]
	push	eax
	mov	eax, DWORD PTR _m$[ebp]
	push	eax
	mov	eax, DWORD PTR _b$[ebp]
	push	eax
	call	_expand_mult_add
	add	esp, 20					; 00000014H
	mov	DWORD PTR _result$[ebp], eax
; Line 4483
	mov	eax, DWORD PTR _result$[ebp]
	cmp	DWORD PTR _reg$[ebp], eax
	je	$L2245
; Line 4484
	mov	eax, DWORD PTR _result$[ebp]
	push	eax
	mov	eax, DWORD PTR _reg$[ebp]
	push	eax
	call	_emit_move_insn
	add	esp, 8
; Line 4485
$L2245:
	call	_gen_sequence
	mov	DWORD PTR _seq$[ebp], eax
; Line 4486
	call	_end_sequence
; Line 4488
	mov	eax, DWORD PTR _insert_before$[ebp]
	push	eax
	mov	eax, DWORD PTR _seq$[ebp]
	push	eax
	call	_emit_insn_before
	add	esp, 8
; Line 4489
$L2242:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_emit_iv_init_code ENDP
_biv_add$ = 8
_giv_mult$ = 12
_reg$ = 16
_insn$ = 20
_emit_iv_inc PROC NEAR
; Line 4501
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 4502
	mov	eax, DWORD PTR _insn$[ebp]
	push	eax
	mov	eax, DWORD PTR _reg$[ebp]
	push	eax
	mov	eax, DWORD PTR _reg$[ebp]
	push	eax
	mov	eax, DWORD PTR _giv_mult$[ebp]
	push	eax
	mov	eax, DWORD PTR _biv_add$[ebp]
	push	eax
	call	_emit_iv_init_code
	add	esp, 20					; 00000014H
; Line 4503
$L2250:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_emit_iv_inc ENDP
_biv_add$ = 8
_giv_mult$ = 12
_status$ = -12
_const_val$ = -8
_tmp$ = -4
_product_cheap_p PROC NEAR
; Line 4512
	push	ebp
	mov	ebp, esp
	sub	esp, 16					; 00000010H
	push	ebx
	push	esi
	push	edi
; Line 4514
	mov	DWORD PTR _status$[ebp], 0
; Line 4518
	mov	eax, DWORD PTR _biv_add$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L2257
; Line 4519
	or	DWORD PTR _status$[ebp], 1
; Line 4520
$L2257:
	mov	eax, DWORD PTR _giv_mult$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L2258
; Line 4521
	or	DWORD PTR _status$[ebp], 2
; Line 4523
$L2258:
	mov	eax, DWORD PTR _status$[ebp]
	mov	DWORD PTR -16+[ebp], eax
	jmp	$L2259
; Line 4525
$L2263:
; Line 4527
	sub	eax, eax
	jmp	$L2253
; Line 4529
$L2264:
; Line 4533
	mov	eax, DWORD PTR _biv_add$[ebp]
	mov	DWORD PTR _tmp$[ebp], eax
; Line 4534
	mov	eax, DWORD PTR _giv_mult$[ebp]
	mov	DWORD PTR _biv_add$[ebp], eax
; Line 4535
	mov	eax, DWORD PTR _tmp$[ebp]
	mov	DWORD PTR _giv_mult$[ebp], eax
; Line 4537
$L2265:
; Line 4540
	mov	eax, DWORD PTR _giv_mult$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _const_val$[ebp], eax
; Line 4541
	cmp	DWORD PTR _const_val$[ebp], -1
	jl	$L2267
	cmp	DWORD PTR _const_val$[ebp], 1
	jle	$L2266
$L2267:
; Line 4543
	push	0
	mov	eax, DWORD PTR _giv_mult$[ebp]
	push	eax
	mov	eax, DWORD PTR _biv_add$[ebp]
	push	eax
	mov	eax, DWORD PTR _biv_add$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	push	eax
	call	_gen_iv_mult
	add	esp, 16					; 00000010H
	mov	DWORD PTR _tmp$[ebp], eax
; Line 4548
	mov	eax, DWORD PTR _tmp$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1638400				; 00190000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L2270
	mov	eax, DWORD PTR _tmp$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 3080192				; 002f0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L2269
$L2270:
	mov	eax, DWORD PTR _tmp$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 720896				; 000b0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L2268
	mov	eax, DWORD PTR _tmp$[ebp]
	mov	eax, DWORD PTR [eax+4]
	cmp	DWORD PTR [eax], 2
	jbe	$L2268
$L2269:
; Line 4549
	sub	eax, eax
	jmp	$L2253
; Line 4550
$L2268:
; Line 4551
$L2266:
	mov	eax, 1
	jmp	$L2253
; Line 4553
$L2271:
; Line 4556
	mov	eax, 1
	jmp	$L2253
; Line 4558
$L2272:
; Line 4559
	call	_abort
; Line 4560
	jmp	$L2260
$L2259:
	cmp	DWORD PTR -16+[ebp], 0
	je	$L2263
	cmp	DWORD PTR -16+[ebp], 1
	je	$L2264
	cmp	DWORD PTR -16+[ebp], 2
	je	$L2265
	cmp	DWORD PTR -16+[ebp], 3
	je	$L2271
	jmp	$L2272
$L2260:
; Line 4561
$L2253:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_product_cheap_p ENDP
_TEXT	ENDS
EXTRN	_regno_reg_rtx:DWORD
EXTRN	_pc_rtx:DWORD
EXTRN	_condjump_p:NEAR
_DATA	SEGMENT
	ORG $+2
$SG2339	DB	'Can reverse loop', 0aH, 00H
	ORG $+2
$SG2350	DB	'Reversed loop and added reg_nonneg', 0aH, 00H
_DATA	ENDS
_TEXT	SEGMENT
_num_nonfixed_reads$2312 = -40
_p$2313 = -48
_no_use_except_counting$2314 = -44
_bivreg$2321 = -52
_src_two_before_end$2335 = -56
_constant$2336 = -64
_win$2337 = -60
_loop_end$ = 8
_iv_list$ = 12
_insn_count$ = 16
_loop_start$ = 20
_bl$ = -24
_reg$ = -16
_jump_label$ = -36
_final_value$ = -20
_start_value$ = -32
_branch_code$ = -4
_new_add_val$ = -8
_tested_before_loop$ = -12
_p$ = -28
_check_dbra_loop PROC NEAR
; Line 4576
	push	ebp
	mov	ebp, esp
	sub	esp, 64					; 00000040H
	push	ebx
	push	esi
	push	edi
; Line 4584
	mov	DWORD PTR _tested_before_loop$[ebp], 0
; Line 4592
	mov	eax, DWORD PTR _loop_start$[ebp]
	mov	DWORD PTR _p$[ebp], eax
	jmp	$L2287
$L2288:
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _p$[ebp], eax
$L2287:
	cmp	DWORD PTR _p$[ebp], 0
	je	$L2289
; Line 4593
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1179648				; 00120000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L2290
; Line 4594
	jmp	$L2289
; Line 4599
$L2290:
	jmp	$L2288
$L2289:
; Line 4606
	cmp	DWORD PTR _p$[ebp], 0
	je	$L2292
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 917504				; 000e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L2292
	mov	eax, DWORD PTR _p$[ebp]
	push	eax
	call	_condjump_p
	add	esp, 4
	or	eax, eax
	je	$L2292
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	ecx, DWORD PTR _pc_rtx
	cmp	DWORD PTR [eax+8], ecx
	je	$L2292
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 4718592				; 00480000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L2294
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax+8]
	mov	ecx, DWORD PTR _pc_rtx
	cmp	DWORD PTR [eax+12], ecx
	je	$L2293
$L2294:
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 4521984				; 00450000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L2292
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax+8]
	mov	ecx, DWORD PTR _pc_rtx
	cmp	DWORD PTR [eax+8], ecx
	jne	$L2292
$L2293:
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax+32]
	push	eax
	call	_next_real_insn
	add	esp, 4
	mov	ebx, eax
	mov	eax, DWORD PTR _loop_end$[ebp]
	push	eax
	call	_next_real_insn
	add	esp, 4
	cmp	ebx, eax
	jne	$L2292
; Line 4610
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _p$[ebp], eax
; Line 4612
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 851968				; 000d0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L2295
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1638400				; 00190000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L2295
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	ecx, DWORD PTR _cc0_rtx
	cmp	DWORD PTR [eax+4], ecx
	jne	$L2295
; Line 4614
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L2296
; Line 4615
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _tested_before_loop$[ebp], eax
; Line 4616
	jmp	$L2297
$L2296:
; Line 4618
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2818048				; 002b0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L2298
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L2298
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax+8]
	mov	ecx, DWORD PTR _const0_rtx
	cmp	DWORD PTR [eax+8], ecx
	jne	$L2298
; Line 4619
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _tested_before_loop$[ebp], eax
; Line 4620
	jmp	$L2299
$L2298:
; Line 4622
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2818048				; 002b0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L2300
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L2300
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax+8]
	mov	ecx, DWORD PTR _const0_rtx
	cmp	DWORD PTR [eax+4], ecx
	jne	$L2300
; Line 4623
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _tested_before_loop$[ebp], eax
; Line 4624
$L2300:
$L2299:
$L2297:
; Line 4625
$L2295:
; Line 4630
$L2292:
; Line 4636
	mov	eax, DWORD PTR _loop_end$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 917504				; 000e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L2301
	mov	eax, DWORD PTR _loop_end$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1638400				; 00190000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L2301
	mov	eax, DWORD PTR _loop_end$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2752512				; 002a0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L2301
	mov	eax, DWORD PTR _loop_end$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 851968				; 000d0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L2301
	mov	eax, DWORD PTR _loop_end$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1638400				; 00190000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L2301
	mov	eax, DWORD PTR _loop_end$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2621440				; 00280000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L2301
; Line 4640
	mov	eax, DWORD PTR _iv_list$[ebp]
	mov	DWORD PTR _bl$[ebp], eax
	jmp	$L2302
$L2303:
	mov	eax, DWORD PTR _bl$[ebp]
	mov	eax, DWORD PTR [eax+28]
	mov	DWORD PTR _bl$[ebp], eax
$L2302:
	cmp	DWORD PTR _bl$[ebp], 0
	je	$L2304
; Line 4643
	mov	eax, DWORD PTR _loop_end$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	mov	eax, DWORD PTR _bl$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	call	_reg_mentioned_p
	add	esp, 8
	or	eax, eax
	je	$L2305
; Line 4644
	jmp	$L2304
; Line 4645
$L2305:
	jmp	$L2303
$L2304:
; Line 4653
	cmp	DWORD PTR _bl$[ebp], 0
	je	$L2306
	mov	eax, DWORD PTR _bl$[ebp]
	cmp	DWORD PTR [eax+4], 1
	jne	$L2306
	mov	eax, DWORD PTR _loop_end$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	mov	eax, DWORD PTR _bl$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	push	eax
	mov	eax, DWORD PTR _bl$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	ecx, DWORD PTR _regno_reg_rtx
	mov	eax, DWORD PTR [ecx+eax*4]
	push	eax
	call	_reg_used_between_p
	add	esp, 12					; 0000000cH
	or	eax, eax
	jne	$L2306
; Line 4663
	mov	eax, DWORD PTR _bl$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+32]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L2307
	mov	eax, DWORD PTR _bl$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+32]
	cmp	DWORD PTR [eax+4], 0
	jge	$L2307
; Line 4672
	mov	eax, DWORD PTR _bl$[ebp]
	mov	eax, DWORD PTR [eax+24]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L2308
	mov	eax, DWORD PTR _bl$[ebp]
	mov	eax, DWORD PTR [eax+24]
	cmp	DWORD PTR [eax+4], 0
	jle	$L2308
	mov	eax, DWORD PTR _bl$[ebp]
	mov	eax, DWORD PTR [eax+24]
	mov	ecx, DWORD PTR _bl$[ebp]
	mov	ecx, DWORD PTR [ecx+8]
	mov	ecx, DWORD PTR [ecx+32]
	mov	eax, DWORD PTR [eax+4]
	cdq
	idiv	DWORD PTR [ecx+4]
	or	edx, edx
	jne	$L2308
; Line 4677
	mov	eax, DWORD PTR _loop_end$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+28]
	push	eax
	push	0
	push	8
	push	2
	call	_gen_rtx
	add	esp, 16					; 00000010H
	mov	ecx, DWORD PTR _loop_end$[ebp]
	mov	ecx, DWORD PTR [ecx+8]
	mov	DWORD PTR [ecx+28], eax
; Line 4678
	mov	eax, DWORD PTR _bl$[ebp]
	mov	BYTE PTR [eax+37], 1
; Line 4680
	mov	eax, 1
	jmp	$L2277
; Line 4685
$L2308:
; Line 4686
	mov	eax, DWORD PTR _bl$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	mov	eax, DWORD PTR [eax+16]
	mov	ecx, DWORD PTR _tested_before_loop$[ebp]
	cmp	DWORD PTR [eax+4], ecx
	jne	$L2309
	mov	eax, DWORD PTR _bl$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+32]
	cmp	DWORD PTR [eax+4], -1
	jne	$L2309
; Line 4690
	mov	eax, DWORD PTR _loop_end$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+28]
	push	eax
	push	0
	push	8
	push	2
	call	_gen_rtx
	add	esp, 16					; 00000010H
	mov	ecx, DWORD PTR _loop_end$[ebp]
	mov	ecx, DWORD PTR [ecx+8]
	mov	DWORD PTR [ecx+28], eax
; Line 4691
	mov	eax, DWORD PTR _bl$[ebp]
	mov	BYTE PTR [eax+37], 1
; Line 4693
	mov	eax, 1
	jmp	$L2277
; Line 4695
$L2309:
; Line 4696
	jmp	$L2310
$L2307:
	cmp	DWORD PTR _num_mem_sets$S783, 1
	jg	$L2311
; Line 4704
	mov	DWORD PTR _num_nonfixed_reads$2312[ebp], 0
; Line 4707
	mov	DWORD PTR _no_use_except_counting$2314[ebp], 0
; Line 4709
	mov	eax, DWORD PTR _loop_start$[ebp]
	mov	DWORD PTR _p$2313[ebp], eax
	jmp	$L2315
$L2316:
	mov	eax, DWORD PTR _p$2313[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	DWORD PTR _p$2313[ebp], eax
$L2315:
	mov	eax, DWORD PTR _p$2313[ebp]
	cmp	DWORD PTR _loop_end$[ebp], eax
	je	$L2317
; Line 4711
	mov	eax, DWORD PTR _p$2313[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 851968				; 000d0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L2319
	mov	eax, DWORD PTR _p$2313[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 983040				; 000f0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L2319
	mov	eax, DWORD PTR _p$2313[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 917504				; 000e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L2318
$L2319:
; Line 4712
	mov	eax, DWORD PTR _p$2313[ebp]
	mov	eax, DWORD PTR [eax+16]
	push	eax
	call	_count_nonfixed_reads
	add	esp, 4
	add	DWORD PTR _num_nonfixed_reads$2312[ebp], eax
; Line 4714
$L2318:
	jmp	$L2316
$L2317:
	mov	eax, DWORD PTR _bl$[ebp]
	cmp	DWORD PTR [eax+12], 0
	jne	$L2320
; Line 4716
	mov	eax, DWORD PTR _bl$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	ecx, DWORD PTR _regno_reg_rtx
	mov	eax, DWORD PTR [ecx+eax*4]
	mov	DWORD PTR _bivreg$2321[ebp], eax
; Line 4720
	mov	DWORD PTR _no_use_except_counting$2314[ebp], 1
; Line 4721
	mov	eax, DWORD PTR _loop_start$[ebp]
	mov	DWORD PTR _p$2313[ebp], eax
	jmp	$L2322
$L2323:
	mov	eax, DWORD PTR _p$2313[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	DWORD PTR _p$2313[ebp], eax
$L2322:
	mov	eax, DWORD PTR _p$2313[ebp]
	cmp	DWORD PTR _loop_end$[ebp], eax
	je	$L2324
; Line 4723
	mov	eax, DWORD PTR _p$2313[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 851968				; 000d0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L2326
	mov	eax, DWORD PTR _p$2313[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 983040				; 000f0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L2326
	mov	eax, DWORD PTR _p$2313[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 917504				; 000e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L2325
$L2326:
; Line 4727
	mov	eax, DWORD PTR _p$2313[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1638400				; 00190000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L2327
	mov	eax, DWORD PTR _p$2313[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L2327
	mov	eax, DWORD PTR _p$2313[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _bl$[ebp]
	mov	ecx, DWORD PTR [ecx]
	cmp	DWORD PTR [eax+4], ecx
	jne	$L2327
; Line 4730
	jmp	$L2328
$L2327:
; Line 4731
	mov	eax, DWORD PTR _loop_end$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	ecx, DWORD PTR _p$2313[ebp]
	cmp	DWORD PTR [eax+8], ecx
	je	$L2330
	mov	eax, DWORD PTR _loop_end$[ebp]
	mov	ecx, DWORD PTR _p$2313[ebp]
	cmp	DWORD PTR [eax+8], ecx
	jne	$L2329
$L2330:
; Line 4734
	jmp	$L2331
$L2329:
	mov	eax, DWORD PTR _p$2313[ebp]
	mov	eax, DWORD PTR [eax+16]
	push	eax
	mov	eax, DWORD PTR _bivreg$2321[ebp]
	push	eax
	call	_reg_mentioned_p
	add	esp, 8
	or	eax, eax
	je	$L2332
; Line 4737
	mov	DWORD PTR _no_use_except_counting$2314[ebp], 0
; Line 4738
	jmp	$L2324
; Line 4740
$L2332:
$L2331:
$L2328:
; Line 4741
$L2325:
	jmp	$L2323
$L2324:
; Line 4749
$L2320:
; Line 4753
	cmp	DWORD PTR _num_nonfixed_reads$2312[ebp], 1
	jg	$L2333
	cmp	DWORD PTR _loop_has_call$S773, 0
	jne	$L2333
	cmp	DWORD PTR _no_use_except_counting$2314[ebp], 0
	jne	$L2334
	mov	eax, DWORD PTR _bl$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _bl$[ebp]
	add	eax, DWORD PTR [ecx+12]
	add	eax, DWORD PTR _num_mem_sets$S783
	add	eax, DWORD PTR _num_movables$S782
	add	eax, 2
	cmp	eax, DWORD PTR _insn_count$[ebp]
	jne	$L2333
$L2334:
; Line 4760
	cmp	DWORD PTR _loop_dump_stream$S787, 0
	je	$L2338
; Line 4761
	push	OFFSET $SG2339
	mov	eax, DWORD PTR _loop_dump_stream$S787
	push	eax
	call	_fprintf
	add	esp, 8
; Line 4774
$L2338:
; Line 4775
	mov	eax, DWORD PTR _loop_end$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	sar	eax, 16					; 00000010H
	mov	DWORD PTR _branch_code$[ebp], eax
; Line 4777
	mov	eax, DWORD PTR _loop_end$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _src_two_before_end$2335[ebp], eax
; Line 4779
	mov	DWORD PTR _win$2337[ebp], 1
; Line 4780
	mov	eax, DWORD PTR _src_two_before_end$2335[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L2340
; Line 4781
	mov	DWORD PTR _constant$2336[ebp], 0
; Line 4782
	jmp	$L2341
$L2340:
; Line 4783
	mov	eax, DWORD PTR _src_two_before_end$2335[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2818048				; 002b0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L2342
	mov	eax, DWORD PTR _src_two_before_end$2335[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L2342
; Line 4784
	mov	eax, DWORD PTR _src_two_before_end$2335[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _constant$2336[ebp], eax
; Line 4785
	jmp	$L2343
$L2342:
; Line 4786
	mov	DWORD PTR _win$2337[ebp], 0
$L2343:
$L2341:
; Line 4791
	cmp	DWORD PTR _win$2337[ebp], 0
	je	$L2344
	mov	eax, DWORD PTR _bl$[ebp]
	mov	ecx, DWORD PTR _const0_rtx
	cmp	DWORD PTR [eax+24], ecx
	jne	$L2344
	cmp	DWORD PTR _branch_code$[ebp], 72	; 00000048H
	je	$L2345
	cmp	DWORD PTR _branch_code$[ebp], 71	; 00000047H
	jne	$L2344
$L2345:
	mov	eax, DWORD PTR _loop_end$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _const0_rtx
	cmp	DWORD PTR [eax+8], ecx
	jne	$L2344
	mov	eax, DWORD PTR _bl$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	ecx, DWORD PTR [eax+32]
	mov	eax, DWORD PTR _constant$2336[ebp]
	cdq
	idiv	DWORD PTR [ecx+4]
	or	edx, edx
	jne	$L2344
; Line 4797
	mov	eax, DWORD PTR _bl$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _reg$[ebp], eax
; Line 4798
	mov	eax, DWORD PTR _loop_end$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _jump_label$[ebp], eax
; Line 4800
	mov	eax, DWORD PTR _bl$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+32]
	mov	eax, DWORD PTR [eax+4]
	neg	eax
	push	eax
	push	0
	push	30					; 0000001eH
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _new_add_val$[ebp], eax
; Line 4803
	cmp	DWORD PTR _branch_code$[ebp], 72	; 00000048H
	jne	$L2346
; Line 4806
	mov	eax, DWORD PTR _constant$2336[ebp]
	push	eax
	push	0
	push	30					; 0000001eH
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _final_value$[ebp], eax
; Line 4809
	mov	eax, DWORD PTR _constant$2336[ebp]
	mov	ecx, DWORD PTR _bl$[ebp]
	mov	ecx, DWORD PTR [ecx+8]
	mov	ecx, DWORD PTR [ecx+32]
	sub	eax, DWORD PTR [ecx+4]
	push	eax
	push	0
	push	30					; 0000001eH
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _start_value$[ebp], eax
; Line 4811
	jmp	$L2347
$L2346:
; Line 4814
	mov	eax, DWORD PTR _constant$2336[ebp]
	push	eax
	push	0
	push	30					; 0000001eH
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _start_value$[ebp], eax
; Line 4817
	mov	eax, DWORD PTR _bl$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+32]
	mov	eax, DWORD PTR [eax+4]
	add	eax, DWORD PTR _constant$2336[ebp]
	push	eax
	push	0
	push	30					; 0000001eH
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _final_value$[ebp], eax
; Line 4818
$L2347:
; Line 4825
	mov	eax, DWORD PTR _loop_start$[ebp]
	push	eax
	mov	eax, DWORD PTR _start_value$[ebp]
	push	eax
	mov	eax, DWORD PTR _reg$[ebp]
	push	eax
	push	0
	push	25					; 00000019H
	call	_gen_rtx
	add	esp, 16					; 00000010H
	push	eax
	call	_emit_insn_before
	add	esp, 8
; Line 4832
	mov	eax, DWORD PTR _bl$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	push	eax
	mov	eax, DWORD PTR _new_add_val$[ebp]
	push	eax
	mov	eax, DWORD PTR _reg$[ebp]
	push	eax
	mov	eax, DWORD PTR _reg$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	push	eax
	push	44					; 0000002cH
	call	_gen_rtx
	add	esp, 16					; 00000010H
	push	eax
	mov	eax, DWORD PTR _reg$[ebp]
	push	eax
	push	0
	push	25					; 00000019H
	call	_gen_rtx
	add	esp, 16					; 00000010H
	push	eax
	call	_emit_insn_before
	add	esp, 8
; Line 4834
	mov	eax, DWORD PTR _bl$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	mov	eax, DWORD PTR [eax+8]
	mov	ecx, DWORD PTR _bl$[ebp]
	mov	ecx, DWORD PTR [ecx+8]
	mov	DWORD PTR [ecx], eax
; Line 4835
	mov	eax, DWORD PTR _bl$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	mov	eax, DWORD PTR [eax+12]
	push	eax
	call	_delete_insn
	add	esp, 4
; Line 4839
	mov	eax, DWORD PTR _jump_label$[ebp]
	mov	eax, DWORD PTR [eax+4]
	inc	DWORD PTR [eax+20]
; Line 4841
	mov	eax, DWORD PTR _loop_end$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	ecx, DWORD PTR _bl$[ebp]
	mov	ecx, DWORD PTR [ecx]
	mov	edx, DWORD PTR _regno_last_uid
	movsx	ecx, WORD PTR [edx+ecx*2]
	cmp	DWORD PTR [eax+4], ecx
	je	$L2348
; Line 4844
	mov	eax, DWORD PTR _loop_end$[ebp]
	push	eax
	mov	eax, DWORD PTR _final_value$[ebp]
	push	eax
	mov	eax, DWORD PTR _reg$[ebp]
	push	eax
	push	0
	push	25					; 00000019H
	call	_gen_rtx
	add	esp, 16					; 00000010H
	push	eax
	call	_emit_insn_after
	add	esp, 8
; Line 4847
$L2348:
	mov	eax, DWORD PTR _loop_end$[ebp]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	call	_delete_insn
	add	esp, 4
; Line 4848
	mov	eax, DWORD PTR _loop_end$[ebp]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	call	_delete_insn
	add	esp, 4
; Line 4852
	mov	eax, DWORD PTR _loop_end$[ebp]
	push	eax
	mov	eax, DWORD PTR _reg$[ebp]
	push	eax
	mov	eax, DWORD PTR _cc0_rtx
	push	eax
	push	0
	push	25					; 00000019H
	call	_gen_rtx
	add	esp, 16					; 00000010H
	push	eax
	call	_emit_insn_before
	add	esp, 8
; Line 4859
	mov	eax, DWORD PTR _loop_end$[ebp]
	push	eax
	mov	eax, DWORD PTR _pc_rtx
	push	eax
	mov	eax, DWORD PTR _jump_label$[ebp]
	push	eax
	mov	eax, DWORD PTR _const0_rtx
	push	eax
	mov	eax, DWORD PTR _cc0_rtx
	push	eax
	push	0
	push	69					; 00000045H
	call	_gen_rtx
	add	esp, 16					; 00000010H
	push	eax
	push	0
	push	42					; 0000002aH
	call	_gen_rtx
	add	esp, 20					; 00000014H
	push	eax
	mov	eax, DWORD PTR _pc_rtx
	push	eax
	push	0
	push	25					; 00000019H
	call	_gen_rtx
	add	esp, 16					; 00000010H
	push	eax
	call	_emit_jump_insn_before
	add	esp, 8
; Line 4861
	mov	eax, DWORD PTR _jump_label$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _loop_end$[ebp]
	mov	ecx, DWORD PTR [ecx+8]
	mov	DWORD PTR [ecx+32], eax
; Line 4868
	mov	eax, DWORD PTR _loop_end$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+28]
	push	eax
	push	0
	push	8
	push	2
	call	_gen_rtx
	add	esp, 16					; 00000010H
	mov	ecx, DWORD PTR _loop_end$[ebp]
	mov	ecx, DWORD PTR [ecx+8]
	mov	DWORD PTR [ecx+28], eax
; Line 4869
	mov	eax, DWORD PTR _bl$[ebp]
	mov	BYTE PTR [eax+37], 1
; Line 4872
	mov	eax, DWORD PTR _start_value$[ebp]
	mov	ecx, DWORD PTR _bl$[ebp]
	mov	DWORD PTR [ecx+24], eax
; Line 4873
	mov	eax, DWORD PTR _new_add_val$[ebp]
	mov	ecx, DWORD PTR _bl$[ebp]
	mov	ecx, DWORD PTR [ecx+8]
	mov	DWORD PTR [ecx+32], eax
; Line 4875
	cmp	DWORD PTR _loop_dump_stream$S787, 0
	je	$L2349
; Line 4876
	push	OFFSET $SG2350
	mov	eax, DWORD PTR _loop_dump_stream$S787
	push	eax
	call	_fprintf
	add	esp, 8
; Line 4878
$L2349:
	mov	eax, 1
	jmp	$L2277
; Line 4880
$L2344:
; Line 4881
$L2333:
; Line 4882
$L2311:
$L2310:
; Line 4883
$L2306:
; Line 4884
$L2301:
	sub	eax, eax
	jmp	$L2277
; Line 4885
$L2277:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_check_dbra_loop ENDP
_TEXT	ENDS
_DATA	SEGMENT
$SG2366	DB	'Cannot eliminate biv %d: cannot understand insn %d.', 0aH
	DB	00H
	ORG $+3
$SG2377	DB	'Cannot eliminate biv %d: biv used in insn %d.', 0aH, 00H
	ORG $+1
$SG2380	DB	'Can eliminate biv %d.', 0aH, 00H
_DATA	ENDS
_TEXT	SEGMENT
_bl$ = 8
_loop_start$ = 12
_end$ = 16
_reg$ = -4
_p$ = -12
_v$ = -8
_code$2361 = -16
_check_eliminate_biv PROC NEAR
; Line 4896
	push	ebp
	mov	ebp, esp
	sub	esp, 16					; 00000010H
	push	ebx
	push	esi
	push	edi
; Line 4898
	mov	eax, DWORD PTR _bl$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _reg$[ebp], eax
; Line 4902
	mov	eax, DWORD PTR _bl$[ebp]
	mov	BYTE PTR [eax+36], 0
; Line 4904
	mov	eax, DWORD PTR _loop_start$[ebp]
	mov	DWORD PTR _p$[ebp], eax
	jmp	$L2358
$L2359:
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	DWORD PTR _p$[ebp], eax
$L2358:
	mov	eax, DWORD PTR _end$[ebp]
	cmp	DWORD PTR _p$[ebp], eax
	je	$L2360
; Line 4906
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	sar	eax, 16					; 00000010H
	mov	DWORD PTR _code$2361[ebp], eax
; Line 4908
	cmp	DWORD PTR _code$2361[ebp], 13		; 0000000dH
	je	$L2363
	cmp	DWORD PTR _code$2361[ebp], 14		; 0000000eH
	je	$L2363
	cmp	DWORD PTR _code$2361[ebp], 15		; 0000000fH
	jne	$L2362
$L2363:
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax+16]
	push	eax
	mov	eax, DWORD PTR _reg$[ebp]
	push	eax
	call	_reg_mentioned_p
	add	esp, 8
	or	eax, eax
	je	$L2362
; Line 4912
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1638400				; 00190000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L2364
; Line 4914
	cmp	DWORD PTR _loop_dump_stream$S787, 0
	je	$L2365
; Line 4917
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	mov	eax, DWORD PTR _bl$[ebp]
	mov	eax, DWORD PTR [eax]
	push	eax
	push	OFFSET $SG2366
	mov	eax, DWORD PTR _loop_dump_stream$S787
	push	eax
	call	_fprintf
	add	esp, 16					; 00000010H
; Line 4918
$L2365:
	jmp	$L2360
; Line 4922
$L2364:
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	ecx, DWORD PTR _reg$[ebp]
	cmp	DWORD PTR [eax+4], ecx
	jne	$L2367
; Line 4923
	jmp	$L2359
; Line 4929
$L2367:
	mov	eax, DWORD PTR _bl$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	DWORD PTR _v$[ebp], eax
	jmp	$L2368
$L2369:
	mov	eax, DWORD PTR _v$[ebp]
	mov	eax, DWORD PTR [eax+56]
	mov	DWORD PTR _v$[ebp], eax
$L2368:
	cmp	DWORD PTR _v$[ebp], 0
	je	$L2370
; Line 4930
	mov	eax, DWORD PTR _v$[ebp]
	mov	ecx, DWORD PTR _p$[ebp]
	cmp	DWORD PTR [eax], ecx
	jne	$L2371
; Line 4935
	mov	eax, DWORD PTR _v$[ebp]
	cmp	DWORD PTR [eax+12], 1
	je	$L2373
	mov	eax, DWORD PTR _v$[ebp]
	cmp	DWORD PTR [eax+12], 0
	jne	$L2372
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax+16]
	push	eax
	mov	eax, DWORD PTR _v$[ebp]
	mov	eax, DWORD PTR [eax+20]
	mov	eax, DWORD PTR [eax]
	push	eax
	mov	eax, DWORD PTR _reg$[ebp]
	push	eax
	call	_other_reg_use_p
	add	esp, 12					; 0000000cH
	or	eax, eax
	jne	$L2372
$L2373:
; Line 4936
	jmp	$L2370
; Line 4937
$L2372:
; Line 4938
$L2371:
	jmp	$L2369
$L2370:
	cmp	DWORD PTR _v$[ebp], 0
	je	$L2374
; Line 4939
	jmp	$L2359
; Line 4942
$L2374:
	mov	eax, DWORD PTR _bl$[ebp]
	push	eax
	mov	eax, DWORD PTR _p$[ebp]
	push	eax
	call	_can_eliminate_biv_p
	add	esp, 8
	or	eax, eax
	je	$L2375
; Line 4943
	jmp	$L2359
; Line 4946
$L2375:
	cmp	DWORD PTR _loop_dump_stream$S787, 0
	je	$L2376
; Line 4949
	mov	eax, DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	mov	eax, DWORD PTR _bl$[ebp]
	mov	eax, DWORD PTR [eax]
	push	eax
	push	OFFSET $SG2377
	mov	eax, DWORD PTR _loop_dump_stream$S787
	push	eax
	call	_fprintf
	add	esp, 16					; 00000010H
; Line 4950
$L2376:
	jmp	$L2360
; Line 4952
$L2362:
	jmp	$L2359
$L2360:
; Line 4954
	mov	eax, DWORD PTR _end$[ebp]
	cmp	DWORD PTR _p$[ebp], eax
	jne	$L2378
; Line 4956
	mov	eax, DWORD PTR _bl$[ebp]
	mov	BYTE PTR [eax+36], 1
; Line 4957
	cmp	DWORD PTR _loop_dump_stream$S787, 0
	je	$L2379
; Line 4959
	mov	eax, DWORD PTR _bl$[ebp]
	mov	eax, DWORD PTR [eax]
	push	eax
	push	OFFSET $SG2380
	mov	eax, DWORD PTR _loop_dump_stream$S787
	push	eax
	call	_fprintf
	add	esp, 12					; 0000000cH
; Line 4960
$L2379:
; Line 4961
$L2378:
$L2354:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_check_eliminate_biv ENDP
_TEXT	ENDS
EXTRN	_next_insn_tests_no_inequality:NEAR
_DATA	SEGMENT
	ORG $+1
$SG2409	DB	'Cannot eliminate biv %d in test insn %d: no appropriate '
	DB	'giv.', 0aH, 00H
_DATA	ENDS
_TEXT	SEGMENT
_insn$ = 8
_bl$ = 12
_src$ = -12
_code$ = -20
_v$ = -24
_tv$ = -16
_arg$ = -28
_arg_operand$ = -8
_mode$ = -4
_can_eliminate_biv_p PROC NEAR
; Line 4977
	push	ebp
	mov	ebp, esp
	sub	esp, 32					; 00000020H
	push	ebx
	push	esi
	push	edi
; Line 4984
	mov	eax, DWORD PTR _bl$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+24]
	mov	DWORD PTR _mode$[ebp], eax
; Line 4986
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	ecx, DWORD PTR _cc0_rtx
	cmp	DWORD PTR [eax+4], ecx
	je	$L2391
; Line 4987
	sub	eax, eax
	jmp	$L2383
; Line 4989
$L2391:
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _src$[ebp], eax
; Line 4990
	mov	eax, DWORD PTR _src$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	sar	eax, 16					; 00000010H
	mov	DWORD PTR _code$[ebp], eax
; Line 4992
	mov	eax, DWORD PTR _code$[ebp]
	mov	DWORD PTR -32+[ebp], eax
	jmp	$L2392
; Line 4995
$L2396:
; Line 4999
	mov	eax, DWORD PTR _bl$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	DWORD PTR _v$[ebp], eax
	jmp	$L2397
$L2398:
	mov	eax, DWORD PTR _v$[ebp]
	mov	eax, DWORD PTR [eax+56]
	mov	DWORD PTR _v$[ebp], eax
$L2397:
	cmp	DWORD PTR _v$[ebp], 0
	je	$L2399
; Line 5003
	mov	eax, DWORD PTR _v$[ebp]
	mov	eax, DWORD PTR [eax+28]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L2400
	mov	eax, DWORD PTR _v$[ebp]
	mov	ecx, DWORD PTR _const0_rtx
	cmp	DWORD PTR [eax+28], ecx
	je	$L2400
	mov	eax, DWORD PTR _v$[ebp]
	mov	ecx, DWORD PTR _const0_rtx
	cmp	DWORD PTR [eax+32], ecx
	jne	$L2400
	mov	eax, DWORD PTR _v$[ebp]
	movsx	eax, BYTE PTR [eax+45]
	or	eax, eax
	jne	$L2400
	mov	eax, DWORD PTR _v$[ebp]
	mov	ecx, DWORD PTR _mode$[ebp]
	cmp	DWORD PTR [eax+24], ecx
	jne	$L2400
; Line 5004
	mov	eax, 1
	jmp	$L2383
; Line 5011
$L2400:
	jmp	$L2398
$L2399:
	mov	eax, DWORD PTR _insn$[ebp]
	push	eax
	call	_next_insn_tests_no_inequality
	add	esp, 4
	or	eax, eax
	je	$L2402
; Line 5012
	mov	eax, DWORD PTR _bl$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	DWORD PTR _v$[ebp], eax
	jmp	$L2403
$L2404:
	mov	eax, DWORD PTR _v$[ebp]
	mov	eax, DWORD PTR [eax+56]
	mov	DWORD PTR _v$[ebp], eax
$L2403:
	cmp	DWORD PTR _v$[ebp], 0
	je	$L2405
; Line 5016
	mov	eax, DWORD PTR _v$[ebp]
	mov	eax, DWORD PTR [eax+28]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L2406
	mov	eax, DWORD PTR _v$[ebp]
	mov	ecx, DWORD PTR _const0_rtx
	cmp	DWORD PTR [eax+28], ecx
	je	$L2406
	mov	eax, DWORD PTR _v$[ebp]
	mov	eax, DWORD PTR [eax+32]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L2407
	mov	eax, DWORD PTR _v$[ebp]
	mov	eax, DWORD PTR [eax+32]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L2406
$L2407:
	mov	eax, DWORD PTR _v$[ebp]
	movsx	eax, BYTE PTR [eax+45]
	or	eax, eax
	jne	$L2406
	mov	eax, DWORD PTR _v$[ebp]
	mov	ecx, DWORD PTR _mode$[ebp]
	cmp	DWORD PTR [eax+24], ecx
	jne	$L2406
; Line 5017
	mov	eax, 1
	jmp	$L2383
; Line 5019
$L2406:
	jmp	$L2404
$L2405:
$L2402:
	cmp	DWORD PTR _loop_dump_stream$S787, 0
	je	$L2408
; Line 5021
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	mov	eax, DWORD PTR _bl$[ebp]
	mov	eax, DWORD PTR [eax]
	push	eax
	push	OFFSET $SG2409
	mov	eax, DWORD PTR _loop_dump_stream$S787
	push	eax
	call	_fprintf
	add	esp, 16					; 00000010H
; Line 5023
$L2408:
	sub	eax, eax
	jmp	$L2383
; Line 5026
$L2410:
; Line 5029
	mov	eax, DWORD PTR _src$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L2411
	mov	eax, DWORD PTR _src$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _bl$[ebp]
	mov	ecx, DWORD PTR [ecx]
	cmp	DWORD PTR [eax+4], ecx
	jne	$L2411
; Line 5031
	mov	eax, DWORD PTR _src$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _arg$[ebp], eax
; Line 5032
	mov	DWORD PTR _arg_operand$[ebp], 1
; Line 5034
	jmp	$L2412
$L2411:
; Line 5035
	mov	eax, DWORD PTR _src$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L2413
	mov	eax, DWORD PTR _src$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	ecx, DWORD PTR _bl$[ebp]
	mov	ecx, DWORD PTR [ecx]
	cmp	DWORD PTR [eax+4], ecx
	jne	$L2413
; Line 5037
	mov	eax, DWORD PTR _src$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _arg$[ebp], eax
; Line 5038
	mov	DWORD PTR _arg_operand$[ebp], 0
; Line 5040
	jmp	$L2414
$L2413:
; Line 5041
	sub	eax, eax
	jmp	$L2383
$L2414:
$L2412:
; Line 5043
	mov	eax, DWORD PTR _arg$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L2415
; Line 5047
	mov	eax, DWORD PTR _bl$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	DWORD PTR _v$[ebp], eax
	jmp	$L2416
$L2417:
	mov	eax, DWORD PTR _v$[ebp]
	mov	eax, DWORD PTR [eax+56]
	mov	DWORD PTR _v$[ebp], eax
$L2416:
	cmp	DWORD PTR _v$[ebp], 0
	je	$L2418
; Line 5051
	mov	eax, DWORD PTR _v$[ebp]
	mov	eax, DWORD PTR [eax+28]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L2419
	mov	eax, DWORD PTR _v$[ebp]
	mov	eax, DWORD PTR [eax+32]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L2419
	mov	eax, DWORD PTR _v$[ebp]
	movsx	eax, BYTE PTR [eax+45]
	or	eax, eax
	jne	$L2419
	mov	eax, DWORD PTR _v$[ebp]
	mov	ecx, DWORD PTR _mode$[ebp]
	cmp	DWORD PTR [eax+24], ecx
	jne	$L2419
; Line 5061
	mov	eax, DWORD PTR _v$[ebp]
	mov	eax, DWORD PTR [eax+28]
	cmp	DWORD PTR [eax+4], 0
	je	$L2421
	mov	eax, DWORD PTR _v$[ebp]
	mov	eax, DWORD PTR [eax+28]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _arg$[ebp]
	imul	eax, DWORD PTR [ecx+4]
	mov	ecx, DWORD PTR _v$[ebp]
	mov	ecx, DWORD PTR [ecx+28]
	cdq
	idiv	DWORD PTR [ecx+4]
	mov	ecx, DWORD PTR _arg$[ebp]
	cmp	eax, DWORD PTR [ecx+4]
	jne	$L2421
	mov	eax, DWORD PTR _v$[ebp]
	mov	eax, DWORD PTR [eax+28]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _arg$[ebp]
	imul	eax, DWORD PTR [ecx+4]
	mov	ecx, DWORD PTR _v$[ebp]
	mov	ecx, DWORD PTR [ecx+32]
	add	eax, DWORD PTR [ecx+4]
	or	eax, eax
	mov	eax, 0
	setg	al
	mov	ecx, DWORD PTR _arg$[ebp]
	cmp	DWORD PTR [ecx+4], 0
	mov	ecx, 0
	setg	cl
	cmp	eax, ecx
	je	$L2420
$L2421:
; Line 5062
	sub	eax, eax
	jmp	$L2383
; Line 5064
$L2420:
	mov	eax, 1
	jmp	$L2383
; Line 5067
$L2419:
	jmp	$L2417
$L2418:
	mov	eax, DWORD PTR _insn$[ebp]
	push	eax
	call	_next_insn_tests_no_inequality
	add	esp, 4
	or	eax, eax
	je	$L2422
; Line 5075
	mov	eax, DWORD PTR _bl$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	DWORD PTR _v$[ebp], eax
	jmp	$L2423
$L2424:
	mov	eax, DWORD PTR _v$[ebp]
	mov	eax, DWORD PTR [eax+56]
	mov	DWORD PTR _v$[ebp], eax
$L2423:
	cmp	DWORD PTR _v$[ebp], 0
	je	$L2425
; Line 5078
	mov	eax, DWORD PTR _v$[ebp]
	mov	eax, DWORD PTR [eax+28]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L2426
	mov	eax, DWORD PTR _v$[ebp]
	movsx	eax, BYTE PTR [eax+45]
	or	eax, eax
	jne	$L2426
	mov	eax, DWORD PTR _v$[ebp]
	mov	ecx, DWORD PTR _mode$[ebp]
	cmp	DWORD PTR [eax+24], ecx
	jne	$L2426
; Line 5079
	mov	eax, 1
	jmp	$L2383
; Line 5080
$L2426:
	jmp	$L2424
$L2425:
; Line 5081
$L2422:
; Line 5082
	jmp	$L2427
$L2415:
; Line 5083
	mov	eax, DWORD PTR _arg$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L2429
	mov	eax, DWORD PTR _arg$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2424832				; 00250000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L2428
$L2429:
	mov	eax, DWORD PTR _insn$[ebp]
	push	eax
	call	_next_insn_tests_no_inequality
	add	esp, 4
	or	eax, eax
	je	$L2428
; Line 5087
	mov	eax, DWORD PTR _arg$[ebp]
	push	eax
	call	_invariant_p
	add	esp, 4
	or	eax, eax
	je	$L2430
; Line 5092
	mov	eax, DWORD PTR _bl$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	DWORD PTR _v$[ebp], eax
	jmp	$L2431
$L2432:
	mov	eax, DWORD PTR _v$[ebp]
	mov	eax, DWORD PTR [eax+56]
	mov	DWORD PTR _v$[ebp], eax
$L2431:
	cmp	DWORD PTR _v$[ebp], 0
	je	$L2433
; Line 5095
	mov	eax, DWORD PTR _v$[ebp]
	mov	eax, DWORD PTR [eax+28]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L2434
	mov	eax, DWORD PTR _v$[ebp]
	movsx	eax, BYTE PTR [eax+45]
	or	eax, eax
	jne	$L2434
	mov	eax, DWORD PTR _v$[ebp]
	mov	ecx, DWORD PTR _mode$[ebp]
	cmp	DWORD PTR [eax+24], ecx
	jne	$L2434
; Line 5096
	mov	eax, 1
	jmp	$L2383
; Line 5097
$L2434:
	jmp	$L2432
$L2433:
; Line 5100
$L2430:
; Line 5101
	mov	eax, DWORD PTR _arg$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L2436
	mov	eax, DWORD PTR _arg$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _induct_var$S1588
	cmp	DWORD PTR [ecx+eax*4], 1
	je	$L2435
$L2436:
; Line 5102
	sub	eax, eax
	jmp	$L2383
; Line 5106
$L2435:
	mov	eax, DWORD PTR _bl$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	DWORD PTR _v$[ebp], eax
	jmp	$L2437
$L2438:
	mov	eax, DWORD PTR _v$[ebp]
	mov	eax, DWORD PTR [eax+56]
	mov	DWORD PTR _v$[ebp], eax
$L2437:
	cmp	DWORD PTR _v$[ebp], 0
	je	$L2439
; Line 5108
	mov	eax, DWORD PTR _v$[ebp]
	mov	ecx, DWORD PTR _mode$[ebp]
	cmp	DWORD PTR [eax+24], ecx
	jne	$L2440
	mov	eax, DWORD PTR _v$[ebp]
	movsx	eax, BYTE PTR [eax+45]
	or	eax, eax
	jne	$L2440
; Line 5110
	mov	eax, DWORD PTR _arg$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _class_struct$S1590
	mov	eax, DWORD PTR [ecx+eax*4]
	mov	eax, DWORD PTR [eax+16]
	mov	DWORD PTR _tv$[ebp], eax
	jmp	$L2441
$L2442:
	mov	eax, DWORD PTR _tv$[ebp]
	mov	eax, DWORD PTR [eax+56]
	mov	DWORD PTR _tv$[ebp], eax
$L2441:
	cmp	DWORD PTR _tv$[ebp], 0
	je	$L2443
; Line 5115
	mov	eax, DWORD PTR _tv$[ebp]
	cmp	DWORD PTR [eax+4], 0
	je	$L2444
	mov	eax, DWORD PTR _v$[ebp]
	mov	eax, DWORD PTR [eax+28]
	push	eax
	mov	eax, DWORD PTR _tv$[ebp]
	mov	eax, DWORD PTR [eax+28]
	push	eax
	call	_rtx_equal_p
	add	esp, 8
	or	eax, eax
	je	$L2444
	mov	eax, DWORD PTR _v$[ebp]
	mov	eax, DWORD PTR [eax+28]
	push	eax
	mov	eax, DWORD PTR _tv$[ebp]
	mov	eax, DWORD PTR [eax+28]
	push	eax
	call	_rtx_equal_p
	add	esp, 8
	or	eax, eax
	je	$L2444
	mov	eax, DWORD PTR _tv$[ebp]
	movsx	eax, BYTE PTR [eax+45]
	or	eax, eax
	jne	$L2444
	mov	eax, DWORD PTR _tv$[ebp]
	mov	ecx, DWORD PTR _mode$[ebp]
	cmp	DWORD PTR [eax+24], ecx
	jne	$L2444
; Line 5116
	mov	eax, 1
	jmp	$L2383
; Line 5117
$L2444:
	jmp	$L2442
$L2443:
; Line 5118
$L2440:
	jmp	$L2438
$L2439:
; Line 5119
$L2428:
$L2427:
	sub	eax, eax
	jmp	$L2383
; Line 5121
$L2445:
; Line 5122
	sub	eax, eax
	jmp	$L2383
; Line 5123
	jmp	$L2393
$L2392:
	cmp	DWORD PTR -32+[ebp], 34			; 00000022H
	je	$L2396
	cmp	DWORD PTR -32+[ebp], 43			; 0000002bH
	je	$L2410
	jmp	$L2445
$L2393:
; Line 5124
$L2383:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_can_eliminate_biv_p ENDP
_TEXT	ENDS
EXTRN	_recog:NEAR
_TEXT	SEGMENT
_compare_value$2497 = -40
_compare_value$2508 = -44
_insn$ = 8
_bl$ = 12
_loop_start$ = 16
_src$ = -12
_code$ = -24
_v$ = -28
_tv$ = -20
_arg$ = -32
_temp$ = -16
_arg_operand$ = -8
_mode$ = -4
_newval$2488 = -36
_eliminate_biv PROC NEAR
; Line 5137
	push	ebp
	mov	ebp, esp
	sub	esp, 48					; 00000030H
	push	ebx
	push	esi
	push	edi
; Line 5138
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _src$[ebp], eax
; Line 5139
	mov	eax, DWORD PTR _src$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	sar	eax, 16					; 00000010H
	mov	DWORD PTR _code$[ebp], eax
; Line 5144
	mov	eax, DWORD PTR _bl$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+24]
	mov	DWORD PTR _mode$[ebp], eax
; Line 5146
	mov	eax, DWORD PTR _code$[ebp]
	mov	DWORD PTR -48+[ebp], eax
	jmp	$L2458
; Line 5149
$L2462:
; Line 5154
	mov	eax, DWORD PTR _bl$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	DWORD PTR _v$[ebp], eax
	jmp	$L2463
$L2464:
	mov	eax, DWORD PTR _v$[ebp]
	mov	eax, DWORD PTR [eax+56]
	mov	DWORD PTR _v$[ebp], eax
$L2463:
	cmp	DWORD PTR _v$[ebp], 0
	je	$L2465
; Line 5158
	mov	eax, DWORD PTR _v$[ebp]
	mov	eax, DWORD PTR [eax+28]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L2466
	mov	eax, DWORD PTR _v$[ebp]
	mov	ecx, DWORD PTR _const0_rtx
	cmp	DWORD PTR [eax+28], ecx
	je	$L2466
	mov	eax, DWORD PTR _v$[ebp]
	mov	ecx, DWORD PTR _const0_rtx
	cmp	DWORD PTR [eax+32], ecx
	jne	$L2466
	mov	eax, DWORD PTR _v$[ebp]
	cmp	DWORD PTR [eax+4], 0
	je	$L2466
	mov	eax, DWORD PTR _v$[ebp]
	mov	ecx, DWORD PTR _mode$[ebp]
	cmp	DWORD PTR [eax+24], ecx
	jne	$L2466
; Line 5159
	jmp	$L2465
; Line 5160
$L2466:
	jmp	$L2464
$L2465:
	cmp	DWORD PTR _v$[ebp], 0
	je	$L2467
; Line 5163
	mov	eax, DWORD PTR _v$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _insn$[ebp]
	mov	ecx, DWORD PTR [ecx+16]
	mov	DWORD PTR [ecx+8], eax
; Line 5166
	mov	eax, DWORD PTR _v$[ebp]
	mov	eax, DWORD PTR [eax+28]
	cmp	DWORD PTR [eax+4], 0
	jge	$L2468
; Line 5169
	mov	eax, DWORD PTR _v$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	mov	eax, DWORD PTR _const0_rtx
	push	eax
	mov	eax, DWORD PTR _v$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	push	eax
	push	43					; 0000002bH
	call	_gen_rtx
	add	esp, 16					; 00000010H
	mov	ecx, DWORD PTR _insn$[ebp]
	mov	ecx, DWORD PTR [ecx+16]
	mov	DWORD PTR [ecx+8], eax
; Line 5170
$L2468:
	jmp	$L2449
; Line 5178
$L2467:
	mov	eax, DWORD PTR _bl$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	DWORD PTR _v$[ebp], eax
	jmp	$L2469
$L2470:
	mov	eax, DWORD PTR _v$[ebp]
	mov	eax, DWORD PTR [eax+56]
	mov	DWORD PTR _v$[ebp], eax
$L2469:
	cmp	DWORD PTR _v$[ebp], 0
	je	$L2471
; Line 5182
	mov	eax, DWORD PTR _v$[ebp]
	mov	eax, DWORD PTR [eax+28]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L2472
	mov	eax, DWORD PTR _v$[ebp]
	mov	ecx, DWORD PTR _const0_rtx
	cmp	DWORD PTR [eax+28], ecx
	je	$L2472
	mov	eax, DWORD PTR _v$[ebp]
	mov	eax, DWORD PTR [eax+32]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L2473
	mov	eax, DWORD PTR _v$[ebp]
	mov	eax, DWORD PTR [eax+32]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L2472
$L2473:
	mov	eax, DWORD PTR _v$[ebp]
	cmp	DWORD PTR [eax+4], 0
	je	$L2472
	mov	eax, DWORD PTR _v$[ebp]
	mov	ecx, DWORD PTR _mode$[ebp]
	cmp	DWORD PTR [eax+24], ecx
	jne	$L2472
; Line 5183
	jmp	$L2471
; Line 5184
$L2472:
	jmp	$L2470
$L2471:
	cmp	DWORD PTR _v$[ebp], 0
	je	$L2474
; Line 5189
	mov	eax, DWORD PTR _v$[ebp]
	mov	eax, DWORD PTR [eax+32]
	push	eax
	call	_copy_rtx
	add	esp, 4
	push	eax
	mov	eax, DWORD PTR _v$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	mov	eax, DWORD PTR _v$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	push	eax
	push	43					; 0000002bH
	call	_gen_rtx
	add	esp, 16					; 00000010H
	mov	ecx, DWORD PTR _insn$[ebp]
	mov	ecx, DWORD PTR [ecx+16]
	mov	DWORD PTR [ecx+8], eax
; Line 5193
	mov	eax, DWORD PTR _v$[ebp]
	mov	eax, DWORD PTR [eax+28]
	cmp	DWORD PTR [eax+4], 0
	jge	$L2475
; Line 5196
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+8]
	mov	ecx, DWORD PTR _insn$[ebp]
	mov	ecx, DWORD PTR [ecx+16]
	mov	ecx, DWORD PTR [ecx+8]
	mov	DWORD PTR [ecx+4], eax
; Line 5197
	mov	eax, DWORD PTR _v$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _insn$[ebp]
	mov	ecx, DWORD PTR [ecx+16]
	mov	ecx, DWORD PTR [ecx+8]
	mov	DWORD PTR [ecx+8], eax
; Line 5206
$L2475:
	jmp	$L2449
; Line 5208
$L2474:
	call	_abort
; Line 5209
	jmp	$L2459
; Line 5212
$L2476:
; Line 5215
	mov	eax, DWORD PTR _src$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L2477
	mov	eax, DWORD PTR _src$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _bl$[ebp]
	mov	ecx, DWORD PTR [ecx]
	cmp	DWORD PTR [eax+4], ecx
	jne	$L2477
; Line 5217
	mov	eax, DWORD PTR _src$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _arg$[ebp], eax
; Line 5218
	mov	DWORD PTR _arg_operand$[ebp], 1
; Line 5220
	jmp	$L2478
$L2477:
; Line 5221
	mov	eax, DWORD PTR _src$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L2479
	mov	eax, DWORD PTR _src$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	ecx, DWORD PTR _bl$[ebp]
	mov	ecx, DWORD PTR [ecx]
	cmp	DWORD PTR [eax+4], ecx
	jne	$L2479
; Line 5223
	mov	eax, DWORD PTR _src$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _arg$[ebp], eax
; Line 5224
	mov	DWORD PTR _arg_operand$[ebp], 0
; Line 5226
	jmp	$L2480
$L2479:
; Line 5227
	call	_abort
$L2480:
$L2478:
; Line 5229
	mov	eax, DWORD PTR _arg$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L2481
; Line 5234
	mov	eax, DWORD PTR _bl$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	DWORD PTR _v$[ebp], eax
	jmp	$L2482
$L2483:
	mov	eax, DWORD PTR _v$[ebp]
	mov	eax, DWORD PTR [eax+56]
	mov	DWORD PTR _v$[ebp], eax
$L2482:
	cmp	DWORD PTR _v$[ebp], 0
	je	$L2484
; Line 5238
	mov	eax, DWORD PTR _v$[ebp]
	mov	eax, DWORD PTR [eax+28]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L2485
	mov	eax, DWORD PTR _v$[ebp]
	mov	eax, DWORD PTR [eax+32]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L2485
	mov	eax, DWORD PTR _v$[ebp]
	cmp	DWORD PTR [eax+4], 0
	je	$L2485
	mov	eax, DWORD PTR _v$[ebp]
	mov	ecx, DWORD PTR _mode$[ebp]
	cmp	DWORD PTR [eax+24], ecx
	jne	$L2485
; Line 5248
	mov	eax, DWORD PTR _v$[ebp]
	mov	eax, DWORD PTR [eax+28]
	cmp	DWORD PTR [eax+4], 0
	je	$L2486
	mov	eax, DWORD PTR _v$[ebp]
	mov	eax, DWORD PTR [eax+28]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _arg$[ebp]
	imul	eax, DWORD PTR [ecx+4]
	mov	ecx, DWORD PTR _v$[ebp]
	mov	ecx, DWORD PTR [ecx+28]
	cdq
	idiv	DWORD PTR [ecx+4]
	mov	ecx, DWORD PTR _arg$[ebp]
	cmp	eax, DWORD PTR [ecx+4]
	jne	$L2486
	mov	eax, DWORD PTR _v$[ebp]
	mov	eax, DWORD PTR [eax+28]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _arg$[ebp]
	imul	eax, DWORD PTR [ecx+4]
	mov	ecx, DWORD PTR _v$[ebp]
	mov	ecx, DWORD PTR [ecx+32]
	add	eax, DWORD PTR [ecx+4]
	or	eax, eax
	mov	eax, 0
	setg	al
	mov	ecx, DWORD PTR _arg$[ebp]
	cmp	DWORD PTR [ecx+4], 0
	mov	ecx, 0
	setg	cl
	cmp	eax, ecx
	jne	$L2486
; Line 5249
	jmp	$L2484
; Line 5250
$L2486:
; Line 5251
$L2485:
	jmp	$L2483
$L2484:
	cmp	DWORD PTR _v$[ebp], 0
	je	$L2487
; Line 5255
	mov	eax, DWORD PTR _v$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, 1
	sub	ecx, DWORD PTR _arg_operand$[ebp]
	mov	edx, DWORD PTR _src$[ebp]
	mov	DWORD PTR [edx+ecx*4+4], eax
; Line 5259
	mov	eax, DWORD PTR _v$[ebp]
	mov	eax, DWORD PTR [eax+28]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _arg$[ebp]
	imul	eax, DWORD PTR [ecx+4]
	mov	ecx, DWORD PTR _v$[ebp]
	mov	ecx, DWORD PTR [ecx+32]
	add	eax, DWORD PTR [ecx+4]
	push	eax
	push	0
	push	30					; 0000001eH
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _newval$2488[ebp], eax
; Line 5260
	mov	eax, DWORD PTR _newval$2488[ebp]
	mov	ecx, DWORD PTR _arg_operand$[ebp]
	mov	edx, DWORD PTR _src$[ebp]
	mov	DWORD PTR [edx+ecx*4+4], eax
; Line 5263
	mov	eax, DWORD PTR _insn$[ebp]
	push	eax
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+16]
	push	eax
	call	_recog
	add	esp, 8
	or	eax, eax
	jge	$L2490
; Line 5265
	mov	eax, DWORD PTR _mode$[ebp]
	push	eax
	call	_gen_reg_rtx
	add	esp, 4
	mov	DWORD PTR _temp$[ebp], eax
; Line 5267
	mov	eax, DWORD PTR _loop_start$[ebp]
	push	eax
	mov	eax, DWORD PTR _temp$[ebp]
	push	eax
	mov	eax, DWORD PTR _v$[ebp]
	mov	eax, DWORD PTR [eax+32]
	push	eax
	mov	eax, DWORD PTR _v$[ebp]
	mov	eax, DWORD PTR [eax+28]
	push	eax
	mov	eax, DWORD PTR _arg$[ebp]
	push	eax
	call	_emit_iv_init_code
	add	esp, 20					; 00000014H
; Line 5268
	mov	eax, DWORD PTR _temp$[ebp]
	mov	ecx, DWORD PTR _arg_operand$[ebp]
	mov	edx, DWORD PTR _src$[ebp]
	mov	DWORD PTR [edx+ecx*4+4], eax
; Line 5273
$L2490:
	mov	eax, DWORD PTR _v$[ebp]
	mov	eax, DWORD PTR [eax+28]
	cmp	DWORD PTR [eax+4], 0
	jge	$L2491
; Line 5275
	mov	eax, DWORD PTR _src$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _temp$[ebp], eax
; Line 5276
	mov	eax, DWORD PTR _src$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	ecx, DWORD PTR _src$[ebp]
	mov	DWORD PTR [ecx+4], eax
; Line 5277
	mov	eax, DWORD PTR _temp$[ebp]
	mov	ecx, DWORD PTR _src$[ebp]
	mov	DWORD PTR [ecx+8], eax
; Line 5279
$L2491:
	jmp	$L2449
; Line 5285
$L2487:
	mov	eax, DWORD PTR _bl$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	DWORD PTR _v$[ebp], eax
	jmp	$L2492
$L2493:
	mov	eax, DWORD PTR _v$[ebp]
	mov	eax, DWORD PTR [eax+56]
	mov	DWORD PTR _v$[ebp], eax
$L2492:
	cmp	DWORD PTR _v$[ebp], 0
	je	$L2494
; Line 5288
	mov	eax, DWORD PTR _v$[ebp]
	mov	eax, DWORD PTR [eax+28]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L2495
	mov	eax, DWORD PTR _v$[ebp]
	cmp	DWORD PTR [eax+4], 0
	je	$L2495
	mov	eax, DWORD PTR _v$[ebp]
	mov	ecx, DWORD PTR _mode$[ebp]
	cmp	DWORD PTR [eax+24], ecx
	jne	$L2495
; Line 5289
	jmp	$L2494
; Line 5290
$L2495:
	jmp	$L2493
$L2494:
	cmp	DWORD PTR _v$[ebp], 0
	je	$L2496
; Line 5292
	mov	eax, DWORD PTR _mode$[ebp]
	push	eax
	call	_gen_reg_rtx
	add	esp, 4
	mov	DWORD PTR _compare_value$2497[ebp], eax
; Line 5295
	mov	eax, DWORD PTR _v$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, 1
	sub	ecx, DWORD PTR _arg_operand$[ebp]
	mov	edx, DWORD PTR _src$[ebp]
	mov	DWORD PTR [edx+ecx*4+4], eax
; Line 5299
	mov	eax, DWORD PTR _loop_start$[ebp]
	push	eax
	mov	eax, DWORD PTR _compare_value$2497[ebp]
	push	eax
	mov	eax, DWORD PTR _v$[ebp]
	mov	eax, DWORD PTR [eax+32]
	push	eax
	mov	eax, DWORD PTR _v$[ebp]
	mov	eax, DWORD PTR [eax+28]
	push	eax
	mov	eax, DWORD PTR _arg$[ebp]
	push	eax
	call	_emit_iv_init_code
	add	esp, 20					; 00000014H
; Line 5301
	mov	eax, DWORD PTR _compare_value$2497[ebp]
	mov	ecx, DWORD PTR _arg_operand$[ebp]
	mov	edx, DWORD PTR _src$[ebp]
	mov	DWORD PTR [edx+ecx*4+4], eax
; Line 5305
	mov	eax, DWORD PTR _v$[ebp]
	mov	eax, DWORD PTR [eax+28]
	cmp	DWORD PTR [eax+4], 0
	jge	$L2498
; Line 5307
	mov	eax, DWORD PTR _src$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _temp$[ebp], eax
; Line 5308
	mov	eax, DWORD PTR _src$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	ecx, DWORD PTR _src$[ebp]
	mov	DWORD PTR [ecx+4], eax
; Line 5309
	mov	eax, DWORD PTR _temp$[ebp]
	mov	ecx, DWORD PTR _src$[ebp]
	mov	DWORD PTR [ecx+8], eax
; Line 5311
$L2498:
	jmp	$L2449
; Line 5313
$L2496:
	call	_abort
; Line 5315
	jmp	$L2499
$L2481:
	mov	eax, DWORD PTR _arg$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L2501
	mov	eax, DWORD PTR _arg$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2424832				; 00250000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L2500
$L2501:
; Line 5317
	mov	eax, DWORD PTR _arg$[ebp]
	push	eax
	call	_invariant_p
	add	esp, 4
	or	eax, eax
	je	$L2502
; Line 5322
	mov	eax, DWORD PTR _bl$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	DWORD PTR _v$[ebp], eax
	jmp	$L2503
$L2504:
	mov	eax, DWORD PTR _v$[ebp]
	mov	eax, DWORD PTR [eax+56]
	mov	DWORD PTR _v$[ebp], eax
$L2503:
	cmp	DWORD PTR _v$[ebp], 0
	je	$L2505
; Line 5325
	mov	eax, DWORD PTR _v$[ebp]
	mov	eax, DWORD PTR [eax+28]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L2506
	mov	eax, DWORD PTR _v$[ebp]
	cmp	DWORD PTR [eax+4], 0
	je	$L2506
	mov	eax, DWORD PTR _v$[ebp]
	mov	ecx, DWORD PTR _mode$[ebp]
	cmp	DWORD PTR [eax+24], ecx
	jne	$L2506
; Line 5326
	jmp	$L2505
; Line 5327
$L2506:
	jmp	$L2504
$L2505:
	cmp	DWORD PTR _v$[ebp], 0
	je	$L2507
; Line 5329
	mov	eax, DWORD PTR _mode$[ebp]
	push	eax
	call	_gen_reg_rtx
	add	esp, 4
	mov	DWORD PTR _compare_value$2508[ebp], eax
; Line 5332
	mov	eax, DWORD PTR _v$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, 1
	sub	ecx, DWORD PTR _arg_operand$[ebp]
	mov	edx, DWORD PTR _src$[ebp]
	mov	DWORD PTR [edx+ecx*4+4], eax
; Line 5336
	mov	eax, DWORD PTR _loop_start$[ebp]
	push	eax
	mov	eax, DWORD PTR _compare_value$2508[ebp]
	push	eax
	mov	eax, DWORD PTR _v$[ebp]
	mov	eax, DWORD PTR [eax+32]
	push	eax
	mov	eax, DWORD PTR _v$[ebp]
	mov	eax, DWORD PTR [eax+28]
	push	eax
	mov	eax, DWORD PTR _arg$[ebp]
	push	eax
	call	_emit_iv_init_code
	add	esp, 20					; 00000014H
; Line 5337
	mov	eax, DWORD PTR _compare_value$2508[ebp]
	mov	ecx, DWORD PTR _arg_operand$[ebp]
	mov	edx, DWORD PTR _src$[ebp]
	mov	DWORD PTR [edx+ecx*4+4], eax
; Line 5341
	mov	eax, DWORD PTR _v$[ebp]
	mov	eax, DWORD PTR [eax+28]
	cmp	DWORD PTR [eax+4], 0
	jge	$L2509
; Line 5343
	mov	eax, DWORD PTR _src$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _temp$[ebp], eax
; Line 5344
	mov	eax, DWORD PTR _src$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	ecx, DWORD PTR _src$[ebp]
	mov	DWORD PTR [ecx+4], eax
; Line 5345
	mov	eax, DWORD PTR _temp$[ebp]
	mov	ecx, DWORD PTR _src$[ebp]
	mov	DWORD PTR [ecx+8], eax
; Line 5347
$L2509:
	jmp	$L2449
; Line 5349
$L2507:
; Line 5352
$L2502:
; Line 5353
	mov	eax, DWORD PTR _arg$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L2511
	mov	eax, DWORD PTR _arg$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _induct_var$S1588
	cmp	DWORD PTR [ecx+eax*4], 1
	je	$L2510
$L2511:
; Line 5354
	call	_abort
; Line 5358
$L2510:
	mov	eax, DWORD PTR _bl$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	DWORD PTR _v$[ebp], eax
	jmp	$L2512
$L2513:
	mov	eax, DWORD PTR _v$[ebp]
	mov	eax, DWORD PTR [eax+56]
	mov	DWORD PTR _v$[ebp], eax
$L2512:
	cmp	DWORD PTR _v$[ebp], 0
	je	$L2514
; Line 5360
	mov	eax, DWORD PTR _v$[ebp]
	cmp	DWORD PTR [eax+4], 0
	jne	$L2515
	mov	eax, DWORD PTR _v$[ebp]
	mov	ecx, DWORD PTR _mode$[ebp]
	cmp	DWORD PTR [eax+24], ecx
	jne	$L2515
; Line 5361
	jmp	$L2513
; Line 5362
$L2515:
	mov	eax, DWORD PTR _arg$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _class_struct$S1590
	mov	eax, DWORD PTR [ecx+eax*4]
	mov	eax, DWORD PTR [eax+16]
	mov	DWORD PTR _tv$[ebp], eax
	jmp	$L2516
$L2517:
	mov	eax, DWORD PTR _tv$[ebp]
	mov	eax, DWORD PTR [eax+56]
	mov	DWORD PTR _tv$[ebp], eax
$L2516:
	cmp	DWORD PTR _tv$[ebp], 0
	je	$L2518
; Line 5366
	mov	eax, DWORD PTR _tv$[ebp]
	cmp	DWORD PTR [eax+4], 0
	je	$L2519
	mov	eax, DWORD PTR _v$[ebp]
	mov	eax, DWORD PTR [eax+28]
	push	eax
	mov	eax, DWORD PTR _tv$[ebp]
	mov	eax, DWORD PTR [eax+28]
	push	eax
	call	_rtx_equal_p
	add	esp, 8
	or	eax, eax
	je	$L2519
	mov	eax, DWORD PTR _v$[ebp]
	mov	eax, DWORD PTR [eax+32]
	push	eax
	mov	eax, DWORD PTR _tv$[ebp]
	mov	eax, DWORD PTR [eax+32]
	push	eax
	call	_rtx_equal_p
	add	esp, 8
	or	eax, eax
	je	$L2519
	mov	eax, DWORD PTR _tv$[ebp]
	mov	ecx, DWORD PTR _mode$[ebp]
	cmp	DWORD PTR [eax+24], ecx
	jne	$L2519
; Line 5367
	jmp	$L2518
; Line 5368
$L2519:
	jmp	$L2517
$L2518:
	cmp	DWORD PTR _tv$[ebp], 0
	je	$L2520
; Line 5369
	jmp	$L2514
; Line 5370
$L2520:
	jmp	$L2513
$L2514:
; Line 5371
	cmp	DWORD PTR _v$[ebp], 0
	je	$L2521
; Line 5374
	mov	eax, DWORD PTR _v$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, 1
	sub	ecx, DWORD PTR _arg_operand$[ebp]
	mov	edx, DWORD PTR _src$[ebp]
	mov	DWORD PTR [edx+ecx*4+4], eax
; Line 5376
	mov	eax, DWORD PTR _tv$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _arg_operand$[ebp]
	mov	edx, DWORD PTR _src$[ebp]
	mov	DWORD PTR [edx+ecx*4+4], eax
; Line 5380
	mov	eax, DWORD PTR _v$[ebp]
	mov	eax, DWORD PTR [eax+28]
	cmp	DWORD PTR [eax+4], 0
	jge	$L2522
; Line 5382
	mov	eax, DWORD PTR _src$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _temp$[ebp], eax
; Line 5383
	mov	eax, DWORD PTR _src$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	ecx, DWORD PTR _src$[ebp]
	mov	DWORD PTR [ecx+4], eax
; Line 5384
	mov	eax, DWORD PTR _temp$[ebp]
	mov	ecx, DWORD PTR _src$[ebp]
	mov	DWORD PTR [ecx+8], eax
; Line 5386
$L2522:
	jmp	$L2449
; Line 5388
$L2521:
; Line 5389
$L2500:
$L2499:
	call	_abort
; Line 5391
$L2523:
; Line 5392
	call	_abort
; Line 5393
	jmp	$L2459
$L2458:
	cmp	DWORD PTR -48+[ebp], 34			; 00000022H
	je	$L2462
	cmp	DWORD PTR -48+[ebp], 43			; 0000002bH
	je	$L2476
	jmp	$L2523
$L2459:
; Line 5394
$L2449:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_eliminate_biv ENDP
_final_biv_value PROC NEAR
; Line 5414
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 5416
	sub	eax, eax
	jmp	$L2526
; Line 5417
$L2526:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_final_biv_value ENDP
_regno$ = 8
_insn$ = 12
_n$ = -4
_last_use_this_basic_block PROC NEAR
; Line 5426
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 5430
	mov	eax, DWORD PTR _insn$[ebp]
	mov	DWORD PTR _n$[ebp], eax
	jmp	$L2531
$L2532:
	mov	eax, DWORD PTR _n$[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	DWORD PTR _n$[ebp], eax
$L2531:
	cmp	DWORD PTR _n$[ebp], 0
	je	$L2533
	mov	eax, DWORD PTR _n$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1114112				; 00110000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L2533
	mov	eax, DWORD PTR _n$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 917504				; 000e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L2533
; Line 5432
	mov	eax, DWORD PTR _regno$[ebp]
	mov	ecx, DWORD PTR _regno_last_uid
	movsx	eax, WORD PTR [ecx+eax*2]
	mov	ecx, DWORD PTR _n$[ebp]
	cmp	eax, DWORD PTR [ecx+4]
	jne	$L2534
; Line 5433
	mov	eax, 1
	jmp	$L2529
; Line 5434
$L2534:
	jmp	$L2532
$L2533:
; Line 5435
	sub	eax, eax
	jmp	$L2529
; Line 5436
$L2529:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_last_use_this_basic_block ENDP
_TEXT	ENDS
END
