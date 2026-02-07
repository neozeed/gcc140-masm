	TITLE	final.c
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
_DATA	SEGMENT
COMM	_regs_ever_live:BYTE:0aH
COMM	_frame_pointer_needed:DWORD
COMM	_next_block_index:DWORD
COMM	_profile_label_no:DWORD
COMM	_final_sequence:DWORD
COMM	_cc_prev_status:BYTE:010H
COMM	_cc_status:BYTE:010H
COMM	_gdbfiles:DWORD
_last_ignored_compare$S608 DD 00H
_new_block$S609 DD 01H
_DATA	ENDS
PUBLIC	_init_final
EXTRN	_xmalloc:NEAR
_BSS	SEGMENT
_next_gdb_filenum$S612 DD 01H DUP (?)
_lastfile$S613 DD 01H DUP (?)
_max_block_depth$S615 DD 01H DUP (?)
_pending_blocks$S616 DD 01H DUP (?)
_app_on$S618 DD	01H DUP (?)
_BSS	ENDS
_TEXT	SEGMENT
; File final.c
_filename$ = 8
_init_final PROC NEAR
; Line 215
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 216
	mov	DWORD PTR _next_block_index, 2
; Line 217
	mov	eax, DWORD PTR _filename$[ebp]
	mov	DWORD PTR _lastfile$S613, eax
; Line 218
	mov	DWORD PTR _app_on$S618, 0
; Line 219
	mov	DWORD PTR _max_block_depth$S615, 20	; 00000014H
; Line 220
	push	80					; 00000050H
	call	_xmalloc
	add	esp, 4
	mov	DWORD PTR _pending_blocks$S616, eax
; Line 221
	mov	DWORD PTR _gdbfiles, 0
; Line 222
	mov	DWORD PTR _next_gdb_filenum$S612, 0
; Line 223
	mov	DWORD PTR _final_sequence, 0
; Line 224
$L621:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_init_final ENDP
_TEXT	ENDS
PUBLIC	_output_addr_const
PUBLIC	_end_final
EXTRN	_profile_block_flag:DWORD
EXTRN	_fprintf:NEAR
EXTRN	_gen_rtx:NEAR
EXTRN	_strlen:NEAR
EXTRN	_alloca:NEAR
EXTRN	_strcpy:NEAR
EXTRN	_strcmp:NEAR
EXTRN	_strcat:NEAR
EXTRN	_assemble_string:NEAR
EXTRN	_text_section:NEAR
EXTRN	_asm_out_file:DWORD
EXTRN	_sprintf:NEAR
EXTRN	__flsbuf:NEAR
EXTRN	_data_section:NEAR
EXTRN	_exact_log2:NEAR
EXTRN	_assemble_integer_zero:NEAR
_BSS	SEGMENT
_count_basic_blocks$S604 DD 01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
$SG632	DB	09H, '.align %d', 0aH, 00H
$SG633	DB	'LPBX', 00H
	ORG $+3
$SG634	DB	'%s%d:', 0aH, 00H
	ORG $+1
$SG636	DB	'LPBX', 00H
	ORG $+3
$SG637	DB	'*%s%d', 00H
	ORG $+2
$SG638	DB	09H, '.long ', 00H
$SG639	DB	'LPBX', 00H
	ORG $+3
$SG640	DB	'*%s%d', 00H
	ORG $+2
$SG641	DB	09H, '.long ', 00H
$SG642	DB	09H, '.long ', 00H
$SG643	DB	'LPBX', 00H
	ORG $+3
$SG644	DB	'*%s%d', 00H
	ORG $+2
$SG645	DB	09H, '.long ', 00H
$SG646	DB	'LPBX', 00H
	ORG $+3
$SG647	DB	'%s%d:', 0aH, 00H
	ORG $+1
$SG655	DB	'.c', 00H
	ORG $+1
$SG658	DB	'.i', 00H
	ORG $+1
$SG661	DB	'.co', 00H
$SG663	DB	'.d', 00H
	ORG $+1
$SG666	DB	09H, '.align %d', 0aH, 00H
$SG667	DB	'LPBX', 00H
	ORG $+3
$SG668	DB	'%s%d:', 0aH, 00H
	ORG $+1
$SG669	DB	09H, '.space %u', 0aH, 00H
$SG671	DB	'LPBX', 00H
	ORG $+3
$SG672	DB	'%s%d:', 0aH, 00H
	ORG $+1
$SG677	DB	'LPB', 00H
$SG678	DB	'*%s%d', 00H
	ORG $+2
$SG679	DB	09H, '.long ', 00H
$SG680	DB	'LPBX', 00H
	ORG $+3
$SG681	DB	'*%s%d', 00H
	ORG $+2
$SG682	DB	09H, '.long ', 00H
_DATA	ENDS
_TEXT	SEGMENT
_len$648 = -20
_data_file$650 = -24
_name$676 = -36
_filename$ = 8
_i$ = -4
_name$628 = -16
_end_final PROC NEAR
; Line 232
	push	ebp
	mov	ebp, esp
	sub	esp, 36					; 00000024H
	push	ebx
	push	esi
	push	edi
; Line 235
	cmp	DWORD PTR _profile_block_flag, 0
	je	$L627
; Line 239
	call	_data_section
; Line 250
	push	4
	call	_exact_log2
	add	esp, 4
	or	eax, eax
	je	$L631
; Line 252
	push	4
	call	_exact_log2
	add	esp, 4
	push	eax
	push	OFFSET $SG632
	mov	eax, DWORD PTR _asm_out_file
	push	eax
	call	_fprintf
	add	esp, 12					; 0000000cH
; Line 254
$L631:
	push	0
	push	OFFSET $SG633
	push	OFFSET $SG634
	mov	eax, DWORD PTR _asm_out_file
	push	eax
	call	_fprintf
	add	esp, 16					; 00000010H
; Line 255
	call	_assemble_integer_zero
; Line 257
	push	1
	push	OFFSET $SG636
	push	OFFSET $SG637
	lea	eax, DWORD PTR _name$628[ebp]
	push	eax
	call	_sprintf
	add	esp, 16					; 00000010H
; Line 258
	push	OFFSET $SG638
	mov	eax, DWORD PTR _asm_out_file
	push	eax
	call	_fprintf
	add	esp, 8
	lea	eax, DWORD PTR _name$628[ebp]
	push	eax
	push	4
	push	39					; 00000027H
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	push	eax
	mov	eax, DWORD PTR _asm_out_file
	push	eax
	call	_output_addr_const
	add	esp, 8
	mov	eax, DWORD PTR _asm_out_file
	dec	DWORD PTR [eax+4]
	mov	eax, DWORD PTR _asm_out_file
	cmp	DWORD PTR [eax+4], 0
	jl	$L1107
	mov	eax, DWORD PTR _asm_out_file
	mov	eax, DWORD PTR [eax]
	mov	BYTE PTR [eax], 10			; 0000000aH
	mov	eax, DWORD PTR _asm_out_file
	inc	DWORD PTR [eax]
	jmp	$L1108
$L1107:
	mov	eax, DWORD PTR _asm_out_file
	push	eax
	push	10					; 0000000aH
	call	__flsbuf
	add	esp, 8
$L1108:
; Line 259
	push	2
	push	OFFSET $SG639
	push	OFFSET $SG640
	lea	eax, DWORD PTR _name$628[ebp]
	push	eax
	call	_sprintf
	add	esp, 16					; 00000010H
; Line 260
	push	OFFSET $SG641
	mov	eax, DWORD PTR _asm_out_file
	push	eax
	call	_fprintf
	add	esp, 8
	lea	eax, DWORD PTR _name$628[ebp]
	push	eax
	push	4
	push	39					; 00000027H
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	push	eax
	mov	eax, DWORD PTR _asm_out_file
	push	eax
	call	_output_addr_const
	add	esp, 8
	mov	eax, DWORD PTR _asm_out_file
	dec	DWORD PTR [eax+4]
	mov	eax, DWORD PTR _asm_out_file
	cmp	DWORD PTR [eax+4], 0
	jl	$L1109
	mov	eax, DWORD PTR _asm_out_file
	mov	eax, DWORD PTR [eax]
	mov	BYTE PTR [eax], 10			; 0000000aH
	mov	eax, DWORD PTR _asm_out_file
	inc	DWORD PTR [eax]
	jmp	$L1110
$L1109:
	mov	eax, DWORD PTR _asm_out_file
	push	eax
	push	10					; 0000000aH
	call	__flsbuf
	add	esp, 8
$L1110:
; Line 262
	push	OFFSET $SG642
	mov	eax, DWORD PTR _asm_out_file
	push	eax
	call	_fprintf
	add	esp, 8
	mov	eax, DWORD PTR _count_basic_blocks$S604
	push	eax
	push	0
	push	30					; 0000001eH
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	push	eax
	mov	eax, DWORD PTR _asm_out_file
	push	eax
	call	_output_addr_const
	add	esp, 8
	mov	eax, DWORD PTR _asm_out_file
	dec	DWORD PTR [eax+4]
	mov	eax, DWORD PTR _asm_out_file
	cmp	DWORD PTR [eax+4], 0
	jl	$L1111
	mov	eax, DWORD PTR _asm_out_file
	mov	eax, DWORD PTR [eax]
	mov	BYTE PTR [eax], 10			; 0000000aH
	mov	eax, DWORD PTR _asm_out_file
	inc	DWORD PTR [eax]
	jmp	$L1112
$L1111:
	mov	eax, DWORD PTR _asm_out_file
	push	eax
	push	10					; 0000000aH
	call	__flsbuf
	add	esp, 8
$L1112:
; Line 263
	call	_assemble_integer_zero
; Line 264
	push	3
	push	OFFSET $SG643
	push	OFFSET $SG644
	lea	eax, DWORD PTR _name$628[ebp]
	push	eax
	call	_sprintf
	add	esp, 16					; 00000010H
; Line 265
	push	OFFSET $SG645
	mov	eax, DWORD PTR _asm_out_file
	push	eax
	call	_fprintf
	add	esp, 8
	lea	eax, DWORD PTR _name$628[ebp]
	push	eax
	push	4
	push	39					; 00000027H
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	push	eax
	mov	eax, DWORD PTR _asm_out_file
	push	eax
	call	_output_addr_const
	add	esp, 8
	mov	eax, DWORD PTR _asm_out_file
	dec	DWORD PTR [eax+4]
	mov	eax, DWORD PTR _asm_out_file
	cmp	DWORD PTR [eax+4], 0
	jl	$L1113
	mov	eax, DWORD PTR _asm_out_file
	mov	eax, DWORD PTR [eax]
	mov	BYTE PTR [eax], 10			; 0000000aH
	mov	eax, DWORD PTR _asm_out_file
	inc	DWORD PTR [eax]
	jmp	$L1114
$L1113:
	mov	eax, DWORD PTR _asm_out_file
	push	eax
	push	10					; 0000000aH
	call	__flsbuf
	add	esp, 8
$L1114:
; Line 268
	push	1
	push	OFFSET $SG646
	push	OFFSET $SG647
	mov	eax, DWORD PTR _asm_out_file
	push	eax
	call	_fprintf
	add	esp, 16					; 00000010H
; Line 270
	mov	eax, DWORD PTR _filename$[ebp]
	push	eax
	call	_strlen
	add	esp, 4
	mov	DWORD PTR _len$648[ebp], eax
; Line 271
	mov	eax, DWORD PTR _len$648[ebp]
	add	eax, 3
	push	eax
	call	_alloca
	add	esp, 4
	mov	DWORD PTR _data_file$650[ebp], eax
; Line 272
	mov	eax, DWORD PTR _filename$[ebp]
	push	eax
	mov	eax, DWORD PTR _data_file$650[ebp]
	push	eax
	call	_strcpy
	add	esp, 8
; Line 273
	cmp	DWORD PTR _len$648[ebp], 2
	jle	$L654
	mov	eax, DWORD PTR _len$648[ebp]
	add	eax, DWORD PTR _data_file$650[ebp]
	sub	eax, 2
	push	eax
	push	OFFSET $SG655
	call	_strcmp
	add	esp, 8
	or	eax, eax
	jne	$L654
; Line 274
	mov	eax, DWORD PTR _len$648[ebp]
	mov	ecx, DWORD PTR _data_file$650[ebp]
	mov	BYTE PTR [eax+ecx-2], 0
; Line 275
	jmp	$L656
$L654:
	cmp	DWORD PTR _len$648[ebp], 2
	jle	$L657
	mov	eax, DWORD PTR _len$648[ebp]
	add	eax, DWORD PTR _data_file$650[ebp]
	sub	eax, 2
	push	eax
	push	OFFSET $SG658
	call	_strcmp
	add	esp, 8
	or	eax, eax
	jne	$L657
; Line 276
	mov	eax, DWORD PTR _len$648[ebp]
	mov	ecx, DWORD PTR _data_file$650[ebp]
	mov	BYTE PTR [eax+ecx-2], 0
; Line 277
	jmp	$L659
$L657:
	cmp	DWORD PTR _len$648[ebp], 3
	jle	$L660
	mov	eax, DWORD PTR _len$648[ebp]
	add	eax, DWORD PTR _data_file$650[ebp]
	sub	eax, 3
	push	eax
	push	OFFSET $SG661
	call	_strcmp
	add	esp, 8
	or	eax, eax
	jne	$L660
; Line 278
	mov	eax, DWORD PTR _len$648[ebp]
	mov	ecx, DWORD PTR _data_file$650[ebp]
	mov	BYTE PTR [eax+ecx-3], 0
; Line 279
$L660:
$L659:
$L656:
	push	OFFSET $SG663
	mov	eax, DWORD PTR _data_file$650[ebp]
	push	eax
	call	_strcat
	add	esp, 8
; Line 280
	mov	eax, DWORD PTR _data_file$650[ebp]
	push	eax
	call	_strlen
	add	esp, 4
	inc	eax
	push	eax
	mov	eax, DWORD PTR _data_file$650[ebp]
	push	eax
	call	_assemble_string
	add	esp, 8
; Line 284
	push	4
	call	_exact_log2
	add	esp, 4
	or	eax, eax
	je	$L665
; Line 286
	push	4
	call	_exact_log2
	add	esp, 4
	push	eax
	push	OFFSET $SG666
	mov	eax, DWORD PTR _asm_out_file
	push	eax
	call	_fprintf
	add	esp, 12					; 0000000cH
; Line 289
$L665:
	push	2
	push	OFFSET $SG667
	push	OFFSET $SG668
	mov	eax, DWORD PTR _asm_out_file
	push	eax
	call	_fprintf
	add	esp, 16					; 00000010H
; Line 290
	mov	eax, DWORD PTR _count_basic_blocks$S604
	shl	eax, 2
	push	eax
	push	OFFSET $SG669
	mov	eax, DWORD PTR _asm_out_file
	push	eax
	call	_fprintf
	add	esp, 12					; 0000000cH
; Line 293
	call	_text_section
; Line 294
	push	3
	push	OFFSET $SG671
	push	OFFSET $SG672
	mov	eax, DWORD PTR _asm_out_file
	push	eax
	call	_fprintf
	add	esp, 16					; 00000010H
; Line 295
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L673
$L674:
	inc	DWORD PTR _i$[ebp]
$L673:
	mov	eax, DWORD PTR _count_basic_blocks$S604
	cmp	DWORD PTR _i$[ebp], eax
	jge	$L675
; Line 298
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	push	OFFSET $SG677
	push	OFFSET $SG678
	lea	eax, DWORD PTR _name$676[ebp]
	push	eax
	call	_sprintf
	add	esp, 16					; 00000010H
; Line 299
	push	OFFSET $SG679
	mov	eax, DWORD PTR _asm_out_file
	push	eax
	call	_fprintf
	add	esp, 8
	lea	eax, DWORD PTR _name$676[ebp]
	push	eax
	push	4
	push	39					; 00000027H
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	push	eax
	mov	eax, DWORD PTR _asm_out_file
	push	eax
	call	_output_addr_const
	add	esp, 8
	mov	eax, DWORD PTR _asm_out_file
	dec	DWORD PTR [eax+4]
	mov	eax, DWORD PTR _asm_out_file
	cmp	DWORD PTR [eax+4], 0
	jl	$L1115
	mov	eax, DWORD PTR _asm_out_file
	mov	eax, DWORD PTR [eax]
	mov	BYTE PTR [eax], 10			; 0000000aH
	mov	eax, DWORD PTR _asm_out_file
	inc	DWORD PTR [eax]
	jmp	$L1116
$L1115:
	mov	eax, DWORD PTR _asm_out_file
	push	eax
	push	10					; 0000000aH
	call	__flsbuf
	add	esp, 8
$L1116:
; Line 300
	jmp	$L674
$L675:
; Line 304
	push	3
	push	OFFSET $SG680
	push	OFFSET $SG681
	lea	eax, DWORD PTR _name$628[ebp]
	push	eax
	call	_sprintf
	add	esp, 16					; 00000010H
; Line 305
	push	OFFSET $SG682
	mov	eax, DWORD PTR _asm_out_file
	push	eax
	call	_fprintf
	add	esp, 8
	lea	eax, DWORD PTR _name$628[ebp]
	push	eax
	push	4
	push	39					; 00000027H
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	push	eax
	mov	eax, DWORD PTR _asm_out_file
	push	eax
	call	_output_addr_const
	add	esp, 8
	mov	eax, DWORD PTR _asm_out_file
	dec	DWORD PTR [eax+4]
	mov	eax, DWORD PTR _asm_out_file
	cmp	DWORD PTR [eax+4], 0
	jl	$L1117
	mov	eax, DWORD PTR _asm_out_file
	mov	eax, DWORD PTR [eax]
	mov	BYTE PTR [eax], 10			; 0000000aH
	mov	eax, DWORD PTR _asm_out_file
	inc	DWORD PTR [eax]
	jmp	$L1118
$L1117:
	mov	eax, DWORD PTR _asm_out_file
	push	eax
	push	10					; 0000000aH
	call	__flsbuf
	add	esp, 8
$L1118:
; Line 307
$L627:
$L625:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_end_final ENDP
_TEXT	ENDS
PUBLIC	_app_enable
_DATA	SEGMENT
$SG686	DB	'/APP', 0aH, 00H
_DATA	ENDS
_TEXT	SEGMENT
_app_enable PROC NEAR
; Line 314
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 315
	cmp	DWORD PTR _app_on$S618, 0
	jne	$L685
; Line 317
	push	OFFSET $SG686
	mov	eax, DWORD PTR _asm_out_file
	push	eax
	call	_fprintf
	add	esp, 8
; Line 318
	mov	DWORD PTR _app_on$S618, 1
; Line 320
$L685:
$L684:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_app_enable ENDP
_TEXT	ENDS
PUBLIC	_app_disable
_DATA	SEGMENT
	ORG $+2
$SG690	DB	'/NO_APP', 0aH, 00H
_DATA	ENDS
_TEXT	SEGMENT
_app_disable PROC NEAR
; Line 327
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 328
	cmp	DWORD PTR _app_on$S618, 0
	je	$L689
; Line 330
	push	OFFSET $SG690
	mov	eax, DWORD PTR _asm_out_file
	push	eax
	call	_fprintf
	add	esp, 8
; Line 331
	mov	DWORD PTR _app_on$S618, 0
; Line 333
$L689:
$L688:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_app_disable ENDP
_TEXT	ENDS
PUBLIC	_profile_function
PUBLIC	_final_start_function
EXTRN	_profile_flag:DWORD
EXTRN	_function_prologue:NEAR
EXTRN	_get_frame_size:NEAR
_BSS	SEGMENT
_last_linenum$S603 DD 01H DUP (?)
_this_is_asm_operands$S605 DD 01H DUP (?)
_block_depth$S617 DD 01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
	ORG $+3
$SG698	DB	09H, '.gdbbeg %d', 0aH, 00H
_DATA	ENDS
_TEXT	SEGMENT
_first$ = 8
_file$ = 12
_write_symbols$ = 16
_final_start_function PROC NEAR
; Line 372
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 373
	mov	DWORD PTR _block_depth$S617, 0
; Line 375
	mov	DWORD PTR _this_is_asm_operands$S605, 0
; Line 379
	cmp	DWORD PTR _write_symbols$[ebp], 1
	jne	$L697
; Line 381
	mov	eax, DWORD PTR _next_block_index
	mov	ecx, DWORD PTR _block_depth$S617
	mov	edx, DWORD PTR _pending_blocks$S616
	mov	DWORD PTR [edx+ecx*4], eax
	inc	DWORD PTR _block_depth$S617
; Line 382
	mov	eax, DWORD PTR _next_block_index
	mov	DWORD PTR -4+[ebp], eax
	inc	DWORD PTR _next_block_index
	mov	eax, DWORD PTR -4+[ebp]
	push	eax
	push	OFFSET $SG698
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	call	_fprintf
	add	esp, 12					; 0000000cH
; Line 389
$L697:
	mov	eax, DWORD PTR _first$[ebp]
	cmp	DWORD PTR [eax+20], -1
	je	$L699
; Line 391
	cmp	DWORD PTR _write_symbols$[ebp], 3
	jne	$L700
; Line 397
	mov	eax, DWORD PTR _first$[ebp]
	mov	eax, DWORD PTR [eax+20]
	mov	DWORD PTR _last_linenum$S603, eax
; Line 398
	jmp	$L701
$L700:
; Line 399
	mov	eax, DWORD PTR _write_symbols$[ebp]
	push	eax
	mov	eax, DWORD PTR _first$[ebp]
	push	eax
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	call	_output_source_line
	add	esp, 12					; 0000000cH
$L701:
; Line 411
$L699:
	call	_get_frame_size
	push	eax
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	call	_function_prologue
	add	esp, 8
; Line 426
	cmp	DWORD PTR _profile_flag, 0
	je	$L704
; Line 427
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	call	_profile_function
	add	esp, 4
; Line 430
$L704:
	inc	DWORD PTR _profile_label_no
; Line 431
$L696:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_final_start_function ENDP
_TEXT	ENDS
EXTRN	_floor_log2:NEAR
EXTRN	_current_function_returns_struct:DWORD
EXTRN	_current_function_needs_context:DWORD
_DATA	SEGMENT
	ORG $+3
$SG713	DB	09H, '.align %d', 0aH, 00H
$SG714	DB	'LP', 00H
	ORG $+1
$SG715	DB	'%s%d:', 0aH, 00H
	ORG $+1
$SG716	DB	'L', 00H
	ORG $+2
$SG717	DB	09H, 'movl $%sP%d,%%edx', 0aH, 09H, 'call _mcount', 0aH, 00H
_DATA	ENDS
_TEXT	SEGMENT
_file$ = 8
_align$ = -8
_sval$ = -12
_cxt$ = -4
_profile_function PROC NEAR
; Line 435
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
	push	ebx
	push	esi
	push	edi
; Line 436
	mov	DWORD PTR _align$[ebp], 32		; 00000020H
; Line 439
	mov	eax, DWORD PTR _current_function_returns_struct
	mov	DWORD PTR _sval$[ebp], eax
; Line 440
	mov	eax, DWORD PTR _current_function_needs_context
	mov	DWORD PTR _cxt$[ebp], eax
; Line 442
	call	_data_section
; Line 443
	mov	eax, DWORD PTR _align$[ebp]
	cdq
	and	edx, 7
	add	eax, edx
	sar	eax, 3
	push	eax
	call	_floor_log2
	add	esp, 4
	or	eax, eax
	je	$L712
	mov	eax, DWORD PTR _align$[ebp]
	cdq
	and	edx, 7
	add	eax, edx
	sar	eax, 3
	push	eax
	call	_floor_log2
	add	esp, 4
	push	eax
	push	OFFSET $SG713
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	call	_fprintf
	add	esp, 12					; 0000000cH
; Line 444
$L712:
	mov	eax, DWORD PTR _profile_label_no
	push	eax
	push	OFFSET $SG714
	push	OFFSET $SG715
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	call	_fprintf
	add	esp, 16					; 00000010H
; Line 445
	call	_assemble_integer_zero
; Line 447
	call	_text_section
; Line 471
	mov	eax, DWORD PTR _profile_label_no
	push	eax
	push	OFFSET $SG716
	push	OFFSET $SG717
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	call	_fprintf
	add	esp, 16					; 00000010H
; Line 494
$L707:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_profile_function ENDP
_TEXT	ENDS
PUBLIC	_final_end_function
EXTRN	_function_epilogue:NEAR
_DATA	SEGMENT
	ORG $+2
$SG725	DB	'/NO_APP', 0aH, 00H
	ORG $+3
$SG727	DB	09H, '.gdbend %d', 0aH, 00H
_DATA	ENDS
_TEXT	SEGMENT
_file$ = 12
_write_symbols$ = 16
_final_end_function PROC NEAR
; Line 506
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 507
	cmp	DWORD PTR _app_on$S618, 0
	je	$L724
; Line 509
	push	OFFSET $SG725
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	call	_fprintf
	add	esp, 8
; Line 510
	mov	DWORD PTR _app_on$S618, 0
; Line 513
$L724:
	cmp	DWORD PTR _write_symbols$[ebp], 1
	jne	$L726
; Line 514
	mov	eax, DWORD PTR _pending_blocks$S616
	mov	eax, DWORD PTR [eax]
	push	eax
	push	OFFSET $SG727
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	call	_fprintf
	add	esp, 12					; 0000000cH
; Line 524
$L726:
	call	_get_frame_size
	push	eax
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	call	_function_epilogue
	add	esp, 8
; Line 534
$L723:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_final_end_function ENDP
_TEXT	ENDS
PUBLIC	_final_scan_insn
PUBLIC	_final
EXTRN	_init_recog:NEAR
_TEXT	SEGMENT
_first$ = 8
_file$ = 12
_write_symbols$ = 16
_optimize$ = 20
_prescan$ = 24
_insn$ = -4
_final	PROC NEAR
; Line 554
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 557
	mov	DWORD PTR _last_ignored_compare$S608, 0
; Line 558
	mov	DWORD PTR _new_block$S609, 1
; Line 560
	call	_init_recog
; Line 562
	mov	DWORD PTR _cc_status, 0
	mov	DWORD PTR _cc_status+4, 0
	mov	DWORD PTR _cc_status+8, 0
; Line 564
	mov	eax, DWORD PTR _first$[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	DWORD PTR _insn$[ebp], eax
$L739:
	cmp	DWORD PTR _insn$[ebp], 0
	je	$L740
; Line 566
	push	0
	mov	eax, DWORD PTR _prescan$[ebp]
	push	eax
	mov	eax, DWORD PTR _optimize$[ebp]
	push	eax
	mov	eax, DWORD PTR _write_symbols$[ebp]
	push	eax
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	mov	eax, DWORD PTR _insn$[ebp]
	push	eax
	call	_final_scan_insn
	add	esp, 24					; 00000018H
	mov	DWORD PTR _insn$[ebp], eax
	jmp	$L739
$L740:
; Line 567
$L735:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_final	ENDP
_TEXT	ENDS
PUBLIC	_alter_subreg
PUBLIC	_output_asm_insn
EXTRN	_abort:NEAR
EXTRN	_find_reg_note:NEAR
EXTRN	_rtx_equal_p:NEAR
EXTRN	_volatile_refs_p:NEAR
EXTRN	_peephole:NEAR
EXTRN	_flag_no_peephole:DWORD
EXTRN	_recog_memoized:NEAR
EXTRN	_insn_extract:NEAR
EXTRN	_recog_operand:BYTE
EXTRN	_insn_template:BYTE
EXTRN	_insn_outfun:BYTE
EXTRN	_insn_n_operands:BYTE
EXTRN	_free:NEAR
EXTRN	_constrain_operands:NEAR
EXTRN	_next_real_insn:NEAR
EXTRN	_notice_update_cc:NEAR
EXTRN	_asm_noperands:NEAR
EXTRN	_decode_asm_operands:NEAR
EXTRN	_xrealloc:NEAR
EXTRN	_pc_rtx:DWORD
EXTRN	_const0_rtx:DWORD
_BSS	SEGMENT
_insn_noperands$S606 DD 01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
	ORG $+3
$SG761	DB	'/NO_APP', 0aH, 00H
	ORG $+3
$SG766	DB	'LBB', 00H
$SG767	DB	'%s%d:', 0aH, 00H
	ORG $+1
$SG769	DB	09H, '.gdbbeg %d', 0aH, 00H
	ORG $+3
$SG773	DB	'LBE', 00H
$SG774	DB	'%s%d:', 0aH, 00H
	ORG $+1
$SG776	DB	09H, '.gdbend %d', 0aH, 00H
	ORG $+3
$SG780	DB	09H, '.align 2', 0aH, 00H
	ORG $+1
$SG784	DB	'/NO_APP', 0aH, 00H
	ORG $+3
$SG785	DB	'L', 00H
	ORG $+2
$SG786	DB	'%s%d:', 0aH, 00H
	ORG $+1
$SG797	DB	'LPB', 00H
$SG798	DB	'%s%d:', 0aH, 00H
	ORG $+1
$SG802	DB	'/APP', 0aH, 00H
	ORG $+2
$SG803	DB	09H, '%s', 0aH, 00H
	ORG $+3
$SG811	DB	'/APP', 0aH, 00H
	ORG $+2
$SG815	DB	'/NO_APP', 0aH, 00H
	ORG $+3
$SG823	DB	'L', 00H
	ORG $+2
$SG824	DB	09H, '.long ', 00H
$SG825	DB	'%s%s%d', 0aH, 00H
$SG834	DB	'L', 00H
	ORG $+2
$SG835	DB	'L', 00H
	ORG $+2
$SG836	DB	09H, '.word %s%d-%s%d', 0aH, 00H
_DATA	ENDS
_TEXT	SEGMENT
_i$838 = -52
_body$788 = -16
_result$853 = -56
_insn_code_number$789 = -8
_template$790 = -12
_real_body$794 = -20
_result$864 = -60
_noperands$805 = -24
_insn$ = 8
_next$870 = -64
_ops$806 = -32
_file$ = 12
_string$807 = -28
_write_symbols$ = 16
_note$872 = -72
_optimize$ = 20
_prev$873 = -68
_prescan$ = 24
_nopeepholes$ = 28
_i$ = -4
_vlen$817 = -40
_idx$818 = -36
_vlen$827 = -48
_idx$828 = -44
_final_scan_insn PROC NEAR
; Line 585
	push	ebp
	mov	ebp, esp
	sub	esp, 80					; 00000050H
	push	ebx
	push	esi
	push	edi
; Line 587
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	sar	eax, 16					; 00000010H
	mov	DWORD PTR -76+[ebp], eax
	jmp	$L749
; Line 589
$L753:
; Line 590
	cmp	DWORD PTR _prescan$[ebp], 0
	jle	$L754
; Line 591
	jmp	$L750
; Line 592
$L754:
	cmp	DWORD PTR _write_symbols$[ebp], 0
	jne	$L755
; Line 593
	jmp	$L750
; Line 594
$L755:
	mov	eax, DWORD PTR _insn$[ebp]
	cmp	DWORD PTR [eax+20], 0
	jne	$L756
; Line 600
	jmp	$L750
; Line 602
$L756:
; Line 603
	mov	eax, DWORD PTR _insn$[ebp]
	cmp	DWORD PTR [eax+20], -4			; fffffffcH
	je	$L758
	mov	eax, DWORD PTR _insn$[ebp]
	cmp	DWORD PTR [eax+20], -5			; fffffffbH
	jne	$L757
$L758:
; Line 604
	jmp	$L750
; Line 605
$L757:
	mov	eax, DWORD PTR _insn$[ebp]
	cmp	DWORD PTR [eax+20], -1
	jne	$L759
; Line 606
	jmp	$L750
; Line 607
$L759:
	cmp	DWORD PTR _app_on$S618, 0
	je	$L760
; Line 609
	push	OFFSET $SG761
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	call	_fprintf
	add	esp, 8
; Line 610
	mov	DWORD PTR _app_on$S618, 0
; Line 612
$L760:
	mov	eax, DWORD PTR _insn$[ebp]
	cmp	DWORD PTR [eax+20], -2			; fffffffeH
	jne	$L762
; Line 617
	mov	eax, DWORD PTR _max_block_depth$S615
	cmp	DWORD PTR _block_depth$S617, eax
	jne	$L763
; Line 620
	shl	DWORD PTR _max_block_depth$S615, 1
; Line 623
	mov	eax, DWORD PTR _max_block_depth$S615
	shl	eax, 2
	push	eax
	mov	eax, DWORD PTR _pending_blocks$S616
	push	eax
	call	_xrealloc
	add	esp, 8
	mov	DWORD PTR _pending_blocks$S616, eax
; Line 625
$L763:
	mov	eax, DWORD PTR _next_block_index
	mov	ecx, DWORD PTR _block_depth$S617
	mov	edx, DWORD PTR _pending_blocks$S616
	mov	DWORD PTR [edx+ecx*4], eax
	inc	DWORD PTR _block_depth$S617
; Line 634
	cmp	DWORD PTR _write_symbols$[ebp], 2
	jne	$L765
; Line 635
	mov	eax, DWORD PTR _next_block_index
	push	eax
	push	OFFSET $SG766
	push	OFFSET $SG767
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	call	_fprintf
	add	esp, 16					; 00000010H
; Line 637
$L765:
	cmp	DWORD PTR _write_symbols$[ebp], 1
	jne	$L768
; Line 638
	mov	eax, DWORD PTR _next_block_index
	push	eax
	push	OFFSET $SG769
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	call	_fprintf
	add	esp, 12					; 0000000cH
; Line 640
$L768:
	inc	DWORD PTR _next_block_index
; Line 642
	jmp	$L770
$L762:
	mov	eax, DWORD PTR _insn$[ebp]
	cmp	DWORD PTR [eax+20], -3			; fffffffdH
	jne	$L771
; Line 647
	dec	DWORD PTR _block_depth$S617
; Line 650
	cmp	DWORD PTR _write_symbols$[ebp], 2
	jne	$L772
	cmp	DWORD PTR _block_depth$S617, 0
	jl	$L772
; Line 652
	mov	eax, DWORD PTR _block_depth$S617
	mov	ecx, DWORD PTR _pending_blocks$S616
	mov	eax, DWORD PTR [ecx+eax*4]
	push	eax
	push	OFFSET $SG773
	push	OFFSET $SG774
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	call	_fprintf
	add	esp, 16					; 00000010H
; Line 660
$L772:
	cmp	DWORD PTR _write_symbols$[ebp], 1
	jne	$L775
; Line 661
	mov	eax, DWORD PTR _block_depth$S617
	mov	ecx, DWORD PTR _pending_blocks$S616
	mov	eax, DWORD PTR [ecx+eax*4]
	push	eax
	push	OFFSET $SG776
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	call	_fprintf
	add	esp, 12					; 0000000cH
; Line 662
$L775:
; Line 663
	jmp	$L777
$L771:
	mov	eax, DWORD PTR _insn$[ebp]
	cmp	DWORD PTR [eax+20], 0
	jle	$L778
; Line 665
	mov	eax, DWORD PTR _write_symbols$[ebp]
	push	eax
	mov	eax, DWORD PTR _insn$[ebp]
	push	eax
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	call	_output_source_line
	add	esp, 12					; 0000000cH
; Line 666
$L778:
$L777:
$L770:
	jmp	$L750
; Line 668
$L779:
; Line 670
	push	OFFSET $SG780
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	call	_fprintf
	add	esp, 8
; Line 672
	jmp	$L750
; Line 674
$L781:
; Line 675
	mov	DWORD PTR _cc_status, 0
	mov	DWORD PTR _cc_status+4, 0
	mov	DWORD PTR _cc_status+8, 0
; Line 676
	cmp	DWORD PTR _prescan$[ebp], 0
	jle	$L782
; Line 677
	jmp	$L750
; Line 678
$L782:
	mov	DWORD PTR _new_block$S609, 1
; Line 679
	cmp	DWORD PTR _app_on$S618, 0
	je	$L783
; Line 681
	push	OFFSET $SG784
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	call	_fprintf
	add	esp, 8
; Line 682
	mov	DWORD PTR _app_on$S618, 0
; Line 703
$L783:
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+16]
	push	eax
	push	OFFSET $SG785
	push	OFFSET $SG786
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	call	_fprintf
	add	esp, 16					; 00000010H
; Line 704
	jmp	$L750
; Line 706
$L787:
; Line 708
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	DWORD PTR _body$788[ebp], eax
; Line 716
	mov	eax, DWORD PTR _body$788[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1703936				; 001a0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L792
	mov	eax, DWORD PTR _body$788[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1769472				; 001b0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L791
$L792:
; Line 717
	jmp	$L750
; Line 719
$L791:
	cmp	DWORD PTR _profile_block_flag, 0
	je	$L793
	cmp	DWORD PTR _new_block$S609, 0
	je	$L793
; Line 721
	mov	eax, DWORD PTR _body$788[ebp]
	mov	DWORD PTR _real_body$794[ebp], eax
; Line 722
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1179648				; 00120000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L795
; Line 723
	mov	eax, DWORD PTR _insn$[ebp]
	push	eax
	call	_next_real_insn
	add	esp, 4
	mov	eax, DWORD PTR [eax+16]
	mov	DWORD PTR _real_body$794[ebp], eax
; Line 726
$L795:
; Line 727
	mov	eax, DWORD PTR _real_body$794[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1507328				; 00170000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L796
	mov	eax, DWORD PTR _real_body$794[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1572864				; 00180000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L796
; Line 729
	mov	DWORD PTR _new_block$S609, 0
; Line 732
	mov	eax, DWORD PTR _count_basic_blocks$S604
	push	eax
	push	OFFSET $SG797
	push	OFFSET $SG798
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	call	_fprintf
	add	esp, 16					; 00000010H
; Line 738
	inc	DWORD PTR _count_basic_blocks$S604
; Line 740
$L796:
; Line 742
$L793:
	mov	eax, DWORD PTR _body$788[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1376256				; 00150000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L799
; Line 745
	mov	DWORD PTR _cc_status, 0
	mov	DWORD PTR _cc_status+4, 0
	mov	DWORD PTR _cc_status+8, 0
; Line 746
	cmp	DWORD PTR _prescan$[ebp], 0
	jle	$L800
; Line 747
	jmp	$L750
; Line 748
$L800:
	cmp	DWORD PTR _app_on$S618, 0
	jne	$L801
; Line 750
	push	OFFSET $SG802
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	call	_fprintf
	add	esp, 8
; Line 751
	mov	DWORD PTR _app_on$S618, 1
; Line 753
$L801:
	mov	eax, DWORD PTR _body$788[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	push	OFFSET $SG803
	mov	eax, DWORD PTR _asm_out_file
	push	eax
	call	_fprintf
	add	esp, 12					; 0000000cH
; Line 754
	jmp	$L750
; Line 758
$L799:
	mov	eax, DWORD PTR _body$788[ebp]
	push	eax
	call	_asm_noperands
	add	esp, 4
	or	eax, eax
	jl	$L804
; Line 760
	mov	eax, DWORD PTR _body$788[ebp]
	push	eax
	call	_asm_noperands
	add	esp, 4
	mov	DWORD PTR _noperands$805[ebp], eax
; Line 765
	mov	DWORD PTR _cc_status, 0
	mov	DWORD PTR _cc_status+4, 0
	mov	DWORD PTR _cc_status+8, 0
; Line 766
	cmp	DWORD PTR _prescan$[ebp], 0
	jle	$L808
; Line 767
	jmp	$L750
; Line 771
$L808:
	cmp	DWORD PTR _noperands$805[ebp], 0
	jle	$L809
; Line 772
	mov	eax, DWORD PTR _noperands$805[ebp]
	shl	eax, 2
	push	eax
	call	_xmalloc
	add	esp, 4
	mov	DWORD PTR _ops$806[ebp], eax
; Line 774
$L809:
	cmp	DWORD PTR _app_on$S618, 0
	jne	$L810
; Line 776
	push	OFFSET $SG811
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	call	_fprintf
	add	esp, 8
; Line 777
	mov	DWORD PTR _app_on$S618, 1
; Line 781
$L810:
	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _ops$806[ebp]
	push	eax
	mov	eax, DWORD PTR _body$788[ebp]
	push	eax
	call	_decode_asm_operands
	add	esp, 20					; 00000014H
	mov	DWORD PTR _string$807[ebp], eax
; Line 783
	mov	eax, DWORD PTR _noperands$805[ebp]
	mov	DWORD PTR _insn_noperands$S606, eax
; Line 784
	mov	eax, DWORD PTR _insn$[ebp]
	mov	DWORD PTR _this_is_asm_operands$S605, eax
; Line 786
	mov	eax, DWORD PTR _ops$806[ebp]
	push	eax
	mov	eax, DWORD PTR _string$807[ebp]
	push	eax
	call	_output_asm_insn
	add	esp, 8
; Line 787
	mov	DWORD PTR _this_is_asm_operands$S605, 0
; Line 788
	cmp	DWORD PTR _noperands$805[ebp], 0
	jle	$L812
; Line 789
	mov	eax, DWORD PTR _ops$806[ebp]
	push	eax
	call	_free
	add	esp, 4
; Line 790
$L812:
	jmp	$L750
; Line 793
$L804:
	cmp	DWORD PTR _prescan$[ebp], 0
	jg	$L814
	cmp	DWORD PTR _app_on$S618, 0
	je	$L814
; Line 795
	push	OFFSET $SG815
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	call	_fprintf
	add	esp, 8
; Line 796
	mov	DWORD PTR _app_on$S618, 0
; Line 802
$L814:
	mov	eax, DWORD PTR _body$788[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1507328				; 00170000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L816
; Line 806
	cmp	DWORD PTR _prescan$[ebp], 0
	jle	$L819
; Line 807
	jmp	$L750
; Line 809
$L819:
	mov	eax, DWORD PTR _body$788[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _vlen$817[ebp], eax
; Line 810
	mov	DWORD PTR _idx$818[ebp], 0
	jmp	$L820
$L821:
	inc	DWORD PTR _idx$818[ebp]
$L820:
	mov	eax, DWORD PTR _vlen$817[ebp]
	cmp	DWORD PTR _idx$818[ebp], eax
	jge	$L822
; Line 812
	mov	eax, DWORD PTR _body$788[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _idx$818[ebp]
	mov	eax, DWORD PTR [eax+ecx*4+4]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+16]
	push	eax
	push	OFFSET $SG823
	push	OFFSET $SG824
	push	OFFSET $SG825
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	call	_fprintf
	add	esp, 20					; 00000014H
	jmp	$L821
$L822:
; Line 818
	jmp	$L750
; Line 820
$L816:
	mov	eax, DWORD PTR _body$788[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1572864				; 00180000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L826
; Line 824
	cmp	DWORD PTR _prescan$[ebp], 0
	jle	$L829
; Line 825
	jmp	$L750
; Line 827
$L829:
	mov	eax, DWORD PTR _body$788[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _vlen$827[ebp], eax
; Line 828
	mov	DWORD PTR _idx$828[ebp], 0
	jmp	$L830
$L831:
	inc	DWORD PTR _idx$828[ebp]
$L830:
	mov	eax, DWORD PTR _vlen$827[ebp]
	cmp	DWORD PTR _idx$828[ebp], eax
	jge	$L832
; Line 831
	call	_abort
	jmp	$L831
$L832:
	mov	eax, DWORD PTR _body$788[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+16]
	push	eax
	push	OFFSET $SG834
	mov	eax, DWORD PTR _body$788[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	ecx, DWORD PTR _idx$828[ebp]
	mov	eax, DWORD PTR [eax+ecx*4+4]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+16]
	push	eax
	push	OFFSET $SG835
	push	OFFSET $SG836
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	call	_fprintf
	add	esp, 24					; 00000018H
; Line 837
	jmp	$L750
; Line 840
$L826:
; Line 841
	mov	eax, DWORD PTR _insn$[ebp]
	push	eax
	call	_recog_memoized
	add	esp, 4
	cmp	eax, -1
	jne	$L837
	mov	eax, DWORD PTR _body$788[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 720896				; 000b0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L837
; Line 844
	cmp	DWORD PTR _prescan$[ebp], 0
	jle	$L839
; Line 845
	jmp	$L750
; Line 846
$L839:
	mov	eax, DWORD PTR _body$788[ebp]
	mov	DWORD PTR _final_sequence, eax
; Line 847
	mov	DWORD PTR _i$838[ebp], 0
	jmp	$L840
$L841:
	inc	DWORD PTR _i$838[ebp]
$L840:
	mov	eax, DWORD PTR _body$788[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _i$838[ebp]
	cmp	DWORD PTR [eax], ecx
	jbe	$L842
; Line 849
	push	1
	mov	eax, DWORD PTR _prescan$[ebp]
	push	eax
	mov	eax, DWORD PTR _optimize$[ebp]
	push	eax
	mov	eax, DWORD PTR _write_symbols$[ebp]
	push	eax
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	mov	eax, DWORD PTR _body$788[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _i$838[ebp]
	mov	eax, DWORD PTR [eax+ecx*4+4]
	push	eax
	call	_final_scan_insn
	add	esp, 24					; 00000018H
	jmp	$L841
$L842:
; Line 850
	mov	DWORD PTR _final_sequence, 0
; Line 854
	jmp	$L750
; Line 859
$L837:
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	DWORD PTR _body$788[ebp], eax
; Line 872
	cmp	DWORD PTR _optimize$[ebp], 0
	je	$L843
	mov	eax, DWORD PTR _body$788[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1638400				; 00190000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L843
	mov	eax, DWORD PTR _body$788[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2621440				; 00280000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L843
	mov	eax, DWORD PTR _insn$[ebp]
	cmp	DWORD PTR _last_ignored_compare$S608, eax
	je	$L843
; Line 874
	mov	eax, DWORD PTR _body$788[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2293760				; 00230000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L844
; Line 875
	mov	eax, DWORD PTR _body$788[ebp]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	call	_alter_subreg
	add	esp, 4
	mov	ecx, DWORD PTR _body$788[ebp]
	mov	DWORD PTR [ecx+8], eax
; Line 876
$L844:
; Line 879
	cmp	DWORD PTR _cc_status+4, 0
	je	$L848
	mov	eax, DWORD PTR _cc_status+4
	push	eax
	mov	eax, DWORD PTR _body$788[ebp]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	call	_rtx_equal_p
	add	esp, 8
	or	eax, eax
	jne	$L847
$L848:
	cmp	DWORD PTR _cc_status+8, 0
	je	$L846
	mov	eax, DWORD PTR _cc_status+8
	push	eax
	mov	eax, DWORD PTR _body$788[ebp]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	call	_rtx_equal_p
	add	esp, 8
	or	eax, eax
	je	$L846
$L847:
; Line 884
	push	0
	push	2
	mov	eax, DWORD PTR _insn$[ebp]
	push	eax
	call	_find_reg_note
	add	esp, 12					; 0000000cH
	or	eax, eax
	jne	$L850
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+16]
	push	eax
	call	_volatile_refs_p
	add	esp, 4
	or	eax, eax
	jne	$L850
; Line 887
	mov	eax, DWORD PTR _insn$[ebp]
	mov	DWORD PTR _last_ignored_compare$S608, eax
; Line 888
	jmp	$L750
; Line 890
$L850:
; Line 891
$L846:
; Line 894
$L843:
; Line 895
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 917504				; 000e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L851
	mov	eax, DWORD PTR _body$788[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1638400				; 00190000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L851
	mov	eax, DWORD PTR _body$788[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2490368				; 00260000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L851
; Line 896
	mov	DWORD PTR _new_block$S609, 1
; Line 903
$L851:
; Line 910
	cmp	DWORD PTR _cc_status, 0
	je	$L852
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 917504				; 000e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L852
	mov	eax, DWORD PTR _body$788[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1638400				; 00190000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L852
	mov	eax, DWORD PTR _body$788[ebp]
	mov	ecx, DWORD PTR _pc_rtx
	cmp	DWORD PTR [eax+4], ecx
	jne	$L852
	mov	eax, DWORD PTR _body$788[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2752512				; 002a0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L852
	cmp	DWORD PTR _prescan$[ebp], 0
	jl	$L852
; Line 917
	mov	eax, DWORD PTR _body$788[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	call	_alter_cond
	add	esp, 4
	mov	DWORD PTR _result$853[ebp], eax
; Line 920
	cmp	DWORD PTR _result$853[ebp], 1
	jne	$L854
; Line 921
	mov	eax, DWORD PTR _body$788[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+8]
	mov	ecx, DWORD PTR _body$788[ebp]
	mov	DWORD PTR [ecx+8], eax
; Line 922
$L854:
	cmp	DWORD PTR _result$853[ebp], -1
	jne	$L855
; Line 923
	mov	eax, DWORD PTR _body$788[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+12]
	mov	ecx, DWORD PTR _body$788[ebp]
	mov	DWORD PTR [ecx+8], eax
; Line 927
$L855:
	mov	eax, DWORD PTR _body$788[ebp]
	mov	ecx, DWORD PTR _pc_rtx
	cmp	DWORD PTR [eax+8], ecx
	jne	$L856
; Line 929
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax]
	and	eax, -65518				; ffff0012H
	or	eax, 18					; 00000012H
	mov	ecx, DWORD PTR _insn$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 930
	mov	eax, DWORD PTR _insn$[ebp]
	mov	DWORD PTR [eax+20], -1
; Line 931
	mov	eax, DWORD PTR _insn$[ebp]
	mov	DWORD PTR [eax+16], 0
; Line 932
	jmp	$L750
; Line 935
$L856:
	cmp	DWORD PTR _result$853[ebp], 0
	je	$L857
; Line 936
	mov	eax, DWORD PTR _insn$[ebp]
	mov	DWORD PTR [eax+20], -1
; Line 937
$L857:
; Line 943
$L852:
; Line 944
	cmp	DWORD PTR _cc_status, 0
	je	$L858
	mov	eax, DWORD PTR _body$788[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1638400				; 00190000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L858
; Line 945
	mov	eax, DWORD PTR _body$788[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	sar	eax, 16					; 00000010H
	mov	DWORD PTR -80+[ebp], eax
	jmp	$L859
; Line 947
$L863:
; Line 959
	mov	eax, DWORD PTR _body$788[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2621440				; 00280000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L865
; Line 960
	jmp	$L860
; Line 961
$L865:
	mov	eax, DWORD PTR _body$788[ebp]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	call	_alter_cond
	add	esp, 4
	mov	DWORD PTR _result$864[ebp], eax
; Line 962
	cmp	DWORD PTR _result$864[ebp], 1
	jne	$L866
; Line 964
	push	1
	push	0
	push	30					; 0000001eH
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	mov	ecx, DWORD PTR _body$788[ebp]
	mov	DWORD PTR [ecx+8], eax
; Line 965
$L866:
	cmp	DWORD PTR _result$864[ebp], -1
	jne	$L867
; Line 966
	mov	eax, DWORD PTR _const0_rtx
	mov	ecx, DWORD PTR _body$788[ebp]
	mov	DWORD PTR [ecx+8], eax
; Line 967
$L867:
	cmp	DWORD PTR _result$864[ebp], 0
	je	$L868
; Line 968
	mov	eax, DWORD PTR _insn$[ebp]
	mov	DWORD PTR [eax+20], -1
; Line 969
$L868:
; Line 970
	jmp	$L860
$L859:
	cmp	DWORD PTR -80+[ebp], 67			; 00000043H
	jl	$L860
	cmp	DWORD PTR -80+[ebp], 76			; 0000004cH
	jle	$L863
	jmp	$L860
$L860:
; Line 975
$L858:
	cmp	DWORD PTR _optimize$[ebp], 0
	je	$L869
	cmp	DWORD PTR _flag_no_peephole, 0
	jne	$L869
	cmp	DWORD PTR _nopeepholes$[ebp], 0
	jne	$L869
; Line 977
	mov	eax, DWORD PTR _insn$[ebp]
	push	eax
	call	_peephole
	add	esp, 4
	mov	DWORD PTR _next$870[ebp], eax
; Line 980
	cmp	DWORD PTR _next$870[ebp], 0
	je	$L871
	mov	eax, DWORD PTR _insn$[ebp]
	mov	ecx, DWORD PTR _next$870[ebp]
	cmp	DWORD PTR [eax+12], ecx
	je	$L871
; Line 982
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	DWORD PTR _note$872[ebp], eax
; Line 983
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _prev$873[ebp], eax
; Line 984
$L875:
	mov	eax, DWORD PTR _note$872[ebp]
	cmp	DWORD PTR _next$870[ebp], eax
	je	$L876
; Line 987
	mov	eax, DWORD PTR _nopeepholes$[ebp]
	push	eax
	mov	eax, DWORD PTR _prescan$[ebp]
	push	eax
	mov	eax, DWORD PTR _optimize$[ebp]
	push	eax
	mov	eax, DWORD PTR _write_symbols$[ebp]
	push	eax
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	mov	eax, DWORD PTR _note$872[ebp]
	push	eax
	call	_final_scan_insn
	add	esp, 24					; 00000018H
; Line 988
	mov	eax, DWORD PTR _note$872[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	DWORD PTR _note$872[ebp], eax
; Line 989
	jmp	$L875
$L876:
; Line 992
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	DWORD PTR _note$872[ebp], eax
; Line 993
	mov	eax, DWORD PTR _prev$873[ebp]
	mov	ecx, DWORD PTR _note$872[ebp]
	mov	DWORD PTR [ecx+8], eax
; Line 994
	mov	eax, DWORD PTR _note$872[ebp]
	mov	ecx, DWORD PTR _prev$873[ebp]
	mov	DWORD PTR [ecx+12], eax
; Line 995
	mov	eax, DWORD PTR _insn$[ebp]
	mov	ecx, DWORD PTR _next$870[ebp]
	mov	ecx, DWORD PTR [ecx+8]
	mov	DWORD PTR [ecx+12], eax
; Line 996
	mov	eax, DWORD PTR _next$870[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	ecx, DWORD PTR _insn$[ebp]
	mov	DWORD PTR [ecx+8], eax
; Line 997
	mov	eax, DWORD PTR _next$870[ebp]
	mov	ecx, DWORD PTR _insn$[ebp]
	mov	DWORD PTR [ecx+12], eax
; Line 998
	mov	eax, DWORD PTR _insn$[ebp]
	mov	ecx, DWORD PTR _next$870[ebp]
	mov	DWORD PTR [ecx+8], eax
; Line 1002
$L871:
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	DWORD PTR _body$788[ebp], eax
; Line 1010
$L869:
	mov	eax, DWORD PTR _insn$[ebp]
	push	eax
	call	_recog_memoized
	add	esp, 4
	mov	DWORD PTR _insn_code_number$789[ebp], eax
; Line 1011
	mov	eax, DWORD PTR _insn$[ebp]
	push	eax
	call	_insn_extract
	add	esp, 4
; Line 1012
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L877
$L878:
	inc	DWORD PTR _i$[ebp]
$L877:
	mov	eax, DWORD PTR _insn_code_number$789[ebp]
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	DWORD PTR _insn_n_operands[eax*4], ecx
	jle	$L879
; Line 1014
	mov	eax, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _recog_operand[eax*4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2293760				; 00230000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L880
; Line 1015
	mov	eax, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _recog_operand[eax*4]
	push	eax
	call	_alter_subreg
	add	esp, 4
	mov	ecx, DWORD PTR _i$[ebp]
	mov	DWORD PTR _recog_operand[ecx*4], eax
; Line 1016
$L880:
	jmp	$L878
$L879:
; Line 1019
	mov	eax, DWORD PTR _insn_code_number$789[ebp]
	push	eax
	call	_constrain_operands
	add	esp, 4
	or	eax, eax
	jne	$L882
; Line 1020
	call	_abort
; Line 1031
$L882:
	mov	eax, OFFSET _cc_status
	mov	ecx, OFFSET _cc_prev_status
	mov	edx, DWORD PTR [eax]
	mov	DWORD PTR [ecx], edx
	mov	edx, DWORD PTR [eax+4]
	mov	DWORD PTR [ecx+4], edx
	mov	edx, DWORD PTR [eax+8]
	mov	DWORD PTR [ecx+8], edx
	mov	eax, DWORD PTR [eax+12]
	mov	DWORD PTR [ecx+12], eax
; Line 1038
	mov	eax, DWORD PTR _body$788[ebp]
	push	eax
	call	_notice_update_cc
	add	esp, 4
; Line 1043
	mov	eax, DWORD PTR _insn_code_number$789[ebp]
	mov	eax, DWORD PTR _insn_template[eax*4]
	mov	DWORD PTR _template$790[ebp], eax
; Line 1044
	cmp	DWORD PTR _template$790[ebp], 0
	jne	$L884
; Line 1046
	mov	eax, DWORD PTR _insn$[ebp]
	push	eax
	push	OFFSET _recog_operand
	mov	eax, DWORD PTR _insn_code_number$789[ebp]
	call	DWORD PTR _insn_outfun[eax*4]
	add	esp, 8
	mov	DWORD PTR _template$790[ebp], eax
; Line 1051
	cmp	DWORD PTR _template$790[ebp], 0
	jne	$L885
; Line 1053
	mov	eax, DWORD PTR _insn$[ebp]
	mov	ecx, DWORD PTR _last_ignored_compare$S608
	cmp	DWORD PTR [eax+8], ecx
	je	$L886
; Line 1054
	call	_abort
; Line 1055
$L886:
	mov	DWORD PTR _new_block$S609, 0
; Line 1056
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+8]
	jmp	$L747
; Line 1058
$L885:
; Line 1060
$L884:
	cmp	DWORD PTR _prescan$[ebp], 0
	jle	$L887
; Line 1061
	jmp	$L750
; Line 1065
$L887:
	push	OFFSET _recog_operand
	mov	eax, DWORD PTR _template$790[ebp]
	push	eax
	call	_output_asm_insn
	add	esp, 8
; Line 1068
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax]
	or	eax, 134217728				; 08000000H
	mov	ecx, DWORD PTR _insn$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 1070
	jmp	$L750
$L749:
	cmp	DWORD PTR -76+[ebp], 16			; 00000010H
	je	$L779
	cmp	DWORD PTR -76+[ebp], 17			; 00000011H
	je	$L781
	cmp	DWORD PTR -76+[ebp], 18			; 00000012H
	je	$L753
	jmp	$L787
$L750:
; Line 1071
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+12]
	jmp	$L747
; Line 1072
$L747:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_final_scan_insn ENDP
_TEXT	ENDS
PUBLIC	_set_current_gdbfile
EXTRN	_permalloc:NEAR
_BSS	SEGMENT
_current_gdbfile$S611 DD 01H DUP (?)
_BSS	ENDS
_TEXT	SEGMENT
_filename$ = 8
_f$ = -4
_set_current_gdbfile PROC NEAR
; Line 1079
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 1081
	mov	eax, DWORD PTR _gdbfiles
	mov	DWORD PTR _f$[ebp], eax
	jmp	$L892
$L893:
	mov	eax, DWORD PTR _f$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _f$[ebp], eax
$L892:
	cmp	DWORD PTR _f$[ebp], 0
	je	$L894
; Line 1082
	mov	eax, DWORD PTR _filename$[ebp]
	push	eax
	mov	eax, DWORD PTR _f$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	call	_strcmp
	add	esp, 8
	or	eax, eax
	jne	$L895
; Line 1083
	jmp	$L894
; Line 1085
$L895:
	jmp	$L893
$L894:
	cmp	DWORD PTR _f$[ebp], 0
	jne	$L896
; Line 1087
	push	16					; 00000010H
	call	_permalloc
	add	esp, 4
	mov	DWORD PTR _f$[ebp], eax
; Line 1088
	mov	eax, DWORD PTR _gdbfiles
	mov	ecx, DWORD PTR _f$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 1089
	mov	eax, DWORD PTR _f$[ebp]
	mov	DWORD PTR _gdbfiles, eax
; Line 1090
	mov	eax, DWORD PTR _filename$[ebp]
	mov	ecx, DWORD PTR _f$[ebp]
	mov	DWORD PTR [ecx+4], eax
; Line 1091
	mov	eax, DWORD PTR _next_gdb_filenum$S612
	mov	ecx, DWORD PTR _f$[ebp]
	mov	DWORD PTR [ecx+8], eax
	inc	DWORD PTR _next_gdb_filenum$S612
; Line 1092
	mov	eax, DWORD PTR _f$[ebp]
	mov	DWORD PTR [eax+12], 0
; Line 1094
$L896:
	mov	eax, DWORD PTR _f$[ebp]
	mov	DWORD PTR _current_gdbfile$S611, eax
; Line 1095
	mov	eax, DWORD PTR _filename$[ebp]
	mov	DWORD PTR _lastfile$S613, eax
; Line 1096
$L890:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_set_current_gdbfile ENDP
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+2
$SG906	DB	09H, '.gdbline %d,%d', 0aH, 00H
	ORG $+3
$SG912	DB	09H, '.stabs "%s",%d,0,0,Ltext', 0aH, 00H
	ORG $+1
$SG913	DB	09H, '.stabd %d,0,%d', 0aH, 00H
_DATA	ENDS
_TEXT	SEGMENT
_file$ = 8
_insn$ = 12
_write_symbols$ = 16
_filename$ = -4
_output_source_line PROC NEAR
; Line 1106
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 1107
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	DWORD PTR _filename$[ebp], eax
; Line 1109
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+20]
	mov	DWORD PTR _last_linenum$S603, eax
; Line 1111
	cmp	DWORD PTR _write_symbols$[ebp], 1
	jne	$L903
; Line 1118
	cmp	DWORD PTR _filename$[ebp], 0
	je	$L904
	cmp	DWORD PTR _lastfile$S613, 0
	je	$L905
	mov	eax, DWORD PTR _lastfile$S613
	push	eax
	mov	eax, DWORD PTR _filename$[ebp]
	push	eax
	call	_strcmp
	add	esp, 8
	or	eax, eax
	jne	$L905
	cmp	DWORD PTR _current_gdbfile$S611, 0
	jne	$L904
$L905:
; Line 1119
	mov	eax, DWORD PTR _filename$[ebp]
	push	eax
	call	_set_current_gdbfile
	add	esp, 4
; Line 1121
$L904:
	mov	eax, DWORD PTR _current_gdbfile$S611
	inc	DWORD PTR [eax+12]
; Line 1123
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+20]
	push	eax
	mov	eax, DWORD PTR _current_gdbfile$S611
	mov	eax, DWORD PTR [eax+8]
	push	eax
	push	OFFSET $SG906
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	call	_fprintf
	add	esp, 16					; 00000010H
; Line 1126
$L903:
	cmp	DWORD PTR _write_symbols$[ebp], 3
	je	$L908
	cmp	DWORD PTR _write_symbols$[ebp], 2
	jne	$L907
$L908:
; Line 1148
	cmp	DWORD PTR _write_symbols$[ebp], 2
	jne	$L909
; Line 1152
	cmp	DWORD PTR _filename$[ebp], 0
	je	$L910
	cmp	DWORD PTR _lastfile$S613, 0
	je	$L911
	mov	eax, DWORD PTR _lastfile$S613
	push	eax
	mov	eax, DWORD PTR _filename$[ebp]
	push	eax
	call	_strcmp
	add	esp, 8
	or	eax, eax
	je	$L910
$L911:
; Line 1158
	push	132					; 00000084H
	mov	eax, DWORD PTR _filename$[ebp]
	push	eax
	push	OFFSET $SG912
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	call	_fprintf
	add	esp, 16					; 00000010H
; Line 1160
	mov	eax, DWORD PTR _filename$[ebp]
	mov	DWORD PTR _lastfile$S613, eax
; Line 1162
$L910:
; Line 1167
$L909:
; Line 1168
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+20]
	push	eax
	push	68					; 00000044H
	push	OFFSET $SG913
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	call	_fprintf
	add	esp, 16					; 00000010H
; Line 1172
$L907:
$L901:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_output_source_line ENDP
_TEXT	ENDS
EXTRN	_plus_constant:NEAR
_TEXT	SEGMENT
_x$ = 8
_y$ = -4
_offset$921 = -8
_alter_subreg PROC NEAR
; Line 1180
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	push	ebx
	push	esi
	push	edi
; Line 1181
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _y$[ebp], eax
; Line 1182
	mov	eax, DWORD PTR _y$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2293760				; 00230000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L917
; Line 1183
	mov	eax, DWORD PTR _y$[ebp]
	push	eax
	call	_alter_subreg
	add	esp, 4
	mov	DWORD PTR _y$[ebp], eax
; Line 1185
$L917:
	mov	eax, DWORD PTR _y$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L918
; Line 1188
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	and	eax, -65502				; ffff0022H
	or	eax, 34					; 00000022H
	mov	ecx, DWORD PTR _x$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 1189
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	ecx, DWORD PTR _y$[ebp]
	add	eax, DWORD PTR [ecx+4]
	mov	ecx, DWORD PTR _x$[ebp]
	mov	DWORD PTR [ecx+4], eax
; Line 1191
	jmp	$L919
$L918:
	mov	eax, DWORD PTR _y$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2424832				; 00250000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L920
; Line 1193
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	shl	eax, 2
	mov	DWORD PTR _offset$921[ebp], eax
; Line 1198
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	and	eax, -65499				; ffff0025H
	or	eax, 37					; 00000025H
	mov	ecx, DWORD PTR _x$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 1199
	mov	eax, DWORD PTR _y$[ebp]
	mov	eax, DWORD PTR [eax]
	shr	eax, 27					; 0000001bH
	and	eax, 1
	shl	eax, 27					; 0000001bH
	mov	ecx, DWORD PTR _x$[ebp]
	mov	ecx, DWORD PTR [ecx]
	and	ecx, -134217729				; f7ffffffH
	or	eax, ecx
	mov	ecx, DWORD PTR _x$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 1200
	mov	eax, DWORD PTR _offset$921[ebp]
	push	eax
	mov	eax, DWORD PTR _y$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	call	_plus_constant
	add	esp, 8
	mov	ecx, DWORD PTR _x$[ebp]
	mov	DWORD PTR [ecx+4], eax
; Line 1202
	jmp	$L922
$L920:
	mov	eax, DWORD PTR _y$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2031616				; 001f0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L923
; Line 1203
	mov	eax, DWORD PTR _y$[ebp]
	jmp	$L915
; Line 1205
$L923:
$L922:
$L919:
	mov	eax, DWORD PTR _x$[ebp]
	jmp	$L915
; Line 1206
$L915:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_alter_subreg ENDP
_x$ = 8
_walk_alter_subreg PROC NEAR
; Line 1213
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 1214
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	sar	eax, 16					; 00000010H
	mov	DWORD PTR -4+[ebp], eax
	jmp	$L927
; Line 1216
$L931:
; Line 1218
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	call	_walk_alter_subreg
	add	esp, 4
	mov	ecx, DWORD PTR _x$[ebp]
	mov	DWORD PTR [ecx+4], eax
; Line 1219
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	call	_walk_alter_subreg
	add	esp, 4
	mov	ecx, DWORD PTR _x$[ebp]
	mov	DWORD PTR [ecx+8], eax
; Line 1220
	jmp	$L928
; Line 1222
$L932:
; Line 1223
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	call	_walk_alter_subreg
	add	esp, 4
	mov	ecx, DWORD PTR _x$[ebp]
	mov	DWORD PTR [ecx+4], eax
; Line 1224
	jmp	$L928
; Line 1226
$L933:
; Line 1227
	mov	eax, DWORD PTR _x$[ebp]
	push	eax
	call	_alter_subreg
	add	esp, 4
	jmp	$L926
; Line 1228
	jmp	$L928
$L927:
	cmp	DWORD PTR -4+[ebp], 35			; 00000023H
	je	$L933
	cmp	DWORD PTR -4+[ebp], 37			; 00000025H
	je	$L932
	cmp	DWORD PTR -4+[ebp], 44			; 0000002cH
	je	$L931
	cmp	DWORD PTR -4+[ebp], 47			; 0000002fH
	je	$L931
	jmp	$L928
$L928:
; Line 1230
	mov	eax, DWORD PTR _x$[ebp]
	jmp	$L926
; Line 1231
$L926:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_walk_alter_subreg ENDP
_cond$ = 8
_value$ = -4
_alter_cond PROC NEAR
; Line 1245
	push	ebp
	mov	ebp, esp
	sub	esp, 24					; 00000018H
	push	ebx
	push	esi
	push	edi
; Line 1246
	mov	DWORD PTR _value$[ebp], 0
; Line 1248
	test	BYTE PTR _cc_status, 1
	je	$L937
; Line 1250
	mov	DWORD PTR _value$[ebp], 2
; Line 1251
	mov	eax, DWORD PTR _cond$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	sar	eax, 16					; 00000010H
	mov	DWORD PTR -8+[ebp], eax
	jmp	$L938
; Line 1253
$L942:
; Line 1254
	mov	eax, DWORD PTR _cond$[ebp]
	mov	eax, DWORD PTR [eax]
	and	eax, -65467				; ffff0045H
	or	eax, 69					; 00000045H
	mov	ecx, DWORD PTR _cond$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 1255
	jmp	$L939
; Line 1256
$L943:
; Line 1257
	mov	eax, DWORD PTR _cond$[ebp]
	mov	eax, DWORD PTR [eax]
	and	eax, -65465				; ffff0047H
	or	eax, 71					; 00000047H
	mov	ecx, DWORD PTR _cond$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 1258
	jmp	$L939
; Line 1259
$L944:
; Line 1260
	mov	eax, DWORD PTR _cond$[ebp]
	mov	eax, DWORD PTR [eax]
	and	eax, -65466				; ffff0046H
	or	eax, 70					; 00000046H
	mov	ecx, DWORD PTR _cond$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 1261
	jmp	$L939
; Line 1262
$L945:
; Line 1263
	mov	eax, DWORD PTR _cond$[ebp]
	mov	eax, DWORD PTR [eax]
	and	eax, -65464				; ffff0048H
	or	eax, 72					; 00000048H
	mov	ecx, DWORD PTR _cond$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 1264
	jmp	$L939
; Line 1265
$L946:
; Line 1266
	mov	eax, DWORD PTR _cond$[ebp]
	mov	eax, DWORD PTR [eax]
	and	eax, -65463				; ffff0049H
	or	eax, 73					; 00000049H
	mov	ecx, DWORD PTR _cond$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 1267
	jmp	$L939
; Line 1268
$L947:
; Line 1269
	mov	eax, DWORD PTR _cond$[ebp]
	mov	eax, DWORD PTR [eax]
	and	eax, -65461				; ffff004bH
	or	eax, 75					; 0000004bH
	mov	ecx, DWORD PTR _cond$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 1270
	jmp	$L939
; Line 1271
$L948:
; Line 1272
	mov	eax, DWORD PTR _cond$[ebp]
	mov	eax, DWORD PTR [eax]
	and	eax, -65462				; ffff004aH
	or	eax, 74					; 0000004aH
	mov	ecx, DWORD PTR _cond$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 1273
	jmp	$L939
; Line 1274
$L949:
; Line 1275
	mov	eax, DWORD PTR _cond$[ebp]
	mov	eax, DWORD PTR [eax]
	and	eax, -65460				; ffff004cH
	or	eax, 76					; 0000004cH
	mov	ecx, DWORD PTR _cond$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 1276
	jmp	$L939
; Line 1277
	jmp	$L939
$L938:
	sub	DWORD PTR -8+[ebp], 69			; 00000045H
	cmp	DWORD PTR -8+[ebp], 7
	ja	$L939
	shl	DWORD PTR -8+[ebp], 2
	mov	eax, DWORD PTR -8+[ebp]
	jmp	DWORD PTR $L1119[eax]
$L1119:
	DD	OFFSET $L943
	DD	OFFSET $L945
	DD	OFFSET $L942
	DD	OFFSET $L944
	DD	OFFSET $L947
	DD	OFFSET $L949
	DD	OFFSET $L946
	DD	OFFSET $L948
$L939:
; Line 1280
$L937:
	test	BYTE PTR _cc_status, 2
	je	$L950
; Line 1281
	mov	eax, DWORD PTR _cond$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	sar	eax, 16					; 00000010H
	mov	DWORD PTR -12+[ebp], eax
	jmp	$L951
; Line 1283
$L955:
; Line 1287
	mov	eax, 1
	jmp	$L935
; Line 1289
$L956:
; Line 1293
	mov	eax, -1
	jmp	$L935
; Line 1295
$L957:
; Line 1296
	mov	eax, DWORD PTR _cond$[ebp]
	mov	eax, DWORD PTR [eax]
	and	eax, -65468				; ffff0044H
	or	eax, 68					; 00000044H
	mov	ecx, DWORD PTR _cond$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 1297
	mov	DWORD PTR _value$[ebp], 2
; Line 1298
	jmp	$L952
; Line 1300
$L958:
; Line 1301
	mov	eax, DWORD PTR _cond$[ebp]
	mov	eax, DWORD PTR [eax]
	and	eax, -65469				; ffff0043H
	or	eax, 67					; 00000043H
	mov	ecx, DWORD PTR _cond$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 1302
	mov	DWORD PTR _value$[ebp], 2
; Line 1303
	jmp	$L952
; Line 1304
	jmp	$L952
$L951:
	sub	DWORD PTR -12+[ebp], 69			; 00000045H
	cmp	DWORD PTR -12+[ebp], 7
	ja	$L952
	shl	DWORD PTR -12+[ebp], 2
	mov	eax, DWORD PTR -12+[ebp]
	jmp	DWORD PTR $L1120[eax]
$L1120:
	DD	OFFSET $L957
	DD	OFFSET $L956
	DD	OFFSET $L955
	DD	OFFSET $L958
	DD	OFFSET $L955
	DD	OFFSET $L956
	DD	OFFSET $L955
	DD	OFFSET $L956
$L952:
; Line 1306
$L950:
	test	BYTE PTR _cc_status, 4
	je	$L959
; Line 1307
	mov	eax, DWORD PTR _cond$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	sar	eax, 16					; 00000010H
	mov	DWORD PTR -16+[ebp], eax
	jmp	$L960
; Line 1309
$L964:
; Line 1312
	mov	eax, 1
	jmp	$L935
; Line 1314
$L965:
; Line 1317
	mov	eax, -1
	jmp	$L935
; Line 1319
$L966:
; Line 1321
	mov	eax, DWORD PTR _cond$[ebp]
	mov	eax, DWORD PTR [eax]
	and	eax, -65468				; ffff0044H
	or	eax, 68					; 00000044H
	mov	ecx, DWORD PTR _cond$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 1322
	mov	DWORD PTR _value$[ebp], 2
; Line 1323
	jmp	$L961
; Line 1325
$L967:
; Line 1327
	mov	eax, DWORD PTR _cond$[ebp]
	mov	eax, DWORD PTR [eax]
	and	eax, -65469				; ffff0043H
	or	eax, 67					; 00000043H
	mov	ecx, DWORD PTR _cond$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 1328
	mov	DWORD PTR _value$[ebp], 2
; Line 1329
	jmp	$L961
; Line 1330
	jmp	$L961
$L960:
	sub	DWORD PTR -16+[ebp], 69			; 00000045H
	cmp	DWORD PTR -16+[ebp], 7
	ja	$L961
	shl	DWORD PTR -16+[ebp], 2
	mov	eax, DWORD PTR -16+[ebp]
	jmp	DWORD PTR $L1121[eax]
$L1121:
	DD	OFFSET $L964
	DD	OFFSET $L967
	DD	OFFSET $L966
	DD	OFFSET $L965
	DD	OFFSET $L964
	DD	OFFSET $L967
	DD	OFFSET $L966
	DD	OFFSET $L965
$L961:
; Line 1332
$L959:
	test	BYTE PTR _cc_status, 8
	je	$L968
; Line 1333
	mov	eax, DWORD PTR _cond$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	sar	eax, 16					; 00000010H
	mov	DWORD PTR -20+[ebp], eax
	jmp	$L969
; Line 1335
$L973:
; Line 1337
	mov	eax, 1
	jmp	$L935
; Line 1339
$L974:
; Line 1340
	mov	eax, DWORD PTR _cond$[ebp]
	mov	eax, DWORD PTR [eax]
	and	eax, -65468				; ffff0044H
	or	eax, 68					; 00000044H
	mov	ecx, DWORD PTR _cond$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 1341
	mov	DWORD PTR _value$[ebp], 2
; Line 1342
	jmp	$L970
; Line 1344
$L975:
; Line 1345
	mov	eax, DWORD PTR _cond$[ebp]
	mov	eax, DWORD PTR [eax]
	and	eax, -65469				; ffff0043H
	or	eax, 67					; 00000043H
	mov	ecx, DWORD PTR _cond$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 1346
	mov	DWORD PTR _value$[ebp], 2
; Line 1347
	jmp	$L970
; Line 1349
$L976:
; Line 1351
	mov	eax, -1
	jmp	$L935
; Line 1352
	jmp	$L970
$L969:
	cmp	DWORD PTR -20+[ebp], 73			; 00000049H
	je	$L973
	cmp	DWORD PTR -20+[ebp], 74			; 0000004aH
	je	$L975
	cmp	DWORD PTR -20+[ebp], 75			; 0000004bH
	je	$L974
	cmp	DWORD PTR -20+[ebp], 76			; 0000004cH
	je	$L976
	jmp	$L970
$L970:
; Line 1354
$L968:
	test	BYTE PTR _cc_status, 48			; 00000030H
	je	$L977
; Line 1355
	mov	eax, DWORD PTR _cond$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	sar	eax, 16					; 00000010H
	mov	DWORD PTR -24+[ebp], eax
	jmp	$L978
; Line 1357
$L982:
; Line 1365
	call	_abort
; Line 1367
$L983:
; Line 1368
	mov	eax, DWORD PTR _cc_status
	and	eax, 32					; 00000020H
	cmp	eax, 1
	sbb	eax, eax
	and	eax, 3
	add	eax, 69					; 00000045H
	and	eax, 65535				; 0000ffffH
	mov	ecx, DWORD PTR _cond$[ebp]
	mov	ecx, DWORD PTR [ecx]
	and	ecx, -65536				; ffff0000H
	or	eax, ecx
	mov	ecx, DWORD PTR _cond$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 1369
	mov	DWORD PTR _value$[ebp], 2
; Line 1370
	jmp	$L979
; Line 1372
$L984:
; Line 1373
	mov	eax, DWORD PTR _cc_status
	and	eax, 32					; 00000020H
	cmp	eax, 1
	sbb	eax, eax
	and	eax, -3					; fffffffdH
	add	eax, 72					; 00000048H
	and	eax, 65535				; 0000ffffH
	mov	ecx, DWORD PTR _cond$[ebp]
	mov	ecx, DWORD PTR [ecx]
	and	ecx, -65536				; ffff0000H
	or	eax, ecx
	mov	ecx, DWORD PTR _cond$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 1374
	mov	DWORD PTR _value$[ebp], 2
; Line 1375
	jmp	$L979
; Line 1376
	jmp	$L979
$L978:
	cmp	DWORD PTR -24+[ebp], 67			; 00000043H
	je	$L983
	cmp	DWORD PTR -24+[ebp], 68			; 00000044H
	je	$L984
	cmp	DWORD PTR -24+[ebp], 69			; 00000045H
	jl	$L979
	cmp	DWORD PTR -24+[ebp], 76			; 0000004cH
	jle	$L982
	jmp	$L979
$L979:
; Line 1378
$L977:
	mov	eax, DWORD PTR _value$[ebp]
	jmp	$L935
; Line 1379
$L935:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_alter_cond ENDP
_TEXT	ENDS
EXTRN	_error_for_asm:NEAR
_DATA	SEGMENT
	ORG $+3
$SG990	DB	'invalid `asm'': %s', 00H
_DATA	ENDS
_TEXT	SEGMENT
_str$ = 8
_output_operand_lossage PROC NEAR
; Line 1387
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 1388
	cmp	DWORD PTR _this_is_asm_operands$S605, 0
	je	$L988
; Line 1389
	mov	eax, DWORD PTR _str$[ebp]
	push	eax
	push	OFFSET $SG990
	mov	eax, DWORD PTR _this_is_asm_operands$S605
	push	eax
	call	_error_for_asm
	add	esp, 12					; 0000000cH
; Line 1390
	jmp	$L991
$L988:
; Line 1391
	call	_abort
$L991:
; Line 1392
$L987:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_output_operand_lossage ENDP
_TEXT	ENDS
PUBLIC	_output_asm_label
PUBLIC	_output_address
EXTRN	_atoi:NEAR
_DATA	SEGMENT
	ORG $+2
$SG1012	DB	'operand number missing after %-letter', 00H
	ORG $+2
$SG1015	DB	'operand number out of range', 00H
$SG1028	DB	'%d', 00H
	ORG $+1
$SG1037	DB	'operand number out of range', 00H
$SG1045	DB	'invalid %%-code', 00H
_DATA	ENDS
_TEXT	SEGMENT
_template$ = 8
_operands$ = 12
_p$ = -4
_c$ = -8
_letter$1008 = -12
_output_asm_insn PROC NEAR
; Line 1416
	push	ebp
	mov	ebp, esp
	sub	esp, 16					; 00000010H
	push	ebx
	push	esi
	push	edi
; Line 1422
	mov	eax, DWORD PTR _template$[ebp]
	movsx	eax, BYTE PTR [eax]
	or	eax, eax
	jne	$L997
; Line 1423
	jmp	$L994
; Line 1425
$L997:
	mov	eax, DWORD PTR _template$[ebp]
	mov	DWORD PTR _p$[ebp], eax
; Line 1426
	mov	eax, DWORD PTR _asm_out_file
	dec	DWORD PTR [eax+4]
	mov	eax, DWORD PTR _asm_out_file
	cmp	DWORD PTR [eax+4], 0
	jl	$L1122
	mov	eax, DWORD PTR _asm_out_file
	mov	eax, DWORD PTR [eax]
	mov	BYTE PTR [eax], 9
	mov	eax, DWORD PTR _asm_out_file
	inc	DWORD PTR [eax]
	jmp	$L1123
$L1122:
	mov	eax, DWORD PTR _asm_out_file
	push	eax
	push	9
	call	__flsbuf
	add	esp, 8
$L1123:
; Line 1432
$L999:
	mov	eax, DWORD PTR _p$[ebp]
	movsx	eax, BYTE PTR [eax]
	mov	DWORD PTR _c$[ebp], eax
	inc	DWORD PTR _p$[ebp]
	cmp	DWORD PTR _c$[ebp], 0
	je	$L1000
; Line 1447
	cmp	DWORD PTR _c$[ebp], 37			; 00000025H
	je	$L1001
; Line 1448
	mov	eax, DWORD PTR _asm_out_file
	dec	DWORD PTR [eax+4]
	mov	eax, DWORD PTR _asm_out_file
	cmp	DWORD PTR [eax+4], 0
	jl	$L1124
	mov	al, BYTE PTR _c$[ebp]
	mov	ecx, DWORD PTR _asm_out_file
	mov	ecx, DWORD PTR [ecx]
	mov	BYTE PTR [ecx], al
	mov	eax, DWORD PTR _asm_out_file
	inc	DWORD PTR [eax]
	jmp	$L1125
$L1124:
	mov	eax, DWORD PTR _asm_out_file
	push	eax
	mov	eax, DWORD PTR _c$[ebp]
	push	eax
	call	__flsbuf
	add	esp, 8
$L1125:
; Line 1449
	jmp	$L1002
$L1001:
; Line 1452
	mov	eax, DWORD PTR _p$[ebp]
	movsx	eax, BYTE PTR [eax]
	cmp	eax, 37					; 00000025H
	jne	$L1003
; Line 1454
	inc	DWORD PTR _p$[ebp]
; Line 1455
	mov	eax, DWORD PTR _asm_out_file
	dec	DWORD PTR [eax+4]
	mov	eax, DWORD PTR _asm_out_file
	cmp	DWORD PTR [eax+4], 0
	jl	$L1126
	mov	al, BYTE PTR _c$[ebp]
	mov	ecx, DWORD PTR _asm_out_file
	mov	ecx, DWORD PTR [ecx]
	mov	BYTE PTR [ecx], al
	mov	eax, DWORD PTR _asm_out_file
	inc	DWORD PTR [eax]
	jmp	$L1127
$L1126:
	mov	eax, DWORD PTR _asm_out_file
	push	eax
	mov	eax, DWORD PTR _c$[ebp]
	push	eax
	call	__flsbuf
	add	esp, 8
$L1127:
; Line 1462
	jmp	$L1004
$L1003:
; Line 1463
	mov	eax, DWORD PTR _p$[ebp]
	movsx	eax, BYTE PTR [eax]
	cmp	eax, 97					; 00000061H
	jl	$L1007
	mov	eax, DWORD PTR _p$[ebp]
	movsx	eax, BYTE PTR [eax]
	cmp	eax, 122				; 0000007aH
	jle	$L1006
$L1007:
	mov	eax, DWORD PTR _p$[ebp]
	movsx	eax, BYTE PTR [eax]
	cmp	eax, 65					; 00000041H
	jl	$L1005
	mov	eax, DWORD PTR _p$[ebp]
	movsx	eax, BYTE PTR [eax]
	cmp	eax, 90					; 0000005aH
	jg	$L1005
$L1006:
; Line 1465
	mov	eax, DWORD PTR _p$[ebp]
	movsx	eax, BYTE PTR [eax]
	mov	DWORD PTR _letter$1008[ebp], eax
	inc	DWORD PTR _p$[ebp]
; Line 1466
	mov	eax, DWORD PTR _p$[ebp]
	push	eax
	call	_atoi
	add	esp, 4
	mov	DWORD PTR _c$[ebp], eax
; Line 1468
	mov	eax, DWORD PTR _p$[ebp]
	movsx	eax, BYTE PTR [eax]
	cmp	eax, 48					; 00000030H
	jl	$L1011
	mov	eax, DWORD PTR _p$[ebp]
	movsx	eax, BYTE PTR [eax]
	cmp	eax, 57					; 00000039H
	jle	$L1010
$L1011:
; Line 1469
	push	OFFSET $SG1012
	call	_output_operand_lossage
	add	esp, 4
; Line 1470
	jmp	$L1013
$L1010:
	cmp	DWORD PTR _this_is_asm_operands$S605, 0
	je	$L1014
	mov	eax, DWORD PTR _c$[ebp]
	cmp	DWORD PTR _insn_noperands$S606, eax
	ja	$L1014
; Line 1471
	push	OFFSET $SG1015
	call	_output_operand_lossage
	add	esp, 4
; Line 1472
	jmp	$L1016
$L1014:
	cmp	DWORD PTR _letter$1008[ebp], 108	; 0000006cH
	jne	$L1017
; Line 1473
	mov	eax, DWORD PTR _c$[ebp]
	mov	ecx, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4]
	push	eax
	call	_output_asm_label
	add	esp, 4
; Line 1474
	jmp	$L1018
$L1017:
	cmp	DWORD PTR _letter$1008[ebp], 97		; 00000061H
	jne	$L1019
; Line 1475
	mov	eax, DWORD PTR _c$[ebp]
	mov	ecx, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4]
	push	eax
	call	_output_address
	add	esp, 4
; Line 1476
	jmp	$L1020
$L1019:
	cmp	DWORD PTR _letter$1008[ebp], 99		; 00000063H
	jne	$L1021
; Line 1478
	mov	eax, DWORD PTR _c$[ebp]
	mov	ecx, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2490368				; 00260000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1023
	mov	eax, DWORD PTR _c$[ebp]
	mov	ecx, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2555904				; 00270000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1023
	mov	eax, DWORD PTR _c$[ebp]
	mov	ecx, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1023
	mov	eax, DWORD PTR _c$[ebp]
	mov	ecx, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2097152				; 00200000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1022
$L1023:
; Line 1479
	mov	eax, DWORD PTR _c$[ebp]
	mov	ecx, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4]
	push	eax
	mov	eax, DWORD PTR _asm_out_file
	push	eax
	call	_output_addr_const
	add	esp, 8
; Line 1480
	jmp	$L1024
$L1022:
; Line 1481
	push	99					; 00000063H
	mov	eax, DWORD PTR _c$[ebp]
	mov	ecx, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4]
	push	eax
	call	_output_operand
	add	esp, 8
$L1024:
; Line 1483
	jmp	$L1025
$L1021:
	cmp	DWORD PTR _letter$1008[ebp], 110	; 0000006eH
	jne	$L1026
; Line 1485
	mov	eax, DWORD PTR _c$[ebp]
	mov	ecx, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1027
; Line 1486
	mov	eax, DWORD PTR _c$[ebp]
	mov	ecx, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4]
	mov	eax, DWORD PTR [eax+4]
	neg	eax
	push	eax
	push	OFFSET $SG1028
	mov	eax, DWORD PTR _asm_out_file
	push	eax
	call	_fprintf
	add	esp, 12					; 0000000cH
; Line 1487
	jmp	$L1029
$L1027:
; Line 1489
	mov	eax, DWORD PTR _asm_out_file
	dec	DWORD PTR [eax+4]
	mov	eax, DWORD PTR _asm_out_file
	cmp	DWORD PTR [eax+4], 0
	jl	$L1128
	mov	eax, DWORD PTR _asm_out_file
	mov	eax, DWORD PTR [eax]
	mov	BYTE PTR [eax], 45			; 0000002dH
	mov	eax, DWORD PTR _asm_out_file
	inc	DWORD PTR [eax]
	jmp	$L1129
$L1128:
	mov	eax, DWORD PTR _asm_out_file
	push	eax
	push	45					; 0000002dH
	call	__flsbuf
	add	esp, 8
$L1129:
; Line 1490
	mov	eax, DWORD PTR _c$[ebp]
	mov	ecx, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4]
	push	eax
	mov	eax, DWORD PTR _asm_out_file
	push	eax
	call	_output_addr_const
	add	esp, 8
; Line 1491
$L1029:
; Line 1493
	jmp	$L1030
$L1026:
; Line 1494
	mov	eax, DWORD PTR _letter$1008[ebp]
	push	eax
	mov	eax, DWORD PTR _c$[ebp]
	mov	ecx, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4]
	push	eax
	call	_output_operand
	add	esp, 8
$L1030:
$L1025:
$L1020:
$L1018:
$L1016:
$L1013:
; Line 1496
$L1032:
	mov	eax, DWORD PTR _p$[ebp]
	movsx	eax, BYTE PTR [eax]
	mov	DWORD PTR _c$[ebp], eax
	cmp	DWORD PTR _c$[ebp], 48			; 00000030H
	jl	$L1033
	cmp	DWORD PTR _c$[ebp], 57			; 00000039H
	jg	$L1033
	inc	DWORD PTR _p$[ebp]
	jmp	$L1032
$L1033:
; Line 1499
	jmp	$L1034
$L1005:
	mov	eax, DWORD PTR _p$[ebp]
	movsx	eax, BYTE PTR [eax]
	cmp	eax, 48					; 00000030H
	jl	$L1035
	mov	eax, DWORD PTR _p$[ebp]
	movsx	eax, BYTE PTR [eax]
	cmp	eax, 57					; 00000039H
	jg	$L1035
; Line 1501
	mov	eax, DWORD PTR _p$[ebp]
	push	eax
	call	_atoi
	add	esp, 4
	mov	DWORD PTR _c$[ebp], eax
; Line 1502
	cmp	DWORD PTR _this_is_asm_operands$S605, 0
	je	$L1036
	mov	eax, DWORD PTR _c$[ebp]
	cmp	DWORD PTR _insn_noperands$S606, eax
	ja	$L1036
; Line 1503
	push	OFFSET $SG1037
	call	_output_operand_lossage
	add	esp, 4
; Line 1504
	jmp	$L1038
$L1036:
; Line 1505
	push	0
	mov	eax, DWORD PTR _c$[ebp]
	mov	ecx, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4]
	push	eax
	call	_output_operand
	add	esp, 8
$L1038:
; Line 1506
$L1040:
	mov	eax, DWORD PTR _p$[ebp]
	movsx	eax, BYTE PTR [eax]
	mov	DWORD PTR _c$[ebp], eax
	cmp	DWORD PTR _c$[ebp], 48			; 00000030H
	jl	$L1041
	cmp	DWORD PTR _c$[ebp], 57			; 00000039H
	jg	$L1041
	inc	DWORD PTR _p$[ebp]
	jmp	$L1040
$L1041:
; Line 1512
	jmp	$L1042
$L1035:
	mov	eax, DWORD PTR _p$[ebp]
	movsx	eax, BYTE PTR [eax]
	cmp	eax, 42					; 0000002aH
	jne	$L1043
; Line 1513
	mov	eax, DWORD PTR _p$[ebp]
	mov	DWORD PTR -16+[ebp], eax
	inc	DWORD PTR _p$[ebp]
	mov	eax, DWORD PTR -16+[ebp]
	movsx	eax, BYTE PTR [eax]
	push	eax
	push	0
	call	_output_operand
	add	esp, 8
; Line 1515
	jmp	$L1044
$L1043:
; Line 1516
	push	OFFSET $SG1045
	call	_output_operand_lossage
	add	esp, 4
$L1044:
$L1042:
$L1034:
$L1004:
; Line 1517
$L1002:
; Line 1518
	jmp	$L999
$L1000:
; Line 1520
	mov	eax, DWORD PTR _asm_out_file
	dec	DWORD PTR [eax+4]
	mov	eax, DWORD PTR _asm_out_file
	cmp	DWORD PTR [eax+4], 0
	jl	$L1130
	mov	eax, DWORD PTR _asm_out_file
	mov	eax, DWORD PTR [eax]
	mov	BYTE PTR [eax], 10			; 0000000aH
	mov	eax, DWORD PTR _asm_out_file
	inc	DWORD PTR [eax]
	jmp	$L1131
$L1130:
	mov	eax, DWORD PTR _asm_out_file
	push	eax
	push	10					; 0000000aH
	call	__flsbuf
	add	esp, 8
$L1131:
; Line 1521
$L994:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_output_asm_insn ENDP
_TEXT	ENDS
EXTRN	_assemble_name:NEAR
_DATA	SEGMENT
$SG1050	DB	'L', 00H
	ORG $+2
$SG1051	DB	'*%s%d', 00H
	ORG $+2
$SG1054	DB	'L', 00H
	ORG $+2
$SG1055	DB	'*%s%d', 00H
	ORG $+2
$SG1057	DB	'`%l'' operand isn''t a label', 00H
_DATA	ENDS
_TEXT	SEGMENT
_x$ = 8
_buf$ = -256
_output_asm_label PROC NEAR
; Line 1528
	push	ebp
	mov	ebp, esp
	sub	esp, 256				; 00000100H
	push	ebx
	push	esi
	push	edi
; Line 1531
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2490368				; 00260000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1049
; Line 1532
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+16]
	push	eax
	push	OFFSET $SG1050
	push	OFFSET $SG1051
	lea	eax, DWORD PTR _buf$[ebp]
	push	eax
	call	_sprintf
	add	esp, 16					; 00000010H
; Line 1533
	jmp	$L1052
$L1049:
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1114112				; 00110000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1053
; Line 1534
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+16]
	push	eax
	push	OFFSET $SG1054
	push	OFFSET $SG1055
	lea	eax, DWORD PTR _buf$[ebp]
	push	eax
	call	_sprintf
	add	esp, 16					; 00000010H
; Line 1535
	jmp	$L1056
$L1053:
; Line 1536
	push	OFFSET $SG1057
	call	_output_operand_lossage
	add	esp, 4
$L1056:
$L1052:
; Line 1538
	lea	eax, DWORD PTR _buf$[ebp]
	push	eax
	mov	eax, DWORD PTR _asm_out_file
	push	eax
	call	_assemble_name
	add	esp, 8
; Line 1539
$L1047:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_output_asm_label ENDP
_TEXT	ENDS
EXTRN	_print_operand:NEAR
_TEXT	SEGMENT
_x$ = 8
_code$ = 12
_output_operand PROC NEAR
; Line 1555
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 1556
	cmp	DWORD PTR _x$[ebp], 0
	je	$L1062
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2293760				; 00230000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1062
; Line 1557
	mov	eax, DWORD PTR _x$[ebp]
	push	eax
	call	_alter_subreg
	add	esp, 4
	mov	DWORD PTR _x$[ebp], eax
; Line 1558
$L1062:
	mov	eax, DWORD PTR _code$[ebp]
	push	eax
	mov	eax, DWORD PTR _x$[ebp]
	push	eax
	mov	eax, DWORD PTR _asm_out_file
	push	eax
	call	_print_operand
	add	esp, 12					; 0000000cH
; Line 1559
$L1061:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_output_operand ENDP
_TEXT	ENDS
EXTRN	_print_operand_address:NEAR
_TEXT	SEGMENT
_x$ = 8
_output_address PROC NEAR
; Line 1568
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 1569
	mov	eax, DWORD PTR _x$[ebp]
	push	eax
	call	_walk_alter_subreg
	add	esp, 4
; Line 1570
	mov	eax, DWORD PTR _x$[ebp]
	push	eax
	mov	eax, DWORD PTR _asm_out_file
	push	eax
	call	_print_operand_address
	add	esp, 8
; Line 1571
$L1065:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_output_address ENDP
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+1
$SG1078	DB	'L', 00H
	ORG $+2
$SG1079	DB	'*%s%d', 00H
	ORG $+2
$SG1081	DB	'L', 00H
	ORG $+2
$SG1082	DB	'*%s%d', 00H
	ORG $+2
$SG1084	DB	'%d', 00H
	ORG $+1
$SG1090	DB	'0x%x%08x', 00H
	ORG $+3
$SG1092	DB	'%d', 00H
	ORG $+1
$SG1094	DB	'floating constant misused', 00H
	ORG $+2
$SG1098	DB	'+', 00H
	ORG $+2
$SG1101	DB	'+', 00H
	ORG $+2
$SG1103	DB	'-', 00H
	ORG $+2
$SG1105	DB	'invalid expression as operand', 00H
_DATA	ENDS
_TEXT	SEGMENT
_file$ = 8
_x$ = 12
_buf$ = -256
_output_addr_const PROC NEAR
; Line 1581
	push	ebp
	mov	ebp, esp
	sub	esp, 260				; 00000104H
	push	ebx
	push	esi
	push	edi
; Line 1584
$restart$1071:
; Line 1585
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	sar	eax, 16					; 00000010H
	mov	DWORD PTR -260+[ebp], eax
	jmp	$L1072
; Line 1587
$L1076:
; Line 1588
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	call	_assemble_name
	add	esp, 8
; Line 1589
	jmp	$L1073
; Line 1591
$L1077:
; Line 1592
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+16]
	push	eax
	push	OFFSET $SG1078
	push	OFFSET $SG1079
	lea	eax, DWORD PTR _buf$[ebp]
	push	eax
	call	_sprintf
	add	esp, 16					; 00000010H
; Line 1593
	lea	eax, DWORD PTR _buf$[ebp]
	push	eax
	mov	eax, DWORD PTR _asm_out_file
	push	eax
	call	_assemble_name
	add	esp, 8
; Line 1594
	jmp	$L1073
; Line 1596
$L1080:
; Line 1597
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+16]
	push	eax
	push	OFFSET $SG1081
	push	OFFSET $SG1082
	lea	eax, DWORD PTR _buf$[ebp]
	push	eax
	call	_sprintf
	add	esp, 16					; 00000010H
; Line 1598
	lea	eax, DWORD PTR _buf$[ebp]
	push	eax
	mov	eax, DWORD PTR _asm_out_file
	push	eax
	call	_assemble_name
	add	esp, 8
; Line 1599
	jmp	$L1073
; Line 1601
$L1083:
; Line 1602
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	push	OFFSET $SG1084
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	call	_fprintf
	add	esp, 12					; 0000000cH
; Line 1603
	jmp	$L1073
; Line 1605
$L1085:
; Line 1606
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _x$[ebp], eax
; Line 1607
	jmp	$restart$1071
; Line 1609
$L1086:
; Line 1610
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	mov	ecx, 100663296				; 06000000H
	and	ecx, -16777216				; ff000000H
	cmp	eax, ecx
	jne	$L1087
; Line 1613
	mov	eax, DWORD PTR _x$[ebp]
	cmp	DWORD PTR [eax+16], 0
	jne	$L1089
	mov	eax, DWORD PTR _x$[ebp]
	cmp	DWORD PTR [eax+12], 0
	jge	$L1088
$L1089:
; Line 1615
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+12]
	push	eax
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+16]
	push	eax
	push	OFFSET $SG1090
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	call	_fprintf
	add	esp, 16					; 00000010H
; Line 1616
	jmp	$L1091
$L1088:
; Line 1617
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+12]
	push	eax
	push	OFFSET $SG1092
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	call	_fprintf
	add	esp, 12					; 0000000cH
$L1091:
; Line 1619
	jmp	$L1093
$L1087:
; Line 1622
	push	OFFSET $SG1094
	call	_output_operand_lossage
	add	esp, 4
$L1093:
; Line 1623
	jmp	$L1073
; Line 1625
$L1095:
; Line 1627
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1096
; Line 1629
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	call	_output_addr_const
	add	esp, 8
; Line 1630
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	cmp	DWORD PTR [eax+4], 0
	jl	$L1097
; Line 1631
	push	OFFSET $SG1098
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	call	_fprintf
	add	esp, 8
; Line 1632
$L1097:
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	call	_output_addr_const
	add	esp, 8
; Line 1634
	jmp	$L1099
$L1096:
; Line 1636
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	call	_output_addr_const
	add	esp, 8
; Line 1637
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	cmp	DWORD PTR [eax+4], 0
	jl	$L1100
; Line 1638
	push	OFFSET $SG1101
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	call	_fprintf
	add	esp, 8
; Line 1639
$L1100:
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	call	_output_addr_const
	add	esp, 8
; Line 1640
$L1099:
; Line 1641
	jmp	$L1073
; Line 1643
$L1102:
; Line 1644
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	call	_output_addr_const
	add	esp, 8
; Line 1645
	push	OFFSET $SG1103
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	call	_fprintf
	add	esp, 8
; Line 1646
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	call	_output_addr_const
	add	esp, 8
; Line 1647
	jmp	$L1073
; Line 1649
$L1104:
; Line 1650
	push	OFFSET $SG1105
	call	_output_operand_lossage
	add	esp, 4
; Line 1651
	jmp	$L1073
$L1072:
	sub	DWORD PTR -260+[ebp], 17		; 00000011H
	cmp	DWORD PTR -260+[ebp], 28		; 0000001cH
	ja	$L1104
	shl	DWORD PTR -260+[ebp], 2
	mov	eax, DWORD PTR -260+[ebp]
	jmp	DWORD PTR $L1132[eax]
$L1132:
	DD	OFFSET $L1080
	DD	OFFSET $L1104
	DD	OFFSET $L1104
	DD	OFFSET $L1104
	DD	OFFSET $L1104
	DD	OFFSET $L1104
	DD	OFFSET $L1104
	DD	OFFSET $L1104
	DD	OFFSET $L1104
	DD	OFFSET $L1104
	DD	OFFSET $L1104
	DD	OFFSET $L1104
	DD	OFFSET $L1104
	DD	OFFSET $L1083
	DD	OFFSET $L1086
	DD	OFFSET $L1085
	DD	OFFSET $L1104
	DD	OFFSET $L1104
	DD	OFFSET $L1104
	DD	OFFSET $L1104
	DD	OFFSET $L1104
	DD	OFFSET $L1077
	DD	OFFSET $L1076
	DD	OFFSET $L1104
	DD	OFFSET $L1104
	DD	OFFSET $L1104
	DD	OFFSET $L1104
	DD	OFFSET $L1095
	DD	OFFSET $L1102
$L1073:
; Line 1652
$L1069:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_output_addr_const ENDP
_TEXT	ENDS
END
