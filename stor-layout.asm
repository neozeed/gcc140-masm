	TITLE	stor-layout.c
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
COMM	_size_zero_node:DWORD
COMM	_size_one_node:DWORD
COMM	_immediate_size_expand:DWORD
COMM	_sizetype:DWORD
COMM	_permanent_type_chain:DWORD
COMM	_temporary_type_chain:DWORD
COMM	_permanent_type_end:DWORD
COMM	_temporary_type_end:DWORD
_DATA	ENDS
PUBLIC	_chain_type
_TEXT	SEGMENT
; File stor-layout.c
_t$ = 8
_chain_type PROC NEAR
; Line 75
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 76
	mov	eax, DWORD PTR _t$[ebp]
	mov	ecx, DWORD PTR _t$[ebp]
	cmp	DWORD PTR [eax+68], ecx
	je	$L762
; Line 77
	jmp	$L761
; Line 78
$L762:
	mov	eax, DWORD PTR _t$[ebp]
	cmp	DWORD PTR [eax+4], 0
	je	$L763
; Line 79
	jmp	$L761
; Line 80
$L763:
	mov	eax, DWORD PTR _t$[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 8
	test	al, 1
	je	$L764
; Line 83
	mov	eax, DWORD PTR _permanent_type_end
	cmp	DWORD PTR _t$[ebp], eax
	jne	$L765
; Line 84
	jmp	$L761
; Line 86
$L765:
	cmp	DWORD PTR _permanent_type_chain, 0
	jne	$L766
; Line 87
	mov	eax, DWORD PTR _t$[ebp]
	mov	DWORD PTR _permanent_type_chain, eax
; Line 88
	jmp	$L767
$L766:
; Line 89
	mov	eax, DWORD PTR _t$[ebp]
	mov	ecx, DWORD PTR _permanent_type_end
	mov	DWORD PTR [ecx+4], eax
$L767:
; Line 90
	mov	eax, DWORD PTR _t$[ebp]
	mov	DWORD PTR _permanent_type_end, eax
; Line 92
	jmp	$L768
$L764:
; Line 94
	mov	eax, DWORD PTR _temporary_type_end
	cmp	DWORD PTR _t$[ebp], eax
	jne	$L769
; Line 95
	jmp	$L761
; Line 96
$L769:
	cmp	DWORD PTR _temporary_type_chain, 0
	jne	$L770
; Line 97
	mov	eax, DWORD PTR _t$[ebp]
	mov	DWORD PTR _temporary_type_chain, eax
; Line 98
	jmp	$L771
$L770:
; Line 99
	mov	eax, DWORD PTR _t$[ebp]
	mov	ecx, DWORD PTR _temporary_type_end
	mov	DWORD PTR [ecx+4], eax
$L771:
; Line 100
	mov	eax, DWORD PTR _t$[ebp]
	mov	DWORD PTR _temporary_type_end, eax
; Line 101
$L768:
; Line 102
$L761:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_chain_type ENDP
_TEXT	ENDS
PUBLIC	_get_permanent_types
_TEXT	SEGMENT
_tem$ = -4
_get_permanent_types PROC NEAR
; Line 109
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 110
	mov	eax, DWORD PTR _permanent_type_chain
	mov	DWORD PTR _tem$[ebp], eax
; Line 111
	mov	DWORD PTR _permanent_type_chain, 0
; Line 112
	mov	DWORD PTR _permanent_type_end, 0
; Line 113
	mov	eax, DWORD PTR _tem$[ebp]
	jmp	$L773
; Line 114
$L773:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_get_permanent_types ENDP
_TEXT	ENDS
PUBLIC	_get_temporary_types
_TEXT	SEGMENT
_tem$ = -4
_get_temporary_types PROC NEAR
; Line 121
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 122
	mov	eax, DWORD PTR _temporary_type_chain
	mov	DWORD PTR _tem$[ebp], eax
; Line 123
	mov	DWORD PTR _temporary_type_chain, 0
; Line 124
	mov	DWORD PTR _temporary_type_end, 0
; Line 125
	mov	eax, DWORD PTR _tem$[ebp]
	jmp	$L776
; Line 126
$L776:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_get_temporary_types ENDP
_TEXT	ENDS
PUBLIC	_get_pending_sizes
_BSS	SEGMENT
_pending_sizes$S778 DD 01H DUP (?)
_BSS	ENDS
_TEXT	SEGMENT
_chain$ = -4
_get_pending_sizes PROC NEAR
; Line 139
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 140
	mov	eax, DWORD PTR _pending_sizes$S778
	mov	DWORD PTR _chain$[ebp], eax
; Line 141
	mov	DWORD PTR _pending_sizes$S778, 0
; Line 142
	mov	eax, DWORD PTR _chain$[ebp]
	jmp	$L779
; Line 143
$L779:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_get_pending_sizes ENDP
_TEXT	ENDS
PUBLIC	_build_int
EXTRN	_expand_expr:NEAR
EXTRN	_global_bindings_p:NEAR
EXTRN	_error:NEAR
EXTRN	_tree_cons:NEAR
EXTRN	_save_expr:NEAR
_DATA	SEGMENT
$SG787	DB	'variable-size type declared outside of any function', 00H
_DATA	ENDS
_TEXT	SEGMENT
_size$ = 8
_variable_size PROC NEAR
; Line 151
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 152
	mov	eax, DWORD PTR _size$[ebp]
	push	eax
	call	_save_expr
	add	esp, 4
	mov	DWORD PTR _size$[ebp], eax
; Line 154
	call	_global_bindings_p
	or	eax, eax
	je	$L785
; Line 156
	push	OFFSET $SG787
	call	_error
	add	esp, 4
; Line 157
	push	1
	call	_build_int
	add	esp, 4
	jmp	$L783
; Line 160
$L785:
	cmp	DWORD PTR _immediate_size_expand, 0
	je	$L788
; Line 161
	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _size$[ebp]
	push	eax
	call	_expand_expr
	add	esp, 16					; 00000010H
; Line 162
	jmp	$L789
$L788:
; Line 163
	mov	eax, DWORD PTR _pending_sizes$S778
	push	eax
	mov	eax, DWORD PTR _size$[ebp]
	push	eax
	push	0
	call	_tree_cons
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _pending_sizes$S778, eax
$L789:
; Line 165
	mov	eax, DWORD PTR _size$[ebp]
	jmp	$L783
; Line 166
$L783:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_variable_size ENDP
_TEXT	ENDS
EXTRN	_mode_class:BYTE
EXTRN	_mode_size:BYTE
_TEXT	SEGMENT
_size$ = 8
_units$ = -12
_t$ = -8
_val$ = -4
_agg_mode PROC NEAR
; Line 183
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
	push	ebx
	push	esi
	push	edi
; Line 184
	mov	eax, DWORD PTR _size$[ebp]
	shr	eax, 3
	mov	DWORD PTR _units$[ebp], eax
; Line 187
	test	BYTE PTR _size$[ebp], 7
	je	$L796
; Line 188
	mov	eax, 26					; 0000001aH
	jmp	$L792
; Line 190
$L796:
	mov	eax, DWORD PTR _mode_size+24
	shl	eax, 3
	cmp	eax, DWORD PTR _size$[ebp]
	jae	$L797
; Line 191
	mov	eax, 26					; 0000001aH
	jmp	$L792
; Line 194
$L797:
	mov	DWORD PTR _val$[ebp], 26		; 0000001aH
; Line 196
	mov	DWORD PTR _t$[ebp], 1
	jmp	$L798
$L799:
	inc	DWORD PTR _t$[ebp]
$L798:
	mov	eax, DWORD PTR _t$[ebp]
	cmp	DWORD PTR _mode_class[eax*4], 1
	jne	$L800
; Line 197
	mov	eax, DWORD PTR _t$[ebp]
	mov	ecx, DWORD PTR _units$[ebp]
	cmp	DWORD PTR _mode_size[eax*4], ecx
	jne	$L801
; Line 198
	mov	eax, DWORD PTR _t$[ebp]
	mov	DWORD PTR _val$[ebp], eax
; Line 200
$L801:
	jmp	$L799
$L800:
	mov	eax, DWORD PTR _val$[ebp]
	jmp	$L792
; Line 201
$L792:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_agg_mode ENDP
_TEXT	ENDS
PUBLIC	_round_size
EXTRN	_abort:NEAR
_TEXT	SEGMENT
_size$ = 8
_t$ = -4
_round_size PROC NEAR
; Line 208
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 212
	mov	DWORD PTR _t$[ebp], 1
	jmp	$L806
$L807:
	inc	DWORD PTR _t$[ebp]
$L806:
	cmp	DWORD PTR _t$[ebp], 26			; 0000001aH
	jge	$L808
; Line 213
	mov	eax, DWORD PTR _t$[ebp]
	mov	eax, DWORD PTR _mode_size[eax*4]
	shl	eax, 3
	cmp	eax, DWORD PTR _size$[ebp]
	jl	$L809
; Line 214
	mov	eax, DWORD PTR _t$[ebp]
	mov	eax, DWORD PTR _mode_size[eax*4]
	shl	eax, 3
	jmp	$L804
; Line 216
$L809:
	jmp	$L807
$L808:
	call	_abort
; Line 217
$L804:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_round_size ENDP
_TEXT	ENDS
EXTRN	_build_int_2:NEAR
EXTRN	_allocation_temporary_p:NEAR
EXTRN	_end_temporary_allocation:NEAR
EXTRN	_resume_temporary_allocation:NEAR
_BSS	SEGMENT
_?size_table@?1??build_int@@9@9$S815 DD 021H DUP (?)
_BSS	ENDS
_TEXT	SEGMENT
_v$ = 8
_t$ = -4
_temp$818 = -8
_build_int PROC NEAR
; Line 224
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	push	ebx
	push	esi
	push	edi
; Line 229
	cmp	DWORD PTR _v$[ebp], 33			; 00000021H
	jae	$L816
	mov	eax, DWORD PTR _v$[ebp]
	cmp	DWORD PTR _?size_table@?1??build_int@@9@9$S815[eax*4], 0
	je	$L816
; Line 230
	mov	eax, DWORD PTR _v$[ebp]
	mov	eax, DWORD PTR _?size_table@?1??build_int@@9@9$S815[eax*4]
	jmp	$L812
; Line 231
$L816:
	cmp	DWORD PTR _v$[ebp], 33			; 00000021H
	jae	$L817
; Line 233
	call	_allocation_temporary_p
	mov	DWORD PTR _temp$818[ebp], eax
; Line 235
	cmp	DWORD PTR _temp$818[ebp], 0
	je	$L820
; Line 236
	call	_end_temporary_allocation
; Line 237
$L820:
	push	0
	mov	eax, DWORD PTR _v$[ebp]
	push	eax
	call	_build_int_2
	add	esp, 8
	mov	DWORD PTR _t$[ebp], eax
; Line 238
	mov	eax, DWORD PTR _sizetype
	mov	ecx, DWORD PTR _t$[ebp]
	mov	DWORD PTR [ecx+8], eax
; Line 239
	mov	eax, DWORD PTR _t$[ebp]
	mov	ecx, DWORD PTR _v$[ebp]
	mov	DWORD PTR _?size_table@?1??build_int@@9@9$S815[ecx*4], eax
; Line 240
	cmp	DWORD PTR _temp$818[ebp], 0
	je	$L822
; Line 241
	call	_resume_temporary_allocation
; Line 242
$L822:
; Line 243
	jmp	$L824
$L817:
; Line 245
	push	0
	mov	eax, DWORD PTR _v$[ebp]
	push	eax
	call	_build_int_2
	add	esp, 8
	mov	DWORD PTR _t$[ebp], eax
; Line 246
	mov	eax, DWORD PTR _sizetype
	mov	ecx, DWORD PTR _t$[ebp]
	mov	DWORD PTR [ecx+8], eax
; Line 247
$L824:
; Line 248
	mov	eax, DWORD PTR _t$[ebp]
	jmp	$L812
; Line 249
$L812:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_build_int ENDP
_TEXT	ENDS
PUBLIC	_genop
EXTRN	_error_mark_node:DWORD
EXTRN	_build:NEAR
EXTRN	_fold:NEAR
EXTRN	_combine:NEAR
_TEXT	SEGMENT
_opc$ = 8
_op1$ = 12
_op2$ = 16
_genop	PROC NEAR
; Line 259
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 261
	mov	eax, DWORD PTR _op1$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 35					; 00000023H
	jne	$L829
	mov	eax, DWORD PTR _op2$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 35					; 00000023H
	jne	$L829
; Line 266
	cmp	DWORD PTR _opc$[ebp], 64		; 00000040H
	jne	$L830
	mov	eax, DWORD PTR _op1$[ebp]
	cmp	DWORD PTR [eax+20], 0
	jne	$L830
	mov	eax, DWORD PTR _op1$[ebp]
	cmp	DWORD PTR [eax+24], 0
	jne	$L830
; Line 267
	mov	eax, DWORD PTR _op2$[ebp]
	jmp	$L828
; Line 268
$L830:
; Line 270
	cmp	DWORD PTR _opc$[ebp], 65		; 00000041H
	jne	$L831
	mov	eax, DWORD PTR _op2$[ebp]
	cmp	DWORD PTR [eax+20], 0
	jne	$L831
	mov	eax, DWORD PTR _op2$[ebp]
	cmp	DWORD PTR [eax+24], 0
	jne	$L831
; Line 271
	mov	eax, DWORD PTR _op1$[ebp]
	jmp	$L828
; Line 272
$L831:
; Line 274
	cmp	DWORD PTR _opc$[ebp], 66		; 00000042H
	jne	$L832
	mov	eax, DWORD PTR _op1$[ebp]
	cmp	DWORD PTR [eax+20], 1
	jne	$L832
	mov	eax, DWORD PTR _op1$[ebp]
	cmp	DWORD PTR [eax+24], 0
	jne	$L832
; Line 275
	mov	eax, DWORD PTR _op2$[ebp]
	jmp	$L828
; Line 276
$L832:
; Line 278
	cmp	DWORD PTR _opc$[ebp], 68		; 00000044H
	jne	$L833
	mov	eax, DWORD PTR _op2$[ebp]
	mov	ecx, DWORD PTR _op1$[ebp]
	mov	ecx, DWORD PTR [ecx+20]
	cmp	DWORD PTR [eax+20], ecx
	jne	$L833
	mov	eax, DWORD PTR _op2$[ebp]
	mov	ecx, DWORD PTR _op1$[ebp]
	mov	ecx, DWORD PTR [ecx+24]
	cmp	DWORD PTR [eax+24], ecx
	jne	$L833
; Line 279
	mov	eax, DWORD PTR _size_one_node
	jmp	$L828
; Line 281
$L833:
	mov	eax, DWORD PTR _op2$[ebp]
	push	eax
	mov	eax, DWORD PTR _op1$[ebp]
	push	eax
	mov	eax, DWORD PTR _opc$[ebp]
	push	eax
	call	_combine
	add	esp, 12					; 0000000cH
	jmp	$L828
; Line 284
$L829:
	mov	eax, DWORD PTR _error_mark_node
	cmp	DWORD PTR _op1$[ebp], eax
	je	$L835
	mov	eax, DWORD PTR _error_mark_node
	cmp	DWORD PTR _op2$[ebp], eax
	jne	$L834
$L835:
; Line 285
	mov	eax, DWORD PTR _error_mark_node
	jmp	$L828
; Line 287
$L834:
	mov	eax, DWORD PTR _op2$[ebp]
	push	eax
	mov	eax, DWORD PTR _op1$[ebp]
	push	eax
	mov	eax, DWORD PTR _sizetype
	push	eax
	mov	eax, DWORD PTR _opc$[ebp]
	push	eax
	call	_build
	add	esp, 16					; 00000010H
	push	eax
	call	_fold
	add	esp, 4
	jmp	$L828
; Line 288
$L828:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_genop	ENDP
_TEXT	ENDS
PUBLIC	_convert_units
EXTRN	_tree_int_cst_equal:NEAR
_TEXT	SEGMENT
_size$ = 8
_inunits$ = 12
_outunits$ = 16
_t$ = -4
_convert_units PROC NEAR
; Line 298
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 301
	mov	eax, DWORD PTR _inunits$[ebp]
	cmp	DWORD PTR _outunits$[ebp], eax
	jne	$L841
; Line 302
	mov	eax, DWORD PTR _size$[ebp]
	jmp	$L839
; Line 305
$L841:
	mov	eax, DWORD PTR _inunits$[ebp]
	cdq
	idiv	DWORD PTR _outunits$[ebp]
	or	edx, edx
	jne	$L842
; Line 306
	mov	eax, DWORD PTR _inunits$[ebp]
	cdq
	idiv	DWORD PTR _outunits$[ebp]
	push	eax
	call	_build_int
	add	esp, 4
	push	eax
	mov	eax, DWORD PTR _size$[ebp]
	push	eax
	push	66					; 00000042H
	call	_genop
	add	esp, 12					; 0000000cH
	jmp	$L839
; Line 308
$L842:
	mov	eax, DWORD PTR _outunits$[ebp]
	cdq
	idiv	DWORD PTR _inunits$[ebp]
	or	edx, edx
	jne	$L843
; Line 317
	mov	eax, DWORD PTR _size$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 66					; 00000042H
	jne	$L845
	mov	eax, DWORD PTR _size$[ebp]
	mov	eax, DWORD PTR [eax+28]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 35					; 00000023H
	jne	$L845
	mov	eax, DWORD PTR _outunits$[ebp]
	cdq
	idiv	DWORD PTR _inunits$[ebp]
	mov	ecx, DWORD PTR _size$[ebp]
	mov	ecx, DWORD PTR [ecx+28]
	cdq
	idiv	DWORD PTR [ecx+20]
	or	edx, edx
	jne	$L845
	mov	eax, DWORD PTR _size$[ebp]
	mov	eax, DWORD PTR [eax+24]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 68					; 00000044H
	jne	$L845
	mov	eax, DWORD PTR _size$[ebp]
	mov	eax, DWORD PTR [eax+24]
	mov	eax, DWORD PTR [eax+28]
	push	eax
	mov	eax, DWORD PTR _size$[ebp]
	mov	eax, DWORD PTR [eax+28]
	push	eax
	call	_tree_int_cst_equal
	add	esp, 8
	or	eax, eax
	je	$L845
; Line 318
	mov	eax, DWORD PTR _size$[ebp]
	mov	eax, DWORD PTR [eax+24]
	mov	eax, DWORD PTR [eax+24]
	mov	DWORD PTR _size$[ebp], eax
; Line 319
$L845:
	mov	eax, DWORD PTR _outunits$[ebp]
	cdq
	idiv	DWORD PTR _inunits$[ebp]
	push	eax
	call	_build_int
	add	esp, 4
	push	eax
	mov	eax, DWORD PTR _size$[ebp]
	push	eax
	push	68					; 00000044H
	call	_genop
	add	esp, 12					; 0000000cH
	jmp	$L839
; Line 322
$L843:
; Line 323
	mov	eax, DWORD PTR _inunits$[ebp]
	push	eax
	call	_build_int
	add	esp, 4
	push	eax
	mov	eax, DWORD PTR _size$[ebp]
	push	eax
	push	66					; 00000042H
	call	_genop
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _t$[ebp], eax
; Line 325
	mov	eax, DWORD PTR _outunits$[ebp]
	push	eax
	call	_build_int
	add	esp, 4
	push	eax
	mov	eax, DWORD PTR _t$[ebp]
	push	eax
	push	68					; 00000044H
	call	_genop
	add	esp, 12					; 0000000cH
	jmp	$L839
; Line 326
$L839:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_convert_units ENDP
_TEXT	ENDS
PUBLIC	_layout_decl
EXTRN	_void_type_node:DWORD
EXTRN	_mode_unit_size:BYTE
_TEXT	SEGMENT
_decl$ = 8
_known_align$ = 12
_type$ = -12
_code$ = -16
_spec_size$ = -8
_bitsize$ = -4
_xmode$865 = -20
_layout_decl PROC NEAR
; Line 346
	push	ebp
	mov	ebp, esp
	sub	esp, 20					; 00000014H
	push	ebx
	push	esi
	push	edi
; Line 347
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _type$[ebp], eax
; Line 348
	mov	eax, DWORD PTR _decl$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	mov	DWORD PTR _code$[ebp], eax
; Line 349
	mov	eax, DWORD PTR _decl$[ebp]
	mov	al, BYTE PTR [eax+36]
	and	eax, 255				; 000000ffH
	mov	DWORD PTR _spec_size$[ebp], eax
; Line 352
	cmp	DWORD PTR _code$[ebp], 41		; 00000029H
	jne	$L853
; Line 353
	jmp	$L848
; Line 355
$L853:
; Line 356
	cmp	DWORD PTR _code$[ebp], 43		; 0000002bH
	je	$L854
	cmp	DWORD PTR _code$[ebp], 44		; 0000002cH
	je	$L854
	cmp	DWORD PTR _code$[ebp], 45		; 0000002dH
	je	$L854
	cmp	DWORD PTR _code$[ebp], 46		; 0000002eH
	je	$L854
	cmp	DWORD PTR _code$[ebp], 42		; 0000002aH
	je	$L854
; Line 357
	call	_abort
; Line 359
$L854:
	mov	eax, DWORD PTR _error_mark_node
	cmp	DWORD PTR _type$[ebp], eax
	jne	$L855
; Line 361
	mov	eax, DWORD PTR _void_type_node
	mov	DWORD PTR _type$[ebp], eax
; Line 362
	mov	DWORD PTR _spec_size$[ebp], 0
; Line 364
$L855:
	mov	eax, DWORD PTR _type$[ebp]
	mov	al, BYTE PTR [eax+36]
	and	eax, 255				; 000000ffH
	or	eax, eax
	jne	$L856
; Line 365
	call	_abort
; Line 369
$L856:
	mov	eax, DWORD PTR _type$[ebp]
	mov	eax, DWORD PTR [eax+32]
	shl	eax, 24					; 00000018H
	shr	eax, 24					; 00000018H
	and	eax, 255				; 000000ffH
	mov	ecx, DWORD PTR _decl$[ebp]
	mov	ecx, DWORD PTR [ecx+32]
	and	ecx, -256				; ffffff00H
	or	eax, ecx
	mov	ecx, DWORD PTR _decl$[ebp]
	mov	DWORD PTR [ecx+32], eax
; Line 370
	mov	eax, DWORD PTR _type$[ebp]
	mov	eax, DWORD PTR [eax+28]
	mov	ecx, DWORD PTR _decl$[ebp]
	mov	DWORD PTR [ecx+28], eax
; Line 371
	mov	eax, DWORD PTR _type$[ebp]
	mov	al, BYTE PTR [eax+36]
	mov	ecx, DWORD PTR _decl$[ebp]
	mov	BYTE PTR [ecx+36], al
; Line 372
	mov	eax, DWORD PTR _type$[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 12					; 0000000cH
	and	eax, 1
	shl	eax, 12					; 0000000cH
	mov	ecx, DWORD PTR _decl$[ebp]
	mov	ecx, DWORD PTR [ecx+16]
	and	ecx, -4097				; ffffefffH
	or	eax, ecx
	mov	ecx, DWORD PTR _decl$[ebp]
	mov	DWORD PTR [ecx+16], eax
; Line 374
	cmp	DWORD PTR _code$[ebp], 46		; 0000002eH
	jne	$L857
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 4
	test	al, 1
	je	$L857
; Line 381
	mov	eax, DWORD PTR _type$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 5
	je	$L858
	mov	eax, DWORD PTR _type$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 8
	je	$L858
; Line 382
	call	_abort
; Line 384
$L858:
	cmp	DWORD PTR _spec_size$[ebp], 0
	jne	$L859
; Line 385
	call	_abort
; Line 388
$L859:
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+32]
	and	eax, -231				; ffffff19H
	or	eax, 25					; 00000019H
	mov	ecx, DWORD PTR _decl$[ebp]
	mov	DWORD PTR [ecx+32], eax
; Line 390
	mov	eax, DWORD PTR _size_one_node
	mov	ecx, DWORD PTR _decl$[ebp]
	mov	DWORD PTR [ecx+28], eax
; Line 391
	mov	al, BYTE PTR _spec_size$[ebp]
	mov	ecx, DWORD PTR _decl$[ebp]
	mov	BYTE PTR [ecx+36], al
; Line 395
	jmp	$L860
$L857:
	mov	eax, DWORD PTR _type$[ebp]
	mov	al, BYTE PTR [eax+37]
	and	eax, 255				; 000000ffH
	mov	ecx, DWORD PTR _decl$[ebp]
	mov	cl, BYTE PTR [ecx+37]
	and	ecx, 255				; 000000ffH
	cmp	eax, ecx
	jle	$L861
; Line 396
	mov	eax, DWORD PTR _type$[ebp]
	mov	al, BYTE PTR [eax+37]
	mov	ecx, DWORD PTR _decl$[ebp]
	mov	BYTE PTR [ecx+37], al
; Line 398
$L861:
$L860:
	mov	eax, DWORD PTR _decl$[ebp]
	cmp	DWORD PTR [eax+28], 0
	je	$L862
; Line 399
	mov	eax, DWORD PTR _decl$[ebp]
	mov	al, BYTE PTR [eax+36]
	and	eax, 255				; 000000ffH
	mov	ecx, DWORD PTR _decl$[ebp]
	mov	ecx, DWORD PTR [ecx+28]
	imul	eax, DWORD PTR [ecx+20]
	mov	DWORD PTR _bitsize$[ebp], eax
; Line 405
$L862:
; Line 410
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+32]
	shl	eax, 24					; 00000018H
	and	eax, -16777216				; ff000000H
	mov	ecx, 436207616				; 1a000000H
	and	ecx, -16777216				; ff000000H
	cmp	eax, ecx
	je	$L864
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+32]
	shl	eax, 24					; 00000018H
	and	eax, -16777216				; ff000000H
	mov	ecx, 419430400				; 19000000H
	and	ecx, -16777216				; ff000000H
	cmp	eax, ecx
	jne	$L863
$L864:
	mov	eax, DWORD PTR _type$[ebp]
	mov	eax, DWORD PTR [eax+32]
	shl	eax, 24					; 00000018H
	and	eax, -16777216				; ff000000H
	mov	ecx, 436207616				; 1a000000H
	and	ecx, -16777216				; ff000000H
	cmp	eax, ecx
	je	$L863
	mov	eax, DWORD PTR _type$[ebp]
	cmp	DWORD PTR [eax+28], 0
	je	$L863
	mov	eax, DWORD PTR _type$[ebp]
	mov	eax, DWORD PTR [eax+28]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 35					; 00000023H
	jne	$L863
; Line 412
	mov	eax, DWORD PTR _bitsize$[ebp]
	push	eax
	call	_agg_mode
	add	esp, 4
	mov	DWORD PTR _xmode$865[ebp], eax
; Line 415
	cmp	DWORD PTR _xmode$865[ebp], 26		; 0000001aH
	je	$L866
	mov	eax, DWORD PTR _known_align$[ebp]
	mov	ecx, DWORD PTR _xmode$865[ebp]
	mov	ecx, DWORD PTR _mode_unit_size[ecx*4]
	shl	ecx, 3
	cmp	ecx, 1
	jg	$L1013
	mov	ecx, 1
$L1013:
	cmp	ecx, 32					; 00000020H
	jl	$L1014
	mov	ecx, 32					; 00000020H
$L1014:
	sub	edx, edx
	div	ecx
	or	edx, edx
	jne	$L866
; Line 418
	mov	eax, DWORD PTR _xmode$865[ebp]
	mov	eax, DWORD PTR _mode_unit_size[eax*4]
	shl	eax, 3
	cmp	eax, 1
	jg	$L1015
	mov	eax, 1
$L1015:
	cmp	eax, 32					; 00000020H
	jl	$L1016
	mov	eax, 32					; 00000020H
$L1016:
	mov	ecx, DWORD PTR _decl$[ebp]
	mov	cl, BYTE PTR [ecx+37]
	and	ecx, 255				; 000000ffH
	cmp	eax, ecx
	jg	$L1017
	mov	eax, ecx
$L1017:
	mov	ecx, DWORD PTR _decl$[ebp]
	mov	BYTE PTR [ecx+37], al
; Line 419
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+32]
	and	eax, -256				; ffffff00H
	mov	al, BYTE PTR _xmode$865[ebp]
	mov	ecx, DWORD PTR _decl$[ebp]
	mov	DWORD PTR [ecx+32], eax
; Line 420
	mov	eax, DWORD PTR _xmode$865[ebp]
	mov	eax, DWORD PTR _mode_size[eax*4]
	push	eax
	call	_build_int
	add	esp, 4
	mov	ecx, DWORD PTR _decl$[ebp]
	mov	DWORD PTR [ecx+28], eax
; Line 421
	mov	eax, DWORD PTR _decl$[ebp]
	mov	BYTE PTR [eax+36], 8
; Line 422
	mov	eax, DWORD PTR _xmode$865[ebp]
	mov	eax, DWORD PTR _mode_size[eax*4]
	shl	eax, 3
	mov	DWORD PTR _bitsize$[ebp], eax
; Line 424
$L866:
; Line 430
$L863:
; Line 433
	mov	eax, DWORD PTR _decl$[ebp]
	cmp	DWORD PTR [eax+28], 0
	je	$L867
	mov	eax, DWORD PTR _type$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 19					; 00000013H
	je	$L868
	mov	eax, DWORD PTR _type$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 20					; 00000014H
	je	$L868
	mov	eax, DWORD PTR _type$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 16					; 00000010H
	jne	$L867
$L868:
; Line 440
	mov	eax, DWORD PTR _type$[ebp]
	mov	eax, DWORD PTR [eax+32]
	shl	eax, 24					; 00000018H
	and	eax, -16777216				; ff000000H
	sar	eax, 22					; 00000016H
	mov	eax, DWORD PTR _mode_size[eax]
	add	eax, 3
	cdq
	and	edx, 3
	add	eax, edx
	sar	eax, 2
	shl	eax, 5
	cmp	eax, DWORD PTR _bitsize$[ebp]
	jge	$L869
; Line 441
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+16]
	or	eax, 512				; 00000200H
	mov	ecx, DWORD PTR _decl$[ebp]
	mov	DWORD PTR [ecx+16], eax
; Line 442
$L869:
; Line 445
$L867:
	mov	eax, DWORD PTR _decl$[ebp]
	cmp	DWORD PTR [eax+28], 0
	je	$L870
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+28]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 6
	test	al, 1
	jne	$L870
; Line 446
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+28]
	push	eax
	call	_variable_size
	add	esp, 4
	mov	ecx, DWORD PTR _decl$[ebp]
	mov	DWORD PTR [ecx+28], eax
; Line 447
$L870:
$L848:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_layout_decl ENDP
_dsize$897 = -36
_tunits$902 = -40
_rec$ = 8
_field$ = -20
_record_align$ = -12
_pending_statics$ = -24
_const_size$ = -8
_var_size$ = -4
_size_unit$ = -16
_desired_align$883 = -28
_uelt$893 = -32
_layout_record PROC NEAR
; Line 461
	push	ebp
	mov	ebp, esp
	sub	esp, 44					; 0000002cH
	push	ebx
	push	esi
	push	edi
; Line 466
	mov	eax, DWORD PTR _rec$[ebp]
	mov	al, BYTE PTR [eax+37]
	and	eax, 255				; 000000ffH
	cmp	eax, 8
	jg	$L1020
	mov	eax, 8
$L1020:
	mov	DWORD PTR _record_align$[ebp], eax
; Line 469
	mov	DWORD PTR _pending_statics$[ebp], 0
; Line 475
	mov	DWORD PTR _const_size$[ebp], 0
; Line 476
	mov	DWORD PTR _var_size$[ebp], 0
; Line 477
	mov	DWORD PTR _size_unit$[ebp], 8
; Line 492
	mov	eax, DWORD PTR _rec$[ebp]
	mov	eax, DWORD PTR [eax+20]
	mov	DWORD PTR _field$[ebp], eax
	jmp	$L880
$L881:
	mov	eax, DWORD PTR _field$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _field$[ebp], eax
$L880:
	cmp	DWORD PTR _field$[ebp], 0
	je	$L882
; Line 502
	mov	eax, DWORD PTR _field$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 43					; 0000002bH
	jne	$L884
; Line 504
	mov	eax, DWORD PTR _pending_statics$[ebp]
	push	eax
	mov	eax, DWORD PTR _field$[ebp]
	push	eax
	push	0
	call	_tree_cons
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _pending_statics$[ebp], eax
; Line 505
	jmp	$L881
; Line 509
$L884:
	mov	eax, DWORD PTR _field$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 41					; 00000029H
	je	$L886
	mov	eax, DWORD PTR _field$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 42					; 0000002aH
	jne	$L885
$L886:
; Line 510
	jmp	$L881
; Line 516
$L885:
	cmp	DWORD PTR _var_size$[ebp], 0
	je	$L1018
	mov	eax, DWORD PTR _size_unit$[ebp]
	mov	DWORD PTR -44+[ebp], eax
	jmp	$L1019
$L1018:
	mov	eax, DWORD PTR _const_size$[ebp]
	mov	DWORD PTR -44+[ebp], eax
$L1019:
	mov	eax, DWORD PTR -44+[ebp]
	push	eax
	mov	eax, DWORD PTR _field$[ebp]
	push	eax
	call	_layout_decl
	add	esp, 8
; Line 517
	mov	eax, DWORD PTR _field$[ebp]
	mov	al, BYTE PTR [eax+37]
	and	eax, 255				; 000000ffH
	mov	DWORD PTR _desired_align$883[ebp], eax
; Line 523
	mov	eax, DWORD PTR _desired_align$883[ebp]
	mov	ecx, DWORD PTR _record_align$[ebp]
	cmp	eax, ecx
	jg	$L1021
	mov	eax, ecx
$L1021:
	mov	DWORD PTR _record_align$[ebp], eax
; Line 537
	mov	eax, DWORD PTR _const_size$[ebp]
	cdq
	idiv	DWORD PTR _desired_align$883[ebp]
	or	edx, edx
	jne	$L888
	mov	eax, DWORD PTR _size_unit$[ebp]
	cdq
	idiv	DWORD PTR _desired_align$883[ebp]
	or	edx, edx
	je	$L887
	cmp	DWORD PTR _var_size$[ebp], 0
	je	$L887
$L888:
; Line 543
	cmp	DWORD PTR _var_size$[ebp], 0
	je	$L890
	mov	eax, DWORD PTR _size_unit$[ebp]
	cdq
	idiv	DWORD PTR _desired_align$883[ebp]
	or	edx, edx
	jne	$L889
$L890:
; Line 545
	mov	eax, DWORD PTR _desired_align$883[ebp]
	mov	ecx, DWORD PTR _const_size$[ebp]
	lea	eax, DWORD PTR [eax+ecx-1]
	cdq
	idiv	DWORD PTR _desired_align$883[ebp]
	imul	eax, DWORD PTR _desired_align$883[ebp]
	mov	DWORD PTR _const_size$[ebp], eax
; Line 546
	jmp	$L891
$L889:
; Line 550
	mov	eax, DWORD PTR _size_unit$[ebp]
	mov	ecx, DWORD PTR _const_size$[ebp]
	lea	eax, DWORD PTR [eax+ecx-1]
	cdq
	idiv	DWORD PTR _size_unit$[ebp]
	push	eax
	call	_build_int
	add	esp, 4
	push	eax
	mov	eax, DWORD PTR _var_size$[ebp]
	push	eax
	push	64					; 00000040H
	call	_genop
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _var_size$[ebp], eax
; Line 551
	mov	DWORD PTR _const_size$[ebp], 0
; Line 552
	mov	eax, DWORD PTR _desired_align$883[ebp]
	push	eax
	mov	eax, DWORD PTR _size_unit$[ebp]
	push	eax
	mov	eax, DWORD PTR _var_size$[ebp]
	push	eax
	call	_convert_units
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _var_size$[ebp], eax
; Line 553
	mov	eax, DWORD PTR _desired_align$883[ebp]
	mov	DWORD PTR _size_unit$[ebp], eax
; Line 554
$L891:
; Line 583
$L887:
	mov	eax, DWORD PTR _const_size$[ebp]
	mov	ecx, DWORD PTR _field$[ebp]
	mov	DWORD PTR [ecx+48], eax
; Line 584
	mov	eax, DWORD PTR _var_size$[ebp]
	mov	ecx, DWORD PTR _field$[ebp]
	mov	DWORD PTR [ecx+52], eax
; Line 585
	mov	al, BYTE PTR _size_unit$[ebp]
	mov	ecx, DWORD PTR _field$[ebp]
	mov	BYTE PTR [ecx+38], al
; Line 591
	mov	eax, DWORD PTR _field$[ebp]
	cmp	DWORD PTR [eax+40], 0
	jne	$L892
	mov	eax, DWORD PTR _field$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 20					; 00000014H
	jne	$L892
; Line 593
	mov	eax, DWORD PTR _field$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+20]
	mov	DWORD PTR _uelt$893[ebp], eax
; Line 594
	jmp	$L894
$L895:
	mov	eax, DWORD PTR _uelt$893[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _uelt$893[ebp], eax
$L894:
	cmp	DWORD PTR _uelt$893[ebp], 0
	je	$L896
; Line 596
	mov	eax, DWORD PTR _field$[ebp]
	mov	eax, DWORD PTR [eax+44]
	mov	ecx, DWORD PTR _uelt$893[ebp]
	mov	DWORD PTR [ecx+44], eax
; Line 597
	mov	eax, DWORD PTR _field$[ebp]
	mov	eax, DWORD PTR [eax+48]
	mov	ecx, DWORD PTR _uelt$893[ebp]
	mov	DWORD PTR [ecx+48], eax
; Line 598
	mov	eax, DWORD PTR _field$[ebp]
	mov	eax, DWORD PTR [eax+52]
	mov	ecx, DWORD PTR _uelt$893[ebp]
	mov	DWORD PTR [ecx+52], eax
; Line 599
	mov	eax, DWORD PTR _field$[ebp]
	mov	al, BYTE PTR [eax+38]
	mov	ecx, DWORD PTR _uelt$893[ebp]
	mov	BYTE PTR [ecx+38], al
; Line 600
	jmp	$L895
$L896:
; Line 605
$L892:
; Line 606
	mov	eax, DWORD PTR _field$[ebp]
	mov	eax, DWORD PTR [eax+28]
	mov	DWORD PTR _dsize$897[ebp], eax
; Line 608
	mov	eax, DWORD PTR _dsize$897[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 6
	test	al, 1
	je	$L898
; Line 609
	mov	eax, DWORD PTR _field$[ebp]
	mov	al, BYTE PTR [eax+36]
	and	eax, 255				; 000000ffH
	mov	ecx, DWORD PTR _dsize$897[ebp]
	imul	eax, DWORD PTR [ecx+20]
	add	DWORD PTR _const_size$[ebp], eax
; Line 610
	jmp	$L899
$L898:
	cmp	DWORD PTR _var_size$[ebp], 0
	jne	$L900
; Line 612
	mov	eax, DWORD PTR _dsize$897[ebp]
	mov	DWORD PTR _var_size$[ebp], eax
; Line 613
	mov	eax, DWORD PTR _field$[ebp]
	mov	al, BYTE PTR [eax+36]
	and	eax, 255				; 000000ffH
	mov	DWORD PTR _size_unit$[ebp], eax
; Line 615
	jmp	$L901
$L900:
; Line 617
	mov	eax, DWORD PTR _field$[ebp]
	mov	al, BYTE PTR [eax+36]
	and	eax, 255				; 000000ffH
	mov	ecx, DWORD PTR _size_unit$[ebp]
	cmp	eax, ecx
	jl	$L1022
	mov	eax, ecx
$L1022:
	mov	DWORD PTR _tunits$902[ebp], eax
; Line 621
	mov	eax, DWORD PTR _tunits$902[ebp]
	push	eax
	mov	eax, DWORD PTR _field$[ebp]
	mov	al, BYTE PTR [eax+36]
	and	eax, 255				; 000000ffH
	push	eax
	mov	eax, DWORD PTR _dsize$897[ebp]
	push	eax
	call	_convert_units
	add	esp, 12					; 0000000cH
	push	eax
	mov	eax, DWORD PTR _tunits$902[ebp]
	push	eax
	mov	eax, DWORD PTR _size_unit$[ebp]
	push	eax
	mov	eax, DWORD PTR _var_size$[ebp]
	push	eax
	call	_convert_units
	add	esp, 12					; 0000000cH
	push	eax
	push	64					; 00000040H
	call	_genop
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _var_size$[ebp], eax
; Line 622
	mov	eax, DWORD PTR _tunits$902[ebp]
	mov	DWORD PTR _size_unit$[ebp], eax
; Line 623
$L901:
$L899:
; Line 625
	jmp	$L881
$L882:
; Line 631
	cmp	DWORD PTR _var_size$[ebp], 0
	jne	$L903
; Line 634
	mov	eax, DWORD PTR _const_size$[ebp]
	mov	ecx, DWORD PTR _record_align$[ebp]
	lea	eax, DWORD PTR [eax+ecx-1]
	cdq
	idiv	DWORD PTR _record_align$[ebp]
	imul	eax, DWORD PTR _record_align$[ebp]
	mov	ecx, DWORD PTR _size_unit$[ebp]
	lea	eax, DWORD PTR [eax+ecx-1]
	cdq
	idiv	DWORD PTR _size_unit$[ebp]
	push	eax
	call	_build_int
	add	esp, 4
	mov	ecx, DWORD PTR _rec$[ebp]
	mov	DWORD PTR [ecx+28], eax
; Line 635
	jmp	$L904
$L903:
; Line 637
	cmp	DWORD PTR _const_size$[ebp], 0
	je	$L905
; Line 640
	mov	eax, DWORD PTR _size_unit$[ebp]
	mov	ecx, DWORD PTR _const_size$[ebp]
	lea	eax, DWORD PTR [eax+ecx-1]
	cdq
	idiv	DWORD PTR _size_unit$[ebp]
	push	eax
	call	_build_int
	add	esp, 4
	push	eax
	mov	eax, DWORD PTR _var_size$[ebp]
	push	eax
	push	64					; 00000040H
	call	_genop
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _var_size$[ebp], eax
; Line 641
$L905:
; Line 644
	mov	eax, DWORD PTR _record_align$[ebp]
	push	eax
	mov	eax, DWORD PTR _size_unit$[ebp]
	push	eax
	mov	eax, DWORD PTR _var_size$[ebp]
	push	eax
	call	_convert_units
	add	esp, 12					; 0000000cH
	mov	ecx, DWORD PTR _rec$[ebp]
	mov	DWORD PTR [ecx+28], eax
; Line 645
	mov	eax, DWORD PTR _record_align$[ebp]
	mov	DWORD PTR _size_unit$[ebp], eax
; Line 646
$L904:
; Line 649
	push	8
	mov	eax, DWORD PTR _size_unit$[ebp]
	push	eax
	mov	eax, DWORD PTR _rec$[ebp]
	mov	eax, DWORD PTR [eax+28]
	push	eax
	call	_convert_units
	add	esp, 12					; 0000000cH
	mov	ecx, DWORD PTR _rec$[ebp]
	mov	DWORD PTR [ecx+28], eax
; Line 650
	mov	eax, DWORD PTR _rec$[ebp]
	mov	BYTE PTR [eax+36], 8
; Line 651
	mov	eax, DWORD PTR _record_align$[ebp]
	cmp	eax, 32					; 00000020H
	jl	$L1023
	mov	eax, 32					; 00000020H
$L1023:
	mov	ecx, DWORD PTR _rec$[ebp]
	mov	BYTE PTR [ecx+37], al
; Line 656
	mov	eax, DWORD PTR _pending_statics$[ebp]
	mov	DWORD PTR _field$[ebp], eax
	jmp	$L906
$L907:
	mov	eax, DWORD PTR _field$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _field$[ebp], eax
$L906:
	cmp	DWORD PTR _field$[ebp], 0
	je	$L908
; Line 657
	push	0
	mov	eax, DWORD PTR _field$[ebp]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	call	_layout_decl
	add	esp, 8
	jmp	$L907
$L908:
; Line 658
$L873:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_layout_record ENDP
_rec$ = 8
_field$ = -16
_union_align$ = -12
_const_size$ = -8
_var_size$ = -4
_layout_union PROC NEAR
; Line 669
	push	ebp
	mov	ebp, esp
	sub	esp, 16					; 00000010H
	push	ebx
	push	esi
	push	edi
; Line 674
	mov	DWORD PTR _union_align$[ebp], 8
; Line 680
	mov	DWORD PTR _const_size$[ebp], 0
; Line 681
	mov	DWORD PTR _var_size$[ebp], 0
; Line 683
	mov	eax, DWORD PTR _rec$[ebp]
	mov	eax, DWORD PTR [eax+20]
	mov	DWORD PTR _field$[ebp], eax
	jmp	$L916
$L917:
	mov	eax, DWORD PTR _field$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _field$[ebp], eax
$L916:
	cmp	DWORD PTR _field$[ebp], 0
	je	$L918
; Line 694
	mov	eax, DWORD PTR _field$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 41					; 00000029H
	je	$L920
	mov	eax, DWORD PTR _field$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 42					; 0000002aH
	jne	$L919
$L920:
; Line 695
	jmp	$L917
; Line 697
$L919:
	push	0
	mov	eax, DWORD PTR _field$[ebp]
	push	eax
	call	_layout_decl
	add	esp, 8
; Line 698
	mov	eax, DWORD PTR _field$[ebp]
	mov	DWORD PTR [eax+48], 0
; Line 699
	mov	eax, DWORD PTR _field$[ebp]
	mov	DWORD PTR [eax+52], 0
; Line 700
	mov	eax, DWORD PTR _field$[ebp]
	mov	BYTE PTR [eax+38], 8
; Line 704
	mov	eax, DWORD PTR _field$[ebp]
	mov	al, BYTE PTR [eax+37]
	and	eax, 255				; 000000ffH
	mov	ecx, DWORD PTR _union_align$[ebp]
	cmp	eax, ecx
	jg	$L1024
	mov	eax, ecx
$L1024:
	mov	DWORD PTR _union_align$[ebp], eax
; Line 717
	mov	eax, DWORD PTR _field$[ebp]
	mov	eax, DWORD PTR [eax+28]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 6
	test	al, 1
	je	$L921
; Line 720
	mov	eax, DWORD PTR _field$[ebp]
	mov	al, BYTE PTR [eax+36]
	and	eax, 255				; 000000ffH
	mov	ecx, DWORD PTR _field$[ebp]
	mov	ecx, DWORD PTR [ecx+28]
	imul	eax, DWORD PTR [ecx+20]
	mov	ecx, DWORD PTR _const_size$[ebp]
	cmp	eax, ecx
	jg	$L1025
	mov	eax, ecx
$L1025:
	mov	DWORD PTR _const_size$[ebp], eax
; Line 721
	jmp	$L922
$L921:
	cmp	DWORD PTR _var_size$[ebp], 0
	jne	$L923
; Line 724
	push	8
	mov	eax, DWORD PTR _field$[ebp]
	mov	al, BYTE PTR [eax+36]
	and	eax, 255				; 000000ffH
	push	eax
	mov	eax, DWORD PTR _field$[ebp]
	mov	eax, DWORD PTR [eax+28]
	push	eax
	call	_convert_units
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _var_size$[ebp], eax
; Line 725
	jmp	$L924
$L923:
; Line 730
	mov	eax, DWORD PTR _var_size$[ebp]
	push	eax
	push	8
	mov	eax, DWORD PTR _field$[ebp]
	mov	al, BYTE PTR [eax+36]
	and	eax, 255				; 000000ffH
	push	eax
	mov	eax, DWORD PTR _field$[ebp]
	mov	eax, DWORD PTR [eax+28]
	push	eax
	call	_convert_units
	add	esp, 12					; 0000000cH
	push	eax
	push	85					; 00000055H
	call	_genop
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _var_size$[ebp], eax
$L924:
$L922:
; Line 731
	jmp	$L917
$L918:
; Line 734
	cmp	DWORD PTR _var_size$[ebp], 0
	jne	$L925
; Line 735
	mov	eax, DWORD PTR _const_size$[ebp]
	add	eax, 7
	cdq
	and	edx, 7
	add	eax, edx
	sar	eax, 3
	push	eax
	call	_build_int
	add	esp, 4
	mov	ecx, DWORD PTR _rec$[ebp]
	mov	DWORD PTR [ecx+28], eax
; Line 736
	jmp	$L926
$L925:
	cmp	DWORD PTR _const_size$[ebp], 0
	jne	$L927
; Line 737
	mov	eax, DWORD PTR _var_size$[ebp]
	mov	ecx, DWORD PTR _rec$[ebp]
	mov	DWORD PTR [ecx+28], eax
; Line 738
	jmp	$L928
$L927:
; Line 740
	mov	eax, DWORD PTR _const_size$[ebp]
	add	eax, 7
	cdq
	and	edx, 7
	add	eax, edx
	sar	eax, 3
	push	eax
	call	_build_int
	add	esp, 4
	push	eax
	mov	eax, DWORD PTR _var_size$[ebp]
	push	eax
	push	85					; 00000055H
	call	_genop
	add	esp, 12					; 0000000cH
	mov	ecx, DWORD PTR _rec$[ebp]
	mov	DWORD PTR [ecx+28], eax
$L928:
$L926:
; Line 743
	mov	eax, DWORD PTR _union_align$[ebp]
	cmp	eax, 32					; 00000020H
	jl	$L1026
	mov	eax, 32					; 00000020H
$L1026:
	mov	DWORD PTR _union_align$[ebp], eax
; Line 744
	mov	eax, DWORD PTR _rec$[ebp]
	mov	al, BYTE PTR [eax+37]
	and	eax, 255				; 000000ffH
	mov	ecx, DWORD PTR _union_align$[ebp]
	cmp	eax, ecx
	jg	$L1027
	mov	eax, ecx
$L1027:
	mov	ecx, DWORD PTR _rec$[ebp]
	mov	BYTE PTR [ecx+37], al
; Line 748
	mov	eax, DWORD PTR _rec$[ebp]
	mov	al, BYTE PTR [eax+37]
	and	eax, 255				; 000000ffH
	push	eax
	push	8
	mov	eax, DWORD PTR _rec$[ebp]
	mov	eax, DWORD PTR [eax+28]
	push	eax
	call	_convert_units
	add	esp, 12					; 0000000cH
	mov	ecx, DWORD PTR _rec$[ebp]
	mov	DWORD PTR [ecx+28], eax
; Line 749
	mov	eax, DWORD PTR _rec$[ebp]
	mov	al, BYTE PTR [eax+37]
	mov	ecx, DWORD PTR _rec$[ebp]
	mov	BYTE PTR [ecx+36], al
; Line 750
$L911:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_layout_union ENDP
_TEXT	ENDS
PUBLIC	_layout_type
EXTRN	_build_pointer_type:NEAR
EXTRN	_suspend_momentary:NEAR
EXTRN	_resume_momentary:NEAR
_TEXT	SEGMENT
_index$961 = -28
_length$962 = -32
_element$963 = -24
_field$971 = -36
_field$980 = -40
_variant$991 = -48
_size$992 = -44
_size_unit$993 = -56
_type$ = 8
_align$994 = -52
_mode$995 = -60
_old$ = -8
_temporary$ = -4
_mode$945 = -16
_t$946 = -12
_prec$952 = -20
_layout_type PROC NEAR
; Line 765
	push	ebp
	mov	ebp, esp
	sub	esp, 64					; 00000040H
	push	ebx
	push	esi
	push	edi
; Line 767
	mov	DWORD PTR _temporary$[ebp], 0
; Line 769
	cmp	DWORD PTR _type$[ebp], 0
	jne	$L933
; Line 770
	call	_abort
; Line 773
$L933:
	mov	eax, DWORD PTR _type$[ebp]
	cmp	DWORD PTR [eax+28], 0
	je	$L934
; Line 774
	jmp	$L930
; Line 778
$L934:
	call	_suspend_momentary
	mov	DWORD PTR _old$[ebp], eax
; Line 779
	mov	eax, DWORD PTR _type$[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 8
	test	al, 1
	je	$L936
	call	_allocation_temporary_p
	or	eax, eax
	je	$L936
; Line 781
	mov	DWORD PTR _temporary$[ebp], 1
; Line 782
	call	_end_temporary_allocation
; Line 785
$L936:
	mov	eax, DWORD PTR _type$[ebp]
	push	eax
	call	_chain_type
	add	esp, 4
; Line 787
	mov	eax, DWORD PTR _type$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	mov	DWORD PTR -64+[ebp], eax
	jmp	$L937
; Line 789
$L941:
; Line 792
	call	_abort
; Line 794
$L942:
; Line 795
	mov	eax, DWORD PTR _size_zero_node
	mov	ecx, DWORD PTR _type$[ebp]
	mov	DWORD PTR [ecx+28], eax
; Line 796
	mov	eax, DWORD PTR _type$[ebp]
	mov	BYTE PTR [eax+36], 8
; Line 797
	mov	eax, DWORD PTR _type$[ebp]
	mov	BYTE PTR [eax+37], 1
; Line 798
	mov	eax, DWORD PTR _type$[ebp]
	and	DWORD PTR [eax+32], -256		; ffffff00H
; Line 799
	jmp	$L938
; Line 801
$L943:
; Line 803
	mov	eax, DWORD PTR _type$[ebp]
	mov	eax, DWORD PTR [eax+24]
	cmp	DWORD PTR [eax+24], 0
	jl	$L944
; Line 804
	mov	eax, DWORD PTR _type$[ebp]
	mov	eax, DWORD PTR [eax+16]
	or	eax, 4096				; 00001000H
	mov	ecx, DWORD PTR _type$[ebp]
	mov	DWORD PTR [ecx+16], eax
; Line 808
$L944:
; Line 812
	mov	DWORD PTR _mode$945[ebp], 26		; 0000001aH
; Line 814
	mov	DWORD PTR _t$946[ebp], 1
	jmp	$L947
$L948:
	inc	DWORD PTR _t$946[ebp]
$L947:
	mov	eax, DWORD PTR _t$946[ebp]
	cmp	DWORD PTR _mode_class[eax*4], 1
	jne	$L949
; Line 815
	mov	eax, DWORD PTR _t$946[ebp]
	mov	eax, DWORD PTR _mode_size[eax*4]
	shl	eax, 3
	mov	ecx, DWORD PTR _type$[ebp]
	mov	cl, BYTE PTR [ecx+38]
	and	ecx, 255				; 000000ffH
	cmp	eax, ecx
	jne	$L950
; Line 816
	mov	eax, DWORD PTR _t$946[ebp]
	mov	DWORD PTR _mode$945[ebp], eax
; Line 818
$L950:
	jmp	$L948
$L949:
	mov	eax, DWORD PTR _type$[ebp]
	mov	eax, DWORD PTR [eax+32]
	and	eax, -256				; ffffff00H
	mov	al, BYTE PTR _mode$945[ebp]
	mov	ecx, DWORD PTR _type$[ebp]
	mov	DWORD PTR [ecx+32], eax
; Line 820
	mov	eax, DWORD PTR _type$[ebp]
	mov	eax, DWORD PTR [eax+32]
	shl	eax, 24					; 00000018H
	and	eax, -16777216				; ff000000H
	sar	eax, 22					; 00000016H
	mov	eax, DWORD PTR _mode_size[eax]
	push	eax
	call	_build_int
	add	esp, 4
	mov	ecx, DWORD PTR _type$[ebp]
	mov	DWORD PTR [ecx+28], eax
; Line 821
	mov	eax, DWORD PTR _type$[ebp]
	mov	BYTE PTR [eax+36], 8
; Line 822
	mov	eax, DWORD PTR _type$[ebp]
	mov	eax, DWORD PTR [eax+32]
	shl	eax, 24					; 00000018H
	and	eax, -16777216				; ff000000H
	sar	eax, 22					; 00000016H
	mov	eax, DWORD PTR _mode_unit_size[eax]
	shl	eax, 3
	cmp	eax, 1
	jg	$L1028
	mov	eax, 1
$L1028:
	cmp	eax, 32					; 00000020H
	jl	$L1029
	mov	eax, 32					; 00000020H
$L1029:
	mov	ecx, DWORD PTR _type$[ebp]
	mov	BYTE PTR [ecx+37], al
; Line 823
	jmp	$L938
; Line 825
$L951:
; Line 827
	mov	eax, DWORD PTR _type$[ebp]
	mov	al, BYTE PTR [eax+38]
	and	eax, 255				; 000000ffH
	mov	DWORD PTR _prec$952[ebp], eax
; Line 828
	mov	eax, DWORD PTR _mode_size+40
	shl	eax, 3
	cmp	eax, DWORD PTR _prec$952[ebp]
	jl	$L953
; Line 829
	mov	eax, DWORD PTR _type$[ebp]
	mov	eax, DWORD PTR [eax+32]
	and	eax, -246				; ffffff0aH
	or	eax, 10					; 0000000aH
	mov	ecx, DWORD PTR _type$[ebp]
	mov	DWORD PTR [ecx+32], eax
; Line 830
	jmp	$L954
$L953:
	mov	eax, DWORD PTR _mode_size+44
	shl	eax, 3
	cmp	eax, DWORD PTR _prec$952[ebp]
	jl	$L955
; Line 831
	mov	eax, DWORD PTR _type$[ebp]
	mov	eax, DWORD PTR [eax+32]
	and	eax, -245				; ffffff0bH
	or	eax, 11					; 0000000bH
	mov	ecx, DWORD PTR _type$[ebp]
	mov	DWORD PTR [ecx+32], eax
; Line 832
	jmp	$L956
$L955:
	mov	eax, DWORD PTR _mode_size+52
	shl	eax, 3
	cmp	eax, DWORD PTR _prec$952[ebp]
	jl	$L957
; Line 833
	mov	eax, DWORD PTR _type$[ebp]
	mov	eax, DWORD PTR [eax+32]
	and	eax, -243				; ffffff0dH
	or	eax, 13					; 0000000dH
	mov	ecx, DWORD PTR _type$[ebp]
	mov	DWORD PTR [ecx+32], eax
; Line 834
	jmp	$L958
$L957:
; Line 835
	call	_abort
$L958:
$L956:
$L954:
; Line 837
	mov	eax, DWORD PTR _type$[ebp]
	mov	eax, DWORD PTR [eax+32]
	shl	eax, 24					; 00000018H
	and	eax, -16777216				; ff000000H
	sar	eax, 22					; 00000016H
	mov	eax, DWORD PTR _mode_size[eax]
	push	eax
	call	_build_int
	add	esp, 4
	mov	ecx, DWORD PTR _type$[ebp]
	mov	DWORD PTR [ecx+28], eax
; Line 838
	mov	eax, DWORD PTR _type$[ebp]
	mov	BYTE PTR [eax+36], 8
; Line 839
	mov	eax, DWORD PTR _type$[ebp]
	mov	eax, DWORD PTR [eax+32]
	shl	eax, 24					; 00000018H
	and	eax, -16777216				; ff000000H
	sar	eax, 22					; 00000016H
	mov	eax, DWORD PTR _mode_unit_size[eax]
	shl	eax, 3
	cmp	eax, 1
	jg	$L1030
	mov	eax, 1
$L1030:
	cmp	eax, 32					; 00000020H
	jl	$L1031
	mov	eax, 32					; 00000020H
$L1031:
	mov	ecx, DWORD PTR _type$[ebp]
	mov	BYTE PTR [ecx+37], al
; Line 840
	jmp	$L938
; Line 842
$L959:
; Line 844
	mov	eax, DWORD PTR _type$[ebp]
	mov	eax, DWORD PTR [eax+32]
	and	eax, -252				; ffffff04H
	or	eax, 4
	mov	ecx, DWORD PTR _type$[ebp]
	mov	DWORD PTR [ecx+32], eax
; Line 845
	push	4
	call	_build_int
	add	esp, 4
	mov	ecx, DWORD PTR _type$[ebp]
	mov	DWORD PTR [ecx+28], eax
; Line 846
	mov	eax, DWORD PTR _type$[ebp]
	mov	BYTE PTR [eax+36], 8
; Line 847
	mov	eax, DWORD PTR _type$[ebp]
	mov	BYTE PTR [eax+37], 32			; 00000020H
; Line 848
	mov	eax, DWORD PTR _type$[ebp]
	mov	eax, DWORD PTR [eax+16]
	or	eax, 4096				; 00001000H
	mov	ecx, DWORD PTR _type$[ebp]
	mov	DWORD PTR [ecx+16], eax
; Line 849
	mov	eax, DWORD PTR _type$[ebp]
	mov	BYTE PTR [eax+38], 32			; 00000020H
; Line 850
	jmp	$L938
; Line 852
$L960:
; Line 854
	mov	eax, DWORD PTR _type$[ebp]
	mov	eax, DWORD PTR [eax+20]
	mov	DWORD PTR _index$961[ebp], eax
; Line 856
	mov	eax, DWORD PTR _type$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _element$963[ebp], eax
; Line 859
	mov	eax, DWORD PTR _element$963[ebp]
	push	eax
	call	_build_pointer_type
	add	esp, 4
; Line 861
	cmp	DWORD PTR _index$961[ebp], 0
	jne	$L964
; Line 862
	mov	DWORD PTR _length$962[ebp], 0
; Line 863
	jmp	$L965
$L964:
; Line 866
	mov	eax, DWORD PTR _index$961[ebp]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	mov	eax, DWORD PTR _index$961[ebp]
	mov	eax, DWORD PTR [eax+60]
	push	eax
	push	65					; 00000041H
	call	_genop
	add	esp, 12					; 0000000cH
	push	eax
	mov	eax, DWORD PTR _size_one_node
	push	eax
	push	64					; 00000040H
	call	_genop
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _length$962[ebp], eax
$L965:
; Line 868
	mov	eax, DWORD PTR _type$[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 4
	test	al, 1
	je	$L966
; Line 869
	call	_abort
; Line 871
$L966:
	mov	eax, DWORD PTR _element$963[ebp]
	mov	al, BYTE PTR [eax+36]
	mov	ecx, DWORD PTR _type$[ebp]
	mov	BYTE PTR [ecx+36], al
; Line 872
	cmp	DWORD PTR _length$962[ebp], 0
	je	$L967
	mov	eax, DWORD PTR _element$963[ebp]
	cmp	DWORD PTR [eax+28], 0
	je	$L967
; Line 873
	mov	eax, DWORD PTR _length$962[ebp]
	push	eax
	mov	eax, DWORD PTR _element$963[ebp]
	mov	eax, DWORD PTR [eax+28]
	push	eax
	push	66					; 00000042H
	call	_genop
	add	esp, 12					; 0000000cH
	mov	ecx, DWORD PTR _type$[ebp]
	mov	DWORD PTR [ecx+28], eax
; Line 874
$L967:
	mov	eax, DWORD PTR _element$963[ebp]
	mov	eax, DWORD PTR [eax+28]
	mov	ecx, DWORD PTR _type$[ebp]
	mov	DWORD PTR [ecx+24], eax
; Line 875
	mov	eax, DWORD PTR _element$963[ebp]
	mov	al, BYTE PTR [eax+36]
	mov	ecx, DWORD PTR _type$[ebp]
	mov	BYTE PTR [ecx+38], al
; Line 876
	mov	eax, DWORD PTR _element$963[ebp]
	mov	al, BYTE PTR [eax+37]
	and	eax, 255				; 000000ffH
	cmp	eax, 8
	jg	$L1032
	mov	eax, 8
$L1032:
	mov	ecx, DWORD PTR _type$[ebp]
	mov	BYTE PTR [ecx+37], al
; Line 877
	mov	eax, DWORD PTR _type$[ebp]
	mov	eax, DWORD PTR [eax+32]
	and	eax, -230				; ffffff1aH
	or	eax, 26					; 0000001aH
	mov	ecx, DWORD PTR _type$[ebp]
	mov	DWORD PTR [ecx+32], eax
; Line 888
	mov	eax, DWORD PTR _type$[ebp]
	cmp	DWORD PTR [eax+28], 0
	je	$L968
	mov	eax, DWORD PTR _type$[ebp]
	mov	eax, DWORD PTR [eax+28]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 35					; 00000023H
	jne	$L968
	mov	eax, DWORD PTR _type$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+32]
	shl	eax, 24					; 00000018H
	and	eax, -16777216				; ff000000H
	mov	ecx, 436207616				; 1a000000H
	and	ecx, -16777216				; ff000000H
	cmp	eax, ecx
	je	$L968
; Line 892
	mov	eax, DWORD PTR _type$[ebp]
	mov	al, BYTE PTR [eax+36]
	and	eax, 255				; 000000ffH
	mov	ecx, DWORD PTR _type$[ebp]
	mov	ecx, DWORD PTR [ecx+28]
	imul	eax, DWORD PTR [ecx+20]
	push	eax
	call	_agg_mode
	add	esp, 4
	and	eax, 255				; 000000ffH
	mov	ecx, DWORD PTR _type$[ebp]
	mov	ecx, DWORD PTR [ecx+32]
	and	ecx, -256				; ffffff00H
	or	eax, ecx
	mov	ecx, DWORD PTR _type$[ebp]
	mov	DWORD PTR [ecx+32], eax
; Line 894
$L968:
	jmp	$L938
; Line 897
$L969:
; Line 898
	mov	eax, DWORD PTR _type$[ebp]
	push	eax
	call	_layout_record
	add	esp, 4
; Line 899
	mov	eax, DWORD PTR _type$[ebp]
	mov	eax, DWORD PTR [eax+32]
	and	eax, -230				; ffffff1aH
	or	eax, 26					; 0000001aH
	mov	ecx, DWORD PTR _type$[ebp]
	mov	DWORD PTR [ecx+32], eax
; Line 909
	mov	eax, DWORD PTR _type$[ebp]
	mov	eax, DWORD PTR [eax+28]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 35					; 00000023H
	jne	$L970
; Line 914
	mov	eax, DWORD PTR _type$[ebp]
	mov	eax, DWORD PTR [eax+20]
	mov	DWORD PTR _field$971[ebp], eax
	jmp	$L972
$L973:
	mov	eax, DWORD PTR _field$971[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _field$971[ebp], eax
$L972:
	cmp	DWORD PTR _field$971[ebp], 0
	je	$L974
; Line 916
	mov	eax, DWORD PTR _field$971[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+32]
	shl	eax, 24					; 00000018H
	and	eax, -16777216				; ff000000H
	mov	ecx, 436207616				; 1a000000H
	and	ecx, -16777216				; ff000000H
	cmp	eax, ecx
	jne	$L975
; Line 917
	jmp	$record_lose$976
; Line 921
$L975:
; Line 924
	mov	eax, DWORD PTR _field$971[ebp]
	mov	al, BYTE PTR [eax+36]
	and	eax, 255				; 000000ffH
	mov	ecx, DWORD PTR _field$971[ebp]
	mov	ecx, DWORD PTR [ecx+28]
	imul	eax, DWORD PTR [ecx+20]
	mov	ecx, DWORD PTR _field$971[ebp]
	mov	ecx, DWORD PTR [ecx+48]
	lea	eax, DWORD PTR [eax+ecx-1]
	cdq
	and	edx, 31					; 0000001fH
	add	eax, edx
	sar	eax, 5
	mov	ecx, eax
	mov	eax, DWORD PTR _field$971[ebp]
	mov	eax, DWORD PTR [eax+48]
	cdq
	and	edx, 31					; 0000001fH
	add	eax, edx
	sar	eax, 5
	cmp	ecx, eax
	je	$L977
; Line 925
	jmp	$record_lose$976
; Line 926
$L977:
	jmp	$L973
$L974:
; Line 930
	mov	eax, DWORD PTR _type$[ebp]
	mov	al, BYTE PTR [eax+36]
	and	eax, 255				; 000000ffH
	mov	ecx, DWORD PTR _type$[ebp]
	mov	ecx, DWORD PTR [ecx+28]
	imul	eax, DWORD PTR [ecx+20]
	push	eax
	call	_agg_mode
	add	esp, 4
	and	eax, 255				; 000000ffH
	mov	ecx, DWORD PTR _type$[ebp]
	mov	ecx, DWORD PTR [ecx+32]
	and	ecx, -256				; ffffff00H
	or	eax, ecx
	mov	ecx, DWORD PTR _type$[ebp]
	mov	DWORD PTR [ecx+32], eax
; Line 931
$record_lose$976:
; Line 933
$L970:
	jmp	$L938
; Line 935
$L978:
; Line 936
	mov	eax, DWORD PTR _type$[ebp]
	push	eax
	call	_layout_union
	add	esp, 4
; Line 937
	mov	eax, DWORD PTR _type$[ebp]
	mov	eax, DWORD PTR [eax+32]
	and	eax, -230				; ffffff1aH
	or	eax, 26					; 0000001aH
	mov	ecx, DWORD PTR _type$[ebp]
	mov	DWORD PTR [ecx+32], eax
; Line 947
	mov	eax, DWORD PTR _type$[ebp]
	mov	eax, DWORD PTR [eax+28]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 35					; 00000023H
	jne	$L979
; Line 952
	mov	eax, DWORD PTR _type$[ebp]
	mov	eax, DWORD PTR [eax+20]
	mov	DWORD PTR _field$980[ebp], eax
	jmp	$L981
$L982:
	mov	eax, DWORD PTR _field$980[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _field$980[ebp], eax
$L981:
	cmp	DWORD PTR _field$980[ebp], 0
	je	$L983
; Line 953
	mov	eax, DWORD PTR _field$980[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+32]
	shl	eax, 24					; 00000018H
	and	eax, -16777216				; ff000000H
	mov	ecx, 436207616				; 1a000000H
	and	ecx, -16777216				; ff000000H
	cmp	eax, ecx
	jne	$L984
; Line 954
	jmp	$union_lose$985
; Line 956
$L984:
	jmp	$L982
$L983:
; Line 958
	mov	eax, DWORD PTR _type$[ebp]
	mov	al, BYTE PTR [eax+36]
	and	eax, 255				; 000000ffH
	mov	ecx, DWORD PTR _type$[ebp]
	mov	ecx, DWORD PTR [ecx+28]
	imul	eax, DWORD PTR [ecx+20]
	push	eax
	call	_agg_mode
	add	esp, 4
	and	eax, 255				; 000000ffH
	mov	ecx, DWORD PTR _type$[ebp]
	mov	ecx, DWORD PTR [ecx+32]
	and	ecx, -256				; ffffff00H
	or	eax, ecx
	mov	ecx, DWORD PTR _type$[ebp]
	mov	DWORD PTR [ecx+32], eax
; Line 959
$union_lose$985:
; Line 961
$L979:
	jmp	$L938
; Line 963
$L986:
; Line 965
	mov	eax, DWORD PTR _type$[ebp]
	mov	eax, DWORD PTR [eax+32]
	and	eax, -229				; ffffff1bH
	or	eax, 27					; 0000001bH
	mov	ecx, DWORD PTR _type$[ebp]
	mov	DWORD PTR [ecx+32], eax
; Line 966
	push	8
	call	_build_int
	add	esp, 4
	mov	ecx, DWORD PTR _type$[ebp]
	mov	DWORD PTR [ecx+28], eax
; Line 967
	mov	eax, DWORD PTR _type$[ebp]
	mov	BYTE PTR [eax+36], 8
; Line 968
	mov	eax, DWORD PTR _type$[ebp]
	mov	BYTE PTR [eax+37], 32			; 00000020H
; Line 969
	jmp	$L938
; Line 971
$L987:
; Line 972
	call	_abort
; Line 973
	jmp	$L938
$L937:
	sub	DWORD PTR -64+[ebp], 4
	cmp	DWORD PTR -64+[ebp], 18			; 00000012H
	ja	$L987
	shl	DWORD PTR -64+[ebp], 2
	mov	eax, DWORD PTR -64+[ebp]
	jmp	DWORD PTR $L1033[eax]
$L1033:
	DD	OFFSET $L942
	DD	OFFSET $L943
	DD	OFFSET $L951
	DD	OFFSET $L987
	DD	OFFSET $L943
	DD	OFFSET $L987
	DD	OFFSET $L987
	DD	OFFSET $L959
	DD	OFFSET $L987
	DD	OFFSET $L959
	DD	OFFSET $L986
	DD	OFFSET $L987
	DD	OFFSET $L960
	DD	OFFSET $L987
	DD	OFFSET $L987
	DD	OFFSET $L969
	DD	OFFSET $L978
	DD	OFFSET $L986
	DD	OFFSET $L941
$L938:
; Line 976
	mov	eax, DWORD PTR _type$[ebp]
	cmp	DWORD PTR [eax+28], 0
	je	$L988
	mov	eax, DWORD PTR _type$[ebp]
	mov	eax, DWORD PTR [eax+28]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 6
	test	al, 1
	jne	$L988
; Line 977
	mov	eax, DWORD PTR _type$[ebp]
	mov	eax, DWORD PTR [eax+28]
	push	eax
	call	_variable_size
	add	esp, 4
	mov	ecx, DWORD PTR _type$[ebp]
	mov	DWORD PTR [ecx+28], eax
; Line 980
$L988:
; Line 981
	mov	eax, DWORD PTR _type$[ebp]
	cmp	DWORD PTR [eax+64], 0
	jne	$L990
	mov	eax, DWORD PTR _type$[ebp]
	mov	ecx, DWORD PTR _type$[ebp]
	cmp	DWORD PTR [eax+68], ecx
	je	$L989
$L990:
; Line 985
	mov	eax, DWORD PTR _type$[ebp]
	mov	eax, DWORD PTR [eax+28]
	mov	DWORD PTR _size$992[ebp], eax
; Line 986
	mov	eax, DWORD PTR _type$[ebp]
	mov	al, BYTE PTR [eax+36]
	and	eax, 255				; 000000ffH
	mov	DWORD PTR _size_unit$993[ebp], eax
; Line 987
	mov	eax, DWORD PTR _type$[ebp]
	mov	al, BYTE PTR [eax+37]
	and	eax, 255				; 000000ffH
	mov	DWORD PTR _align$994[ebp], eax
; Line 988
	mov	eax, DWORD PTR _type$[ebp]
	mov	eax, DWORD PTR [eax+32]
	shl	eax, 24					; 00000018H
	sar	eax, 24					; 00000018H
	mov	DWORD PTR _mode$995[ebp], eax
; Line 993
	mov	eax, DWORD PTR _type$[ebp]
	mov	eax, DWORD PTR [eax+68]
	mov	DWORD PTR _variant$991[ebp], eax
	jmp	$L996
$L997:
	mov	eax, DWORD PTR _variant$991[ebp]
	mov	eax, DWORD PTR [eax+64]
	mov	DWORD PTR _variant$991[ebp], eax
$L996:
	cmp	DWORD PTR _variant$991[ebp], 0
	je	$L998
; Line 995
	mov	eax, DWORD PTR _size$992[ebp]
	mov	ecx, DWORD PTR _variant$991[ebp]
	mov	DWORD PTR [ecx+28], eax
; Line 996
	mov	al, BYTE PTR _size_unit$993[ebp]
	mov	ecx, DWORD PTR _variant$991[ebp]
	mov	BYTE PTR [ecx+36], al
; Line 997
	mov	al, BYTE PTR _align$994[ebp]
	mov	ecx, DWORD PTR _variant$991[ebp]
	mov	BYTE PTR [ecx+37], al
; Line 998
	mov	eax, DWORD PTR _variant$991[ebp]
	mov	eax, DWORD PTR [eax+32]
	and	eax, -256				; ffffff00H
	mov	al, BYTE PTR _mode$995[ebp]
	mov	ecx, DWORD PTR _variant$991[ebp]
	mov	DWORD PTR [ecx+32], eax
; Line 999
	jmp	$L997
$L998:
; Line 1002
$L989:
	cmp	DWORD PTR _temporary$[ebp], 0
	je	$L999
; Line 1003
	call	_resume_temporary_allocation
; Line 1004
$L999:
	mov	eax, DWORD PTR _old$[ebp]
	push	eax
	call	_resume_momentary
	add	esp, 4
; Line 1005
$L930:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_layout_type ENDP
_TEXT	ENDS
PUBLIC	_make_signed_type
EXTRN	_make_node:NEAR
_TEXT	SEGMENT
_precision$ = 8
_type$ = -4
_make_signed_type PROC NEAR
; Line 1012
	push	ebp
	mov	ebp, esp
	sub	esp, 16					; 00000010H
	push	ebx
	push	esi
	push	edi
; Line 1013
	push	5
	call	_make_node
	add	esp, 4
	mov	DWORD PTR _type$[ebp], eax
; Line 1015
	mov	al, BYTE PTR _precision$[ebp]
	mov	ecx, DWORD PTR _type$[ebp]
	mov	BYTE PTR [ecx+38], al
; Line 1023
	mov	eax, DWORD PTR _precision$[ebp]
	sub	eax, 32					; 00000020H
	or	eax, eax
	jle	$L1034
	mov	DWORD PTR -8+[ebp], 0
	jmp	$L1035
$L1034:
	mov	eax, -1
	mov	ecx, DWORD PTR _precision$[ebp]
	dec	ecx
	shl	eax, cl
	mov	DWORD PTR -8+[ebp], eax
$L1035:
	mov	eax, -1
	mov	ecx, DWORD PTR _precision$[ebp]
	sub	ecx, 33					; 00000021H
	or	ecx, ecx
	jg	$L1040
	sub	ecx, ecx
$L1040:
	shl	eax, cl
	push	eax
	mov	eax, DWORD PTR -8+[ebp]
	push	eax
	call	_build_int_2
	add	esp, 8
	mov	edx, DWORD PTR _type$[ebp]
	mov	DWORD PTR [edx+24], eax
; Line 1028
	mov	eax, DWORD PTR _precision$[ebp]
	sub	eax, 33					; 00000021H
	or	eax, eax
	jle	$L1036
	mov	eax, 1
	mov	edx, DWORD PTR _precision$[ebp]
	sub	edx, 33					; 00000021H
	mov	cl, dl
	shl	eax, cl
	dec	eax
	mov	DWORD PTR -12+[ebp], eax
	jmp	$L1037
$L1036:
	mov	DWORD PTR -12+[ebp], 0
$L1037:
	mov	eax, DWORD PTR _precision$[ebp]
	sub	eax, 32					; 00000020H
	or	eax, eax
	jle	$L1038
	mov	DWORD PTR -16+[ebp], -1
	jmp	$L1039
$L1038:
	mov	eax, 1
	mov	ecx, DWORD PTR _precision$[ebp]
	dec	ecx
	shl	eax, cl
	dec	eax
	mov	DWORD PTR -16+[ebp], eax
$L1039:
	mov	eax, DWORD PTR -12+[ebp]
	push	eax
	mov	eax, DWORD PTR -16+[ebp]
	push	eax
	call	_build_int_2
	add	esp, 8
	mov	ecx, DWORD PTR _type$[ebp]
	mov	DWORD PTR [ecx+60], eax
; Line 1032
	mov	eax, DWORD PTR _type$[ebp]
	mov	ecx, DWORD PTR _type$[ebp]
	mov	ecx, DWORD PTR [ecx+24]
	mov	DWORD PTR [ecx+8], eax
; Line 1033
	mov	eax, DWORD PTR _type$[ebp]
	mov	ecx, DWORD PTR _type$[ebp]
	mov	ecx, DWORD PTR [ecx+60]
	mov	DWORD PTR [ecx+8], eax
; Line 1038
	cmp	DWORD PTR _sizetype, 0
	jne	$L1004
; Line 1039
	mov	eax, DWORD PTR _type$[ebp]
	mov	DWORD PTR _sizetype, eax
; Line 1043
$L1004:
	mov	eax, DWORD PTR _type$[ebp]
	push	eax
	call	_layout_type
	add	esp, 4
; Line 1045
	mov	eax, DWORD PTR _type$[ebp]
	jmp	$L1002
; Line 1046
$L1002:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_make_signed_type ENDP
_TEXT	ENDS
PUBLIC	_make_unsigned_type
PUBLIC	_fixup_unsigned_type
_TEXT	SEGMENT
_precision$ = 8
_type$ = -4
_make_unsigned_type PROC NEAR
; Line 1053
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 1054
	push	5
	call	_make_node
	add	esp, 4
	mov	DWORD PTR _type$[ebp], eax
; Line 1056
	mov	al, BYTE PTR _precision$[ebp]
	mov	ecx, DWORD PTR _type$[ebp]
	mov	BYTE PTR [ecx+38], al
; Line 1061
	cmp	DWORD PTR _sizetype, 0
	jne	$L1008
; Line 1062
	mov	eax, DWORD PTR _type$[ebp]
	mov	DWORD PTR _sizetype, eax
; Line 1064
$L1008:
	mov	eax, DWORD PTR _type$[ebp]
	push	eax
	call	_fixup_unsigned_type
	add	esp, 4
; Line 1065
	mov	eax, DWORD PTR _type$[ebp]
	jmp	$L1006
; Line 1066
$L1006:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_make_unsigned_type ENDP
_type$ = 8
_precision$ = -4
_fixup_unsigned_type PROC NEAR
; Line 1075
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
	push	ebx
	push	esi
	push	edi
; Line 1076
	mov	eax, DWORD PTR _type$[ebp]
	mov	al, BYTE PTR [eax+38]
	and	eax, 255				; 000000ffH
	mov	DWORD PTR _precision$[ebp], eax
; Line 1078
	push	0
	push	0
	call	_build_int_2
	add	esp, 8
	mov	edx, DWORD PTR _type$[ebp]
	mov	DWORD PTR [edx+24], eax
; Line 1084
	mov	eax, DWORD PTR _precision$[ebp]
	sub	eax, 32					; 00000020H
	or	eax, eax
	jle	$L1041
	mov	eax, -1
	mov	edx, 32					; 00000020H
	mov	ebx, DWORD PTR _precision$[ebp]
	sub	ebx, 32					; 00000020H
	sub	edx, ebx
	mov	cl, dl
	shr	eax, cl
	mov	DWORD PTR -8+[ebp], eax
	jmp	$L1042
$L1041:
	mov	DWORD PTR -8+[ebp], 0
$L1042:
	mov	eax, DWORD PTR _precision$[ebp]
	sub	eax, 32					; 00000020H
	js	$L1043
	mov	DWORD PTR -12+[ebp], -1
	jmp	$L1044
$L1043:
	mov	eax, 1
	mov	cl, BYTE PTR _precision$[ebp]
	shl	eax, cl
	dec	eax
	mov	DWORD PTR -12+[ebp], eax
$L1044:
	mov	eax, DWORD PTR -8+[ebp]
	push	eax
	mov	eax, DWORD PTR -12+[ebp]
	push	eax
	call	_build_int_2
	add	esp, 8
	mov	ecx, DWORD PTR _type$[ebp]
	mov	DWORD PTR [ecx+60], eax
; Line 1085
	mov	eax, DWORD PTR _type$[ebp]
	mov	ecx, DWORD PTR _type$[ebp]
	mov	ecx, DWORD PTR [ecx+24]
	mov	DWORD PTR [ecx+8], eax
; Line 1086
	mov	eax, DWORD PTR _type$[ebp]
	mov	ecx, DWORD PTR _type$[ebp]
	mov	ecx, DWORD PTR [ecx+60]
	mov	DWORD PTR [ecx+8], eax
; Line 1090
	mov	eax, DWORD PTR _type$[ebp]
	push	eax
	call	_layout_type
	add	esp, 4
; Line 1091
$L1010:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_fixup_unsigned_type ENDP
_TEXT	ENDS
END
