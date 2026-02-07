	TITLE	c-typeck.c
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
PUBLIC	_datatype
EXTRN	_build_pointer_type:NEAR
_TEXT	SEGMENT
; File c-typeck.c
_node$ = 8
_type$ = -4
_datatype PROC NEAR
; Line 63
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 64
	mov	eax, DWORD PTR _node$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _type$[ebp], eax
; Line 65
	mov	eax, DWORD PTR _type$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 16					; 00000010H
	jne	$L691
; Line 66
	mov	eax, DWORD PTR _type$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+40]
	jmp	$L689
; Line 67
$L691:
	mov	eax, DWORD PTR _type$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 21					; 00000015H
	jne	$L692
; Line 68
	mov	eax, DWORD PTR _type$[ebp]
	push	eax
	call	_build_pointer_type
	add	esp, 4
	jmp	$L689
; Line 69
$L692:
	mov	eax, DWORD PTR _type$[ebp]
	jmp	$L689
; Line 70
$L689:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_datatype ENDP
_TEXT	ENDS
PUBLIC	_incomplete_type_error
PUBLIC	_require_complete_type
EXTRN	_error_mark_node:DWORD
EXTRN	_void_type_node:DWORD
_TEXT	SEGMENT
_value$ = 8
_type$ = -4
_require_complete_type PROC NEAR
; Line 78
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 79
	mov	eax, DWORD PTR _value$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _type$[ebp], eax
; Line 83
	mov	eax, DWORD PTR _type$[ebp]
	cmp	DWORD PTR [eax+28], 0
	je	$L697
	mov	eax, DWORD PTR _void_type_node
	cmp	DWORD PTR _type$[ebp], eax
	je	$L697
; Line 84
	mov	eax, DWORD PTR _value$[ebp]
	jmp	$L695
; Line 86
$L697:
	mov	eax, DWORD PTR _type$[ebp]
	push	eax
	mov	eax, DWORD PTR _value$[ebp]
	push	eax
	call	_incomplete_type_error
	add	esp, 8
; Line 87
	mov	eax, DWORD PTR _error_mark_node
	jmp	$L695
; Line 88
$L695:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_require_complete_type ENDP
_TEXT	ENDS
EXTRN	_error:NEAR
EXTRN	_abort:NEAR
_DATA	SEGMENT
$SG706	DB	'`%s'' has an incomplete type', 00H
$SG714	DB	'invalid use of undefined type `struct %s''', 00H
	ORG $+2
$SG716	DB	'invalid use of undefined type `union %s''', 00H
	ORG $+3
$SG718	DB	'invalid use of undefined type `enum %s''', 00H
$SG720	DB	'invalid use of void expression', 00H
	ORG $+1
$SG723	DB	'invalid use of array with unspecified bounds', 00H
	ORG $+3
$SG728	DB	'invalid use of incomplete typedef `%s''', 00H
_DATA	ENDS
_TEXT	SEGMENT
_value$ = 8
_type$ = 12
_errmsg$ = -4
_incomplete_type_error PROC NEAR
; Line 98
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	push	ebx
	push	esi
	push	edi
; Line 102
	mov	eax, DWORD PTR _type$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	or	eax, eax
	jne	$L702
; Line 103
	jmp	$L700
; Line 105
$L702:
; Line 106
	cmp	DWORD PTR _value$[ebp], 0
	je	$L703
	mov	eax, DWORD PTR _value$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 43					; 0000002bH
	je	$L704
	mov	eax, DWORD PTR _value$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 44					; 0000002cH
	jne	$L703
$L704:
; Line 108
	mov	eax, DWORD PTR _value$[ebp]
	mov	eax, DWORD PTR [eax+40]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	push	OFFSET $SG706
	call	_error
	add	esp, 8
; Line 109
	jmp	$L707
$L703:
; Line 111
$retry$708:
; Line 114
	mov	eax, DWORD PTR _type$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	mov	DWORD PTR -8+[ebp], eax
	jmp	$L709
; Line 116
$L713:
; Line 117
	mov	DWORD PTR _errmsg$[ebp], OFFSET $SG714
; Line 118
	jmp	$L710
; Line 120
$L715:
; Line 121
	mov	DWORD PTR _errmsg$[ebp], OFFSET $SG716
; Line 122
	jmp	$L710
; Line 124
$L717:
; Line 125
	mov	DWORD PTR _errmsg$[ebp], OFFSET $SG718
; Line 126
	jmp	$L710
; Line 128
$L719:
; Line 129
	push	OFFSET $SG720
	call	_error
	add	esp, 4
; Line 130
	jmp	$L700
; Line 132
$L721:
; Line 133
	mov	eax, DWORD PTR _type$[ebp]
	cmp	DWORD PTR [eax+20], 0
	je	$L722
; Line 135
	mov	eax, DWORD PTR _type$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _type$[ebp], eax
; Line 136
	jmp	$retry$708
; Line 138
$L722:
	push	OFFSET $SG723
	call	_error
	add	esp, 4
; Line 139
	jmp	$L700
; Line 141
$L724:
; Line 142
	call	_abort
; Line 143
	jmp	$L710
$L709:
	cmp	DWORD PTR -8+[ebp], 4
	je	$L719
	cmp	DWORD PTR -8+[ebp], 8
	je	$L717
	cmp	DWORD PTR -8+[ebp], 16			; 00000010H
	je	$L721
	cmp	DWORD PTR -8+[ebp], 19			; 00000013H
	je	$L713
	cmp	DWORD PTR -8+[ebp], 20			; 00000014H
	je	$L715
	jmp	$L724
$L710:
; Line 145
	mov	eax, DWORD PTR _type$[ebp]
	mov	eax, DWORD PTR [eax+56]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 1
	jne	$L726
; Line 146
	mov	eax, DWORD PTR _type$[ebp]
	mov	eax, DWORD PTR [eax+56]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	mov	eax, DWORD PTR _errmsg$[ebp]
	push	eax
	call	_error
	add	esp, 8
; Line 147
	jmp	$L727
$L726:
; Line 150
	mov	eax, DWORD PTR _type$[ebp]
	mov	eax, DWORD PTR [eax+56]
	mov	eax, DWORD PTR [eax+40]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	push	OFFSET $SG728
	call	_error
	add	esp, 8
$L727:
; Line 151
$L707:
; Line 152
$L700:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_incomplete_type_error ENDP
_TEXT	ENDS
EXTRN	_c_build_type_variant:NEAR
_TEXT	SEGMENT
_type$ = 8
_like$ = 12
_constflag$ = -8
_volflag$ = -4
_qualify_type PROC NEAR
; Line 160
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	push	ebx
	push	esi
	push	edi
; Line 161
	mov	eax, DWORD PTR _type$[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 5
	test	al, 1
	jne	$L2024
	mov	eax, DWORD PTR _like$[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 5
	test	al, 1
	je	$L2022
$L2024:
	mov	DWORD PTR _constflag$[ebp], 1
	jmp	$L2023
$L2022:
	mov	DWORD PTR _constflag$[ebp], 0
$L2023:
; Line 162
	mov	eax, DWORD PTR _type$[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 3
	test	al, 1
	jne	$L2027
	mov	eax, DWORD PTR _like$[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 3
	test	al, 1
	je	$L2025
$L2027:
	mov	DWORD PTR _volflag$[ebp], 1
	jmp	$L2026
$L2025:
	mov	DWORD PTR _volflag$[ebp], 0
$L2026:
; Line 163
	mov	eax, DWORD PTR _volflag$[ebp]
	push	eax
	mov	eax, DWORD PTR _constflag$[ebp]
	push	eax
	mov	eax, DWORD PTR _type$[ebp]
	push	eax
	call	_c_build_type_variant
	add	esp, 12					; 0000000cH
	jmp	$L732
; Line 164
$L732:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_qualify_type ENDP
_TEXT	ENDS
PUBLIC	_commontype
PUBLIC	_type_for_size
EXTRN	_build_array_type:NEAR
EXTRN	_build_function_type:NEAR
EXTRN	_long_integer_type_node:DWORD
EXTRN	_long_unsigned_type_node:DWORD
EXTRN	_tree_cons:NEAR
EXTRN	_list_length:NEAR
_TEXT	SEGMENT
_valtype$769 = -36
_p1$770 = -32
_p2$771 = -16
_len$772 = -28
_newargs$773 = -20
_n$774 = -40
_i$775 = -24
_t1$ = 8
_t2$ = 12
_form1$ = -8
_form2$ = -4
_elt$765 = -12
_commontype PROC NEAR
; Line 179
	push	ebp
	mov	ebp, esp
	sub	esp, 48					; 00000030H
	push	ebx
	push	esi
	push	edi
; Line 185
	mov	eax, DWORD PTR _t1$[ebp]
	cmp	DWORD PTR _t2$[ebp], eax
	jne	$L740
	mov	eax, DWORD PTR _t1$[ebp]
	jmp	$L737
; Line 188
$L740:
	mov	eax, DWORD PTR _t1$[ebp]
	cmp	DWORD PTR _error_mark_node, eax
	jne	$L741
; Line 189
	mov	eax, DWORD PTR _t2$[ebp]
	jmp	$L737
; Line 190
$L741:
	mov	eax, DWORD PTR _t2$[ebp]
	cmp	DWORD PTR _error_mark_node, eax
	jne	$L742
; Line 191
	mov	eax, DWORD PTR _t1$[ebp]
	jmp	$L737
; Line 195
$L742:
	mov	eax, DWORD PTR _t1$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 8
	jne	$L743
; Line 196
	push	1
	mov	eax, DWORD PTR _t1$[ebp]
	mov	al, BYTE PTR [eax+38]
	and	eax, 255				; 000000ffH
	push	eax
	call	_type_for_size
	add	esp, 8
	mov	DWORD PTR _t1$[ebp], eax
; Line 197
$L743:
	mov	eax, DWORD PTR _t2$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 8
	jne	$L744
; Line 198
	push	1
	mov	eax, DWORD PTR _t2$[ebp]
	mov	al, BYTE PTR [eax+38]
	and	eax, 255				; 000000ffH
	push	eax
	call	_type_for_size
	add	esp, 8
	mov	DWORD PTR _t2$[ebp], eax
; Line 200
$L744:
	mov	eax, DWORD PTR _t1$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	mov	DWORD PTR _form1$[ebp], eax
; Line 201
	mov	eax, DWORD PTR _t2$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	mov	DWORD PTR _form2$[ebp], eax
; Line 203
	mov	eax, DWORD PTR _form1$[ebp]
	mov	DWORD PTR -48+[ebp], eax
	jmp	$L745
; Line 205
$L749:
; Line 209
	cmp	DWORD PTR _form1$[ebp], 6
	jne	$L750
	cmp	DWORD PTR _form2$[ebp], 6
	je	$L750
; Line 210
	mov	eax, DWORD PTR _t1$[ebp]
	jmp	$L737
; Line 212
$L750:
	cmp	DWORD PTR _form2$[ebp], 6
	jne	$L751
	cmp	DWORD PTR _form1$[ebp], 6
	je	$L751
; Line 213
	mov	eax, DWORD PTR _t2$[ebp]
	jmp	$L737
; Line 217
$L751:
	mov	eax, DWORD PTR _t2$[ebp]
	mov	al, BYTE PTR [eax+38]
	and	eax, 255				; 000000ffH
	mov	ecx, DWORD PTR _t1$[ebp]
	mov	cl, BYTE PTR [ecx+38]
	and	ecx, 255				; 000000ffH
	cmp	eax, ecx
	jge	$L752
; Line 218
	mov	eax, DWORD PTR _t1$[ebp]
	jmp	$L737
; Line 219
	jmp	$L753
$L752:
	mov	eax, DWORD PTR _t2$[ebp]
	mov	al, BYTE PTR [eax+38]
	and	eax, 255				; 000000ffH
	mov	ecx, DWORD PTR _t1$[ebp]
	mov	cl, BYTE PTR [ecx+38]
	and	ecx, 255				; 000000ffH
	cmp	eax, ecx
	jle	$L754
; Line 220
	mov	eax, DWORD PTR _t2$[ebp]
	jmp	$L737
; Line 224
$L754:
$L753:
; Line 225
	mov	eax, DWORD PTR _t1$[ebp]
	cmp	DWORD PTR _long_unsigned_type_node, eax
	je	$L756
	mov	eax, DWORD PTR _t2$[ebp]
	cmp	DWORD PTR _long_unsigned_type_node, eax
	jne	$L755
$L756:
; Line 226
	mov	eax, DWORD PTR _long_unsigned_type_node
	jmp	$L737
; Line 228
$L755:
; Line 229
	mov	eax, DWORD PTR _t1$[ebp]
	cmp	DWORD PTR _long_integer_type_node, eax
	je	$L758
	mov	eax, DWORD PTR _t2$[ebp]
	cmp	DWORD PTR _long_integer_type_node, eax
	jne	$L757
$L758:
; Line 233
	mov	eax, DWORD PTR _t1$[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 12					; 0000000cH
	test	al, 1
	jne	$L760
	mov	eax, DWORD PTR _t2$[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 12					; 0000000cH
	test	al, 1
	je	$L759
$L760:
; Line 234
	mov	eax, DWORD PTR _long_unsigned_type_node
	jmp	$L737
; Line 235
$L759:
	mov	eax, DWORD PTR _long_integer_type_node
	jmp	$L737
; Line 240
$L757:
	mov	eax, DWORD PTR _t1$[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 12					; 0000000cH
	test	al, 1
	je	$L761
; Line 241
	mov	eax, DWORD PTR _t1$[ebp]
	jmp	$L737
; Line 242
	jmp	$L762
$L761:
	mov	eax, DWORD PTR _t2$[ebp]
	jmp	$L737
$L762:
; Line 244
$L763:
; Line 258
	mov	eax, DWORD PTR _t2$[ebp]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	mov	eax, DWORD PTR _t1$[ebp]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	call	_commontype
	add	esp, 8
	push	eax
	call	_build_pointer_type
	add	esp, 4
	jmp	$L737
; Line 260
$L764:
; Line 262
	mov	eax, DWORD PTR _t2$[ebp]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	mov	eax, DWORD PTR _t1$[ebp]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	call	_commontype
	add	esp, 8
	mov	DWORD PTR _elt$765[ebp], eax
; Line 264
	mov	eax, DWORD PTR _t1$[ebp]
	mov	ecx, DWORD PTR _elt$765[ebp]
	cmp	DWORD PTR [eax+8], ecx
	jne	$L766
	mov	eax, DWORD PTR _t1$[ebp]
	cmp	DWORD PTR [eax+20], 0
	je	$L766
; Line 265
	mov	eax, DWORD PTR _t1$[ebp]
	jmp	$L737
; Line 266
$L766:
	mov	eax, DWORD PTR _t2$[ebp]
	mov	ecx, DWORD PTR _elt$765[ebp]
	cmp	DWORD PTR [eax+8], ecx
	jne	$L767
	mov	eax, DWORD PTR _t2$[ebp]
	cmp	DWORD PTR [eax+20], 0
	je	$L767
; Line 267
	mov	eax, DWORD PTR _t2$[ebp]
	jmp	$L737
; Line 269
$L767:
	mov	eax, DWORD PTR _t1$[ebp]
	cmp	DWORD PTR [eax+20], 0
	je	$L2028
	mov	eax, DWORD PTR _t1$[ebp]
	mov	DWORD PTR -44+[ebp], eax
	jmp	$L2029
$L2028:
	mov	eax, DWORD PTR _t2$[ebp]
	mov	DWORD PTR -44+[ebp], eax
$L2029:
	mov	eax, DWORD PTR -44+[ebp]
	mov	eax, DWORD PTR [eax+20]
	push	eax
	mov	eax, DWORD PTR _elt$765[ebp]
	push	eax
	call	_build_array_type
	add	esp, 8
	jmp	$L737
; Line 272
$L768:
; Line 276
	mov	eax, DWORD PTR _t2$[ebp]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	mov	eax, DWORD PTR _t1$[ebp]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	call	_commontype
	add	esp, 8
	mov	DWORD PTR _valtype$769[ebp], eax
; Line 277
	mov	eax, DWORD PTR _t1$[ebp]
	mov	eax, DWORD PTR [eax+20]
	mov	DWORD PTR _p1$770[ebp], eax
; Line 278
	mov	eax, DWORD PTR _t2$[ebp]
	mov	eax, DWORD PTR [eax+20]
	mov	DWORD PTR _p2$771[ebp], eax
; Line 284
	mov	eax, DWORD PTR _t1$[ebp]
	mov	ecx, DWORD PTR _valtype$769[ebp]
	cmp	DWORD PTR [eax+8], ecx
	jne	$L776
	mov	eax, DWORD PTR _t2$[ebp]
	cmp	DWORD PTR [eax+20], 0
	jne	$L776
; Line 285
	mov	eax, DWORD PTR _t1$[ebp]
	jmp	$L737
; Line 286
$L776:
	mov	eax, DWORD PTR _t2$[ebp]
	mov	ecx, DWORD PTR _valtype$769[ebp]
	cmp	DWORD PTR [eax+8], ecx
	jne	$L777
	mov	eax, DWORD PTR _t1$[ebp]
	cmp	DWORD PTR [eax+20], 0
	jne	$L777
; Line 287
	mov	eax, DWORD PTR _t2$[ebp]
	jmp	$L737
; Line 290
$L777:
	mov	eax, DWORD PTR _t1$[ebp]
	cmp	DWORD PTR [eax+20], 0
	jne	$L778
; Line 291
	mov	eax, DWORD PTR _t2$[ebp]
	mov	eax, DWORD PTR [eax+20]
	push	eax
	mov	eax, DWORD PTR _valtype$769[ebp]
	push	eax
	call	_build_function_type
	add	esp, 8
	jmp	$L737
; Line 292
$L778:
	mov	eax, DWORD PTR _t2$[ebp]
	cmp	DWORD PTR [eax+20], 0
	jne	$L779
; Line 293
	mov	eax, DWORD PTR _t1$[ebp]
	mov	eax, DWORD PTR [eax+20]
	push	eax
	mov	eax, DWORD PTR _valtype$769[ebp]
	push	eax
	call	_build_function_type
	add	esp, 8
	jmp	$L737
; Line 298
$L779:
	mov	eax, DWORD PTR _p1$770[ebp]
	push	eax
	call	_list_length
	add	esp, 4
	mov	DWORD PTR _len$772[ebp], eax
; Line 299
	mov	DWORD PTR _newargs$773[ebp], 0
; Line 301
	mov	DWORD PTR _i$775[ebp], 0
	jmp	$L780
$L781:
	inc	DWORD PTR _i$775[ebp]
$L780:
	mov	eax, DWORD PTR _len$772[ebp]
	cmp	DWORD PTR _i$775[ebp], eax
	jge	$L782
; Line 302
	mov	eax, DWORD PTR _newargs$773[ebp]
	push	eax
	push	0
	push	0
	call	_tree_cons
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _newargs$773[ebp], eax
	jmp	$L781
$L782:
; Line 304
	mov	eax, DWORD PTR _newargs$773[ebp]
	mov	DWORD PTR _n$774[ebp], eax
; Line 307
	jmp	$L783
$L784:
	mov	eax, DWORD PTR _p1$770[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _p1$770[ebp], eax
	mov	eax, DWORD PTR _p2$771[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _p2$771[ebp], eax
	mov	eax, DWORD PTR _n$774[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _n$774[ebp], eax
$L783:
	cmp	DWORD PTR _p1$770[ebp], 0
	je	$L785
; Line 308
	mov	eax, DWORD PTR _p2$771[ebp]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	mov	eax, DWORD PTR _p1$770[ebp]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	call	_commontype
	add	esp, 8
	mov	ecx, DWORD PTR _n$774[ebp]
	mov	DWORD PTR [ecx+24], eax
	jmp	$L784
$L785:
; Line 310
	mov	eax, DWORD PTR _newargs$773[ebp]
	push	eax
	mov	eax, DWORD PTR _valtype$769[ebp]
	push	eax
	call	_build_function_type
	add	esp, 8
	jmp	$L737
; Line 313
$L786:
; Line 314
	mov	eax, DWORD PTR _t1$[ebp]
	jmp	$L737
; Line 315
	jmp	$L746
$L745:
	cmp	DWORD PTR -48+[ebp], 5
	jl	$L786
	cmp	DWORD PTR -48+[ebp], 6
	jle	$L749
	cmp	DWORD PTR -48+[ebp], 11			; 0000000bH
	je	$L763
	cmp	DWORD PTR -48+[ebp], 16			; 00000010H
	je	$L764
	cmp	DWORD PTR -48+[ebp], 21			; 00000015H
	je	$L768
	jmp	$L786
$L746:
; Line 317
$L737:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_commontype ENDP
_TEXT	ENDS
PUBLIC	_comptypes
_TEXT	SEGMENT
_type1$ = 8
_type2$ = 12
_t1$ = -8
_t2$ = -4
_d1$809 = -16
_d2$810 = -12
_comptypes PROC NEAR
; Line 326
	push	ebp
	mov	ebp, esp
	sub	esp, 20					; 00000014H
	push	ebx
	push	esi
	push	edi
; Line 327
	mov	eax, DWORD PTR _type1$[ebp]
	mov	DWORD PTR _t1$[ebp], eax
; Line 328
	mov	eax, DWORD PTR _type2$[ebp]
	mov	DWORD PTR _t2$[ebp], eax
; Line 332
	mov	eax, DWORD PTR _t1$[ebp]
	cmp	DWORD PTR _t2$[ebp], eax
	je	$L794
	mov	eax, DWORD PTR _t1$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	or	eax, eax
	je	$L794
	mov	eax, DWORD PTR _t2$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	or	eax, eax
	jne	$L793
$L794:
; Line 333
	mov	eax, 1
	jmp	$L790
; Line 337
$L793:
	mov	eax, DWORD PTR _t1$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 8
	jne	$L795
; Line 338
	push	1
	mov	eax, DWORD PTR _t1$[ebp]
	mov	al, BYTE PTR [eax+38]
	and	eax, 255				; 000000ffH
	push	eax
	call	_type_for_size
	add	esp, 8
	mov	DWORD PTR _t1$[ebp], eax
; Line 339
$L795:
	mov	eax, DWORD PTR _t2$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 8
	jne	$L796
; Line 340
	push	1
	mov	eax, DWORD PTR _t2$[ebp]
	mov	al, BYTE PTR [eax+38]
	and	eax, 255				; 000000ffH
	push	eax
	call	_type_for_size
	add	esp, 8
	mov	DWORD PTR _t2$[ebp], eax
; Line 342
$L796:
	mov	eax, DWORD PTR _t1$[ebp]
	cmp	DWORD PTR _t2$[ebp], eax
	jne	$L797
; Line 343
	mov	eax, 1
	jmp	$L790
; Line 347
$L797:
	mov	eax, DWORD PTR _t2$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	mov	ecx, DWORD PTR _t1$[ebp]
	mov	cl, BYTE PTR [ecx+12]
	and	ecx, 255				; 000000ffH
	cmp	eax, ecx
	je	$L798
	sub	eax, eax
	jmp	$L790
; Line 351
$L798:
	sub	eax, eax
	mov	ecx, DWORD PTR _t2$[ebp]
	mov	ecx, DWORD PTR [ecx+16]
	shr	ecx, 5
	mov	edx, DWORD PTR _t1$[ebp]
	mov	edx, DWORD PTR [edx+16]
	shr	edx, 5
	and	edx, 1
	xor	ecx, edx
	and	ecx, 1
	cmp	eax, ecx
	je	$L799
; Line 352
	sub	eax, eax
	jmp	$L790
; Line 353
$L799:
	sub	eax, eax
	mov	ecx, DWORD PTR _t2$[ebp]
	mov	ecx, DWORD PTR [ecx+16]
	shr	ecx, 11					; 0000000bH
	mov	edx, DWORD PTR _t1$[ebp]
	mov	edx, DWORD PTR [edx+16]
	shr	edx, 11					; 0000000bH
	and	edx, 1
	xor	ecx, edx
	and	ecx, 1
	cmp	eax, ecx
	je	$L800
; Line 354
	sub	eax, eax
	jmp	$L790
; Line 356
$L800:
	mov	eax, DWORD PTR _t1$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	mov	DWORD PTR -20+[ebp], eax
	jmp	$L801
; Line 358
$L805:
; Line 360
	mov	eax, DWORD PTR _t1$[ebp]
	mov	ecx, DWORD PTR _t2$[ebp]
	mov	ecx, DWORD PTR [ecx+8]
	cmp	DWORD PTR [eax+8], ecx
	je	$L2032
	mov	eax, DWORD PTR _t2$[ebp]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	mov	eax, DWORD PTR _t1$[ebp]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	call	_comptypes
	add	esp, 8
	or	eax, eax
	je	$L2030
$L2032:
	mov	eax, 1
	jmp	$L2031
$L2030:
	sub	eax, eax
$L2031:
	jmp	$L790
; Line 362
$L806:
; Line 365
	mov	eax, DWORD PTR _t1$[ebp]
	mov	ecx, DWORD PTR _t2$[ebp]
	mov	ecx, DWORD PTR [ecx+8]
	cmp	DWORD PTR [eax+8], ecx
	je	$L2035
	mov	eax, DWORD PTR _t2$[ebp]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	mov	eax, DWORD PTR _t1$[ebp]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	call	_comptypes
	add	esp, 8
	or	eax, eax
	je	$L2033
$L2035:
	mov	eax, DWORD PTR _t2$[ebp]
	mov	eax, DWORD PTR [eax+20]
	push	eax
	mov	eax, DWORD PTR _t1$[ebp]
	mov	eax, DWORD PTR [eax+20]
	push	eax
	call	_compparms
	add	esp, 8
	or	eax, eax
	je	$L2033
	mov	eax, 1
	jmp	$L2034
$L2033:
	sub	eax, eax
$L2034:
	jmp	$L790
; Line 367
$L807:
; Line 370
	mov	eax, DWORD PTR _t1$[ebp]
	mov	ecx, DWORD PTR _t2$[ebp]
	mov	ecx, DWORD PTR [ecx+8]
	cmp	DWORD PTR [eax+8], ecx
	je	$L808
	mov	eax, DWORD PTR _t2$[ebp]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	mov	eax, DWORD PTR _t1$[ebp]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	call	_comptypes
	add	esp, 8
	or	eax, eax
	jne	$L808
; Line 371
	sub	eax, eax
	jmp	$L790
; Line 372
$L808:
; Line 373
	mov	eax, DWORD PTR _t1$[ebp]
	mov	eax, DWORD PTR [eax+20]
	mov	DWORD PTR _d1$809[ebp], eax
; Line 374
	mov	eax, DWORD PTR _t2$[ebp]
	mov	eax, DWORD PTR [eax+20]
	mov	DWORD PTR _d2$810[ebp], eax
; Line 381
	cmp	DWORD PTR _d1$809[ebp], 0
	je	$L812
	cmp	DWORD PTR _d2$810[ebp], 0
	je	$L812
	mov	eax, DWORD PTR _d1$809[ebp]
	cmp	DWORD PTR _d2$810[ebp], eax
	je	$L812
	mov	eax, DWORD PTR _d1$809[ebp]
	mov	eax, DWORD PTR [eax+24]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 35					; 00000023H
	jne	$L812
	mov	eax, DWORD PTR _d2$810[ebp]
	mov	eax, DWORD PTR [eax+24]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 35					; 00000023H
	jne	$L812
	mov	eax, DWORD PTR _d1$809[ebp]
	mov	eax, DWORD PTR [eax+60]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 35					; 00000023H
	jne	$L812
	mov	eax, DWORD PTR _d2$810[ebp]
	mov	eax, DWORD PTR [eax+60]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 35					; 00000023H
	je	$L811
$L812:
; Line 382
	mov	eax, 1
	jmp	$L790
; Line 384
$L811:
; Line 391
	mov	eax, DWORD PTR _d2$810[ebp]
	mov	eax, DWORD PTR [eax+24]
	mov	ecx, DWORD PTR _d1$809[ebp]
	mov	ecx, DWORD PTR [ecx+24]
	mov	ecx, DWORD PTR [ecx+20]
	cmp	DWORD PTR [eax+20], ecx
	jne	$L2036
	mov	eax, DWORD PTR _d2$810[ebp]
	mov	eax, DWORD PTR [eax+24]
	mov	ecx, DWORD PTR _d1$809[ebp]
	mov	ecx, DWORD PTR [ecx+24]
	mov	ecx, DWORD PTR [ecx+24]
	cmp	DWORD PTR [eax+24], ecx
	jne	$L2036
	mov	eax, DWORD PTR _d1$809[ebp]
	mov	eax, DWORD PTR [eax+60]
	mov	ecx, DWORD PTR _d2$810[ebp]
	mov	ecx, DWORD PTR [ecx+60]
	mov	ecx, DWORD PTR [ecx+20]
	cmp	DWORD PTR [eax+20], ecx
	jne	$L2036
	mov	eax, DWORD PTR _d1$809[ebp]
	mov	eax, DWORD PTR [eax+60]
	mov	ecx, DWORD PTR _d2$810[ebp]
	mov	ecx, DWORD PTR [ecx+60]
	mov	ecx, DWORD PTR [ecx+24]
	cmp	DWORD PTR [eax+24], ecx
	jne	$L2036
	mov	eax, 1
	jmp	$L2037
$L2036:
	sub	eax, eax
$L2037:
	jmp	$L790
; Line 393
	jmp	$L802
$L801:
	cmp	DWORD PTR -20+[ebp], 11			; 0000000bH
	je	$L805
	cmp	DWORD PTR -20+[ebp], 16			; 00000010H
	je	$L807
	cmp	DWORD PTR -20+[ebp], 21			; 00000015H
	je	$L806
	jmp	$L802
$L802:
; Line 394
	sub	eax, eax
	jmp	$L790
; Line 395
$L790:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_comptypes ENDP
_TEXT	ENDS
PUBLIC	_comp_target_types
_TEXT	SEGMENT
_ttl$ = 8
_ttr$ = 12
_comp_target_types PROC NEAR
; Line 403
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 405
	mov	eax, DWORD PTR _ttr$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+68]
	push	eax
	mov	eax, DWORD PTR _ttl$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+68]
	push	eax
	call	_comptypes
	add	esp, 8
	jmp	$L815
; Line 406
$L815:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_comp_target_types ENDP
_TEXT	ENDS
PUBLIC	_compparms1
_TEXT	SEGMENT
_parms1$ = 8
_parms2$ = 12
_t1$ = -8
_t2$ = -4
_compparms PROC NEAR
; Line 419
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	push	ebx
	push	esi
	push	edi
; Line 420
	mov	eax, DWORD PTR _parms1$[ebp]
	mov	DWORD PTR _t1$[ebp], eax
	mov	eax, DWORD PTR _parms2$[ebp]
	mov	DWORD PTR _t2$[ebp], eax
; Line 425
	cmp	DWORD PTR _t1$[ebp], 0
	jne	$L821
; Line 426
	mov	eax, DWORD PTR _t2$[ebp]
	push	eax
	call	_compparms1
	add	esp, 4
	jmp	$L818
; Line 427
$L821:
	cmp	DWORD PTR _t2$[ebp], 0
	jne	$L823
; Line 428
	mov	eax, DWORD PTR _t1$[ebp]
	push	eax
	call	_compparms1
	add	esp, 4
	jmp	$L818
; Line 430
$L823:
$L825:
; Line 432
	cmp	DWORD PTR _t1$[ebp], 0
	jne	$L827
	cmp	DWORD PTR _t2$[ebp], 0
	jne	$L827
; Line 433
	mov	eax, 1
	jmp	$L818
; Line 436
$L827:
	cmp	DWORD PTR _t1$[ebp], 0
	je	$L829
	cmp	DWORD PTR _t2$[ebp], 0
	jne	$L828
$L829:
; Line 437
	sub	eax, eax
	jmp	$L818
; Line 438
$L828:
	mov	eax, DWORD PTR _t2$[ebp]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	mov	eax, DWORD PTR _t1$[ebp]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	call	_comptypes
	add	esp, 8
	or	eax, eax
	jne	$L830
; Line 439
	sub	eax, eax
	jmp	$L818
; Line 440
$L830:
	mov	eax, DWORD PTR _t1$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _t1$[ebp], eax
; Line 441
	mov	eax, DWORD PTR _t2$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _t2$[ebp], eax
; Line 442
	jmp	$L825
$L826:
; Line 443
$L818:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_compparms ENDP
_TEXT	ENDS
EXTRN	_integer_type_node:DWORD
EXTRN	_float_type_node:DWORD
_TEXT	SEGMENT
_t$ = -4
_type$837 = -8
_parms$ = 8
_compparms1 PROC NEAR
; Line 451
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	push	ebx
	push	esi
	push	edi
; Line 453
	mov	eax, DWORD PTR _parms$[ebp]
	mov	DWORD PTR _t$[ebp], eax
	jmp	$L834
$L835:
	mov	eax, DWORD PTR _t$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _t$[ebp], eax
$L834:
	cmp	DWORD PTR _t$[ebp], 0
	je	$L836
; Line 455
	mov	eax, DWORD PTR _t$[ebp]
	mov	eax, DWORD PTR [eax+24]
	mov	DWORD PTR _type$837[ebp], eax
; Line 457
	mov	eax, DWORD PTR _t$[ebp]
	cmp	DWORD PTR [eax+4], 0
	jne	$L838
	mov	eax, DWORD PTR _type$837[ebp]
	cmp	DWORD PTR _void_type_node, eax
	je	$L838
; Line 458
	sub	eax, eax
	jmp	$L832
; Line 460
$L838:
	mov	eax, DWORD PTR _type$837[ebp]
	cmp	DWORD PTR _float_type_node, eax
	jne	$L839
; Line 461
	sub	eax, eax
	jmp	$L832
; Line 463
$L839:
; Line 464
	mov	eax, DWORD PTR _type$837[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 5
	jne	$L840
	mov	eax, DWORD PTR _integer_type_node
	mov	al, BYTE PTR [eax+38]
	and	eax, 255				; 000000ffH
	mov	ecx, DWORD PTR _type$837[ebp]
	mov	cl, BYTE PTR [ecx+38]
	and	ecx, 255				; 000000ffH
	cmp	eax, ecx
	jle	$L840
; Line 465
	sub	eax, eax
	jmp	$L832
; Line 466
$L840:
	jmp	$L835
$L836:
; Line 467
	mov	eax, 1
	jmp	$L832
; Line 468
$L832:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_compparms1 ENDP
_TEXT	ENDS
PUBLIC	_unsigned_type
EXTRN	_unsigned_type_node:DWORD
EXTRN	_char_type_node:DWORD
EXTRN	_unsigned_char_type_node:DWORD
EXTRN	_signed_char_type_node:DWORD
EXTRN	_short_integer_type_node:DWORD
EXTRN	_short_unsigned_type_node:DWORD
EXTRN	_long_long_integer_type_node:DWORD
EXTRN	_long_long_unsigned_type_node:DWORD
_TEXT	SEGMENT
_type$ = 8
_unsigned_type PROC NEAR
; Line 475
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 476
	mov	eax, DWORD PTR _type$[ebp]
	cmp	DWORD PTR _signed_char_type_node, eax
	je	$L844
	mov	eax, DWORD PTR _type$[ebp]
	cmp	DWORD PTR _char_type_node, eax
	jne	$L843
$L844:
; Line 477
	mov	eax, DWORD PTR _unsigned_char_type_node
	jmp	$L842
; Line 478
$L843:
	mov	eax, DWORD PTR _type$[ebp]
	cmp	DWORD PTR _integer_type_node, eax
	jne	$L845
; Line 479
	mov	eax, DWORD PTR _unsigned_type_node
	jmp	$L842
; Line 480
$L845:
	mov	eax, DWORD PTR _type$[ebp]
	cmp	DWORD PTR _short_integer_type_node, eax
	jne	$L846
; Line 481
	mov	eax, DWORD PTR _short_unsigned_type_node
	jmp	$L842
; Line 482
$L846:
	mov	eax, DWORD PTR _type$[ebp]
	cmp	DWORD PTR _long_integer_type_node, eax
	jne	$L847
; Line 483
	mov	eax, DWORD PTR _long_unsigned_type_node
	jmp	$L842
; Line 484
$L847:
	mov	eax, DWORD PTR _type$[ebp]
	cmp	DWORD PTR _long_long_integer_type_node, eax
	jne	$L848
; Line 485
	mov	eax, DWORD PTR _long_long_unsigned_type_node
	jmp	$L842
; Line 486
$L848:
	mov	eax, DWORD PTR _type$[ebp]
	jmp	$L842
; Line 487
$L842:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_unsigned_type ENDP
_TEXT	ENDS
PUBLIC	_signed_type
_TEXT	SEGMENT
_type$ = 8
_signed_type PROC NEAR
; Line 494
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 495
	mov	eax, DWORD PTR _unsigned_char_type_node
	cmp	DWORD PTR _type$[ebp], eax
	je	$L852
	mov	eax, DWORD PTR _char_type_node
	cmp	DWORD PTR _type$[ebp], eax
	jne	$L851
$L852:
; Line 496
	mov	eax, DWORD PTR _signed_char_type_node
	jmp	$L850
; Line 497
$L851:
	mov	eax, DWORD PTR _unsigned_type_node
	cmp	DWORD PTR _type$[ebp], eax
	jne	$L853
; Line 498
	mov	eax, DWORD PTR _integer_type_node
	jmp	$L850
; Line 499
$L853:
	mov	eax, DWORD PTR _short_unsigned_type_node
	cmp	DWORD PTR _type$[ebp], eax
	jne	$L854
; Line 500
	mov	eax, DWORD PTR _short_integer_type_node
	jmp	$L850
; Line 501
$L854:
	mov	eax, DWORD PTR _type$[ebp]
	cmp	DWORD PTR _long_unsigned_type_node, eax
	jne	$L855
; Line 502
	mov	eax, DWORD PTR _long_integer_type_node
	jmp	$L850
; Line 503
$L855:
	mov	eax, DWORD PTR _type$[ebp]
	cmp	DWORD PTR _long_long_unsigned_type_node, eax
	jne	$L856
; Line 504
	mov	eax, DWORD PTR _long_long_integer_type_node
	jmp	$L850
; Line 505
$L856:
	mov	eax, DWORD PTR _type$[ebp]
	jmp	$L850
; Line 506
$L850:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_signed_type ENDP
_TEXT	ENDS
PUBLIC	_signed_or_unsigned_type
_TEXT	SEGMENT
_unsignedp$ = 8
_type$ = 12
_signed_or_unsigned_type PROC NEAR
; Line 515
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 516
	mov	eax, DWORD PTR _type$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 5
	je	$L861
; Line 517
	mov	eax, DWORD PTR _type$[ebp]
	jmp	$L860
; Line 518
$L861:
	mov	eax, DWORD PTR _signed_char_type_node
	mov	al, BYTE PTR [eax+38]
	and	eax, 255				; 000000ffH
	mov	ecx, DWORD PTR _type$[ebp]
	mov	cl, BYTE PTR [ecx+38]
	and	ecx, 255				; 000000ffH
	cmp	eax, ecx
	jne	$L862
; Line 519
	cmp	DWORD PTR _unsignedp$[ebp], 0
	je	$L2038
	mov	eax, DWORD PTR _unsigned_char_type_node
	jmp	$L2039
$L2038:
	mov	eax, DWORD PTR _signed_char_type_node
$L2039:
	jmp	$L860
; Line 520
$L862:
	mov	eax, DWORD PTR _integer_type_node
	mov	al, BYTE PTR [eax+38]
	and	eax, 255				; 000000ffH
	mov	ecx, DWORD PTR _type$[ebp]
	mov	cl, BYTE PTR [ecx+38]
	and	ecx, 255				; 000000ffH
	cmp	eax, ecx
	jne	$L863
; Line 521
	cmp	DWORD PTR _unsignedp$[ebp], 0
	je	$L2040
	mov	eax, DWORD PTR _unsigned_type_node
	jmp	$L2041
$L2040:
	mov	eax, DWORD PTR _integer_type_node
$L2041:
	jmp	$L860
; Line 522
$L863:
	mov	eax, DWORD PTR _short_integer_type_node
	mov	al, BYTE PTR [eax+38]
	and	eax, 255				; 000000ffH
	mov	ecx, DWORD PTR _type$[ebp]
	mov	cl, BYTE PTR [ecx+38]
	and	ecx, 255				; 000000ffH
	cmp	eax, ecx
	jne	$L864
; Line 523
	cmp	DWORD PTR _unsignedp$[ebp], 0
	je	$L2042
	mov	eax, DWORD PTR _short_unsigned_type_node
	jmp	$L2043
$L2042:
	mov	eax, DWORD PTR _short_integer_type_node
$L2043:
	jmp	$L860
; Line 524
$L864:
	mov	eax, DWORD PTR _long_integer_type_node
	mov	al, BYTE PTR [eax+38]
	and	eax, 255				; 000000ffH
	mov	ecx, DWORD PTR _type$[ebp]
	mov	cl, BYTE PTR [ecx+38]
	and	ecx, 255				; 000000ffH
	cmp	eax, ecx
	jne	$L865
; Line 525
	cmp	DWORD PTR _unsignedp$[ebp], 0
	je	$L2044
	mov	eax, DWORD PTR _long_unsigned_type_node
	jmp	$L2045
$L2044:
	mov	eax, DWORD PTR _long_integer_type_node
$L2045:
	jmp	$L860
; Line 526
$L865:
	mov	eax, DWORD PTR _long_long_integer_type_node
	mov	al, BYTE PTR [eax+38]
	and	eax, 255				; 000000ffH
	mov	ecx, DWORD PTR _type$[ebp]
	mov	cl, BYTE PTR [ecx+38]
	and	ecx, 255				; 000000ffH
	cmp	eax, ecx
	jne	$L866
; Line 528
	cmp	DWORD PTR _unsignedp$[ebp], 0
	je	$L2046
	mov	eax, DWORD PTR _long_long_unsigned_type_node
	jmp	$L2047
$L2046:
	mov	eax, DWORD PTR _long_long_integer_type_node
$L2047:
	jmp	$L860
; Line 529
$L866:
	mov	eax, DWORD PTR _type$[ebp]
	jmp	$L860
; Line 530
$L860:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_signed_or_unsigned_type ENDP
_bits$ = 8
_unsignedp$ = 12
_type_for_size PROC NEAR
; Line 539
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 540
	mov	eax, DWORD PTR _signed_char_type_node
	mov	al, BYTE PTR [eax+38]
	and	eax, 255				; 000000ffH
	cmp	eax, DWORD PTR _bits$[ebp]
	jl	$L870
; Line 541
	cmp	DWORD PTR _unsignedp$[ebp], 0
	je	$L2048
	mov	eax, DWORD PTR _unsigned_char_type_node
	jmp	$L2049
$L2048:
	mov	eax, DWORD PTR _signed_char_type_node
$L2049:
	jmp	$L869
; Line 543
$L870:
	mov	eax, DWORD PTR _short_integer_type_node
	mov	al, BYTE PTR [eax+38]
	and	eax, 255				; 000000ffH
	cmp	eax, DWORD PTR _bits$[ebp]
	jl	$L871
; Line 544
	cmp	DWORD PTR _unsignedp$[ebp], 0
	je	$L2050
	mov	eax, DWORD PTR _short_unsigned_type_node
	jmp	$L2051
$L2050:
	mov	eax, DWORD PTR _short_integer_type_node
$L2051:
	jmp	$L869
; Line 546
$L871:
	mov	eax, DWORD PTR _integer_type_node
	mov	al, BYTE PTR [eax+38]
	and	eax, 255				; 000000ffH
	cmp	eax, DWORD PTR _bits$[ebp]
	jl	$L872
; Line 547
	cmp	DWORD PTR _unsignedp$[ebp], 0
	je	$L2052
	mov	eax, DWORD PTR _unsigned_type_node
	jmp	$L2053
$L2052:
	mov	eax, DWORD PTR _integer_type_node
$L2053:
	jmp	$L869
; Line 549
$L872:
	mov	eax, DWORD PTR _long_integer_type_node
	mov	al, BYTE PTR [eax+38]
	and	eax, 255				; 000000ffH
	cmp	eax, DWORD PTR _bits$[ebp]
	jl	$L873
; Line 550
	cmp	DWORD PTR _unsignedp$[ebp], 0
	je	$L2054
	mov	eax, DWORD PTR _long_unsigned_type_node
	jmp	$L2055
$L2054:
	mov	eax, DWORD PTR _long_integer_type_node
$L2055:
	jmp	$L869
; Line 552
$L873:
	mov	eax, DWORD PTR _long_long_integer_type_node
	mov	al, BYTE PTR [eax+38]
	and	eax, 255				; 000000ffH
	cmp	eax, DWORD PTR _bits$[ebp]
	jl	$L874
; Line 554
	cmp	DWORD PTR _unsignedp$[ebp], 0
	je	$L2056
	mov	eax, DWORD PTR _long_long_unsigned_type_node
	jmp	$L2057
$L2056:
	mov	eax, DWORD PTR _long_long_integer_type_node
$L2057:
	jmp	$L869
; Line 556
$L874:
	sub	eax, eax
	jmp	$L869
; Line 557
$L869:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_type_for_size ENDP
_TEXT	ENDS
PUBLIC	_get_floating_type
EXTRN	_double_type_node:DWORD
EXTRN	_long_double_type_node:DWORD
_TEXT	SEGMENT
_mode$ = 8
_get_floating_type PROC NEAR
; Line 562
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 563
	mov	eax, DWORD PTR _float_type_node
	mov	eax, DWORD PTR [eax+32]
	shl	eax, 24					; 00000018H
	sar	eax, 24					; 00000018H
	cmp	eax, DWORD PTR _mode$[ebp]
	jne	$L877
; Line 564
	mov	eax, DWORD PTR _float_type_node
	jmp	$L876
; Line 565
$L877:
	mov	eax, DWORD PTR _double_type_node
	mov	eax, DWORD PTR [eax+32]
	shl	eax, 24					; 00000018H
	sar	eax, 24					; 00000018H
	cmp	eax, DWORD PTR _mode$[ebp]
	jne	$L878
; Line 566
	mov	eax, DWORD PTR _double_type_node
	jmp	$L876
; Line 567
$L878:
	mov	eax, DWORD PTR _long_double_type_node
	mov	eax, DWORD PTR [eax+32]
	shl	eax, 24					; 00000018H
	sar	eax, 24					; 00000018H
	cmp	eax, DWORD PTR _mode$[ebp]
	jne	$L879
; Line 568
	mov	eax, DWORD PTR _long_double_type_node
	jmp	$L876
; Line 569
$L879:
	call	_abort
; Line 570
$L876:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_get_floating_type ENDP
_TEXT	ENDS
PUBLIC	_c_sizeof
EXTRN	_pedantic:DWORD
EXTRN	_convert_units:NEAR
EXTRN	_size_in_bytes:NEAR
EXTRN	_build_int:NEAR
EXTRN	_warn_pointer_arith:DWORD
EXTRN	_warning:NEAR
_DATA	SEGMENT
	ORG $+1
$SG887	DB	'sizeof applied to a function type', 00H
	ORG $+2
$SG891	DB	'sizeof applied to a void type', 00H
_DATA	ENDS
_TEXT	SEGMENT
_type$ = 8
_code$ = -4
_c_sizeof PROC NEAR
; Line 575
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 576
	mov	eax, DWORD PTR _type$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	mov	DWORD PTR _code$[ebp], eax
; Line 578
	cmp	DWORD PTR _code$[ebp], 21		; 00000015H
	jne	$L883
; Line 580
	cmp	DWORD PTR _pedantic, 0
	jne	$L885
	cmp	DWORD PTR _warn_pointer_arith, 0
	je	$L884
$L885:
; Line 581
	push	OFFSET $SG887
	call	_warning
	add	esp, 4
; Line 582
$L884:
	push	1
	call	_build_int
	add	esp, 4
	jmp	$L881
; Line 584
$L883:
	cmp	DWORD PTR _code$[ebp], 4
	jne	$L888
; Line 586
	cmp	DWORD PTR _pedantic, 0
	jne	$L890
	cmp	DWORD PTR _warn_pointer_arith, 0
	je	$L889
$L890:
; Line 587
	push	OFFSET $SG891
	call	_warning
	add	esp, 4
; Line 588
$L889:
	push	1
	call	_build_int
	add	esp, 4
	jmp	$L881
; Line 592
$L888:
; Line 593
	mov	eax, DWORD PTR _char_type_node
	mov	al, BYTE PTR [eax+38]
	and	eax, 255				; 000000ffH
	push	eax
	push	8
	mov	eax, DWORD PTR _type$[ebp]
	push	eax
	call	_size_in_bytes
	add	esp, 4
	push	eax
	call	_convert_units
	add	esp, 12					; 0000000cH
	jmp	$L881
; Line 594
$L881:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_c_sizeof ENDP
_TEXT	ENDS
PUBLIC	_c_sizeof_nowarn
_TEXT	SEGMENT
_type$ = 8
_code$ = -4
_c_sizeof_nowarn PROC NEAR
; Line 599
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 600
	mov	eax, DWORD PTR _type$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	mov	DWORD PTR _code$[ebp], eax
; Line 603
	cmp	DWORD PTR _code$[ebp], 21		; 00000015H
	je	$L897
	cmp	DWORD PTR _code$[ebp], 4
	jne	$L896
$L897:
; Line 604
	push	1
	call	_build_int
	add	esp, 4
	jmp	$L894
; Line 607
$L896:
; Line 608
	mov	eax, DWORD PTR _char_type_node
	mov	al, BYTE PTR [eax+38]
	and	eax, 255				; 000000ffH
	push	eax
	push	8
	mov	eax, DWORD PTR _type$[ebp]
	push	eax
	call	_size_in_bytes
	add	esp, 4
	push	eax
	call	_convert_units
	add	esp, 12					; 0000000cH
	jmp	$L894
; Line 609
$L894:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_c_sizeof_nowarn ENDP
_TEXT	ENDS
PUBLIC	_c_alignof
_TEXT	SEGMENT
_type$ = 8
_code$ = -4
_c_alignof PROC NEAR
; Line 617
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 618
	mov	eax, DWORD PTR _type$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	mov	DWORD PTR _code$[ebp], eax
; Line 620
	cmp	DWORD PTR _code$[ebp], 21		; 00000015H
	jne	$L901
; Line 621
	push	4
	call	_build_int
	add	esp, 4
	jmp	$L899
; Line 623
$L901:
	cmp	DWORD PTR _code$[ebp], 4
	jne	$L902
; Line 624
	push	1
	call	_build_int
	add	esp, 4
	jmp	$L899
; Line 626
$L902:
	mov	eax, DWORD PTR _type$[ebp]
	mov	al, BYTE PTR [eax+37]
	and	eax, 255				; 000000ffH
	sar	eax, 3
	push	eax
	call	_build_int
	add	esp, 4
	jmp	$L899
; Line 627
$L899:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_c_alignof ENDP
_TEXT	ENDS
EXTRN	_current_function_decl:DWORD
_TEXT	SEGMENT
_decl$ = 8
_decl_constant_value PROC NEAR
; Line 634
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 649
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 1
	test	al, 1
	jne	$L906
	cmp	DWORD PTR _current_function_decl, 0
	je	$L906
	cmp	DWORD PTR _pedantic, 0
	jne	$L906
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 11					; 0000000bH
	test	al, 1
	jne	$L906
	mov	eax, DWORD PTR _decl$[ebp]
	cmp	DWORD PTR [eax+64], 0
	je	$L906
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+64]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	or	eax, eax
	je	$L906
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+64]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 6
	test	al, 1
	je	$L906
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+64]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 52					; 00000034H
	je	$L906
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+32]
	shl	eax, 24					; 00000018H
	and	eax, -16777216				; ff000000H
	mov	ecx, 436207616				; 1a000000H
	and	ecx, -16777216				; ff000000H
	cmp	eax, ecx
	je	$L906
; Line 650
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+64]
	jmp	$L905
; Line 651
$L906:
	mov	eax, DWORD PTR _decl$[ebp]
	jmp	$L905
; Line 652
$L905:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_decl_constant_value ENDP
_TEXT	ENDS
PUBLIC	_default_conversion
PUBLIC	_build_unary_op
PUBLIC	_mark_addressable
EXTRN	_build:NEAR
EXTRN	_lvalue_p:NEAR
EXTRN	_convert:NEAR
EXTRN	_flag_traditional:DWORD
EXTRN	_staticp:NEAR
EXTRN	_optimize:DWORD
_DATA	SEGMENT
	ORG $+2
$SG920	DB	'void value not ignored as it ought to be', 00H
	ORG $+3
$SG932	DB	'invalid use of non-lvalue array', 00H
_DATA	ENDS
_TEXT	SEGMENT
_exp$ = 8
_dt$ = -8
_form$ = -4
_adr$923 = -12
_restype$924 = -20
_ptrtype$925 = -16
_op1$928 = -24
_default_conversion PROC NEAR
; Line 662
	push	ebp
	mov	ebp, esp
	sub	esp, 24					; 00000018H
	push	ebx
	push	esi
	push	edi
; Line 663
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _dt$[ebp], eax
; Line 664
	mov	eax, DWORD PTR _dt$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	mov	DWORD PTR _form$[ebp], eax
; Line 666
	mov	eax, DWORD PTR _exp$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 41					; 00000029H
	jne	$L911
; Line 667
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+64]
	mov	DWORD PTR _exp$[ebp], eax
; Line 669
	jmp	$L912
$L911:
; Line 671
	cmp	DWORD PTR _optimize, 0
	je	$L913
	mov	eax, DWORD PTR _exp$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 43					; 0000002bH
	jne	$L913
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 5
	test	al, 1
	je	$L913
; Line 672
	mov	eax, DWORD PTR _exp$[ebp]
	push	eax
	call	_decl_constant_value
	add	esp, 4
	mov	DWORD PTR _exp$[ebp], eax
; Line 676
$L913:
$L912:
; Line 677
	mov	eax, DWORD PTR _exp$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 113				; 00000071H
	jne	$L914
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+24]
	mov	ecx, DWORD PTR _exp$[ebp]
	mov	ecx, DWORD PTR [ecx+8]
	cmp	DWORD PTR [eax+8], ecx
	jne	$L914
; Line 678
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+24]
	mov	DWORD PTR _exp$[ebp], eax
; Line 680
$L914:
; Line 683
	cmp	DWORD PTR _form$[ebp], 8
	je	$L916
	cmp	DWORD PTR _form$[ebp], 5
	jne	$L915
	mov	eax, DWORD PTR _integer_type_node
	mov	al, BYTE PTR [eax+38]
	and	eax, 255				; 000000ffH
	mov	ecx, DWORD PTR _dt$[ebp]
	mov	cl, BYTE PTR [ecx+38]
	and	ecx, 255				; 000000ffH
	cmp	eax, ecx
	jle	$L915
$L916:
; Line 686
	cmp	DWORD PTR _flag_traditional, 0
	je	$L917
	mov	eax, DWORD PTR _dt$[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 12					; 0000000cH
	test	al, 1
	je	$L917
; Line 687
	mov	eax, DWORD PTR _exp$[ebp]
	push	eax
	mov	eax, DWORD PTR _unsigned_type_node
	push	eax
	call	_convert
	add	esp, 8
	jmp	$L908
; Line 688
$L917:
	mov	eax, DWORD PTR _exp$[ebp]
	push	eax
	mov	eax, DWORD PTR _integer_type_node
	push	eax
	call	_convert
	add	esp, 8
	jmp	$L908
; Line 690
$L915:
	cmp	DWORD PTR _flag_traditional, 0
	je	$L918
	mov	eax, DWORD PTR _dt$[ebp]
	cmp	DWORD PTR _float_type_node, eax
	jne	$L918
; Line 691
	mov	eax, DWORD PTR _exp$[ebp]
	push	eax
	mov	eax, DWORD PTR _double_type_node
	push	eax
	call	_convert
	add	esp, 8
	jmp	$L908
; Line 692
$L918:
	cmp	DWORD PTR _form$[ebp], 4
	jne	$L919
; Line 694
	push	OFFSET $SG920
	call	_error
	add	esp, 4
; Line 695
	mov	eax, DWORD PTR _error_mark_node
	jmp	$L908
; Line 697
$L919:
	cmp	DWORD PTR _form$[ebp], 21		; 00000015H
	jne	$L921
; Line 699
	push	0
	mov	eax, DWORD PTR _exp$[ebp]
	push	eax
	push	116					; 00000074H
	call	_build_unary_op
	add	esp, 12					; 0000000cH
	jmp	$L908
; Line 701
$L921:
	cmp	DWORD PTR _form$[ebp], 16		; 00000010H
	jne	$L922
; Line 704
	mov	eax, DWORD PTR _dt$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _restype$924[ebp], eax
; Line 707
	mov	eax, DWORD PTR _exp$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 48					; 00000030H
	jne	$L926
; Line 709
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	mov	eax, DWORD PTR _restype$924[ebp]
	mov	eax, DWORD PTR [eax+40]
	push	eax
	call	_convert
	add	esp, 8
	jmp	$L908
; Line 711
$L926:
	mov	eax, DWORD PTR _exp$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 53					; 00000035H
	jne	$L927
; Line 713
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+28]
	push	eax
	call	_default_conversion
	add	esp, 4
	mov	DWORD PTR _op1$928[ebp], eax
; Line 715
	mov	eax, DWORD PTR _op1$928[ebp]
	push	eax
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	mov	eax, DWORD PTR _op1$928[ebp]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	push	53					; 00000035H
	call	_build
	add	esp, 16					; 00000010H
	jmp	$L908
; Line 718
$L927:
; Line 719
	mov	eax, DWORD PTR _exp$[ebp]
	push	eax
	call	_lvalue_p
	add	esp, 4
	or	eax, eax
	jne	$L930
	mov	eax, DWORD PTR _exp$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 52					; 00000034H
	jne	$L931
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 2
	test	al, 1
	jne	$L930
$L931:
; Line 721
	push	OFFSET $SG932
	call	_error
	add	esp, 4
; Line 722
	mov	eax, DWORD PTR _error_mark_node
	jmp	$L908
; Line 725
$L930:
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 5
	test	al, 1
	jne	$L934
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 11					; 0000000bH
	test	al, 1
	je	$L933
$L934:
; Line 727
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 11					; 0000000bH
	and	eax, 1
	push	eax
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 5
	and	eax, 1
	push	eax
	mov	eax, DWORD PTR _restype$924[ebp]
	push	eax
	call	_c_build_type_variant
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _restype$924[ebp], eax
; Line 729
$L933:
	mov	eax, DWORD PTR _restype$924[ebp]
	push	eax
	call	_build_pointer_type
	add	esp, 4
	mov	DWORD PTR _ptrtype$925[ebp], eax
; Line 731
	mov	eax, DWORD PTR _exp$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 43					; 0000002bH
	jne	$L935
; Line 737
	mov	eax, DWORD PTR _exp$[ebp]
	push	eax
	mov	eax, DWORD PTR _ptrtype$925[ebp]
	push	eax
	push	116					; 00000074H
	call	_build
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _adr$923[ebp], eax
; Line 738
	mov	eax, DWORD PTR _exp$[ebp]
	push	eax
	call	_mark_addressable
	add	esp, 4
	or	eax, eax
	jne	$L936
; Line 739
	mov	eax, DWORD PTR _error_mark_node
	jmp	$L908
; Line 740
$L936:
	mov	eax, DWORD PTR _exp$[ebp]
	push	eax
	call	_staticp
	add	esp, 4
	and	eax, 1
	shl	eax, 6
	mov	ecx, DWORD PTR _adr$923[ebp]
	mov	ecx, DWORD PTR [ecx+16]
	and	ecx, -65				; ffffffbfH
	or	eax, ecx
	mov	ecx, DWORD PTR _adr$923[ebp]
	mov	DWORD PTR [ecx+16], eax
; Line 741
	mov	eax, DWORD PTR _adr$923[ebp]
	and	DWORD PTR [eax+16], -9			; fffffff7H
; Line 742
	mov	eax, DWORD PTR _adr$923[ebp]
	jmp	$L908
; Line 746
$L935:
	push	1
	mov	eax, DWORD PTR _exp$[ebp]
	push	eax
	push	116					; 00000074H
	call	_build_unary_op
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _adr$923[ebp], eax
; Line 747
	mov	eax, DWORD PTR _adr$923[ebp]
	push	eax
	mov	eax, DWORD PTR _ptrtype$925[ebp]
	push	eax
	call	_convert
	add	esp, 8
	jmp	$L908
; Line 749
$L922:
	mov	eax, DWORD PTR _exp$[ebp]
	jmp	$L908
; Line 750
$L908:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_default_conversion ENDP
_TEXT	ENDS
PUBLIC	_build_component_ref
_DATA	SEGMENT
$SG953	DB	'structure has no member named `%s''', 00H
	ORG $+1
$SG954	DB	'union has no member named `%s''', 00H
	ORG $+1
$SG962	DB	'request for member `%s'' in something not a structure or'
	DB	' union', 00H
_DATA	ENDS
_TEXT	SEGMENT
_datum$ = 8
_component$ = 12
_basename$ = -20
_basetype$ = -16
_form$ = -4
_field$ = -12
_ref$ = -8
_build_component_ref PROC NEAR
; Line 758
	push	ebp
	mov	ebp, esp
	sub	esp, 20					; 00000014H
	push	ebx
	push	esi
	push	edi
; Line 759
	mov	eax, DWORD PTR _datum$[ebp]
	mov	DWORD PTR _basename$[ebp], eax
; Line 760
	mov	eax, DWORD PTR _basename$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _basetype$[ebp], eax
; Line 761
	mov	eax, DWORD PTR _basetype$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	mov	DWORD PTR _form$[ebp], eax
; Line 762
	mov	DWORD PTR _field$[ebp], 0
; Line 767
	cmp	DWORD PTR _form$[ebp], 19		; 00000013H
	je	$L946
	cmp	DWORD PTR _form$[ebp], 20		; 00000014H
	jne	$L945
$L946:
; Line 769
	mov	eax, DWORD PTR _basetype$[ebp]
	cmp	DWORD PTR [eax+28], 0
	jne	$L947
; Line 771
	mov	eax, DWORD PTR _basetype$[ebp]
	push	eax
	push	0
	call	_incomplete_type_error
	add	esp, 8
; Line 772
	mov	eax, DWORD PTR _error_mark_node
	jmp	$L939
; Line 777
$L947:
	mov	eax, DWORD PTR _basetype$[ebp]
	mov	eax, DWORD PTR [eax+20]
	mov	DWORD PTR _field$[ebp], eax
	jmp	$L948
$L949:
	mov	eax, DWORD PTR _field$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _field$[ebp], eax
$L948:
	cmp	DWORD PTR _field$[ebp], 0
	je	$L950
; Line 779
	mov	eax, DWORD PTR _field$[ebp]
	mov	ecx, DWORD PTR _component$[ebp]
	cmp	DWORD PTR [eax+40], ecx
	jne	$L951
; Line 780
	jmp	$L950
; Line 781
$L951:
	jmp	$L949
$L950:
; Line 783
	cmp	DWORD PTR _field$[ebp], 0
	jne	$L952
; Line 788
	mov	eax, DWORD PTR _component$[ebp]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	mov	eax, OFFSET $SG953
	cmp	DWORD PTR _form$[ebp], 19		; 00000013H
	je	$L2058
	mov	eax, OFFSET $SG954
$L2058:
	push	eax
	call	_error
	add	esp, 8
; Line 789
	mov	eax, DWORD PTR _error_mark_node
	jmp	$L939
; Line 791
$L952:
	mov	eax, DWORD PTR _field$[ebp]
	mov	ecx, DWORD PTR _error_mark_node
	cmp	DWORD PTR [eax+8], ecx
	jne	$L955
; Line 792
	mov	eax, DWORD PTR _error_mark_node
	jmp	$L939
; Line 794
$L955:
	mov	eax, DWORD PTR _field$[ebp]
	push	eax
	mov	eax, DWORD PTR _basename$[ebp]
	push	eax
	mov	eax, DWORD PTR _field$[ebp]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	push	47					; 0000002fH
	call	_build
	add	esp, 16					; 00000010H
	mov	DWORD PTR _ref$[ebp], eax
; Line 796
	mov	eax, DWORD PTR _basename$[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 5
	test	al, 1
	jne	$L957
	mov	eax, DWORD PTR _field$[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 5
	test	al, 1
	je	$L956
$L957:
; Line 797
	mov	eax, DWORD PTR _ref$[ebp]
	mov	eax, DWORD PTR [eax+16]
	or	eax, 32					; 00000020H
	mov	ecx, DWORD PTR _ref$[ebp]
	mov	DWORD PTR [ecx+16], eax
; Line 798
$L956:
	mov	eax, DWORD PTR _basename$[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 11					; 0000000bH
	test	al, 1
	jne	$L959
	mov	eax, DWORD PTR _field$[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 3
	test	al, 1
	je	$L958
$L959:
; Line 799
	mov	eax, DWORD PTR _ref$[ebp]
	mov	eax, DWORD PTR [eax+16]
	or	eax, 2048				; 00000800H
	mov	ecx, DWORD PTR _ref$[ebp]
	mov	DWORD PTR [ecx+16], eax
; Line 801
$L958:
	mov	eax, DWORD PTR _ref$[ebp]
	jmp	$L939
; Line 803
	jmp	$L960
$L945:
	cmp	DWORD PTR _form$[ebp], 0
	je	$L961
; Line 805
	mov	eax, DWORD PTR _component$[ebp]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	push	OFFSET $SG962
	call	_error
	add	esp, 8
; Line 807
$L961:
$L960:
	mov	eax, DWORD PTR _error_mark_node
	jmp	$L939
; Line 808
$L939:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_build_component_ref ENDP
_TEXT	ENDS
PUBLIC	_build_indirect_ref
_DATA	SEGMENT
	ORG $+2
$SG975	DB	'dereferencing pointer to incomplete type', 00H
	ORG $+3
$SG978	DB	'invalid type argument of `%s''', 00H
_DATA	ENDS
_TEXT	SEGMENT
_ptr$ = 8
_errorstring$ = 12
_pointer$ = -8
_dt$ = -4
_t$971 = -12
_ref$972 = -16
_build_indirect_ref PROC NEAR
; Line 818
	push	ebp
	mov	ebp, esp
	sub	esp, 16					; 00000010H
	push	ebx
	push	esi
	push	edi
; Line 819
	mov	eax, DWORD PTR _ptr$[ebp]
	push	eax
	call	_default_conversion
	add	esp, 4
	mov	DWORD PTR _pointer$[ebp], eax
; Line 820
	mov	eax, DWORD PTR _pointer$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _dt$[ebp], eax
; Line 822
	mov	eax, DWORD PTR _dt$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 11					; 0000000bH
	jne	$L968
; Line 825
	mov	eax, DWORD PTR _pointer$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 116				; 00000074H
	jne	$L969
	mov	eax, DWORD PTR _pointer$[ebp]
	mov	eax, DWORD PTR [eax+24]
	mov	ecx, DWORD PTR _dt$[ebp]
	mov	ecx, DWORD PTR [ecx+8]
	cmp	DWORD PTR [eax+8], ecx
	jne	$L969
; Line 826
	mov	eax, DWORD PTR _pointer$[ebp]
	mov	eax, DWORD PTR [eax+24]
	jmp	$L965
; Line 827
	jmp	$L970
$L969:
; Line 829
	mov	eax, DWORD PTR _dt$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _t$971[ebp], eax
; Line 831
	mov	eax, DWORD PTR _pointer$[ebp]
	push	eax
	mov	eax, DWORD PTR _t$971[ebp]
	mov	eax, DWORD PTR [eax+68]
	push	eax
	push	48					; 00000030H
	call	_build
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _ref$972[ebp], eax
; Line 834
	mov	eax, DWORD PTR _t$971[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 4
	je	$L974
	mov	eax, DWORD PTR _t$971[ebp]
	cmp	DWORD PTR [eax+28], 0
	jne	$L973
	mov	eax, DWORD PTR _t$971[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 16					; 00000010H
	je	$L973
$L974:
; Line 836
	push	OFFSET $SG975
	call	_error
	add	esp, 4
; Line 837
	mov	eax, DWORD PTR _error_mark_node
	jmp	$L965
; Line 840
$L973:
	mov	eax, DWORD PTR _t$971[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 5
	and	eax, 1
	shl	eax, 5
	mov	ecx, DWORD PTR _ref$972[ebp]
	mov	ecx, DWORD PTR [ecx+16]
	and	ecx, -33				; ffffffdfH
	or	eax, ecx
	mov	ecx, DWORD PTR _ref$972[ebp]
	mov	DWORD PTR [ecx+16], eax
; Line 841
	mov	eax, DWORD PTR _t$971[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 3
	test	al, 1
	jne	$L2061
	mov	eax, DWORD PTR _pointer$[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 3
	test	al, 1
	je	$L2059
$L2061:
	mov	eax, DWORD PTR _ref$972[ebp]
	mov	eax, DWORD PTR [eax+16]
	or	eax, 8
	mov	ecx, DWORD PTR _ref$972[ebp]
	mov	DWORD PTR [ecx+16], eax
	jmp	$L2060
$L2059:
	mov	eax, DWORD PTR _ref$972[ebp]
	and	DWORD PTR [eax+16], -9			; fffffff7H
$L2060:
; Line 842
	mov	eax, DWORD PTR _t$971[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 3
	and	eax, 1
	shl	eax, 11					; 0000000bH
	mov	ecx, DWORD PTR _ref$972[ebp]
	mov	ecx, DWORD PTR [ecx+16]
	and	ecx, -2049				; fffff7ffH
	or	eax, ecx
	mov	ecx, DWORD PTR _ref$972[ebp]
	mov	DWORD PTR [ecx+16], eax
; Line 843
	mov	eax, DWORD PTR _ref$972[ebp]
	jmp	$L965
; Line 844
$L970:
; Line 845
	jmp	$L976
$L968:
	mov	eax, DWORD PTR _pointer$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	or	eax, eax
	je	$L977
; Line 846
	mov	eax, DWORD PTR _errorstring$[ebp]
	push	eax
	push	OFFSET $SG978
	call	_error
	add	esp, 8
; Line 847
$L977:
$L976:
	mov	eax, DWORD PTR _error_mark_node
	jmp	$L965
; Line 848
$L965:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_build_indirect_ref ENDP
_TEXT	ENDS
PUBLIC	_build_binary_op_nodefault
PUBLIC	_build_array_ref
EXTRN	_fold:NEAR
_DATA	SEGMENT
	ORG $+2
$SG983	DB	'subscript missing in array reference', 00H
	ORG $+3
$SG988	DB	'array subscript is not an integer', 00H
	ORG $+2
$SG993	DB	'ANSI C forbids subscripting non-lvalue array', 00H
	ORG $+3
$SG1000	DB	'ANSI C forbids subscripting non-lvalue array', 00H
	ORG $+3
$SG1006	DB	'array subscript is not an integer', 00H
	ORG $+2
$SG1007	DB	'array indexing', 00H
_DATA	ENDS
_TEXT	SEGMENT
_array$ = 8
_index$ = 12
_rval$985 = -4
_type$986 = -8
_foo$995 = -12
_ar$1001 = -16
_ind$1002 = -20
_build_array_ref PROC NEAR
; Line 862
	push	ebp
	mov	ebp, esp
	sub	esp, 20					; 00000014H
	push	ebx
	push	esi
	push	edi
; Line 863
	cmp	DWORD PTR _index$[ebp], 0
	jne	$L982
; Line 865
	push	OFFSET $SG983
	call	_error
	add	esp, 4
; Line 866
	mov	eax, DWORD PTR _error_mark_node
	jmp	$L981
; Line 869
$L982:
; Line 870
	mov	eax, DWORD PTR _array$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 16					; 00000010H
	jne	$L984
	mov	eax, DWORD PTR _array$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 48					; 00000030H
	je	$L984
; Line 874
	mov	eax, DWORD PTR _index$[ebp]
	push	eax
	call	_default_conversion
	add	esp, 4
	mov	DWORD PTR _index$[ebp], eax
; Line 876
	mov	eax, DWORD PTR _error_mark_node
	cmp	DWORD PTR _index$[ebp], eax
	je	$L987
	mov	eax, DWORD PTR _index$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 5
	je	$L987
; Line 878
	push	OFFSET $SG988
	call	_error
	add	esp, 4
; Line 879
	mov	eax, DWORD PTR _error_mark_node
	jmp	$L981
; Line 886
$L987:
; Line 888
	mov	eax, DWORD PTR _index$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 35					; 00000023H
	jne	$L990
	mov	eax, DWORD PTR _array$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+8]
	cmp	DWORD PTR [eax+28], 0
	je	$L989
	mov	eax, DWORD PTR _array$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+28]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 35					; 00000023H
	je	$L989
$L990:
; Line 890
	mov	eax, DWORD PTR _array$[ebp]
	push	eax
	call	_mark_addressable
	add	esp, 4
	or	eax, eax
	jne	$L991
; Line 891
	mov	eax, DWORD PTR _error_mark_node
	jmp	$L981
; Line 892
$L991:
; Line 894
$L989:
	cmp	DWORD PTR _pedantic, 0
	je	$L992
	mov	eax, DWORD PTR _array$[ebp]
	push	eax
	call	_lvalue_p
	add	esp, 4
	or	eax, eax
	jne	$L992
; Line 895
	push	OFFSET $SG993
	call	_warning
	add	esp, 4
; Line 897
$L992:
	cmp	DWORD PTR _pedantic, 0
	je	$L994
; Line 899
	mov	eax, DWORD PTR _array$[ebp]
	mov	DWORD PTR _foo$995[ebp], eax
; Line 900
$L997:
	mov	eax, DWORD PTR _foo$995[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 47					; 0000002fH
	jne	$L998
; Line 901
	mov	eax, DWORD PTR _foo$995[ebp]
	mov	eax, DWORD PTR [eax+24]
	mov	DWORD PTR _foo$995[ebp], eax
	jmp	$L997
$L998:
; Line 902
	mov	eax, DWORD PTR _foo$995[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 43					; 0000002bH
	jne	$L999
	mov	eax, DWORD PTR _foo$995[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 10					; 0000000aH
	test	al, 1
	je	$L999
; Line 903
	push	OFFSET $SG1000
	call	_warning
	add	esp, 4
; Line 904
$L999:
; Line 906
$L994:
	mov	eax, DWORD PTR _array$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+68]
	mov	DWORD PTR _type$986[ebp], eax
; Line 907
	mov	eax, DWORD PTR _index$[ebp]
	push	eax
	mov	eax, DWORD PTR _array$[ebp]
	push	eax
	mov	eax, DWORD PTR _type$986[ebp]
	push	eax
	push	51					; 00000033H
	call	_build
	add	esp, 16					; 00000010H
	mov	DWORD PTR _rval$985[ebp], eax
; Line 912
	mov	eax, DWORD PTR _array$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 5
	mov	ecx, DWORD PTR _array$[ebp]
	mov	ecx, DWORD PTR [ecx+16]
	shr	ecx, 5
	or	eax, ecx
	mov	ecx, DWORD PTR _rval$985[ebp]
	mov	ecx, DWORD PTR [ecx+16]
	shr	ecx, 5
	or	eax, ecx
	and	eax, 1
	shl	eax, 5
	mov	ecx, DWORD PTR _rval$985[ebp]
	mov	ecx, DWORD PTR [ecx+16]
	and	ecx, -33				; ffffffdfH
	or	eax, ecx
	mov	ecx, DWORD PTR _rval$985[ebp]
	mov	DWORD PTR [ecx+16], eax
; Line 915
	mov	eax, DWORD PTR _array$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 3
	mov	ecx, DWORD PTR _rval$985[ebp]
	mov	ecx, DWORD PTR [ecx+16]
	shr	ecx, 3
	or	eax, ecx
	mov	ecx, DWORD PTR _array$[ebp]
	mov	ecx, DWORD PTR [ecx+16]
	shr	ecx, 3
	or	eax, ecx
	and	eax, 1
	shl	eax, 3
	mov	ecx, DWORD PTR _rval$985[ebp]
	mov	ecx, DWORD PTR [ecx+16]
	and	ecx, -9					; fffffff7H
	or	eax, ecx
	mov	ecx, DWORD PTR _rval$985[ebp]
	mov	DWORD PTR [ecx+16], eax
; Line 917
	mov	eax, DWORD PTR _array$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 3
	mov	ecx, DWORD PTR _rval$985[ebp]
	mov	ecx, DWORD PTR [ecx+16]
	shr	ecx, 11					; 0000000bH
	or	eax, ecx
	and	eax, 1
	shl	eax, 11					; 0000000bH
	mov	ecx, DWORD PTR _rval$985[ebp]
	mov	ecx, DWORD PTR [ecx+16]
	and	ecx, -2049				; fffff7ffH
	or	eax, ecx
	mov	ecx, DWORD PTR _rval$985[ebp]
	mov	DWORD PTR [ecx+16], eax
; Line 918
	mov	eax, DWORD PTR _rval$985[ebp]
	push	eax
	call	_fold
	add	esp, 4
	push	eax
	call	_require_complete_type
	add	esp, 4
	jmp	$L981
; Line 921
$L984:
; Line 922
	mov	eax, DWORD PTR _array$[ebp]
	push	eax
	call	_default_conversion
	add	esp, 4
	mov	DWORD PTR _ar$1001[ebp], eax
; Line 923
	mov	eax, DWORD PTR _index$[ebp]
	push	eax
	call	_default_conversion
	add	esp, 4
	mov	DWORD PTR _ind$1002[ebp], eax
; Line 928
	mov	eax, DWORD PTR _ar$1001[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 11					; 0000000bH
	jne	$L1005
	mov	eax, DWORD PTR _ind$1002[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 5
	jne	$L1004
$L1005:
	mov	eax, DWORD PTR _ind$1002[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 11					; 0000000bH
	jne	$L1003
	mov	eax, DWORD PTR _ar$1001[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 5
	je	$L1003
$L1004:
; Line 930
	push	OFFSET $SG1006
	call	_error
	add	esp, 4
; Line 931
	mov	eax, DWORD PTR _error_mark_node
	jmp	$L981
; Line 934
$L1003:
; Line 935
	push	OFFSET $SG1007
	push	64					; 00000040H
	mov	eax, DWORD PTR _ind$1002[ebp]
	push	eax
	mov	eax, DWORD PTR _ar$1001[ebp]
	push	eax
	push	64					; 00000040H
	call	_build_binary_op_nodefault
	add	esp, 16					; 00000010H
	push	eax
	call	_build_indirect_ref
	add	esp, 8
	jmp	$L981
; Line 937
$L981:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_build_array_ref ENDP
_TEXT	ENDS
PUBLIC	_build_function_call
PUBLIC	_actualparameterlist
EXTRN	_integer_zero_node:DWORD
_DATA	SEGMENT
	ORG $+1
$SG1022	DB	'called object is not a function', 00H
_DATA	ENDS
_TEXT	SEGMENT
_result$1030 = -20
_function$ = 8
_params$ = 12
_fntype$ = -16
_value_type$ = -12
_coerced_params$ = -8
_name$ = -4
_build_function_call PROC NEAR
; Line 947
	push	ebp
	mov	ebp, esp
	sub	esp, 24					; 00000018H
	push	ebx
	push	esi
	push	edi
; Line 951
	mov	DWORD PTR _name$[ebp], 0
; Line 957
	mov	eax, DWORD PTR _function$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 113				; 00000071H
	jne	$L1016
	mov	eax, DWORD PTR _function$[ebp]
	mov	eax, DWORD PTR [eax+24]
	mov	ecx, DWORD PTR _function$[ebp]
	mov	ecx, DWORD PTR [ecx+8]
	cmp	DWORD PTR [eax+8], ecx
	jne	$L1016
; Line 958
	mov	eax, DWORD PTR _function$[ebp]
	mov	eax, DWORD PTR [eax+24]
	mov	DWORD PTR _function$[ebp], eax
; Line 961
$L1016:
	mov	eax, DWORD PTR _function$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 39					; 00000027H
	jne	$L1017
; Line 963
	mov	eax, DWORD PTR _function$[ebp]
	mov	eax, DWORD PTR [eax+40]
	mov	DWORD PTR _name$[ebp], eax
; Line 968
	mov	eax, DWORD PTR _function$[ebp]
	push	eax
	mov	eax, DWORD PTR _function$[ebp]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	call	_build_pointer_type
	add	esp, 4
	push	eax
	push	116					; 00000074H
	call	_build
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _function$[ebp], eax
; Line 970
	jmp	$L1018
$L1017:
; Line 971
	mov	eax, DWORD PTR _function$[ebp]
	push	eax
	call	_default_conversion
	add	esp, 4
	mov	DWORD PTR _function$[ebp], eax
$L1018:
; Line 973
	mov	eax, DWORD PTR _function$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _fntype$[ebp], eax
; Line 975
	mov	eax, DWORD PTR _fntype$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	or	eax, eax
	jne	$L1019
; Line 976
	mov	eax, DWORD PTR _error_mark_node
	jmp	$L1010
; Line 978
$L1019:
; Line 979
	mov	eax, DWORD PTR _fntype$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 11					; 0000000bH
	jne	$L1021
	mov	eax, DWORD PTR _fntype$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 21					; 00000015H
	je	$L1020
$L1021:
; Line 981
	push	OFFSET $SG1022
	call	_error
	add	esp, 4
; Line 982
	mov	eax, DWORD PTR _error_mark_node
	jmp	$L1010
; Line 986
$L1020:
	mov	eax, DWORD PTR _fntype$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _fntype$[ebp], eax
; Line 991
	mov	eax, DWORD PTR _name$[ebp]
	push	eax
	mov	eax, DWORD PTR _params$[ebp]
	push	eax
	mov	eax, DWORD PTR _fntype$[ebp]
	mov	eax, DWORD PTR [eax+20]
	push	eax
	call	_actualparameterlist
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _coerced_params$[ebp], eax
; Line 998
	mov	eax, DWORD PTR _function$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 116				; 00000074H
	jne	$L1023
	mov	eax, DWORD PTR _function$[ebp]
	mov	eax, DWORD PTR [eax+24]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 39					; 00000027H
	jne	$L1023
; Line 999
	mov	eax, DWORD PTR _function$[ebp]
	mov	eax, DWORD PTR [eax+24]
	mov	eax, DWORD PTR [eax+48]
	mov	DWORD PTR -24+[ebp], eax
	jmp	$L1024
; Line 1001
$L1028:
; Line 1004
	cmp	DWORD PTR _coerced_params$[ebp], 0
	jne	$L1029
; Line 1005
	mov	eax, DWORD PTR _integer_zero_node
	jmp	$L1010
; Line 1006
$L1029:
	push	0
	mov	eax, DWORD PTR _coerced_params$[ebp]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	push	86					; 00000056H
	call	_build_unary_op
	add	esp, 12					; 0000000cH
	jmp	$L1010
; Line 1007
	jmp	$L1025
$L1024:
	cmp	DWORD PTR -24+[ebp], 2
	jl	$L1025
	cmp	DWORD PTR -24+[ebp], 4
	jle	$L1028
	jmp	$L1025
$L1025:
; Line 1009
$L1023:
	mov	eax, DWORD PTR _fntype$[ebp]
	cmp	DWORD PTR [eax+8], 0
	je	$L2062
	mov	eax, DWORD PTR _fntype$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _value_type$[ebp], eax
	jmp	$L2063
$L2062:
	mov	eax, DWORD PTR _void_type_node
	mov	DWORD PTR _value_type$[ebp], eax
$L2063:
; Line 1013
	push	0
	mov	eax, DWORD PTR _coerced_params$[ebp]
	push	eax
	mov	eax, DWORD PTR _function$[ebp]
	push	eax
	mov	eax, DWORD PTR _value_type$[ebp]
	push	eax
	push	61					; 0000003dH
	call	_build
	add	esp, 20					; 00000014H
	mov	DWORD PTR _result$1030[ebp], eax
; Line 1015
	mov	eax, DWORD PTR _result$1030[ebp]
	mov	eax, DWORD PTR [eax+16]
	or	eax, 8
	mov	ecx, DWORD PTR _result$1030[ebp]
	mov	DWORD PTR [ecx+16], eax
; Line 1016
	mov	eax, DWORD PTR _value_type$[ebp]
	cmp	DWORD PTR _void_type_node, eax
	jne	$L1031
; Line 1017
	mov	eax, DWORD PTR _result$1030[ebp]
	jmp	$L1010
; Line 1018
$L1031:
	mov	eax, DWORD PTR _result$1030[ebp]
	push	eax
	call	_require_complete_type
	add	esp, 4
	jmp	$L1010
; Line 1020
$L1010:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_build_function_call ENDP
_TEXT	ENDS
EXTRN	_build_tree_list:NEAR
EXTRN	_chainon:NEAR
_DATA	SEGMENT
$SG1047	DB	'too many arguments to function `%s''', 00H
$SG1049	DB	'too many arguments to function', 00H
	ORG $+1
$SG1056	DB	'parameter type of called function is incomplete', 00H
$SG1059	DB	'argument passing', 00H
	ORG $+3
$SG1067	DB	'too few arguments to function `%s''', 00H
	ORG $+1
$SG1069	DB	'too few arguments to function', 00H
_DATA	ENDS
_TEXT	SEGMENT
_typelist$ = 8
_values$ = 12
_name$ = 16
_typetail$ = -8
_valtail$ = -4
_result$ = -12
_type$1042 = -20
_val$1043 = -16
_parm$1044 = -24
_parmval$1054 = -28
_actualparameterlist PROC NEAR
; Line 1039
	push	ebp
	mov	ebp, esp
	sub	esp, 28					; 0000001cH
	push	ebx
	push	esi
	push	edi
; Line 1041
	mov	DWORD PTR _result$[ebp], 0
; Line 1045
	mov	eax, DWORD PTR _values$[ebp]
	mov	DWORD PTR _valtail$[ebp], eax
	mov	eax, DWORD PTR _typelist$[ebp]
	mov	DWORD PTR _typetail$[ebp], eax
	jmp	$L1039
$L1040:
	mov	eax, DWORD PTR _valtail$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _valtail$[ebp], eax
$L1039:
	cmp	DWORD PTR _valtail$[ebp], 0
	je	$L1041
; Line 1047
	cmp	DWORD PTR _typetail$[ebp], 0
	je	$L2064
	mov	eax, DWORD PTR _typetail$[ebp]
	mov	eax, DWORD PTR [eax+24]
	mov	DWORD PTR _type$1042[ebp], eax
	jmp	$L2065
$L2064:
	mov	DWORD PTR _type$1042[ebp], 0
$L2065:
; Line 1048
	mov	eax, DWORD PTR _valtail$[ebp]
	mov	eax, DWORD PTR [eax+24]
	mov	DWORD PTR _val$1043[ebp], eax
; Line 1051
	mov	eax, DWORD PTR _type$1042[ebp]
	cmp	DWORD PTR _void_type_node, eax
	jne	$L1045
; Line 1053
	cmp	DWORD PTR _name$[ebp], 0
	je	$L1046
; Line 1055
	mov	eax, DWORD PTR _name$[ebp]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	push	OFFSET $SG1047
	call	_error
	add	esp, 8
; Line 1056
	jmp	$L1048
$L1046:
; Line 1057
	push	OFFSET $SG1049
	call	_error
	add	esp, 4
$L1048:
; Line 1058
	jmp	$L1041
; Line 1063
$L1045:
; Line 1064
	mov	eax, DWORD PTR _val$1043[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 113				; 00000071H
	jne	$L1050
	mov	eax, DWORD PTR _val$1043[ebp]
	mov	eax, DWORD PTR [eax+24]
	mov	ecx, DWORD PTR _val$1043[ebp]
	mov	ecx, DWORD PTR [ecx+8]
	cmp	DWORD PTR [eax+8], ecx
	jne	$L1050
; Line 1065
	mov	eax, DWORD PTR _val$1043[ebp]
	mov	eax, DWORD PTR [eax+24]
	mov	DWORD PTR _val$1043[ebp], eax
; Line 1067
$L1050:
; Line 1068
	mov	eax, DWORD PTR _val$1043[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 16					; 00000010H
	je	$L1052
	mov	eax, DWORD PTR _val$1043[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 21					; 00000015H
	jne	$L1051
$L1052:
; Line 1069
	mov	eax, DWORD PTR _val$1043[ebp]
	push	eax
	call	_default_conversion
	add	esp, 4
	mov	DWORD PTR _val$1043[ebp], eax
; Line 1071
$L1051:
	mov	eax, DWORD PTR _val$1043[ebp]
	push	eax
	call	_require_complete_type
	add	esp, 4
	mov	DWORD PTR _val$1043[ebp], eax
; Line 1073
	cmp	DWORD PTR _type$1042[ebp], 0
	je	$L1053
; Line 1078
	mov	eax, DWORD PTR _type$1042[ebp]
	cmp	DWORD PTR [eax+28], 0
	jne	$L1055
; Line 1080
	push	OFFSET $SG1056
	call	_error
	add	esp, 4
; Line 1081
	mov	eax, DWORD PTR _val$1043[ebp]
	mov	DWORD PTR _parmval$1054[ebp], eax
; Line 1083
	jmp	$L1057
$L1055:
; Line 1090
	cmp	DWORD PTR _flag_traditional, 0
	jne	$L1058
	mov	eax, DWORD PTR _type$1042[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 5
	jne	$L1058
	mov	eax, DWORD PTR _integer_type_node
	mov	al, BYTE PTR [eax+38]
	and	eax, 255				; 000000ffH
	mov	ecx, DWORD PTR _type$1042[ebp]
	mov	cl, BYTE PTR [ecx+38]
	and	ecx, 255				; 000000ffH
	cmp	eax, ecx
	jle	$L1058
; Line 1091
	mov	eax, DWORD PTR _integer_type_node
	mov	DWORD PTR _type$1042[ebp], eax
; Line 1093
$L1058:
	push	OFFSET $SG1059
	mov	eax, DWORD PTR _val$1043[ebp]
	push	eax
	mov	eax, DWORD PTR _type$1042[ebp]
	push	eax
	call	_convert_for_assignment
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _parmval$1054[ebp], eax
; Line 1096
	mov	eax, DWORD PTR _type$1042[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 5
	jne	$L1060
	mov	eax, DWORD PTR _integer_type_node
	mov	al, BYTE PTR [eax+38]
	and	eax, 255				; 000000ffH
	mov	ecx, DWORD PTR _type$1042[ebp]
	mov	cl, BYTE PTR [ecx+38]
	and	ecx, 255				; 000000ffH
	cmp	eax, ecx
	jle	$L1060
; Line 1097
	mov	eax, DWORD PTR _parmval$1054[ebp]
	push	eax
	call	_default_conversion
	add	esp, 4
	mov	DWORD PTR _parmval$1054[ebp], eax
; Line 1099
$L1060:
$L1057:
; Line 1100
	mov	eax, DWORD PTR _parmval$1054[ebp]
	push	eax
	push	0
	call	_build_tree_list
	add	esp, 8
	mov	DWORD PTR _parm$1044[ebp], eax
; Line 1102
	jmp	$L1061
$L1053:
; Line 1104
	mov	eax, DWORD PTR _val$1043[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 6
	jne	$L1062
	mov	eax, DWORD PTR _val$1043[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	al, BYTE PTR [eax+38]
	and	eax, 255				; 000000ffH
	mov	ecx, DWORD PTR _double_type_node
	mov	cl, BYTE PTR [ecx+38]
	and	ecx, 255				; 000000ffH
	cmp	eax, ecx
	jge	$L1062
; Line 1106
	mov	eax, DWORD PTR _val$1043[ebp]
	push	eax
	mov	eax, DWORD PTR _double_type_node
	push	eax
	call	_convert
	add	esp, 8
	push	eax
	push	0
	call	_build_tree_list
	add	esp, 8
	mov	DWORD PTR _parm$1044[ebp], eax
; Line 1107
	jmp	$L1063
$L1062:
; Line 1109
	mov	eax, DWORD PTR _val$1043[ebp]
	push	eax
	call	_default_conversion
	add	esp, 4
	push	eax
	push	0
	call	_build_tree_list
	add	esp, 8
	mov	DWORD PTR _parm$1044[ebp], eax
$L1063:
$L1061:
; Line 1111
	mov	eax, DWORD PTR _parm$1044[ebp]
	push	eax
	mov	eax, DWORD PTR _result$[ebp]
	push	eax
	call	_chainon
	add	esp, 8
	mov	DWORD PTR _result$[ebp], eax
; Line 1112
	cmp	DWORD PTR _typetail$[ebp], 0
	je	$L1064
; Line 1113
	mov	eax, DWORD PTR _typetail$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _typetail$[ebp], eax
; Line 1114
$L1064:
	jmp	$L1040
$L1041:
; Line 1116
	cmp	DWORD PTR _typetail$[ebp], 0
	je	$L1065
	mov	eax, DWORD PTR _typetail$[ebp]
	mov	ecx, DWORD PTR _void_type_node
	cmp	DWORD PTR [eax+24], ecx
	je	$L1065
; Line 1118
	cmp	DWORD PTR _name$[ebp], 0
	je	$L1066
; Line 1120
	mov	eax, DWORD PTR _name$[ebp]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	push	OFFSET $SG1067
	call	_error
	add	esp, 8
; Line 1121
	jmp	$L1068
$L1066:
; Line 1122
	push	OFFSET $SG1069
	call	_error
	add	esp, 4
$L1068:
; Line 1125
$L1065:
	mov	eax, DWORD PTR _result$[ebp]
	jmp	$L1035
; Line 1126
$L1035:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_actualparameterlist ENDP
_TEXT	ENDS
PUBLIC	_build_binary_op
_TEXT	SEGMENT
_code$ = 8
_arg1$ = 12
_arg2$ = 16
_build_binary_op PROC NEAR
; Line 1135
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 1137
	mov	eax, DWORD PTR _code$[ebp]
	push	eax
	mov	eax, DWORD PTR _arg2$[ebp]
	push	eax
	call	_default_conversion
	add	esp, 4
	push	eax
	mov	eax, DWORD PTR _arg1$[ebp]
	push	eax
	call	_default_conversion
	add	esp, 4
	push	eax
	mov	eax, DWORD PTR _code$[ebp]
	push	eax
	call	_build_binary_op_nodefault
	add	esp, 16					; 00000010H
	jmp	$L1073
; Line 1138
$L1073:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_build_binary_op ENDP
_TEXT	ENDS
PUBLIC	_truthvalue_conversion
EXTRN	_null_pointer_node:DWORD
EXTRN	_int_fits_type_p:NEAR
EXTRN	_integer_zerop:NEAR
EXTRN	_get_narrower:NEAR
_DATA	SEGMENT
	ORG $+2
$SG1148	DB	'ANSI C forbids comparison of `void *'' with function poi'
	DB	'nter', 00H
$SG1152	DB	'ANSI C forbids comparison of `void *'' with function poi'
	DB	'nter', 00H
$SG1154	DB	'comparison of distinct pointer types lacks a cast', 00H
	ORG $+2
$SG1162	DB	'comparison between pointer and integer', 00H
	ORG $+1
$SG1166	DB	'comparison between pointer and integer', 00H
	ORG $+1
$SG1175	DB	'comparison of distinct pointer types lacks a cast', 00H
	ORG $+2
$SG1178	DB	'ANSI C forbids ordered comparisons of pointers to functi'
	DB	'ons', 00H
$SG1186	DB	'comparison of distinct pointer types lacks a cast', 00H
	ORG $+2
$SG1189	DB	'ANSI C forbids ordered comparisons of pointers to functi'
	DB	'ons', 00H
$SG1193	DB	'ordered comparison of pointer with integer zero', 00H
$SG1197	DB	'ordered comparison of pointer with integer zero', 00H
$SG1201	DB	'comparison between pointer and integer', 00H
	ORG $+1
$SG1205	DB	'comparison between pointer and integer', 00H
_DATA	ENDS
_TEXT	SEGMENT
_uns$1216 = -60
_short_compare$ = -12
_type$1217 = -68
_short_shift$ = -16
_common$ = -8
_unsigned_arg$1231 = -88
_arg0$1232 = -84
_xop0$1238 = -96
_xop1$1239 = -108
_xresult_type$1240 = -100
_xresultcode$1241 = -104
_val$1242 = -92
_result$1248 = -116
_folded$1249 = -112
_code$ = 8
_op0$ = 12
_op1$ = 16
_error_code$ = 20
_tt0$1142 = -56
_tt1$1143 = -52
_dt0$ = -48
_dt1$ = -40
_code0$ = -4
_code1$ = -44
_resultcode$ = -32
_unsigned0$1212 = -80
_result_type$ = -28
_unsigned1$1213 = -76
_converted$ = -36
_arg0$1214 = -72
_final_type$ = -24
_arg1$1215 = -64
_shorten$ = -20
_build_binary_op_nodefault PROC NEAR
; Line 1163
	push	ebp
	mov	ebp, esp
	sub	esp, 128				; 00000080H
	push	ebx
	push	esi
	push	edi
; Line 1164
	mov	eax, DWORD PTR _op0$[ebp]
	push	eax
	call	_datatype
	add	esp, 4
	mov	DWORD PTR _dt0$[ebp], eax
	mov	eax, DWORD PTR _op1$[ebp]
	push	eax
	call	_datatype
	add	esp, 4
	mov	DWORD PTR _dt1$[ebp], eax
; Line 1168
	mov	eax, DWORD PTR _dt0$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	mov	DWORD PTR _code0$[ebp], eax
; Line 1169
	mov	eax, DWORD PTR _dt1$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	mov	DWORD PTR _code1$[ebp], eax
; Line 1174
	mov	eax, DWORD PTR _code$[ebp]
	mov	DWORD PTR _resultcode$[ebp], eax
; Line 1178
	mov	DWORD PTR _result_type$[ebp], 0
; Line 1183
	mov	DWORD PTR _converted$[ebp], 0
; Line 1187
	mov	DWORD PTR _final_type$[ebp], 0
; Line 1195
	mov	DWORD PTR _shorten$[ebp], 0
; Line 1200
	mov	DWORD PTR _short_compare$[ebp], 0
; Line 1204
	mov	DWORD PTR _short_shift$[ebp], 0
; Line 1207
	mov	DWORD PTR _common$[ebp], 0
; Line 1212
	cmp	DWORD PTR _code0$[ebp], 0
	je	$L1092
	cmp	DWORD PTR _code1$[ebp], 0
	jne	$L1091
$L1092:
; Line 1213
	mov	eax, DWORD PTR _error_mark_node
	jmp	$L1078
; Line 1215
$L1091:
	mov	eax, DWORD PTR _code$[ebp]
	mov	DWORD PTR -128+[ebp], eax
	jmp	$L1093
; Line 1217
$L1097:
; Line 1219
	cmp	DWORD PTR _code0$[ebp], 11		; 0000000bH
	jne	$L1098
	cmp	DWORD PTR _code1$[ebp], 5
	jne	$L1098
; Line 1220
	mov	eax, DWORD PTR _op1$[ebp]
	push	eax
	mov	eax, DWORD PTR _op0$[ebp]
	push	eax
	push	64					; 00000040H
	call	_pointer_int_sum
	add	esp, 12					; 0000000cH
	jmp	$L1078
; Line 1221
	jmp	$L1099
$L1098:
	cmp	DWORD PTR _code1$[ebp], 11		; 0000000bH
	jne	$L1100
	cmp	DWORD PTR _code0$[ebp], 5
	jne	$L1100
; Line 1222
	mov	eax, DWORD PTR _op0$[ebp]
	push	eax
	mov	eax, DWORD PTR _op1$[ebp]
	push	eax
	push	64					; 00000040H
	call	_pointer_int_sum
	add	esp, 12					; 0000000cH
	jmp	$L1078
; Line 1223
	jmp	$L1101
$L1100:
; Line 1224
	mov	DWORD PTR _common$[ebp], 1
$L1101:
$L1099:
; Line 1225
	jmp	$L1094
; Line 1227
$L1102:
; Line 1231
	cmp	DWORD PTR _code0$[ebp], 11		; 0000000bH
	jne	$L1103
	cmp	DWORD PTR _code1$[ebp], 11		; 0000000bH
	jne	$L1103
	mov	eax, DWORD PTR _dt1$[ebp]
	push	eax
	mov	eax, DWORD PTR _dt0$[ebp]
	push	eax
	call	_comp_target_types
	add	esp, 8
	or	eax, eax
	je	$L1103
; Line 1232
	mov	eax, DWORD PTR _op1$[ebp]
	push	eax
	mov	eax, DWORD PTR _op0$[ebp]
	push	eax
	call	_pointer_diff
	add	esp, 8
	jmp	$L1078
; Line 1234
	jmp	$L1104
$L1103:
	cmp	DWORD PTR _code0$[ebp], 11		; 0000000bH
	jne	$L1105
	cmp	DWORD PTR _code1$[ebp], 5
	jne	$L1105
; Line 1235
	mov	eax, DWORD PTR _op1$[ebp]
	push	eax
	mov	eax, DWORD PTR _op0$[ebp]
	push	eax
	push	65					; 00000041H
	call	_pointer_int_sum
	add	esp, 12					; 0000000cH
	jmp	$L1078
; Line 1236
	jmp	$L1106
$L1105:
; Line 1237
	mov	DWORD PTR _common$[ebp], 1
$L1106:
$L1104:
; Line 1238
	jmp	$L1094
; Line 1240
$L1107:
; Line 1241
	mov	DWORD PTR _common$[ebp], 1
; Line 1242
	jmp	$L1094
; Line 1244
$L1108:
; Line 1250
	cmp	DWORD PTR _code0$[ebp], 5
	je	$L1110
	cmp	DWORD PTR _code0$[ebp], 6
	jne	$L1109
$L1110:
	cmp	DWORD PTR _code1$[ebp], 5
	je	$L1111
	cmp	DWORD PTR _code1$[ebp], 6
	jne	$L1109
$L1111:
; Line 1252
	cmp	DWORD PTR _code0$[ebp], 5
	jne	$L1113
	cmp	DWORD PTR _code1$[ebp], 5
	je	$L1112
$L1113:
; Line 1253
	mov	DWORD PTR _resultcode$[ebp], 75		; 0000004bH
; Line 1254
	jmp	$L1114
$L1112:
; Line 1255
	mov	DWORD PTR _shorten$[ebp], 1
$L1114:
; Line 1256
	mov	DWORD PTR _common$[ebp], 1
; Line 1258
$L1109:
	jmp	$L1094
; Line 1260
$L1115:
; Line 1264
	cmp	DWORD PTR _code0$[ebp], 5
	jne	$L1116
	cmp	DWORD PTR _code1$[ebp], 5
	jne	$L1116
; Line 1265
	mov	DWORD PTR _shorten$[ebp], -1
; Line 1271
$L1116:
; Line 1274
	mov	eax, DWORD PTR _op0$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 35					; 00000023H
	jne	$L1117
	mov	eax, DWORD PTR _op1$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 113				; 00000071H
	jne	$L1117
	mov	eax, DWORD PTR _op1$[ebp]
	mov	eax, DWORD PTR [eax+24]
	mov	eax, DWORD PTR [eax+8]
	mov	al, BYTE PTR [eax+38]
	and	eax, 255				; 000000ffH
	mov	ecx, DWORD PTR _dt1$[ebp]
	mov	cl, BYTE PTR [ecx+38]
	and	ecx, 255				; 000000ffH
	cmp	eax, ecx
	jge	$L1117
	mov	eax, DWORD PTR _op1$[ebp]
	mov	eax, DWORD PTR [eax+24]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 12					; 0000000cH
	test	al, 1
	je	$L1117
; Line 1276
	mov	eax, DWORD PTR _result_type$[ebp]
	mov	DWORD PTR _final_type$[ebp], eax
; Line 1277
	mov	eax, DWORD PTR _op1$[ebp]
	mov	eax, DWORD PTR [eax+24]
	mov	DWORD PTR _op1$[ebp], eax
; Line 1278
	mov	eax, DWORD PTR _op1$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _result_type$[ebp], eax
; Line 1280
$L1117:
; Line 1283
	mov	eax, DWORD PTR _op1$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 35					; 00000023H
	jne	$L1118
	mov	eax, DWORD PTR _op0$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 113				; 00000071H
	jne	$L1118
	mov	eax, DWORD PTR _op0$[ebp]
	mov	eax, DWORD PTR [eax+24]
	mov	eax, DWORD PTR [eax+8]
	mov	al, BYTE PTR [eax+38]
	and	eax, 255				; 000000ffH
	mov	ecx, DWORD PTR _dt0$[ebp]
	mov	cl, BYTE PTR [ecx+38]
	and	ecx, 255				; 000000ffH
	cmp	eax, ecx
	jge	$L1118
	mov	eax, DWORD PTR _op0$[ebp]
	mov	eax, DWORD PTR [eax+24]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 12					; 0000000cH
	test	al, 1
	je	$L1118
; Line 1285
	mov	eax, DWORD PTR _result_type$[ebp]
	mov	DWORD PTR _final_type$[ebp], eax
; Line 1286
	mov	eax, DWORD PTR _op0$[ebp]
	mov	eax, DWORD PTR [eax+24]
	mov	DWORD PTR _op0$[ebp], eax
; Line 1287
	mov	eax, DWORD PTR _op0$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _result_type$[ebp], eax
; Line 1289
$L1118:
	jmp	$L1094
; Line 1291
$L1119:
; Line 1292
	cmp	DWORD PTR _code0$[ebp], 5
	jne	$L1120
	cmp	DWORD PTR _code1$[ebp], 5
	jne	$L1120
; Line 1293
	mov	DWORD PTR _shorten$[ebp], 1
; Line 1294
$L1120:
	jmp	$L1094
; Line 1296
$L1121:
; Line 1301
	cmp	DWORD PTR _code0$[ebp], 5
	je	$L1123
	cmp	DWORD PTR _code0$[ebp], 11		; 0000000bH
	je	$L1123
	cmp	DWORD PTR _code0$[ebp], 6
	jne	$L1122
$L1123:
	cmp	DWORD PTR _code1$[ebp], 5
	je	$L1124
	cmp	DWORD PTR _code1$[ebp], 11		; 0000000bH
	je	$L1124
	cmp	DWORD PTR _code1$[ebp], 6
	jne	$L1122
$L1124:
; Line 1306
	mov	eax, DWORD PTR _integer_type_node
	mov	DWORD PTR _result_type$[ebp], eax
; Line 1307
	mov	eax, DWORD PTR _op0$[ebp]
	push	eax
	call	_truthvalue_conversion
	add	esp, 4
	mov	DWORD PTR _op0$[ebp], eax
; Line 1308
	mov	eax, DWORD PTR _op1$[ebp]
	push	eax
	call	_truthvalue_conversion
	add	esp, 4
	mov	DWORD PTR _op1$[ebp], eax
; Line 1309
	mov	DWORD PTR _converted$[ebp], 1
; Line 1311
$L1122:
	jmp	$L1094
; Line 1317
$L1125:
; Line 1318
	cmp	DWORD PTR _code0$[ebp], 5
	jne	$L1126
	cmp	DWORD PTR _code1$[ebp], 5
	jne	$L1126
; Line 1320
	mov	eax, DWORD PTR _dt0$[ebp]
	mov	DWORD PTR _result_type$[ebp], eax
; Line 1322
	mov	eax, DWORD PTR _op1$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 35					; 00000023H
	jne	$L1127
	mov	eax, DWORD PTR _op1$[ebp]
	cmp	DWORD PTR [eax+20], 0
	jle	$L1127
; Line 1323
	mov	DWORD PTR _short_shift$[ebp], 1
; Line 1326
$L1127:
	mov	eax, DWORD PTR _op1$[ebp]
	mov	ecx, DWORD PTR _integer_type_node
	cmp	DWORD PTR [eax+8], ecx
	je	$L1128
; Line 1327
	mov	eax, DWORD PTR _op1$[ebp]
	push	eax
	mov	eax, DWORD PTR _integer_type_node
	push	eax
	call	_convert
	add	esp, 8
	mov	DWORD PTR _op1$[ebp], eax
; Line 1328
$L1128:
; Line 1329
$L1126:
	jmp	$L1094
; Line 1331
$L1129:
; Line 1332
	cmp	DWORD PTR _code0$[ebp], 5
	jne	$L1130
	cmp	DWORD PTR _code1$[ebp], 5
	jne	$L1130
; Line 1334
	mov	eax, DWORD PTR _dt0$[ebp]
	mov	DWORD PTR _result_type$[ebp], eax
; Line 1336
	mov	eax, DWORD PTR _op1$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 35					; 00000023H
	jne	$L1131
	mov	eax, DWORD PTR _op1$[ebp]
	cmp	DWORD PTR [eax+20], 0
	jge	$L1131
; Line 1337
	mov	DWORD PTR _short_shift$[ebp], 1
; Line 1340
$L1131:
	mov	eax, DWORD PTR _op1$[ebp]
	mov	ecx, DWORD PTR _integer_type_node
	cmp	DWORD PTR [eax+8], ecx
	je	$L1132
; Line 1341
	mov	eax, DWORD PTR _op1$[ebp]
	push	eax
	mov	eax, DWORD PTR _integer_type_node
	push	eax
	call	_convert
	add	esp, 8
	mov	DWORD PTR _op1$[ebp], eax
; Line 1342
$L1132:
; Line 1343
$L1130:
	jmp	$L1094
; Line 1345
$L1133:
; Line 1347
	cmp	DWORD PTR _code0$[ebp], 5
	jne	$L1134
	cmp	DWORD PTR _code1$[ebp], 5
	jne	$L1134
; Line 1349
	mov	eax, DWORD PTR _dt0$[ebp]
	mov	DWORD PTR _result_type$[ebp], eax
; Line 1352
	mov	eax, DWORD PTR _op1$[ebp]
	mov	ecx, DWORD PTR _integer_type_node
	cmp	DWORD PTR [eax+8], ecx
	je	$L1135
; Line 1353
	mov	eax, DWORD PTR _op1$[ebp]
	push	eax
	mov	eax, DWORD PTR _integer_type_node
	push	eax
	call	_convert
	add	esp, 8
	mov	DWORD PTR _op1$[ebp], eax
; Line 1354
$L1135:
; Line 1355
$L1134:
	jmp	$L1094
; Line 1357
$L1136:
; Line 1361
	mov	eax, DWORD PTR _integer_type_node
	mov	DWORD PTR _result_type$[ebp], eax
; Line 1362
	mov	DWORD PTR _converted$[ebp], 1
; Line 1364
	cmp	DWORD PTR _code0$[ebp], 5
	je	$L1138
	cmp	DWORD PTR _code0$[ebp], 6
	jne	$L1137
$L1138:
	cmp	DWORD PTR _code1$[ebp], 5
	je	$L1139
	cmp	DWORD PTR _code1$[ebp], 6
	jne	$L1137
$L1139:
; Line 1365
	mov	DWORD PTR _short_compare$[ebp], 1
; Line 1366
	jmp	$L1140
$L1137:
	cmp	DWORD PTR _code0$[ebp], 11		; 0000000bH
	jne	$L1141
	cmp	DWORD PTR _code1$[ebp], 11		; 0000000bH
	jne	$L1141
; Line 1368
	mov	eax, DWORD PTR _dt0$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _tt0$1142[ebp], eax
; Line 1369
	mov	eax, DWORD PTR _dt1$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _tt1$1143[ebp], eax
; Line 1372
	mov	eax, DWORD PTR _dt1$[ebp]
	push	eax
	mov	eax, DWORD PTR _dt0$[ebp]
	push	eax
	call	_comp_target_types
	add	esp, 8
	or	eax, eax
	je	$L1144
; Line 1374
	jmp	$L1145
$L1144:
	mov	eax, DWORD PTR _tt0$1142[ebp]
	mov	ecx, DWORD PTR _void_type_node
	cmp	DWORD PTR [eax+68], ecx
	jne	$L1146
; Line 1376
	cmp	DWORD PTR _pedantic, 0
	je	$L1147
	mov	eax, DWORD PTR _tt1$1143[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 21					; 00000015H
	jne	$L1147
; Line 1377
	push	OFFSET $SG1148
	call	_warning
	add	esp, 4
; Line 1378
$L1147:
; Line 1379
	jmp	$L1149
$L1146:
	mov	eax, DWORD PTR _tt1$1143[ebp]
	mov	ecx, DWORD PTR _void_type_node
	cmp	DWORD PTR [eax+68], ecx
	jne	$L1150
; Line 1381
	cmp	DWORD PTR _pedantic, 0
	je	$L1151
	mov	eax, DWORD PTR _tt0$1142[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 21					; 00000015H
	jne	$L1151
; Line 1382
	push	OFFSET $SG1152
	call	_warning
	add	esp, 4
; Line 1383
$L1151:
; Line 1384
	jmp	$L1153
$L1150:
; Line 1385
	push	OFFSET $SG1154
	call	_warning
	add	esp, 4
$L1153:
$L1149:
$L1145:
; Line 1387
	jmp	$L1155
$L1141:
; Line 1388
	cmp	DWORD PTR _code0$[ebp], 11		; 0000000bH
	jne	$L1156
	mov	eax, DWORD PTR _op1$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 35					; 00000023H
	jne	$L1156
	mov	eax, DWORD PTR _op1$[ebp]
	push	eax
	call	_integer_zerop
	add	esp, 4
	or	eax, eax
	je	$L1156
; Line 1389
	mov	eax, DWORD PTR _null_pointer_node
	mov	DWORD PTR _op1$[ebp], eax
; Line 1390
	jmp	$L1157
$L1156:
; Line 1391
	cmp	DWORD PTR _code1$[ebp], 11		; 0000000bH
	jne	$L1158
	mov	eax, DWORD PTR _op0$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 35					; 00000023H
	jne	$L1158
	mov	eax, DWORD PTR _op0$[ebp]
	push	eax
	call	_integer_zerop
	add	esp, 4
	or	eax, eax
	je	$L1158
; Line 1392
	mov	eax, DWORD PTR _null_pointer_node
	mov	DWORD PTR _op0$[ebp], eax
; Line 1393
	jmp	$L1159
$L1158:
	cmp	DWORD PTR _code0$[ebp], 11		; 0000000bH
	jne	$L1160
	cmp	DWORD PTR _code1$[ebp], 5
	jne	$L1160
; Line 1395
	cmp	DWORD PTR _flag_traditional, 0
	jne	$L1161
; Line 1396
	push	OFFSET $SG1162
	call	_warning
	add	esp, 4
; Line 1397
$L1161:
	mov	eax, DWORD PTR _op1$[ebp]
	push	eax
	mov	eax, DWORD PTR _op0$[ebp]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	call	_convert
	add	esp, 8
	mov	DWORD PTR _op1$[ebp], eax
; Line 1399
	jmp	$L1163
$L1160:
	cmp	DWORD PTR _code0$[ebp], 5
	jne	$L1164
	cmp	DWORD PTR _code1$[ebp], 11		; 0000000bH
	jne	$L1164
; Line 1401
	cmp	DWORD PTR _flag_traditional, 0
	jne	$L1165
; Line 1402
	push	OFFSET $SG1166
	call	_warning
	add	esp, 4
; Line 1403
$L1165:
	mov	eax, DWORD PTR _op0$[ebp]
	push	eax
	mov	eax, DWORD PTR _op1$[ebp]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	call	_convert
	add	esp, 8
	mov	DWORD PTR _op0$[ebp], eax
; Line 1405
	jmp	$L1167
$L1164:
; Line 1408
	mov	DWORD PTR _result_type$[ebp], 0
$L1167:
$L1163:
$L1159:
$L1157:
$L1155:
$L1140:
; Line 1409
	jmp	$L1094
; Line 1411
$L1168:
; Line 1414
	cmp	DWORD PTR _code0$[ebp], 5
	je	$L1170
	cmp	DWORD PTR _code0$[ebp], 6
	jne	$L1169
$L1170:
	cmp	DWORD PTR _code1$[ebp], 5
	je	$L1171
	cmp	DWORD PTR _code1$[ebp], 6
	jne	$L1169
$L1171:
; Line 1415
	mov	DWORD PTR _shorten$[ebp], 1
; Line 1416
	jmp	$L1172
$L1169:
	cmp	DWORD PTR _code0$[ebp], 11		; 0000000bH
	jne	$L1173
	cmp	DWORD PTR _code1$[ebp], 11		; 0000000bH
	jne	$L1173
; Line 1418
	mov	eax, DWORD PTR _dt1$[ebp]
	push	eax
	mov	eax, DWORD PTR _dt0$[ebp]
	push	eax
	call	_comp_target_types
	add	esp, 8
	or	eax, eax
	jne	$L1174
; Line 1419
	push	OFFSET $SG1175
	call	_warning
	add	esp, 4
; Line 1420
	jmp	$L1176
$L1174:
; Line 1421
	cmp	DWORD PTR _pedantic, 0
	je	$L1177
	mov	eax, DWORD PTR _dt0$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 21					; 00000015H
	jne	$L1177
; Line 1422
	push	OFFSET $SG1178
	call	_warning
	add	esp, 4
; Line 1423
$L1177:
$L1176:
	mov	eax, DWORD PTR _dt1$[ebp]
	push	eax
	mov	eax, DWORD PTR _dt0$[ebp]
	push	eax
	call	_commontype
	add	esp, 8
	mov	DWORD PTR _result_type$[ebp], eax
; Line 1425
$L1173:
$L1172:
	jmp	$L1094
; Line 1427
$L1179:
; Line 1432
	cmp	DWORD PTR _code0$[ebp], 5
	je	$L1181
	cmp	DWORD PTR _code0$[ebp], 6
	jne	$L1180
$L1181:
	cmp	DWORD PTR _code1$[ebp], 5
	je	$L1182
	cmp	DWORD PTR _code1$[ebp], 6
	jne	$L1180
$L1182:
; Line 1433
	mov	DWORD PTR _short_compare$[ebp], 1
; Line 1434
	jmp	$L1183
$L1180:
	cmp	DWORD PTR _code0$[ebp], 11		; 0000000bH
	jne	$L1184
	cmp	DWORD PTR _code1$[ebp], 11		; 0000000bH
	jne	$L1184
; Line 1436
	mov	eax, DWORD PTR _dt1$[ebp]
	push	eax
	mov	eax, DWORD PTR _dt0$[ebp]
	push	eax
	call	_comp_target_types
	add	esp, 8
	or	eax, eax
	jne	$L1185
; Line 1437
	push	OFFSET $SG1186
	call	_warning
	add	esp, 4
; Line 1438
	jmp	$L1187
$L1185:
; Line 1439
	cmp	DWORD PTR _pedantic, 0
	je	$L1188
	mov	eax, DWORD PTR _dt0$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 21					; 00000015H
	jne	$L1188
; Line 1440
	push	OFFSET $SG1189
	call	_warning
	add	esp, 4
; Line 1441
$L1188:
$L1187:
	mov	eax, DWORD PTR _integer_type_node
	mov	DWORD PTR _result_type$[ebp], eax
; Line 1443
	jmp	$L1190
$L1184:
; Line 1444
	cmp	DWORD PTR _code0$[ebp], 11		; 0000000bH
	jne	$L1191
	mov	eax, DWORD PTR _op1$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 35					; 00000023H
	jne	$L1191
	mov	eax, DWORD PTR _op1$[ebp]
	push	eax
	call	_integer_zerop
	add	esp, 4
	or	eax, eax
	je	$L1191
; Line 1446
	mov	eax, DWORD PTR _integer_type_node
	mov	DWORD PTR _result_type$[ebp], eax
; Line 1447
	mov	eax, DWORD PTR _null_pointer_node
	mov	DWORD PTR _op1$[ebp], eax
; Line 1448
	cmp	DWORD PTR _flag_traditional, 0
	jne	$L1192
; Line 1449
	push	OFFSET $SG1193
	call	_warning
	add	esp, 4
; Line 1450
$L1192:
; Line 1451
	jmp	$L1194
$L1191:
; Line 1452
	cmp	DWORD PTR _code1$[ebp], 11		; 0000000bH
	jne	$L1195
	mov	eax, DWORD PTR _op0$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 35					; 00000023H
	jne	$L1195
	mov	eax, DWORD PTR _op0$[ebp]
	push	eax
	call	_integer_zerop
	add	esp, 4
	or	eax, eax
	je	$L1195
; Line 1454
	mov	eax, DWORD PTR _integer_type_node
	mov	DWORD PTR _result_type$[ebp], eax
; Line 1455
	mov	eax, DWORD PTR _null_pointer_node
	mov	DWORD PTR _op0$[ebp], eax
; Line 1456
	cmp	DWORD PTR _pedantic, 0
	je	$L1196
; Line 1457
	push	OFFSET $SG1197
	call	_warning
	add	esp, 4
; Line 1458
$L1196:
; Line 1459
	jmp	$L1198
$L1195:
	cmp	DWORD PTR _code0$[ebp], 11		; 0000000bH
	jne	$L1199
	cmp	DWORD PTR _code1$[ebp], 5
	jne	$L1199
; Line 1461
	mov	eax, DWORD PTR _integer_type_node
	mov	DWORD PTR _result_type$[ebp], eax
; Line 1462
	cmp	DWORD PTR _flag_traditional, 0
	jne	$L1200
; Line 1463
	push	OFFSET $SG1201
	call	_warning
	add	esp, 4
; Line 1464
$L1200:
	mov	eax, DWORD PTR _op1$[ebp]
	push	eax
	mov	eax, DWORD PTR _op0$[ebp]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	call	_convert
	add	esp, 8
	mov	DWORD PTR _op1$[ebp], eax
; Line 1466
	jmp	$L1202
$L1199:
	cmp	DWORD PTR _code0$[ebp], 5
	jne	$L1203
	cmp	DWORD PTR _code1$[ebp], 11		; 0000000bH
	jne	$L1203
; Line 1468
	mov	eax, DWORD PTR _integer_type_node
	mov	DWORD PTR _result_type$[ebp], eax
; Line 1469
	cmp	DWORD PTR _flag_traditional, 0
	jne	$L1204
; Line 1470
	push	OFFSET $SG1205
	call	_warning
	add	esp, 4
; Line 1471
$L1204:
	mov	eax, DWORD PTR _op0$[ebp]
	push	eax
	mov	eax, DWORD PTR _op1$[ebp]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	call	_convert
	add	esp, 8
	mov	DWORD PTR _op0$[ebp], eax
; Line 1473
$L1203:
$L1202:
$L1198:
$L1194:
$L1190:
$L1183:
	mov	DWORD PTR _converted$[ebp], 1
; Line 1474
	jmp	$L1094
; Line 1475
	jmp	$L1094
$L1093:
	sub	DWORD PTR -128+[ebp], 64		; 00000040H
	cmp	DWORD PTR -128+[ebp], 43		; 0000002bH
	ja	$L1094
	shl	DWORD PTR -128+[ebp], 2
	mov	eax, DWORD PTR -128+[ebp]
	jmp	DWORD PTR $L2066[eax]
$L2066:
	DD	OFFSET $L1097
	DD	OFFSET $L1102
	DD	OFFSET $L1107
	DD	OFFSET $L1108
	DD	OFFSET $L1108
	DD	OFFSET $L1108
	DD	OFFSET $L1108
	DD	OFFSET $L1119
	DD	OFFSET $L1094
	DD	OFFSET $L1094
	DD	OFFSET $L1094
	DD	OFFSET $L1094
	DD	OFFSET $L1108
	DD	OFFSET $L1094
	DD	OFFSET $L1094
	DD	OFFSET $L1094
	DD	OFFSET $L1094
	DD	OFFSET $L1094
	DD	OFFSET $L1094
	DD	OFFSET $L1094
	DD	OFFSET $L1168
	DD	OFFSET $L1168
	DD	OFFSET $L1094
	DD	OFFSET $L1094
	DD	OFFSET $L1129
	DD	OFFSET $L1125
	DD	OFFSET $L1133
	DD	OFFSET $L1133
	DD	OFFSET $L1115
	DD	OFFSET $L1115
	DD	OFFSET $L1115
	DD	OFFSET $L1115
	DD	OFFSET $L1094
	DD	OFFSET $L1121
	DD	OFFSET $L1121
	DD	OFFSET $L1121
	DD	OFFSET $L1121
	DD	OFFSET $L1094
	DD	OFFSET $L1179
	DD	OFFSET $L1179
	DD	OFFSET $L1179
	DD	OFFSET $L1179
	DD	OFFSET $L1136
	DD	OFFSET $L1136
$L1094:
; Line 1478
	cmp	DWORD PTR _code0$[ebp], 5
	je	$L1207
	cmp	DWORD PTR _code0$[ebp], 6
	jne	$L1206
$L1207:
	cmp	DWORD PTR _code1$[ebp], 5
	je	$L1208
	cmp	DWORD PTR _code1$[ebp], 6
	jne	$L1206
$L1208:
; Line 1480
	cmp	DWORD PTR _shorten$[ebp], 0
	jne	$L1210
	cmp	DWORD PTR _common$[ebp], 0
	jne	$L1210
	cmp	DWORD PTR _short_compare$[ebp], 0
	je	$L1209
$L1210:
; Line 1481
	mov	eax, DWORD PTR _dt1$[ebp]
	push	eax
	mov	eax, DWORD PTR _dt0$[ebp]
	push	eax
	call	_commontype
	add	esp, 8
	mov	DWORD PTR _result_type$[ebp], eax
; Line 1494
$L1209:
	cmp	DWORD PTR _shorten$[ebp], 0
	je	$L1211
; Line 1497
	lea	eax, DWORD PTR _unsigned0$1212[ebp]
	push	eax
	mov	eax, DWORD PTR _op0$[ebp]
	push	eax
	call	_get_narrower
	add	esp, 8
	mov	DWORD PTR _arg0$1214[ebp], eax
; Line 1498
	lea	eax, DWORD PTR _unsigned1$1213[ebp]
	push	eax
	mov	eax, DWORD PTR _op1$[ebp]
	push	eax
	call	_get_narrower
	add	esp, 8
	mov	DWORD PTR _arg1$1215[ebp], eax
; Line 1500
	mov	eax, DWORD PTR _result_type$[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 12					; 0000000cH
	and	eax, 1
	mov	DWORD PTR _uns$1216[ebp], eax
; Line 1503
	mov	eax, DWORD PTR _result_type$[ebp]
	mov	DWORD PTR _final_type$[ebp], eax
; Line 1508
	mov	eax, DWORD PTR _arg0$1214[ebp]
	cmp	DWORD PTR _op0$[ebp], eax
	jne	$L1218
	mov	eax, DWORD PTR _op0$[ebp]
	mov	ecx, DWORD PTR _final_type$[ebp]
	cmp	DWORD PTR [eax+8], ecx
	je	$L1218
; Line 1509
	mov	eax, DWORD PTR _op0$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 12					; 0000000cH
	and	eax, 1
	mov	DWORD PTR _unsigned0$1212[ebp], eax
; Line 1510
$L1218:
	mov	eax, DWORD PTR _op1$[ebp]
	cmp	DWORD PTR _arg1$1215[ebp], eax
	jne	$L1219
	mov	eax, DWORD PTR _op1$[ebp]
	mov	ecx, DWORD PTR _final_type$[ebp]
	cmp	DWORD PTR [eax+8], ecx
	je	$L1219
; Line 1511
	mov	eax, DWORD PTR _op1$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 12					; 0000000cH
	and	eax, 1
	mov	DWORD PTR _unsigned1$1213[ebp], eax
; Line 1517
$L1219:
	cmp	DWORD PTR _shorten$[ebp], -1
	jne	$L1220
; Line 1518
	mov	eax, DWORD PTR _unsigned0$1212[ebp]
	mov	DWORD PTR _uns$1216[ebp], eax
; Line 1527
$L1220:
; Line 1532
	mov	eax, DWORD PTR _arg0$1214[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	al, BYTE PTR [eax+38]
	and	eax, 255				; 000000ffH
	mov	ecx, DWORD PTR _result_type$[ebp]
	mov	cl, BYTE PTR [ecx+38]
	and	ecx, 255				; 000000ffH
	cmp	eax, ecx
	jge	$L1221
	mov	eax, DWORD PTR _arg1$1215[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	al, BYTE PTR [eax+38]
	and	eax, 255				; 000000ffH
	mov	ecx, DWORD PTR _arg0$1214[ebp]
	mov	ecx, DWORD PTR [ecx+8]
	mov	cl, BYTE PTR [ecx+38]
	and	ecx, 255				; 000000ffH
	cmp	eax, ecx
	jne	$L1221
	mov	eax, DWORD PTR _unsigned1$1213[ebp]
	cmp	DWORD PTR _unsigned0$1212[ebp], eax
	jne	$L1221
	cmp	DWORD PTR _unsigned0$1212[ebp], 0
	jne	$L1222
	cmp	DWORD PTR _uns$1216[ebp], 0
	jne	$L1221
$L1222:
; Line 1535
	mov	eax, DWORD PTR _arg1$1215[ebp]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	mov	eax, DWORD PTR _arg0$1214[ebp]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	call	_commontype
	add	esp, 8
	push	eax
	mov	eax, DWORD PTR _unsigned0$1212[ebp]
	push	eax
	call	_signed_or_unsigned_type
	add	esp, 8
	mov	DWORD PTR _result_type$[ebp], eax
; Line 1536
	jmp	$L1223
$L1221:
; Line 1542
	mov	eax, DWORD PTR _arg0$1214[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 35					; 00000023H
	jne	$L1225
	cmp	DWORD PTR _unsigned1$1213[ebp], 0
	jne	$L1226
	cmp	DWORD PTR _uns$1216[ebp], 0
	jne	$L1225
$L1226:
	mov	eax, DWORD PTR _arg1$1215[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	al, BYTE PTR [eax+38]
	and	eax, 255				; 000000ffH
	mov	ecx, DWORD PTR _result_type$[ebp]
	mov	cl, BYTE PTR [ecx+38]
	and	ecx, 255				; 000000ffH
	cmp	eax, ecx
	jge	$L1225
	mov	eax, DWORD PTR _arg1$1215[ebp]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	mov	eax, DWORD PTR _unsigned1$1213[ebp]
	push	eax
	call	_signed_or_unsigned_type
	add	esp, 8
	mov	DWORD PTR _type$1217[ebp], eax
	mov	eax, DWORD PTR _type$1217[ebp]
	push	eax
	mov	eax, DWORD PTR _arg0$1214[ebp]
	push	eax
	call	_int_fits_type_p
	add	esp, 8
	mov	DWORD PTR -120+[ebp], eax
	cmp	DWORD PTR -120+[ebp], 0
	je	$L1225
; Line 1543
	mov	eax, DWORD PTR _type$1217[ebp]
	mov	DWORD PTR _result_type$[ebp], eax
; Line 1544
	jmp	$L1227
$L1225:
; Line 1550
	mov	eax, DWORD PTR _arg1$1215[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 35					; 00000023H
	jne	$L1228
	cmp	DWORD PTR _unsigned0$1212[ebp], 0
	jne	$L1229
	cmp	DWORD PTR _uns$1216[ebp], 0
	jne	$L1228
$L1229:
	mov	eax, DWORD PTR _arg0$1214[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	al, BYTE PTR [eax+38]
	and	eax, 255				; 000000ffH
	mov	ecx, DWORD PTR _result_type$[ebp]
	mov	cl, BYTE PTR [ecx+38]
	and	ecx, 255				; 000000ffH
	cmp	eax, ecx
	jge	$L1228
	mov	eax, DWORD PTR _arg0$1214[ebp]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	mov	eax, DWORD PTR _unsigned0$1212[ebp]
	push	eax
	call	_signed_or_unsigned_type
	add	esp, 8
	mov	DWORD PTR _type$1217[ebp], eax
	mov	eax, DWORD PTR _type$1217[ebp]
	push	eax
	mov	eax, DWORD PTR _arg1$1215[ebp]
	push	eax
	call	_int_fits_type_p
	add	esp, 8
	mov	DWORD PTR -124+[ebp], eax
	cmp	DWORD PTR -124+[ebp], 0
	je	$L1228
; Line 1551
	mov	eax, DWORD PTR _type$1217[ebp]
	mov	DWORD PTR _result_type$[ebp], eax
; Line 1552
$L1228:
$L1227:
$L1223:
; Line 1556
$L1211:
	cmp	DWORD PTR _short_shift$[ebp], 0
	je	$L1230
; Line 1559
	lea	eax, DWORD PTR _unsigned_arg$1231[ebp]
	push	eax
	mov	eax, DWORD PTR _op0$[ebp]
	push	eax
	call	_get_narrower
	add	esp, 8
	mov	DWORD PTR _arg0$1232[ebp], eax
; Line 1561
	mov	eax, DWORD PTR _result_type$[ebp]
	mov	DWORD PTR _final_type$[ebp], eax
; Line 1563
	mov	eax, DWORD PTR _arg0$1232[ebp]
	cmp	DWORD PTR _op0$[ebp], eax
	jne	$L1233
	mov	eax, DWORD PTR _op0$[ebp]
	mov	ecx, DWORD PTR _final_type$[ebp]
	cmp	DWORD PTR [eax+8], ecx
	jne	$L1233
; Line 1564
	mov	eax, DWORD PTR _op0$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 12					; 0000000cH
	and	eax, 1
	mov	DWORD PTR _unsigned_arg$1231[ebp], eax
; Line 1566
$L1233:
; Line 1576
	mov	eax, DWORD PTR _arg0$1232[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	al, BYTE PTR [eax+38]
	and	eax, 255				; 000000ffH
	mov	ecx, DWORD PTR _result_type$[ebp]
	mov	cl, BYTE PTR [ecx+38]
	and	ecx, 255				; 000000ffH
	cmp	eax, ecx
	jge	$L1234
	mov	eax, DWORD PTR _final_type$[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 12					; 0000000cH
	test	al, 1
	je	$L1235
	cmp	DWORD PTR _unsigned_arg$1231[ebp], 0
	jne	$L1235
	mov	eax, DWORD PTR _arg0$1232[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	al, BYTE PTR [eax+38]
	and	eax, 255				; 000000ffH
	add	eax, eax
	mov	ecx, DWORD PTR _result_type$[ebp]
	mov	cl, BYTE PTR [ecx+38]
	and	ecx, 255				; 000000ffH
	cmp	eax, ecx
	jg	$L1234
$L1235:
; Line 1581
	mov	eax, DWORD PTR _arg0$1232[ebp]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	mov	eax, DWORD PTR _unsigned_arg$1231[ebp]
	push	eax
	call	_signed_or_unsigned_type
	add	esp, 8
	mov	DWORD PTR _result_type$[ebp], eax
; Line 1583
	mov	eax, DWORD PTR _op0$[ebp]
	mov	ecx, DWORD PTR _result_type$[ebp]
	cmp	DWORD PTR [eax+8], ecx
	je	$L1236
; Line 1584
	mov	eax, DWORD PTR _op0$[ebp]
	push	eax
	mov	eax, DWORD PTR _result_type$[ebp]
	push	eax
	call	_convert
	add	esp, 8
	mov	DWORD PTR _op0$[ebp], eax
; Line 1585
$L1236:
	mov	DWORD PTR _converted$[ebp], 1
; Line 1587
$L1234:
; Line 1592
$L1230:
	cmp	DWORD PTR _short_compare$[ebp], 0
	je	$L1237
; Line 1598
	mov	eax, DWORD PTR _op0$[ebp]
	mov	DWORD PTR _xop0$1238[ebp], eax
	mov	eax, DWORD PTR _op1$[ebp]
	mov	DWORD PTR _xop1$1239[ebp], eax
	mov	eax, DWORD PTR _result_type$[ebp]
	mov	DWORD PTR _xresult_type$1240[ebp], eax
; Line 1599
	mov	eax, DWORD PTR _resultcode$[ebp]
	mov	DWORD PTR _xresultcode$1241[ebp], eax
; Line 1601
	lea	eax, DWORD PTR _xresultcode$1241[ebp]
	push	eax
	lea	eax, DWORD PTR _xresult_type$1240[ebp]
	push	eax
	lea	eax, DWORD PTR _xop1$1239[ebp]
	push	eax
	lea	eax, DWORD PTR _xop0$1238[ebp]
	push	eax
	call	_shorten_compare
	add	esp, 16					; 00000010H
	mov	DWORD PTR _val$1242[ebp], eax
; Line 1602
	cmp	DWORD PTR _val$1242[ebp], 0
	je	$L1243
; Line 1603
	mov	eax, DWORD PTR _val$1242[ebp]
	jmp	$L1078
; Line 1604
$L1243:
	mov	eax, DWORD PTR _xop0$1238[ebp]
	mov	DWORD PTR _op0$[ebp], eax
	mov	eax, DWORD PTR _xop1$1239[ebp]
	mov	DWORD PTR _op1$[ebp], eax
	mov	eax, DWORD PTR _xresult_type$1240[ebp]
	mov	DWORD PTR _result_type$[ebp], eax
; Line 1605
	mov	eax, DWORD PTR _xresultcode$1241[ebp]
	mov	DWORD PTR _resultcode$[ebp], eax
; Line 1607
$L1237:
; Line 1615
$L1206:
	cmp	DWORD PTR _result_type$[ebp], 0
	jne	$L1244
; Line 1617
	mov	eax, DWORD PTR _error_code$[ebp]
	push	eax
	call	_binary_op_error
	add	esp, 4
; Line 1618
	mov	eax, DWORD PTR _error_mark_node
	jmp	$L1078
; Line 1621
$L1244:
	cmp	DWORD PTR _converted$[ebp], 0
	jne	$L1245
; Line 1623
	mov	eax, DWORD PTR _op0$[ebp]
	mov	ecx, DWORD PTR _result_type$[ebp]
	cmp	DWORD PTR [eax+8], ecx
	je	$L1246
; Line 1624
	mov	eax, DWORD PTR _op0$[ebp]
	push	eax
	mov	eax, DWORD PTR _result_type$[ebp]
	push	eax
	call	_convert
	add	esp, 8
	mov	DWORD PTR _op0$[ebp], eax
; Line 1625
$L1246:
	mov	eax, DWORD PTR _op1$[ebp]
	mov	ecx, DWORD PTR _result_type$[ebp]
	cmp	DWORD PTR [eax+8], ecx
	je	$L1247
; Line 1626
	mov	eax, DWORD PTR _op1$[ebp]
	push	eax
	mov	eax, DWORD PTR _result_type$[ebp]
	push	eax
	call	_convert
	add	esp, 8
	mov	DWORD PTR _op1$[ebp], eax
; Line 1627
$L1247:
; Line 1629
$L1245:
; Line 1630
	mov	eax, DWORD PTR _op1$[ebp]
	push	eax
	mov	eax, DWORD PTR _op0$[ebp]
	push	eax
	mov	eax, DWORD PTR _result_type$[ebp]
	push	eax
	mov	eax, DWORD PTR _resultcode$[ebp]
	push	eax
	call	_build
	add	esp, 16					; 00000010H
	mov	DWORD PTR _result$1248[ebp], eax
; Line 1633
	mov	eax, DWORD PTR _result$1248[ebp]
	push	eax
	call	_fold
	add	esp, 4
	mov	DWORD PTR _folded$1249[ebp], eax
; Line 1634
	mov	eax, DWORD PTR _result$1248[ebp]
	cmp	DWORD PTR _folded$1249[ebp], eax
	jne	$L1250
; Line 1635
	mov	eax, DWORD PTR _op0$[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 6
	mov	ecx, DWORD PTR _op1$[ebp]
	mov	ecx, DWORD PTR [ecx+16]
	shr	ecx, 6
	and	eax, ecx
	and	eax, 1
	shl	eax, 6
	mov	ecx, DWORD PTR _folded$1249[ebp]
	mov	ecx, DWORD PTR [ecx+16]
	and	ecx, -65				; ffffffbfH
	or	eax, ecx
	mov	ecx, DWORD PTR _folded$1249[ebp]
	mov	DWORD PTR [ecx+16], eax
; Line 1636
$L1250:
	cmp	DWORD PTR _final_type$[ebp], 0
	je	$L1251
; Line 1637
	mov	eax, DWORD PTR _folded$1249[ebp]
	push	eax
	mov	eax, DWORD PTR _final_type$[ebp]
	push	eax
	call	_convert
	add	esp, 8
	jmp	$L1078
; Line 1638
$L1251:
	mov	eax, DWORD PTR _folded$1249[ebp]
	jmp	$L1078
; Line 1640
$L1078:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_build_binary_op_nodefault ENDP
_TEXT	ENDS
EXTRN	_integer_one_node:DWORD
_DATA	SEGMENT
	ORG $+1
$SG1263	DB	'pointer of type `void *'' used in arithmetic', 00H
$SG1268	DB	'pointer to a function used in arithmetic', 00H
_DATA	ENDS
_TEXT	SEGMENT
_resultcode$ = 8
_ptrop$ = 12
_intop$ = 16
_size_exp$ = -12
_result$ = -16
_folded$ = -8
_result_type$ = -4
_subcode$1272 = -20
_pointer_int_sum PROC NEAR
; Line 1649
	push	ebp
	mov	ebp, esp
	sub	esp, 20					; 00000014H
	push	ebx
	push	esi
	push	edi
; Line 1657
	mov	eax, DWORD PTR _ptrop$[ebp]
	push	eax
	call	_datatype
	add	esp, 4
	mov	DWORD PTR _result_type$[ebp], eax
; Line 1659
	mov	eax, DWORD PTR _result_type$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 4
	jne	$L1260
; Line 1661
	cmp	DWORD PTR _pedantic, 0
	jne	$L1262
	cmp	DWORD PTR _warn_pointer_arith, 0
	je	$L1261
$L1262:
; Line 1662
	push	OFFSET $SG1263
	call	_warning
	add	esp, 4
; Line 1663
$L1261:
	mov	eax, DWORD PTR _integer_one_node
	mov	DWORD PTR _size_exp$[ebp], eax
; Line 1665
	jmp	$L1264
$L1260:
	mov	eax, DWORD PTR _result_type$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 21					; 00000015H
	jne	$L1265
; Line 1667
	cmp	DWORD PTR _pedantic, 0
	jne	$L1267
	cmp	DWORD PTR _warn_pointer_arith, 0
	je	$L1266
$L1267:
; Line 1668
	push	OFFSET $SG1268
	call	_warning
	add	esp, 4
; Line 1669
$L1266:
	mov	eax, DWORD PTR _integer_one_node
	mov	DWORD PTR _size_exp$[ebp], eax
; Line 1671
	jmp	$L1269
$L1265:
; Line 1672
	mov	eax, DWORD PTR _result_type$[ebp]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	call	_c_sizeof
	add	esp, 4
	mov	DWORD PTR _size_exp$[ebp], eax
$L1269:
$L1264:
; Line 1682
	mov	eax, DWORD PTR _intop$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 64					; 00000040H
	je	$L1271
	mov	eax, DWORD PTR _intop$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 65					; 00000041H
	jne	$L1270
$L1271:
	mov	eax, DWORD PTR _intop$[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 6
	test	al, 1
	jne	$L1270
	mov	eax, DWORD PTR _intop$[ebp]
	mov	eax, DWORD PTR [eax+28]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 6
	test	al, 1
	je	$L1270
	mov	eax, DWORD PTR _size_exp$[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 6
	test	al, 1
	je	$L1270
; Line 1684
	mov	eax, DWORD PTR _resultcode$[ebp]
	mov	DWORD PTR _subcode$1272[ebp], eax
; Line 1685
	mov	eax, DWORD PTR _intop$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 65					; 00000041H
	jne	$L1273
; Line 1686
	mov	eax, DWORD PTR _subcode$1272[ebp]
	sub	eax, 64					; 00000040H
	cmp	eax, 1
	sbb	eax, eax
	and	eax, 1
	add	eax, 64					; 00000040H
	mov	DWORD PTR _subcode$1272[ebp], eax
; Line 1687
$L1273:
	mov	eax, DWORD PTR _intop$[ebp]
	mov	eax, DWORD PTR [eax+28]
	push	eax
	mov	eax, DWORD PTR _ptrop$[ebp]
	push	eax
	mov	eax, DWORD PTR _subcode$1272[ebp]
	push	eax
	call	_build_binary_op
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _ptrop$[ebp], eax
; Line 1688
	mov	eax, DWORD PTR _intop$[ebp]
	mov	eax, DWORD PTR [eax+24]
	mov	DWORD PTR _intop$[ebp], eax
; Line 1694
$L1270:
	mov	eax, DWORD PTR _intop$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	al, BYTE PTR [eax+38]
	and	eax, 255				; 000000ffH
	cmp	eax, 32					; 00000020H
	je	$L1274
; Line 1695
	mov	eax, DWORD PTR _intop$[ebp]
	push	eax
	push	0
	push	32					; 00000020H
	call	_type_for_size
	add	esp, 8
	push	eax
	call	_convert
	add	esp, 8
	mov	DWORD PTR _intop$[ebp], eax
; Line 1700
$L1274:
	mov	eax, DWORD PTR _size_exp$[ebp]
	push	eax
	mov	eax, DWORD PTR _intop$[ebp]
	push	eax
	push	66					; 00000042H
	call	_build_binary_op
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _intop$[ebp], eax
; Line 1704
	mov	eax, DWORD PTR _intop$[ebp]
	push	eax
	mov	eax, DWORD PTR _ptrop$[ebp]
	push	eax
	mov	eax, DWORD PTR _result_type$[ebp]
	push	eax
	mov	eax, DWORD PTR _resultcode$[ebp]
	push	eax
	call	_build
	add	esp, 16					; 00000010H
	mov	DWORD PTR _result$[ebp], eax
; Line 1706
	mov	eax, DWORD PTR _result$[ebp]
	push	eax
	call	_fold
	add	esp, 4
	mov	DWORD PTR _folded$[ebp], eax
; Line 1707
	mov	eax, DWORD PTR _result$[ebp]
	cmp	DWORD PTR _folded$[ebp], eax
	jne	$L1275
; Line 1708
	mov	eax, DWORD PTR _intop$[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 6
	mov	ecx, DWORD PTR _ptrop$[ebp]
	mov	ecx, DWORD PTR [ecx+16]
	shr	ecx, 6
	and	eax, ecx
	and	eax, 1
	shl	eax, 6
	mov	ecx, DWORD PTR _folded$[ebp]
	mov	ecx, DWORD PTR [ecx+16]
	and	ecx, -65				; ffffffbfH
	or	eax, ecx
	mov	ecx, DWORD PTR _folded$[ebp]
	mov	DWORD PTR [ecx+16], eax
; Line 1709
$L1275:
	mov	eax, DWORD PTR _folded$[ebp]
	jmp	$L1255
; Line 1710
$L1255:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_pointer_int_sum ENDP
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+3
$SG1286	DB	'pointer of type `void *'' used in subtraction', 00H
	ORG $+3
$SG1288	DB	'pointer to a function used in subtraction', 00H
_DATA	ENDS
_TEXT	SEGMENT
_result$ = -16
_folded$ = -8
_restype$ = -12
_op0$ = 8
_op1$ = 12
_dt0$ = -20
_pointer_diff PROC NEAR
; Line 1718
	push	ebp
	mov	ebp, esp
	sub	esp, 20					; 00000014H
	push	ebx
	push	esi
	push	edi
; Line 1719
	mov	eax, DWORD PTR _op0$[ebp]
	push	eax
	call	_datatype
	add	esp, 4
	mov	DWORD PTR _dt0$[ebp], eax
; Line 1722
	push	0
	push	32					; 00000020H
	call	_type_for_size
	add	esp, 8
	mov	DWORD PTR _restype$[ebp], eax
; Line 1724
	cmp	DWORD PTR _pedantic, 0
	je	$L1284
; Line 1726
	mov	eax, DWORD PTR _dt0$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 4
	jne	$L1285
; Line 1727
	push	OFFSET $SG1286
	call	_warning
	add	esp, 4
; Line 1728
$L1285:
	mov	eax, DWORD PTR _dt0$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 21					; 00000015H
	jne	$L1287
; Line 1729
	push	OFFSET $SG1288
	call	_warning
	add	esp, 4
; Line 1730
$L1287:
; Line 1735
$L1284:
; Line 1736
	mov	eax, DWORD PTR _op1$[ebp]
	push	eax
	mov	eax, DWORD PTR _restype$[ebp]
	push	eax
	call	_convert
	add	esp, 8
	push	eax
	mov	eax, DWORD PTR _op0$[ebp]
	push	eax
	mov	eax, DWORD PTR _restype$[ebp]
	push	eax
	call	_convert
	add	esp, 8
	push	eax
	push	65					; 00000041H
	call	_build_binary_op
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _op0$[ebp], eax
; Line 1737
	mov	eax, DWORD PTR _dt0$[ebp]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	call	_c_sizeof_nowarn
	add	esp, 4
	mov	DWORD PTR _op1$[ebp], eax
; Line 1741
	mov	eax, DWORD PTR _op1$[ebp]
	push	eax
	mov	eax, DWORD PTR _op0$[ebp]
	push	eax
	mov	eax, DWORD PTR _restype$[ebp]
	push	eax
	push	76					; 0000004cH
	call	_build
	add	esp, 16					; 00000010H
	mov	DWORD PTR _result$[ebp], eax
; Line 1743
	mov	eax, DWORD PTR _result$[ebp]
	push	eax
	call	_fold
	add	esp, 4
	mov	DWORD PTR _folded$[ebp], eax
; Line 1744
	mov	eax, DWORD PTR _folded$[ebp]
	cmp	DWORD PTR _result$[ebp], eax
	jne	$L1289
; Line 1745
	mov	eax, DWORD PTR _op1$[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 6
	mov	ecx, DWORD PTR _op0$[ebp]
	mov	ecx, DWORD PTR [ecx+16]
	shr	ecx, 6
	and	eax, ecx
	and	eax, 1
	shl	eax, 6
	mov	ecx, DWORD PTR _folded$[ebp]
	mov	ecx, DWORD PTR [ecx+16]
	and	ecx, -65				; ffffffbfH
	or	eax, ecx
	mov	ecx, DWORD PTR _folded$[ebp]
	mov	DWORD PTR [ecx+16], eax
; Line 1746
$L1289:
	mov	eax, DWORD PTR _folded$[ebp]
	jmp	$L1278
; Line 1747
$L1278:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_pointer_diff ENDP
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+2
$SG1298	DB	'invalid truth-value expression', 00H
	ORG $+1
$SG1300	DB	'+', 00H
	ORG $+2
$SG1302	DB	'-', 00H
	ORG $+2
$SG1304	DB	'*', 00H
	ORG $+2
$SG1306	DB	'max', 00H
$SG1308	DB	'min', 00H
$SG1310	DB	'==', 00H
	ORG $+1
$SG1312	DB	'!=', 00H
	ORG $+1
$SG1314	DB	'<=', 00H
	ORG $+1
$SG1316	DB	'>=', 00H
	ORG $+1
$SG1318	DB	'<', 00H
	ORG $+2
$SG1320	DB	'>', 00H
	ORG $+2
$SG1322	DB	'<<', 00H
	ORG $+1
$SG1324	DB	'>>', 00H
	ORG $+1
$SG1326	DB	'%', 00H
	ORG $+2
$SG1328	DB	'/', 00H
	ORG $+2
$SG1330	DB	'&', 00H
	ORG $+2
$SG1332	DB	'|', 00H
	ORG $+2
$SG1334	DB	'&&', 00H
	ORG $+1
$SG1336	DB	'||', 00H
	ORG $+1
$SG1338	DB	'^', 00H
	ORG $+2
$SG1339	DB	'invalid operands to binary %s', 00H
_DATA	ENDS
_TEXT	SEGMENT
_code$ = 8
_opname$ = -4
_binary_op_error PROC NEAR
; Line 1755
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	push	ebx
	push	esi
	push	edi
; Line 1757
	mov	eax, DWORD PTR _code$[ebp]
	mov	DWORD PTR -8+[ebp], eax
	jmp	$L1293
; Line 1759
$L1297:
; Line 1760
	push	OFFSET $SG1298
	call	_error
	add	esp, 4
; Line 1761
	jmp	$L1291
; Line 1763
$L1299:
; Line 1764
	mov	DWORD PTR _opname$[ebp], OFFSET $SG1300
	jmp	$L1294
; Line 1765
$L1301:
; Line 1766
	mov	DWORD PTR _opname$[ebp], OFFSET $SG1302
	jmp	$L1294
; Line 1767
$L1303:
; Line 1768
	mov	DWORD PTR _opname$[ebp], OFFSET $SG1304
	jmp	$L1294
; Line 1769
$L1305:
; Line 1770
	mov	DWORD PTR _opname$[ebp], OFFSET $SG1306
	jmp	$L1294
; Line 1771
$L1307:
; Line 1772
	mov	DWORD PTR _opname$[ebp], OFFSET $SG1308
	jmp	$L1294
; Line 1773
$L1309:
; Line 1774
	mov	DWORD PTR _opname$[ebp], OFFSET $SG1310
	jmp	$L1294
; Line 1775
$L1311:
; Line 1776
	mov	DWORD PTR _opname$[ebp], OFFSET $SG1312
	jmp	$L1294
; Line 1777
$L1313:
; Line 1778
	mov	DWORD PTR _opname$[ebp], OFFSET $SG1314
	jmp	$L1294
; Line 1779
$L1315:
; Line 1780
	mov	DWORD PTR _opname$[ebp], OFFSET $SG1316
	jmp	$L1294
; Line 1781
$L1317:
; Line 1782
	mov	DWORD PTR _opname$[ebp], OFFSET $SG1318
	jmp	$L1294
; Line 1783
$L1319:
; Line 1784
	mov	DWORD PTR _opname$[ebp], OFFSET $SG1320
	jmp	$L1294
; Line 1785
$L1321:
; Line 1786
	mov	DWORD PTR _opname$[ebp], OFFSET $SG1322
	jmp	$L1294
; Line 1787
$L1323:
; Line 1788
	mov	DWORD PTR _opname$[ebp], OFFSET $SG1324
	jmp	$L1294
; Line 1789
$L1325:
; Line 1790
	mov	DWORD PTR _opname$[ebp], OFFSET $SG1326
	jmp	$L1294
; Line 1791
$L1327:
; Line 1792
	mov	DWORD PTR _opname$[ebp], OFFSET $SG1328
	jmp	$L1294
; Line 1793
$L1329:
; Line 1794
	mov	DWORD PTR _opname$[ebp], OFFSET $SG1330
	jmp	$L1294
; Line 1795
$L1331:
; Line 1796
	mov	DWORD PTR _opname$[ebp], OFFSET $SG1332
	jmp	$L1294
; Line 1797
$L1333:
; Line 1798
	mov	DWORD PTR _opname$[ebp], OFFSET $SG1334
	jmp	$L1294
; Line 1799
$L1335:
; Line 1800
	mov	DWORD PTR _opname$[ebp], OFFSET $SG1336
	jmp	$L1294
; Line 1801
$L1337:
; Line 1802
	mov	DWORD PTR _opname$[ebp], OFFSET $SG1338
	jmp	$L1294
; Line 1803
	jmp	$L1294
$L1293:
	sub	DWORD PTR -8+[ebp], 64			; 00000040H
	cmp	DWORD PTR -8+[ebp], 49			; 00000031H
	ja	$L1294
	shl	DWORD PTR -8+[ebp], 2
	mov	eax, DWORD PTR -8+[ebp]
	jmp	DWORD PTR $L2067[eax]
$L2067:
	DD	OFFSET $L1299
	DD	OFFSET $L1301
	DD	OFFSET $L1303
	DD	OFFSET $L1327
	DD	OFFSET $L1294
	DD	OFFSET $L1294
	DD	OFFSET $L1294
	DD	OFFSET $L1325
	DD	OFFSET $L1294
	DD	OFFSET $L1294
	DD	OFFSET $L1294
	DD	OFFSET $L1294
	DD	OFFSET $L1294
	DD	OFFSET $L1294
	DD	OFFSET $L1294
	DD	OFFSET $L1294
	DD	OFFSET $L1294
	DD	OFFSET $L1294
	DD	OFFSET $L1294
	DD	OFFSET $L1294
	DD	OFFSET $L1307
	DD	OFFSET $L1305
	DD	OFFSET $L1294
	DD	OFFSET $L1294
	DD	OFFSET $L1321
	DD	OFFSET $L1323
	DD	OFFSET $L1294
	DD	OFFSET $L1294
	DD	OFFSET $L1331
	DD	OFFSET $L1337
	DD	OFFSET $L1329
	DD	OFFSET $L1294
	DD	OFFSET $L1294
	DD	OFFSET $L1333
	DD	OFFSET $L1335
	DD	OFFSET $L1294
	DD	OFFSET $L1294
	DD	OFFSET $L1294
	DD	OFFSET $L1317
	DD	OFFSET $L1313
	DD	OFFSET $L1319
	DD	OFFSET $L1315
	DD	OFFSET $L1309
	DD	OFFSET $L1311
	DD	OFFSET $L1294
	DD	OFFSET $L1294
	DD	OFFSET $L1294
	DD	OFFSET $L1294
	DD	OFFSET $L1294
	DD	OFFSET $L1297
$L1294:
; Line 1804
	mov	eax, DWORD PTR _opname$[ebp]
	push	eax
	push	OFFSET $SG1339
	call	_error
	add	esp, 8
; Line 1805
$L1291:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_binary_op_error ENDP
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+2
$SG1415	DB	'comparison is always 0 due to limited range of data type'
	DB	00H
	ORG $+3
$SG1417	DB	'comparison is always 1 due to limited range of data type'
	DB	00H
_DATA	ENDS
_TEXT	SEGMENT
_type$ = -16
_op0$ = -20
_op1$ = -12
_unsignedp0$ = -36
_unsignedp1$ = -32
_real1$ = -28
_real2$ = -24
_primop0$ = -8
_primop1$ = -4
_code$ = -40
_tem$1358 = -48
_temi$1359 = -44
_min_gt$1369 = -56
_max_gt$1370 = -80
_min_lt$1371 = -72
_max_lt$1372 = -68
_maxval$1373 = -52
_minval$1374 = -76
_unsignedp$1375 = -64
_val$1376 = -60
_op0_ptr$ = 8
_op1_ptr$ = 12
_restype_ptr$ = 16
_rescode_ptr$ = 20
_shorten_compare PROC NEAR
; Line 1824
	push	ebp
	mov	ebp, esp
	sub	esp, 92					; 0000005cH
	push	ebx
	push	esi
	push	edi
; Line 1826
	mov	eax, DWORD PTR _op0_ptr$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _op0$[ebp], eax
; Line 1827
	mov	eax, DWORD PTR _op1_ptr$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _op1$[ebp], eax
; Line 1831
	mov	eax, DWORD PTR _rescode_ptr$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _code$[ebp], eax
; Line 1836
	lea	eax, DWORD PTR _unsignedp0$[ebp]
	push	eax
	mov	eax, DWORD PTR _op0$[ebp]
	push	eax
	call	_get_narrower
	add	esp, 8
	mov	DWORD PTR _primop0$[ebp], eax
; Line 1837
	lea	eax, DWORD PTR _unsignedp1$[ebp]
	push	eax
	mov	eax, DWORD PTR _op1$[ebp]
	push	eax
	call	_get_narrower
	add	esp, 8
	mov	DWORD PTR _primop1$[ebp], eax
; Line 1842
	mov	eax, DWORD PTR _primop0$[ebp]
	cmp	DWORD PTR _op0$[ebp], eax
	jne	$L1355
	mov	eax, DWORD PTR _op0$[ebp]
	mov	ecx, DWORD PTR _restype_ptr$[ebp]
	mov	ecx, DWORD PTR [ecx]
	cmp	DWORD PTR [eax+8], ecx
	je	$L1355
; Line 1843
	mov	eax, DWORD PTR _op0$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 12					; 0000000cH
	and	eax, 1
	mov	DWORD PTR _unsignedp0$[ebp], eax
; Line 1844
$L1355:
	mov	eax, DWORD PTR _primop1$[ebp]
	cmp	DWORD PTR _op1$[ebp], eax
	jne	$L1356
	mov	eax, DWORD PTR _op1$[ebp]
	mov	ecx, DWORD PTR _restype_ptr$[ebp]
	mov	ecx, DWORD PTR [ecx]
	cmp	DWORD PTR [eax+8], ecx
	je	$L1356
; Line 1845
	mov	eax, DWORD PTR _op1$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 12					; 0000000cH
	and	eax, 1
	mov	DWORD PTR _unsignedp1$[ebp], eax
; Line 1848
$L1356:
	mov	eax, DWORD PTR _primop0$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	sub	eax, 6
	cmp	eax, 1
	sbb	eax, eax
	neg	eax
	mov	DWORD PTR _real1$[ebp], eax
; Line 1849
	mov	eax, DWORD PTR _primop1$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	sub	eax, 6
	cmp	eax, 1
	sbb	eax, eax
	neg	eax
	mov	DWORD PTR _real2$[ebp], eax
; Line 1854
	mov	eax, DWORD PTR _primop0$[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 6
	test	al, 1
	je	$L1357
; Line 1856
	mov	eax, DWORD PTR _primop0$[ebp]
	mov	DWORD PTR _tem$1358[ebp], eax
; Line 1857
	mov	eax, DWORD PTR _unsignedp0$[ebp]
	mov	DWORD PTR _temi$1359[ebp], eax
; Line 1858
	mov	eax, DWORD PTR _primop1$[ebp]
	mov	DWORD PTR _primop0$[ebp], eax
; Line 1859
	mov	eax, DWORD PTR _tem$1358[ebp]
	mov	DWORD PTR _primop1$[ebp], eax
; Line 1860
	mov	eax, DWORD PTR _op0$[ebp]
	mov	DWORD PTR _tem$1358[ebp], eax
; Line 1861
	mov	eax, DWORD PTR _op1$[ebp]
	mov	DWORD PTR _op0$[ebp], eax
; Line 1862
	mov	eax, DWORD PTR _tem$1358[ebp]
	mov	DWORD PTR _op1$[ebp], eax
; Line 1863
	mov	eax, DWORD PTR _op0$[ebp]
	mov	ecx, DWORD PTR _op0_ptr$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 1864
	mov	eax, DWORD PTR _op1$[ebp]
	mov	ecx, DWORD PTR _op1_ptr$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 1865
	mov	eax, DWORD PTR _unsignedp1$[ebp]
	mov	DWORD PTR _unsignedp0$[ebp], eax
; Line 1866
	mov	eax, DWORD PTR _temi$1359[ebp]
	mov	DWORD PTR _unsignedp1$[ebp], eax
; Line 1867
	mov	eax, DWORD PTR _real1$[ebp]
	mov	DWORD PTR _temi$1359[ebp], eax
; Line 1868
	mov	eax, DWORD PTR _real2$[ebp]
	mov	DWORD PTR _real1$[ebp], eax
; Line 1869
	mov	eax, DWORD PTR _temi$1359[ebp]
	mov	DWORD PTR _real2$[ebp], eax
; Line 1871
	mov	eax, DWORD PTR _code$[ebp]
	mov	DWORD PTR -88+[ebp], eax
	jmp	$L1360
; Line 1873
$L1364:
; Line 1874
	mov	DWORD PTR _code$[ebp], 104		; 00000068H
; Line 1875
	jmp	$L1361
; Line 1876
$L1365:
; Line 1877
	mov	DWORD PTR _code$[ebp], 102		; 00000066H
; Line 1878
	jmp	$L1361
; Line 1879
$L1366:
; Line 1880
	mov	DWORD PTR _code$[ebp], 105		; 00000069H
; Line 1881
	jmp	$L1361
; Line 1882
$L1367:
; Line 1883
	mov	DWORD PTR _code$[ebp], 103		; 00000067H
; Line 1884
	jmp	$L1361
; Line 1885
	jmp	$L1361
$L1360:
	cmp	DWORD PTR -88+[ebp], 102		; 00000066H
	je	$L1364
	cmp	DWORD PTR -88+[ebp], 103		; 00000067H
	je	$L1366
	cmp	DWORD PTR -88+[ebp], 104		; 00000068H
	je	$L1365
	cmp	DWORD PTR -88+[ebp], 105		; 00000069H
	je	$L1367
	jmp	$L1361
$L1361:
; Line 1886
	mov	eax, DWORD PTR _code$[ebp]
	mov	ecx, DWORD PTR _rescode_ptr$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 1906
$L1357:
; Line 1908
	cmp	DWORD PTR _real1$[ebp], 0
	jne	$L1368
	cmp	DWORD PTR _real2$[ebp], 0
	jne	$L1368
	mov	eax, DWORD PTR _primop1$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 35					; 00000023H
	jne	$L1368
	mov	eax, DWORD PTR _primop0$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	al, BYTE PTR [eax+38]
	and	eax, 255				; 000000ffH
	mov	ecx, DWORD PTR _restype_ptr$[ebp]
	mov	ecx, DWORD PTR [ecx]
	mov	cl, BYTE PTR [ecx+38]
	and	ecx, 255				; 000000ffH
	cmp	eax, ecx
	jge	$L1368
; Line 1913
	mov	eax, DWORD PTR _restype_ptr$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 12					; 0000000cH
	and	eax, 1
	mov	DWORD PTR _unsignedp$1375[ebp], eax
; Line 1916
	mov	eax, DWORD PTR _primop0$[ebp]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	mov	eax, DWORD PTR _unsignedp0$[ebp]
	push	eax
	call	_signed_or_unsigned_type
	add	esp, 8
	mov	DWORD PTR _type$[ebp], eax
; Line 1918
	mov	eax, DWORD PTR _type$[ebp]
	mov	eax, DWORD PTR [eax+60]
	mov	DWORD PTR _maxval$1373[ebp], eax
; Line 1919
	mov	eax, DWORD PTR _type$[ebp]
	mov	eax, DWORD PTR [eax+24]
	mov	DWORD PTR _minval$1374[ebp], eax
; Line 1921
	cmp	DWORD PTR _unsignedp$1375[ebp], 0
	je	$L1377
	cmp	DWORD PTR _unsignedp0$[ebp], 0
	jne	$L1377
; Line 1922
	mov	eax, DWORD PTR _restype_ptr$[ebp]
	mov	eax, DWORD PTR [eax]
	push	eax
	call	_signed_type
	add	esp, 4
	mov	ecx, DWORD PTR _restype_ptr$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 1924
$L1377:
	mov	eax, DWORD PTR _primop1$[ebp]
	mov	ecx, DWORD PTR _restype_ptr$[ebp]
	mov	ecx, DWORD PTR [ecx]
	cmp	DWORD PTR [eax+8], ecx
	je	$L1378
; Line 1925
	mov	eax, DWORD PTR _primop1$[ebp]
	push	eax
	mov	eax, DWORD PTR _restype_ptr$[ebp]
	mov	eax, DWORD PTR [eax]
	push	eax
	call	_convert
	add	esp, 8
	mov	DWORD PTR _primop1$[ebp], eax
; Line 1926
$L1378:
	mov	eax, DWORD PTR _restype_ptr$[ebp]
	mov	ecx, DWORD PTR _type$[ebp]
	cmp	DWORD PTR [eax], ecx
	je	$L1379
; Line 1928
	mov	eax, DWORD PTR _minval$1374[ebp]
	push	eax
	mov	eax, DWORD PTR _restype_ptr$[ebp]
	mov	eax, DWORD PTR [eax]
	push	eax
	call	_convert
	add	esp, 8
	mov	DWORD PTR _minval$1374[ebp], eax
; Line 1929
	mov	eax, DWORD PTR _maxval$1373[ebp]
	push	eax
	mov	eax, DWORD PTR _restype_ptr$[ebp]
	mov	eax, DWORD PTR [eax]
	push	eax
	call	_convert
	add	esp, 8
	mov	DWORD PTR _maxval$1373[ebp], eax
; Line 1932
$L1379:
	cmp	DWORD PTR _unsignedp$1375[ebp], 0
	je	$L1380
	cmp	DWORD PTR _unsignedp0$[ebp], 0
	je	$L1380
; Line 1934
	mov	eax, DWORD PTR _minval$1374[ebp]
	mov	ecx, DWORD PTR _primop1$[ebp]
	mov	ecx, DWORD PTR [ecx+24]
	cmp	DWORD PTR [eax+24], ecx
	ja	$L2070
	mov	eax, DWORD PTR _minval$1374[ebp]
	mov	ecx, DWORD PTR _primop1$[ebp]
	mov	ecx, DWORD PTR [ecx+24]
	cmp	DWORD PTR [eax+24], ecx
	jne	$L2068
	mov	eax, DWORD PTR _minval$1374[ebp]
	mov	ecx, DWORD PTR _primop1$[ebp]
	mov	ecx, DWORD PTR [ecx+20]
	cmp	DWORD PTR [eax+20], ecx
	jbe	$L2068
$L2070:
	mov	DWORD PTR _min_gt$1369[ebp], 1
	jmp	$L2069
$L2068:
	mov	DWORD PTR _min_gt$1369[ebp], 0
$L2069:
; Line 1935
	mov	eax, DWORD PTR _primop1$[ebp]
	mov	ecx, DWORD PTR _maxval$1373[ebp]
	mov	ecx, DWORD PTR [ecx+24]
	cmp	DWORD PTR [eax+24], ecx
	jb	$L2073
	mov	eax, DWORD PTR _primop1$[ebp]
	mov	ecx, DWORD PTR _maxval$1373[ebp]
	mov	ecx, DWORD PTR [ecx+24]
	cmp	DWORD PTR [eax+24], ecx
	jne	$L2071
	mov	eax, DWORD PTR _maxval$1373[ebp]
	mov	ecx, DWORD PTR _primop1$[ebp]
	mov	ecx, DWORD PTR [ecx+20]
	cmp	DWORD PTR [eax+20], ecx
	jbe	$L2071
$L2073:
	mov	DWORD PTR _max_gt$1370[ebp], 1
	jmp	$L2072
$L2071:
	mov	DWORD PTR _max_gt$1370[ebp], 0
$L2072:
; Line 1936
	mov	eax, DWORD PTR _minval$1374[ebp]
	mov	ecx, DWORD PTR _primop1$[ebp]
	mov	ecx, DWORD PTR [ecx+24]
	cmp	DWORD PTR [eax+24], ecx
	jb	$L2076
	mov	eax, DWORD PTR _minval$1374[ebp]
	mov	ecx, DWORD PTR _primop1$[ebp]
	mov	ecx, DWORD PTR [ecx+24]
	cmp	DWORD PTR [eax+24], ecx
	jne	$L2074
	mov	eax, DWORD PTR _minval$1374[ebp]
	mov	ecx, DWORD PTR _primop1$[ebp]
	mov	ecx, DWORD PTR [ecx+20]
	cmp	DWORD PTR [eax+20], ecx
	jae	$L2074
$L2076:
	mov	DWORD PTR _min_lt$1371[ebp], 1
	jmp	$L2075
$L2074:
	mov	DWORD PTR _min_lt$1371[ebp], 0
$L2075:
; Line 1937
	mov	eax, DWORD PTR _primop1$[ebp]
	mov	ecx, DWORD PTR _maxval$1373[ebp]
	mov	ecx, DWORD PTR [ecx+24]
	cmp	DWORD PTR [eax+24], ecx
	ja	$L2079
	mov	eax, DWORD PTR _primop1$[ebp]
	mov	ecx, DWORD PTR _maxval$1373[ebp]
	mov	ecx, DWORD PTR [ecx+24]
	cmp	DWORD PTR [eax+24], ecx
	jne	$L2077
	mov	eax, DWORD PTR _maxval$1373[ebp]
	mov	ecx, DWORD PTR _primop1$[ebp]
	mov	ecx, DWORD PTR [ecx+20]
	cmp	DWORD PTR [eax+20], ecx
	jae	$L2077
$L2079:
	mov	DWORD PTR _max_lt$1372[ebp], 1
	jmp	$L2078
$L2077:
	mov	DWORD PTR _max_lt$1372[ebp], 0
$L2078:
; Line 1939
	jmp	$L1381
$L1380:
; Line 1941
	mov	eax, DWORD PTR _minval$1374[ebp]
	mov	ecx, DWORD PTR _primop1$[ebp]
	mov	ecx, DWORD PTR [ecx+24]
	cmp	DWORD PTR [eax+24], ecx
	jg	$L2082
	mov	eax, DWORD PTR _minval$1374[ebp]
	mov	ecx, DWORD PTR _primop1$[ebp]
	mov	ecx, DWORD PTR [ecx+24]
	cmp	DWORD PTR [eax+24], ecx
	jne	$L2080
	mov	eax, DWORD PTR _minval$1374[ebp]
	mov	ecx, DWORD PTR _primop1$[ebp]
	mov	ecx, DWORD PTR [ecx+20]
	cmp	DWORD PTR [eax+20], ecx
	jbe	$L2080
$L2082:
	mov	DWORD PTR _min_gt$1369[ebp], 1
	jmp	$L2081
$L2080:
	mov	DWORD PTR _min_gt$1369[ebp], 0
$L2081:
; Line 1942
	mov	eax, DWORD PTR _primop1$[ebp]
	mov	ecx, DWORD PTR _maxval$1373[ebp]
	mov	ecx, DWORD PTR [ecx+24]
	cmp	DWORD PTR [eax+24], ecx
	jl	$L2085
	mov	eax, DWORD PTR _primop1$[ebp]
	mov	ecx, DWORD PTR _maxval$1373[ebp]
	mov	ecx, DWORD PTR [ecx+24]
	cmp	DWORD PTR [eax+24], ecx
	jne	$L2083
	mov	eax, DWORD PTR _maxval$1373[ebp]
	mov	ecx, DWORD PTR _primop1$[ebp]
	mov	ecx, DWORD PTR [ecx+20]
	cmp	DWORD PTR [eax+20], ecx
	jbe	$L2083
$L2085:
	mov	DWORD PTR _max_gt$1370[ebp], 1
	jmp	$L2084
$L2083:
	mov	DWORD PTR _max_gt$1370[ebp], 0
$L2084:
; Line 1943
	mov	eax, DWORD PTR _minval$1374[ebp]
	mov	ecx, DWORD PTR _primop1$[ebp]
	mov	ecx, DWORD PTR [ecx+24]
	cmp	DWORD PTR [eax+24], ecx
	jl	$L2088
	mov	eax, DWORD PTR _minval$1374[ebp]
	mov	ecx, DWORD PTR _primop1$[ebp]
	mov	ecx, DWORD PTR [ecx+24]
	cmp	DWORD PTR [eax+24], ecx
	jne	$L2086
	mov	eax, DWORD PTR _minval$1374[ebp]
	mov	ecx, DWORD PTR _primop1$[ebp]
	mov	ecx, DWORD PTR [ecx+20]
	cmp	DWORD PTR [eax+20], ecx
	jae	$L2086
$L2088:
	mov	DWORD PTR _min_lt$1371[ebp], 1
	jmp	$L2087
$L2086:
	mov	DWORD PTR _min_lt$1371[ebp], 0
$L2087:
; Line 1944
	mov	eax, DWORD PTR _primop1$[ebp]
	mov	ecx, DWORD PTR _maxval$1373[ebp]
	mov	ecx, DWORD PTR [ecx+24]
	cmp	DWORD PTR [eax+24], ecx
	jg	$L2091
	mov	eax, DWORD PTR _primop1$[ebp]
	mov	ecx, DWORD PTR _maxval$1373[ebp]
	mov	ecx, DWORD PTR [ecx+24]
	cmp	DWORD PTR [eax+24], ecx
	jne	$L2089
	mov	eax, DWORD PTR _maxval$1373[ebp]
	mov	ecx, DWORD PTR _primop1$[ebp]
	mov	ecx, DWORD PTR [ecx+20]
	cmp	DWORD PTR [eax+20], ecx
	jae	$L2089
$L2091:
	mov	DWORD PTR _max_lt$1372[ebp], 1
	jmp	$L2090
$L2089:
	mov	DWORD PTR _max_lt$1372[ebp], 0
$L2090:
; Line 1945
$L1381:
; Line 1947
	mov	DWORD PTR _val$1376[ebp], 0
; Line 1949
	cmp	DWORD PTR _code$[ebp], 107		; 0000006bH
	jne	$L1382
; Line 1951
	cmp	DWORD PTR _max_lt$1372[ebp], 0
	jne	$L1384
	cmp	DWORD PTR _min_gt$1369[ebp], 0
	je	$L1383
$L1384:
; Line 1952
	mov	eax, DWORD PTR _integer_one_node
	mov	DWORD PTR _val$1376[ebp], eax
; Line 1953
$L1383:
; Line 1954
	jmp	$L1385
$L1382:
	cmp	DWORD PTR _code$[ebp], 106		; 0000006aH
	jne	$L1386
; Line 1956
	cmp	DWORD PTR _max_lt$1372[ebp], 0
	jne	$L1388
	cmp	DWORD PTR _min_gt$1369[ebp], 0
	je	$L1387
$L1388:
; Line 1957
	mov	eax, DWORD PTR _integer_zero_node
	mov	DWORD PTR _val$1376[ebp], eax
; Line 1958
$L1387:
; Line 1959
	jmp	$L1389
$L1386:
	cmp	DWORD PTR _code$[ebp], 102		; 00000066H
	jne	$L1390
; Line 1961
	cmp	DWORD PTR _max_lt$1372[ebp], 0
	je	$L1391
; Line 1962
	mov	eax, DWORD PTR _integer_one_node
	mov	DWORD PTR _val$1376[ebp], eax
; Line 1963
$L1391:
	cmp	DWORD PTR _min_lt$1371[ebp], 0
	jne	$L1392
; Line 1964
	mov	eax, DWORD PTR _integer_zero_node
	mov	DWORD PTR _val$1376[ebp], eax
; Line 1965
$L1392:
; Line 1966
	jmp	$L1393
$L1390:
	cmp	DWORD PTR _code$[ebp], 104		; 00000068H
	jne	$L1394
; Line 1968
	cmp	DWORD PTR _min_gt$1369[ebp], 0
	je	$L1395
; Line 1969
	mov	eax, DWORD PTR _integer_one_node
	mov	DWORD PTR _val$1376[ebp], eax
; Line 1970
$L1395:
	cmp	DWORD PTR _max_gt$1370[ebp], 0
	jne	$L1396
; Line 1971
	mov	eax, DWORD PTR _integer_zero_node
	mov	DWORD PTR _val$1376[ebp], eax
; Line 1972
$L1396:
; Line 1973
	jmp	$L1397
$L1394:
	cmp	DWORD PTR _code$[ebp], 103		; 00000067H
	jne	$L1398
; Line 1975
	cmp	DWORD PTR _max_gt$1370[ebp], 0
	jne	$L1399
; Line 1976
	mov	eax, DWORD PTR _integer_one_node
	mov	DWORD PTR _val$1376[ebp], eax
; Line 1977
$L1399:
	cmp	DWORD PTR _min_gt$1369[ebp], 0
	je	$L1400
; Line 1978
	mov	eax, DWORD PTR _integer_zero_node
	mov	DWORD PTR _val$1376[ebp], eax
; Line 1979
$L1400:
; Line 1980
	jmp	$L1401
$L1398:
	cmp	DWORD PTR _code$[ebp], 105		; 00000069H
	jne	$L1402
; Line 1982
	cmp	DWORD PTR _min_lt$1371[ebp], 0
	jne	$L1403
; Line 1983
	mov	eax, DWORD PTR _integer_one_node
	mov	DWORD PTR _val$1376[ebp], eax
; Line 1984
$L1403:
	cmp	DWORD PTR _max_lt$1372[ebp], 0
	je	$L1404
; Line 1985
	mov	eax, DWORD PTR _integer_zero_node
	mov	DWORD PTR _val$1376[ebp], eax
; Line 1986
$L1404:
; Line 1999
$L1402:
$L1401:
$L1397:
$L1393:
$L1389:
$L1385:
	cmp	DWORD PTR _unsignedp$1375[ebp], 0
	je	$L1405
	cmp	DWORD PTR _unsignedp0$[ebp], 0
	jne	$L1405
; Line 2001
	cmp	DWORD PTR _val$1376[ebp], 0
	je	$L1406
; Line 2002
	mov	eax, DWORD PTR _code$[ebp]
	mov	DWORD PTR -92+[ebp], eax
	jmp	$L1407
; Line 2004
$L1411:
; Line 2006
	mov	eax, DWORD PTR _type$[ebp]
	mov	eax, DWORD PTR [eax+24]
	mov	DWORD PTR _primop1$[ebp], eax
; Line 2007
	mov	DWORD PTR _val$1376[ebp], 0
; Line 2008
	jmp	$L1408
; Line 2010
$L1412:
; Line 2012
	mov	eax, DWORD PTR _type$[ebp]
	mov	eax, DWORD PTR [eax+60]
	mov	DWORD PTR _primop1$[ebp], eax
; Line 2013
	mov	DWORD PTR _val$1376[ebp], 0
; Line 2014
	jmp	$L1408
; Line 2015
	jmp	$L1408
$L1407:
	cmp	DWORD PTR -92+[ebp], 102		; 00000066H
	je	$L1411
	cmp	DWORD PTR -92+[ebp], 103		; 00000067H
	jl	$L1408
	cmp	DWORD PTR -92+[ebp], 104		; 00000068H
	jle	$L1412
	cmp	DWORD PTR -92+[ebp], 105		; 00000069H
	je	$L1411
	jmp	$L1408
$L1408:
; Line 2016
$L1406:
	mov	eax, DWORD PTR _type$[ebp]
	push	eax
	call	_unsigned_type
	add	esp, 4
	mov	DWORD PTR _type$[ebp], eax
; Line 2019
$L1405:
	cmp	DWORD PTR _max_lt$1372[ebp], 0
	je	$L1413
	cmp	DWORD PTR _unsignedp0$[ebp], 0
	jne	$L1413
; Line 2023
	mov	eax, DWORD PTR _integer_zero_node
	cmp	DWORD PTR _val$1376[ebp], eax
	jne	$L1414
; Line 2024
	push	OFFSET $SG1415
	call	_warning
	add	esp, 4
; Line 2025
$L1414:
	mov	eax, DWORD PTR _integer_one_node
	cmp	DWORD PTR _val$1376[ebp], eax
	jne	$L1416
; Line 2026
	push	OFFSET $SG1417
	call	_warning
	add	esp, 4
; Line 2027
$L1416:
; Line 2029
$L1413:
	cmp	DWORD PTR _val$1376[ebp], 0
	je	$L1418
; Line 2032
	mov	eax, DWORD PTR _primop0$[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 3
	test	al, 1
	je	$L1419
; Line 2033
	mov	eax, DWORD PTR _val$1376[ebp]
	push	eax
	mov	eax, DWORD PTR _primop0$[ebp]
	push	eax
	mov	eax, DWORD PTR _val$1376[ebp]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	push	53					; 00000035H
	call	_build
	add	esp, 16					; 00000010H
	jmp	$L1344
; Line 2034
$L1419:
	mov	eax, DWORD PTR _val$1376[ebp]
	jmp	$L1344
; Line 2040
$L1418:
; Line 2041
	jmp	$L1420
$L1368:
; Line 2042
	cmp	DWORD PTR _real1$[ebp], 0
	je	$L1421
	cmp	DWORD PTR _real2$[ebp], 0
	je	$L1421
	mov	eax, DWORD PTR _primop1$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	al, BYTE PTR [eax+38]
	and	eax, 255				; 000000ffH
	mov	ecx, DWORD PTR _primop0$[ebp]
	mov	ecx, DWORD PTR [ecx+8]
	mov	cl, BYTE PTR [ecx+38]
	and	ecx, 255				; 000000ffH
	cmp	eax, ecx
	jne	$L1421
; Line 2043
	mov	eax, DWORD PTR _primop0$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _type$[ebp], eax
; Line 2053
	jmp	$L1422
$L1421:
; Line 2055
	mov	eax, DWORD PTR _unsignedp0$[ebp]
	cmp	DWORD PTR _unsignedp1$[ebp], eax
	jne	$L1423
	mov	eax, DWORD PTR _real2$[ebp]
	cmp	DWORD PTR _real1$[ebp], eax
	jne	$L1423
	mov	eax, DWORD PTR _primop0$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	al, BYTE PTR [eax+38]
	and	eax, 255				; 000000ffH
	mov	ecx, DWORD PTR _restype_ptr$[ebp]
	mov	ecx, DWORD PTR [ecx]
	mov	cl, BYTE PTR [ecx+38]
	and	ecx, 255				; 000000ffH
	cmp	eax, ecx
	jge	$L1423
	mov	eax, DWORD PTR _primop1$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	al, BYTE PTR [eax+38]
	and	eax, 255				; 000000ffH
	mov	ecx, DWORD PTR _restype_ptr$[ebp]
	mov	ecx, DWORD PTR [ecx]
	mov	cl, BYTE PTR [ecx+38]
	and	ecx, 255				; 000000ffH
	cmp	eax, ecx
	jge	$L1423
; Line 2057
	mov	eax, DWORD PTR _primop1$[ebp]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	mov	eax, DWORD PTR _primop0$[ebp]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	call	_commontype
	add	esp, 8
	mov	DWORD PTR _type$[ebp], eax
; Line 2060
	cmp	DWORD PTR _unsignedp0$[ebp], 0
	jne	$L2094
	mov	eax, DWORD PTR _restype_ptr$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 12					; 0000000cH
	test	al, 1
	je	$L2092
$L2094:
	mov	DWORD PTR -84+[ebp], 1
	jmp	$L2093
$L2092:
	mov	DWORD PTR -84+[ebp], 0
$L2093:
	mov	eax, DWORD PTR _type$[ebp]
	push	eax
	mov	eax, DWORD PTR -84+[ebp]
	push	eax
	call	_signed_or_unsigned_type
	add	esp, 8
	mov	DWORD PTR _type$[ebp], eax
; Line 2064
	mov	eax, DWORD PTR _primop0$[ebp]
	push	eax
	mov	eax, DWORD PTR _primop0$[ebp]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	mov	eax, DWORD PTR _unsignedp0$[ebp]
	push	eax
	call	_signed_or_unsigned_type
	add	esp, 8
	push	eax
	call	_convert
	add	esp, 8
	mov	DWORD PTR _primop0$[ebp], eax
; Line 2066
	mov	eax, DWORD PTR _primop1$[ebp]
	push	eax
	mov	eax, DWORD PTR _primop1$[ebp]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	mov	eax, DWORD PTR _unsignedp1$[ebp]
	push	eax
	call	_signed_or_unsigned_type
	add	esp, 8
	push	eax
	call	_convert
	add	esp, 8
	mov	DWORD PTR _primop1$[ebp], eax
; Line 2068
	jmp	$L1424
$L1423:
; Line 2072
	mov	eax, DWORD PTR _restype_ptr$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _type$[ebp], eax
; Line 2073
	mov	eax, DWORD PTR _op0$[ebp]
	mov	DWORD PTR _primop0$[ebp], eax
; Line 2074
	mov	eax, DWORD PTR _op1$[ebp]
	mov	DWORD PTR _primop1$[ebp], eax
; Line 2075
$L1424:
$L1422:
$L1420:
; Line 2077
	mov	eax, DWORD PTR _primop0$[ebp]
	push	eax
	mov	eax, DWORD PTR _type$[ebp]
	push	eax
	call	_convert
	add	esp, 8
	mov	ecx, DWORD PTR _op0_ptr$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 2078
	mov	eax, DWORD PTR _primop1$[ebp]
	push	eax
	mov	eax, DWORD PTR _type$[ebp]
	push	eax
	call	_convert
	add	esp, 8
	mov	ecx, DWORD PTR _op1_ptr$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 2080
	mov	eax, DWORD PTR _integer_type_node
	mov	ecx, DWORD PTR _restype_ptr$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 2082
	sub	eax, eax
	jmp	$L1344
; Line 2083
$L1344:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_shorten_compare ENDP
_TEXT	ENDS
PUBLIC	_readonly_warning
PUBLIC	_build_modify_expr
EXTRN	_build_int_2:NEAR
EXTRN	_lvalue_or_else:NEAR
EXTRN	_save_expr:NEAR
EXTRN	_stabilize_reference:NEAR
EXTRN	_get_unwidened:NEAR
_DATA	SEGMENT
	ORG $+3
$SG1442	DB	'wrong type argument to unary plus', 00H
	ORG $+2
$SG1447	DB	'wrong type argument to unary minus', 00H
	ORG $+1
$SG1452	DB	'wrong type argument to bit-complement', 00H
	ORG $+2
$SG1457	DB	'wrong type argument to abs', 00H
	ORG $+1
$SG1462	DB	'wrong type argument to unary exclamation mark', 00H
	ORG $+2
$SG1470	DB	'wrong type argument to increment', 00H
	ORG $+3
$SG1472	DB	'wrong type argument to decrement', 00H
	ORG $+3
$SG1474	DB	'increment', 00H
	ORG $+2
$SG1475	DB	'decrement', 00H
	ORG $+2
$SG1481	DB	'increment', 00H
	ORG $+2
$SG1482	DB	'decrement', 00H
	ORG $+2
$SG1483	DB	'wrong type argument to %s', 00H
	ORG $+2
$SG1498	DB	'increment', 00H
	ORG $+2
$SG1499	DB	'decrement', 00H
	ORG $+2
$SG1512	DB	'ANSI C forbids the address of a cast expression', 00H
$SG1516	DB	'unary `&''', 00H
	ORG $+2
$SG1524	DB	'attempt to take address of bit-field structure member `%'
	DB	's''', 00H
_DATA	ENDS
_TEXT	SEGMENT
_inc$1476 = -24
_result_type$1477 = -28
_code$ = 8
_xarg$ = 12
_incremented$1491 = -36
_noconvert$ = 16
_modify$1492 = -40
_value$1493 = -32
_arg$ = -8
_argtype$ = -20
_typecode$ = -16
_errstring$ = -12
_val$ = -4
_addr$1520 = -44
_field$1522 = -48
_offset$1526 = -52
_build_unary_op PROC NEAR
; Line 2095
	push	ebp
	mov	ebp, esp
	sub	esp, 80					; 00000050H
	push	ebx
	push	esi
	push	edi
; Line 2097
	mov	eax, DWORD PTR _xarg$[ebp]
	mov	DWORD PTR _arg$[ebp], eax
; Line 2098
	mov	DWORD PTR _argtype$[ebp], 0
; Line 2099
	mov	eax, DWORD PTR _arg$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	mov	DWORD PTR _typecode$[ebp], eax
; Line 2100
	mov	DWORD PTR _errstring$[ebp], 0
; Line 2103
	cmp	DWORD PTR _typecode$[ebp], 0
	jne	$L1434
; Line 2104
	mov	eax, DWORD PTR _error_mark_node
	jmp	$L1428
; Line 2105
$L1434:
	cmp	DWORD PTR _typecode$[ebp], 8
	jne	$L1435
; Line 2106
	mov	DWORD PTR _typecode$[ebp], 5
; Line 2108
$L1435:
	mov	eax, DWORD PTR _code$[ebp]
	mov	DWORD PTR -72+[ebp], eax
	jmp	$L1436
; Line 2110
$L1440:
; Line 2114
	cmp	DWORD PTR _typecode$[ebp], 5
	je	$L1441
	cmp	DWORD PTR _typecode$[ebp], 6
	je	$L1441
; Line 2115
	mov	DWORD PTR _errstring$[ebp], OFFSET $SG1442
; Line 2116
	jmp	$L1443
$L1441:
	cmp	DWORD PTR _noconvert$[ebp], 0
	jne	$L1444
; Line 2117
	mov	eax, DWORD PTR _arg$[ebp]
	push	eax
	call	_default_conversion
	add	esp, 4
	mov	DWORD PTR _arg$[ebp], eax
; Line 2118
$L1444:
$L1443:
	jmp	$L1437
; Line 2120
$L1445:
; Line 2121
	cmp	DWORD PTR _typecode$[ebp], 5
	je	$L1446
	cmp	DWORD PTR _typecode$[ebp], 6
	je	$L1446
; Line 2122
	mov	DWORD PTR _errstring$[ebp], OFFSET $SG1447
; Line 2123
	jmp	$L1448
$L1446:
	cmp	DWORD PTR _noconvert$[ebp], 0
	jne	$L1449
; Line 2124
	mov	eax, DWORD PTR _arg$[ebp]
	push	eax
	call	_default_conversion
	add	esp, 4
	mov	DWORD PTR _arg$[ebp], eax
; Line 2125
$L1449:
$L1448:
	jmp	$L1437
; Line 2127
$L1450:
; Line 2128
	cmp	DWORD PTR _typecode$[ebp], 5
	je	$L1451
; Line 2129
	mov	DWORD PTR _errstring$[ebp], OFFSET $SG1452
; Line 2130
	jmp	$L1453
$L1451:
	cmp	DWORD PTR _noconvert$[ebp], 0
	jne	$L1454
; Line 2131
	mov	eax, DWORD PTR _arg$[ebp]
	push	eax
	call	_default_conversion
	add	esp, 4
	mov	DWORD PTR _arg$[ebp], eax
; Line 2132
$L1454:
$L1453:
	jmp	$L1437
; Line 2134
$L1455:
; Line 2135
	cmp	DWORD PTR _typecode$[ebp], 5
	je	$L1456
	cmp	DWORD PTR _typecode$[ebp], 6
	je	$L1456
; Line 2136
	mov	DWORD PTR _errstring$[ebp], OFFSET $SG1457
; Line 2137
	jmp	$L1458
$L1456:
	cmp	DWORD PTR _noconvert$[ebp], 0
	jne	$L1459
; Line 2138
	mov	eax, DWORD PTR _arg$[ebp]
	push	eax
	call	_default_conversion
	add	esp, 4
	mov	DWORD PTR _arg$[ebp], eax
; Line 2139
$L1459:
$L1458:
	jmp	$L1437
; Line 2141
$L1460:
; Line 2145
	cmp	DWORD PTR _typecode$[ebp], 5
	je	$L1461
	cmp	DWORD PTR _typecode$[ebp], 6
	je	$L1461
	cmp	DWORD PTR _typecode$[ebp], 11		; 0000000bH
	je	$L1461
	cmp	DWORD PTR _typecode$[ebp], 16		; 00000010H
	je	$L1461
	cmp	DWORD PTR _typecode$[ebp], 21		; 00000015H
	je	$L1461
; Line 2147
	mov	DWORD PTR _errstring$[ebp], OFFSET $SG1462
; Line 2148
	jmp	$L1437
; Line 2150
$L1461:
	mov	eax, DWORD PTR _arg$[ebp]
	push	eax
	call	_truthvalue_conversion
	add	esp, 4
	mov	DWORD PTR _arg$[ebp], eax
; Line 2151
	mov	eax, DWORD PTR _arg$[ebp]
	push	eax
	call	_invert_truthvalue
	add	esp, 4
	mov	DWORD PTR _val$[ebp], eax
; Line 2152
	cmp	DWORD PTR _val$[ebp], 0
	je	$L1463
	mov	eax, DWORD PTR _val$[ebp]
	jmp	$L1428
; Line 2153
$L1463:
	jmp	$L1437
; Line 2155
$L1464:
; Line 2156
	jmp	$L1437
; Line 2158
$L1465:
; Line 2165
	mov	eax, DWORD PTR _arg$[ebp]
	push	eax
	mov	eax, DWORD PTR _code$[ebp]
	push	eax
	call	_unary_complex_lvalue
	add	esp, 8
	mov	DWORD PTR _val$[ebp], eax
; Line 2166
	cmp	DWORD PTR _val$[ebp], 0
	je	$L1466
; Line 2167
	mov	eax, DWORD PTR _val$[ebp]
	jmp	$L1428
; Line 2171
$L1466:
; Line 2172
	cmp	DWORD PTR _typecode$[ebp], 11		; 0000000bH
	je	$L1467
	cmp	DWORD PTR _typecode$[ebp], 5
	je	$L1467
	cmp	DWORD PTR _typecode$[ebp], 6
	je	$L1467
; Line 2174
	cmp	DWORD PTR _code$[ebp], 126		; 0000007eH
	je	$L1469
	cmp	DWORD PTR _code$[ebp], 128		; 00000080H
	jne	$L1468
$L1469:
; Line 2175
	mov	DWORD PTR _errstring$[ebp], OFFSET $SG1470
; Line 2176
	jmp	$L1471
$L1468:
; Line 2177
	mov	DWORD PTR _errstring$[ebp], OFFSET $SG1472
$L1471:
; Line 2178
	jmp	$L1437
; Line 2183
$L1467:
	mov	eax, DWORD PTR _arg$[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 5
	test	al, 1
	je	$L1473
; Line 2187
	cmp	DWORD PTR _code$[ebp], 126		; 0000007eH
	je	$L2097
	cmp	DWORD PTR _code$[ebp], 128		; 00000080H
	jne	$L2095
$L2097:
	mov	DWORD PTR -56+[ebp], OFFSET $SG1474
	jmp	$L2096
$L2095:
	mov	DWORD PTR -56+[ebp], OFFSET $SG1475
$L2096:
	mov	eax, DWORD PTR -56+[ebp]
	push	eax
	mov	eax, DWORD PTR _arg$[ebp]
	push	eax
	call	_readonly_warning
	add	esp, 8
; Line 2189
$L1473:
; Line 2191
	mov	eax, DWORD PTR _arg$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _result_type$1477[ebp], eax
; Line 2193
	push	0
	mov	eax, DWORD PTR _arg$[ebp]
	push	eax
	call	_get_unwidened
	add	esp, 8
	mov	DWORD PTR _arg$[ebp], eax
; Line 2194
	mov	eax, DWORD PTR _arg$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _argtype$[ebp], eax
; Line 2198
	cmp	DWORD PTR _typecode$[ebp], 11		; 0000000bH
	jne	$L1478
; Line 2202
	cmp	DWORD PTR _pedantic, 0
	je	$L1479
	mov	eax, DWORD PTR _result_type$1477[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 21					; 00000015H
	je	$L1480
	mov	eax, DWORD PTR _result_type$1477[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 4
	jne	$L1479
$L1480:
; Line 2206
	cmp	DWORD PTR _code$[ebp], 126		; 0000007eH
	je	$L2100
	cmp	DWORD PTR _code$[ebp], 128		; 00000080H
	jne	$L2098
$L2100:
	mov	DWORD PTR -60+[ebp], OFFSET $SG1481
	jmp	$L2099
$L2098:
	mov	DWORD PTR -60+[ebp], OFFSET $SG1482
$L2099:
	mov	eax, DWORD PTR -60+[ebp]
	push	eax
	push	OFFSET $SG1483
	call	_warning
	add	esp, 8
; Line 2207
$L1479:
	mov	eax, DWORD PTR _result_type$1477[ebp]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	call	_c_sizeof_nowarn
	add	esp, 4
	mov	DWORD PTR _inc$1476[ebp], eax
; Line 2209
	jmp	$L1484
$L1478:
; Line 2210
	mov	eax, DWORD PTR _integer_one_node
	mov	DWORD PTR _inc$1476[ebp], eax
$L1484:
; Line 2212
	mov	eax, DWORD PTR _inc$1476[ebp]
	push	eax
	mov	eax, DWORD PTR _argtype$[ebp]
	push	eax
	call	_convert
	add	esp, 8
	mov	DWORD PTR _inc$1476[ebp], eax
; Line 2216
	cmp	DWORD PTR _pedantic, 0
	jne	$L1485
; Line 2217
	mov	eax, DWORD PTR _arg$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	mov	DWORD PTR -76+[ebp], eax
	jmp	$L1486
; Line 2219
$L1490:
; Line 2228
	mov	eax, DWORD PTR _arg$[ebp]
	push	eax
	call	_stabilize_reference
	add	esp, 4
	mov	DWORD PTR _arg$[ebp], eax
; Line 2229
	cmp	DWORD PTR _code$[ebp], 126		; 0000007eH
	je	$L1495
	cmp	DWORD PTR _code$[ebp], 125		; 0000007dH
	jne	$L1494
$L1495:
; Line 2230
	mov	eax, DWORD PTR _arg$[ebp]
	mov	DWORD PTR _value$1493[ebp], eax
; Line 2231
	jmp	$L1496
$L1494:
; Line 2232
	mov	eax, DWORD PTR _arg$[ebp]
	push	eax
	call	_save_expr
	add	esp, 4
	mov	DWORD PTR _value$1493[ebp], eax
$L1496:
; Line 2236
	cmp	DWORD PTR _code$[ebp], 126		; 0000007eH
	je	$L2103
	cmp	DWORD PTR _code$[ebp], 128		; 00000080H
	jne	$L2101
$L2103:
	mov	DWORD PTR -64+[ebp], 64			; 00000040H
	jmp	$L2102
$L2101:
	mov	DWORD PTR -64+[ebp], 65			; 00000041H
$L2102:
	mov	eax, DWORD PTR _inc$1476[ebp]
	push	eax
	mov	eax, DWORD PTR _value$1493[ebp]
	push	eax
	mov	eax, DWORD PTR _argtype$[ebp]
	push	eax
	mov	eax, DWORD PTR -64+[ebp]
	push	eax
	call	_build
	add	esp, 16					; 00000010H
	mov	DWORD PTR _incremented$1491[ebp], eax
; Line 2237
	mov	eax, DWORD PTR _incremented$1491[ebp]
	mov	eax, DWORD PTR [eax+16]
	or	eax, 8
	mov	ecx, DWORD PTR _incremented$1491[ebp]
	mov	DWORD PTR [ecx+16], eax
; Line 2238
	mov	eax, DWORD PTR _incremented$1491[ebp]
	push	eax
	push	113					; 00000071H
	mov	eax, DWORD PTR _arg$[ebp]
	push	eax
	call	_build_modify_expr
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _modify$1492[ebp], eax
; Line 2239
	mov	eax, DWORD PTR _value$1493[ebp]
	push	eax
	mov	eax, DWORD PTR _modify$1492[ebp]
	push	eax
	mov	eax, DWORD PTR _arg$[ebp]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	push	53					; 00000035H
	call	_build
	add	esp, 16					; 00000010H
	jmp	$L1428
; Line 2241
	jmp	$L1487
$L1486:
	cmp	DWORD PTR -76+[ebp], 77			; 0000004dH
	jl	$L1487
	cmp	DWORD PTR -76+[ebp], 81			; 00000051H
	jle	$L1490
	cmp	DWORD PTR -76+[ebp], 112		; 00000070H
	jl	$L1487
	cmp	DWORD PTR -76+[ebp], 113		; 00000071H
	jle	$L1490
	jmp	$L1487
$L1487:
; Line 2244
$L1485:
; Line 2246
	cmp	DWORD PTR _code$[ebp], 126		; 0000007eH
	je	$L2106
	cmp	DWORD PTR _code$[ebp], 128		; 00000080H
	jne	$L2104
$L2106:
	mov	DWORD PTR -68+[ebp], OFFSET $SG1498
	jmp	$L2105
$L2104:
	mov	DWORD PTR -68+[ebp], OFFSET $SG1499
$L2105:
	mov	eax, DWORD PTR -68+[ebp]
	push	eax
	mov	eax, DWORD PTR _arg$[ebp]
	push	eax
	call	_lvalue_or_else
	add	esp, 8
	or	eax, eax
	jne	$L1497
; Line 2247
	mov	eax, DWORD PTR _error_mark_node
	jmp	$L1428
; Line 2249
$L1497:
	mov	eax, DWORD PTR _inc$1476[ebp]
	push	eax
	mov	eax, DWORD PTR _arg$[ebp]
	push	eax
	mov	eax, DWORD PTR _arg$[ebp]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	mov	eax, DWORD PTR _code$[ebp]
	push	eax
	call	_build
	add	esp, 16					; 00000010H
	mov	DWORD PTR _val$[ebp], eax
; Line 2250
	mov	eax, DWORD PTR _val$[ebp]
	mov	eax, DWORD PTR [eax+16]
	or	eax, 8
	mov	ecx, DWORD PTR _val$[ebp]
	mov	DWORD PTR [ecx+16], eax
; Line 2251
	mov	eax, DWORD PTR _val$[ebp]
	push	eax
	mov	eax, DWORD PTR _result_type$1477[ebp]
	push	eax
	call	_convert
	add	esp, 8
	jmp	$L1428
; Line 2254
$L1500:
; Line 2259
	mov	eax, DWORD PTR _arg$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 48					; 00000030H
	jne	$L1501
; Line 2262
	mov	eax, DWORD PTR _arg$[ebp]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	call	_lvalue_p
	add	esp, 4
	or	eax, eax
	je	$L1502
; Line 2264
	mov	eax, DWORD PTR _arg$[ebp]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	mov	eax, DWORD PTR _arg$[ebp]
	mov	eax, DWORD PTR [eax+24]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	push	113					; 00000071H
	call	_build
	add	esp, 12					; 0000000cH
	jmp	$L1428
; Line 2265
$L1502:
	mov	eax, DWORD PTR _arg$[ebp]
	mov	eax, DWORD PTR [eax+24]
	jmp	$L1428
; Line 2269
$L1501:
	mov	eax, DWORD PTR _arg$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 51					; 00000033H
	jne	$L1503
; Line 2271
	mov	eax, DWORD PTR _arg$[ebp]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	call	_mark_addressable
	add	esp, 4
	or	eax, eax
	jne	$L1504
; Line 2272
	mov	eax, DWORD PTR _error_mark_node
	jmp	$L1428
; Line 2273
$L1504:
; Line 2274
	mov	eax, DWORD PTR _arg$[ebp]
	mov	eax, DWORD PTR [eax+28]
	push	eax
	mov	eax, DWORD PTR _arg$[ebp]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	push	64					; 00000040H
	call	_build_binary_op
	add	esp, 12					; 0000000cH
	jmp	$L1428
; Line 2279
$L1503:
	mov	eax, DWORD PTR _arg$[ebp]
	push	eax
	mov	eax, DWORD PTR _code$[ebp]
	push	eax
	call	_unary_complex_lvalue
	add	esp, 8
	mov	DWORD PTR _val$[ebp], eax
; Line 2280
	cmp	DWORD PTR _val$[ebp], 0
	je	$L1505
; Line 2281
	mov	eax, DWORD PTR _val$[ebp]
	jmp	$L1428
; Line 2285
$L1505:
	mov	eax, DWORD PTR _arg$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	mov	DWORD PTR -80+[ebp], eax
	jmp	$L1506
; Line 2287
$L1510:
; Line 2294
	cmp	DWORD PTR _pedantic, 0
	je	$L1511
; Line 2295
	push	OFFSET $SG1512
	call	_warning
	add	esp, 4
; Line 2296
$L1511:
; Line 2298
	push	0
	mov	eax, DWORD PTR _arg$[ebp]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	push	116					; 00000074H
	call	_build_unary_op
	add	esp, 12					; 0000000cH
	push	eax
	mov	eax, DWORD PTR _arg$[ebp]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	call	_build_pointer_type
	add	esp, 4
	push	eax
	call	_convert
	add	esp, 8
	jmp	$L1428
; Line 2299
	jmp	$L1507
$L1506:
	cmp	DWORD PTR -80+[ebp], 77			; 0000004dH
	jl	$L1507
	cmp	DWORD PTR -80+[ebp], 81			; 00000051H
	jle	$L1510
	cmp	DWORD PTR -80+[ebp], 112		; 00000070H
	jl	$L1507
	cmp	DWORD PTR -80+[ebp], 113		; 00000071H
	jle	$L1510
	jmp	$L1507
$L1507:
; Line 2303
	mov	eax, DWORD PTR _arg$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 52					; 00000034H
	jne	$L1513
	mov	eax, DWORD PTR _arg$[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 6
	test	al, 1
	je	$L1513
; Line 2307
	jmp	$L1514
$L1513:
	cmp	DWORD PTR _typecode$[ebp], 21		; 00000015H
	je	$L1515
	push	OFFSET $SG1516
	mov	eax, DWORD PTR _arg$[ebp]
	push	eax
	call	_lvalue_or_else
	add	esp, 8
	or	eax, eax
	jne	$L1515
; Line 2308
	mov	eax, DWORD PTR _error_mark_node
	jmp	$L1428
; Line 2311
$L1515:
$L1514:
	mov	eax, DWORD PTR _arg$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _argtype$[ebp], eax
; Line 2312
	mov	eax, DWORD PTR _arg$[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 5
	test	al, 1
	jne	$L1518
	mov	eax, DWORD PTR _arg$[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 11					; 0000000bH
	test	al, 1
	je	$L1517
$L1518:
; Line 2315
	mov	eax, DWORD PTR _arg$[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 11					; 0000000bH
	and	eax, 1
	push	eax
	mov	eax, DWORD PTR _arg$[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 5
	and	eax, 1
	push	eax
	mov	eax, DWORD PTR _argtype$[ebp]
	push	eax
	call	_c_build_type_variant
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _argtype$[ebp], eax
; Line 2317
$L1517:
	mov	eax, DWORD PTR _argtype$[ebp]
	push	eax
	call	_build_pointer_type
	add	esp, 4
	mov	DWORD PTR _argtype$[ebp], eax
; Line 2319
	mov	eax, DWORD PTR _arg$[ebp]
	push	eax
	call	_mark_addressable
	add	esp, 4
	or	eax, eax
	jne	$L1519
; Line 2320
	mov	eax, DWORD PTR _error_mark_node
	jmp	$L1428
; Line 2322
$L1519:
; Line 2325
	mov	eax, DWORD PTR _arg$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 47					; 0000002fH
	jne	$L1521
; Line 2327
	mov	eax, DWORD PTR _arg$[ebp]
	mov	eax, DWORD PTR [eax+28]
	mov	DWORD PTR _field$1522[ebp], eax
; Line 2329
	push	0
	mov	eax, DWORD PTR _arg$[ebp]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	push	116					; 00000074H
	call	_build_unary_op
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _addr$1520[ebp], eax
; Line 2331
	mov	eax, DWORD PTR _field$1522[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 4
	test	al, 1
	je	$L1523
; Line 2334
	mov	eax, DWORD PTR _field$1522[ebp]
	mov	eax, DWORD PTR [eax+40]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	push	OFFSET $SG1524
	call	_error
	add	esp, 8
; Line 2335
	mov	eax, DWORD PTR _error_mark_node
	jmp	$L1428
; Line 2338
$L1523:
	mov	eax, DWORD PTR _addr$1520[ebp]
	push	eax
	mov	eax, DWORD PTR _argtype$[ebp]
	push	eax
	call	_convert
	add	esp, 8
	mov	DWORD PTR _addr$1520[ebp], eax
; Line 2340
	mov	eax, DWORD PTR _field$1522[ebp]
	cmp	DWORD PTR [eax+48], 0
	je	$L1525
; Line 2344
	push	0
	mov	eax, DWORD PTR _field$1522[ebp]
	mov	eax, DWORD PTR [eax+48]
	cdq
	and	edx, 7
	add	eax, edx
	sar	eax, 3
	push	eax
	call	_build_int_2
	add	esp, 8
	mov	DWORD PTR _offset$1526[ebp], eax
; Line 2345
	mov	eax, DWORD PTR _argtype$[ebp]
	mov	ecx, DWORD PTR _offset$1526[ebp]
	mov	DWORD PTR [ecx+8], eax
; Line 2346
	mov	eax, DWORD PTR _offset$1526[ebp]
	push	eax
	mov	eax, DWORD PTR _addr$1520[ebp]
	push	eax
	mov	eax, DWORD PTR _argtype$[ebp]
	push	eax
	push	64					; 00000040H
	call	_build
	add	esp, 16					; 00000010H
	push	eax
	call	_fold
	add	esp, 4
	mov	DWORD PTR _addr$1520[ebp], eax
; Line 2348
$L1525:
; Line 2349
	jmp	$L1527
$L1521:
; Line 2350
	mov	eax, DWORD PTR _arg$[ebp]
	push	eax
	mov	eax, DWORD PTR _argtype$[ebp]
	push	eax
	mov	eax, DWORD PTR _code$[ebp]
	push	eax
	call	_build
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _addr$1520[ebp], eax
$L1527:
; Line 2354
	mov	eax, DWORD PTR _arg$[ebp]
	push	eax
	call	_staticp
	add	esp, 4
	and	eax, 1
	shl	eax, 6
	mov	ecx, DWORD PTR _addr$1520[ebp]
	mov	ecx, DWORD PTR [ecx+16]
	and	ecx, -65				; ffffffbfH
	or	eax, ecx
	mov	ecx, DWORD PTR _addr$1520[ebp]
	mov	DWORD PTR [ecx+16], eax
; Line 2355
	mov	eax, DWORD PTR _addr$1520[ebp]
	jmp	$L1428
; Line 2357
	jmp	$L1437
$L1436:
	cmp	DWORD PTR -72+[ebp], 112		; 00000070H
	jg	$L2107
	je	$L1440
	cmp	DWORD PTR -72+[ebp], 83			; 00000053H
	je	$L1445
	cmp	DWORD PTR -72+[ebp], 86			; 00000056H
	je	$L1455
	cmp	DWORD PTR -72+[ebp], 96			; 00000060H
	je	$L1450
	cmp	DWORD PTR -72+[ebp], 101		; 00000065H
	je	$L1460
	jmp	$L1437
$L2107:
	cmp	DWORD PTR -72+[ebp], 113		; 00000071H
	je	$L1437
	cmp	DWORD PTR -72+[ebp], 116		; 00000074H
	je	$L1500
	cmp	DWORD PTR -72+[ebp], 125		; 0000007dH
	jl	$L1437
	cmp	DWORD PTR -72+[ebp], 128		; 00000080H
	jle	$L1465
	jmp	$L1437
$L1437:
; Line 2359
	cmp	DWORD PTR _errstring$[ebp], 0
	jne	$L1528
; Line 2361
	cmp	DWORD PTR _argtype$[ebp], 0
	jne	$L1529
; Line 2362
	mov	eax, DWORD PTR _arg$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _argtype$[ebp], eax
; Line 2363
$L1529:
	mov	eax, DWORD PTR _arg$[ebp]
	push	eax
	mov	eax, DWORD PTR _argtype$[ebp]
	push	eax
	mov	eax, DWORD PTR _code$[ebp]
	push	eax
	call	_build
	add	esp, 12					; 0000000cH
	push	eax
	call	_fold
	add	esp, 4
	jmp	$L1428
; Line 2366
$L1528:
	mov	eax, DWORD PTR _errstring$[ebp]
	push	eax
	call	_error
	add	esp, 4
; Line 2367
	mov	eax, DWORD PTR _error_mark_node
	jmp	$L1428
; Line 2368
$L1428:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_build_unary_op ENDP
_conversions$ = 8
_arg$ = 12
_convert_sequence PROC NEAR
; Line 2378
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 2379
	mov	eax, DWORD PTR _conversions$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	mov	DWORD PTR -4+[ebp], eax
	jmp	$L1533
; Line 2381
$L1537:
; Line 2390
	mov	eax, DWORD PTR _arg$[ebp]
	push	eax
	mov	eax, DWORD PTR _conversions$[ebp]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	call	_convert_sequence
	add	esp, 8
	push	eax
	mov	eax, DWORD PTR _conversions$[ebp]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	call	_convert
	add	esp, 8
	jmp	$L1532
; Line 2392
$L1538:
; Line 2393
	mov	eax, DWORD PTR _arg$[ebp]
	jmp	$L1532
; Line 2394
	jmp	$L1534
$L1533:
	cmp	DWORD PTR -4+[ebp], 77			; 0000004dH
	jl	$L1538
	cmp	DWORD PTR -4+[ebp], 81			; 00000051H
	jle	$L1537
	cmp	DWORD PTR -4+[ebp], 112			; 00000070H
	jl	$L1538
	cmp	DWORD PTR -4+[ebp], 113			; 00000071H
	jle	$L1537
	jmp	$L1538
$L1534:
; Line 2395
$L1532:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_convert_sequence ENDP
_TEXT	ENDS
PUBLIC	_build_conditional_expr
_TEXT	SEGMENT
_code$ = 8
_arg$ = 12
_real_result$1544 = -4
_unary_complex_lvalue PROC NEAR
; Line 2407
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 2408
	cmp	DWORD PTR _pedantic, 0
	je	$L1542
; Line 2409
	sub	eax, eax
	jmp	$L1541
; Line 2412
$L1542:
	mov	eax, DWORD PTR _arg$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 53					; 00000035H
	jne	$L1543
; Line 2414
	push	0
	mov	eax, DWORD PTR _arg$[ebp]
	mov	eax, DWORD PTR [eax+28]
	push	eax
	mov	eax, DWORD PTR _code$[ebp]
	push	eax
	call	_build_unary_op
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _real_result$1544[ebp], eax
; Line 2416
	mov	eax, DWORD PTR _real_result$1544[ebp]
	push	eax
	mov	eax, DWORD PTR _arg$[ebp]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	mov	eax, DWORD PTR _real_result$1544[ebp]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	push	53					; 00000035H
	call	_build
	add	esp, 16					; 00000010H
	jmp	$L1541
; Line 2420
$L1543:
	mov	eax, DWORD PTR _arg$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 60					; 0000003cH
	jne	$L1545
; Line 2424
	push	0
	mov	eax, DWORD PTR _arg$[ebp]
	mov	eax, DWORD PTR [eax+32]
	push	eax
	mov	eax, DWORD PTR _code$[ebp]
	push	eax
	call	_build_unary_op
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	mov	eax, DWORD PTR _arg$[ebp]
	mov	eax, DWORD PTR [eax+28]
	push	eax
	mov	eax, DWORD PTR _code$[ebp]
	push	eax
	call	_build_unary_op
	add	esp, 12					; 0000000cH
	push	eax
	mov	eax, DWORD PTR _arg$[ebp]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	call	_build_conditional_expr
	add	esp, 12					; 0000000cH
	jmp	$L1541
; Line 2426
$L1545:
	sub	eax, eax
	jmp	$L1541
; Line 2427
$L1541:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_unary_complex_lvalue ENDP
_TEXT	ENDS
EXTRN	_strcpy:NEAR
EXTRN	_strcat:NEAR
_DATA	SEGMENT
	ORG $+1
$SG1555	DB	' of read-only member `%s''', 00H
	ORG $+2
$SG1558	DB	' of read-only variable `%s''', 00H
$SG1560	DB	'%s of read-only location', 00H
_DATA	ENDS
_TEXT	SEGMENT
_arg$ = 8
_string$ = 12
_buf$ = -80
_readonly_warning PROC NEAR
; Line 2435
	push	ebp
	mov	ebp, esp
	sub	esp, 80					; 00000050H
	push	ebx
	push	esi
	push	edi
; Line 2437
	mov	eax, DWORD PTR _string$[ebp]
	push	eax
	lea	eax, DWORD PTR _buf$[ebp]
	push	eax
	call	_strcpy
	add	esp, 8
; Line 2439
	mov	eax, DWORD PTR _arg$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 47					; 0000002fH
	jne	$L1551
; Line 2441
	mov	eax, DWORD PTR _arg$[ebp]
	mov	eax, DWORD PTR [eax+24]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 5
	test	al, 1
	je	$L1552
; Line 2442
	mov	eax, DWORD PTR _string$[ebp]
	push	eax
	mov	eax, DWORD PTR _arg$[ebp]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	call	_readonly_warning
	add	esp, 8
; Line 2443
	jmp	$L1553
$L1552:
; Line 2445
	push	OFFSET $SG1555
	lea	eax, DWORD PTR _buf$[ebp]
	push	eax
	call	_strcat
	add	esp, 8
; Line 2446
	mov	eax, DWORD PTR _arg$[ebp]
	mov	eax, DWORD PTR [eax+28]
	mov	eax, DWORD PTR [eax+40]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	lea	eax, DWORD PTR _buf$[ebp]
	push	eax
	call	_warning
	add	esp, 8
; Line 2447
$L1553:
; Line 2449
	jmp	$L1556
$L1551:
	mov	eax, DWORD PTR _arg$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 43					; 0000002bH
	jne	$L1557
; Line 2451
	push	OFFSET $SG1558
	lea	eax, DWORD PTR _buf$[ebp]
	push	eax
	call	_strcat
	add	esp, 8
; Line 2452
	mov	eax, DWORD PTR _arg$[ebp]
	mov	eax, DWORD PTR [eax+40]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	lea	eax, DWORD PTR _buf$[ebp]
	push	eax
	call	_warning
	add	esp, 8
; Line 2454
	jmp	$L1559
$L1557:
; Line 2456
	lea	eax, DWORD PTR _buf$[ebp]
	push	eax
	push	OFFSET $SG1560
	call	_warning
	add	esp, 8
; Line 2457
$L1559:
$L1556:
; Line 2458
$L1548:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_readonly_warning ENDP
_expr$ = 8
_form$ = -4
_truthvalue_conversion PROC NEAR
; Line 2472
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 2478
	mov	eax, DWORD PTR _expr$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 113				; 00000071H
	jne	$L1564
	mov	eax, DWORD PTR _expr$[ebp]
	mov	eax, DWORD PTR [eax+24]
	mov	ecx, DWORD PTR _expr$[ebp]
	mov	ecx, DWORD PTR [ecx+8]
	cmp	DWORD PTR [eax+8], ecx
	jne	$L1564
; Line 2479
	mov	eax, DWORD PTR _expr$[ebp]
	mov	eax, DWORD PTR [eax+24]
	mov	DWORD PTR _expr$[ebp], eax
; Line 2481
$L1564:
	mov	eax, DWORD PTR _expr$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	mov	DWORD PTR _form$[ebp], eax
; Line 2483
	cmp	DWORD PTR _form$[ebp], 106		; 0000006aH
	jne	$L1565
	mov	eax, DWORD PTR _expr$[ebp]
	mov	eax, DWORD PTR [eax+28]
	push	eax
	call	_integer_zerop
	add	esp, 4
	or	eax, eax
	je	$L1565
; Line 2484
	push	0
	mov	eax, DWORD PTR _expr$[ebp]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	push	101					; 00000065H
	call	_build_unary_op
	add	esp, 12					; 0000000cH
	jmp	$L1562
; Line 2487
$L1565:
; Line 2490
	cmp	DWORD PTR _form$[ebp], 47		; 0000002fH
	jne	$L1566
	mov	eax, DWORD PTR _expr$[ebp]
	mov	eax, DWORD PTR [eax+28]
	mov	eax, DWORD PTR [eax+28]
	cmp	DWORD PTR [eax+20], 1
	jne	$L1566
	mov	eax, DWORD PTR _expr$[ebp]
	mov	eax, DWORD PTR [eax+28]
	mov	al, BYTE PTR [eax+36]
	and	eax, 255				; 000000ffH
	cmp	eax, 1
	jne	$L1566
	mov	eax, DWORD PTR _expr$[ebp]
	mov	eax, DWORD PTR [eax+28]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 12					; 0000000cH
	test	al, 1
	je	$L1566
; Line 2491
	mov	eax, DWORD PTR _expr$[ebp]
	jmp	$L1562
; Line 2493
$L1566:
; Line 2499
	cmp	DWORD PTR _form$[ebp], 97		; 00000061H
	je	$L1568
	cmp	DWORD PTR _form$[ebp], 98		; 00000062H
	je	$L1568
	cmp	DWORD PTR _form$[ebp], 99		; 00000063H
	je	$L1568
	cmp	DWORD PTR _form$[ebp], 100		; 00000064H
	je	$L1568
	cmp	DWORD PTR _form$[ebp], 101		; 00000065H
	je	$L1568
	cmp	DWORD PTR _form$[ebp], 106		; 0000006aH
	je	$L1568
	cmp	DWORD PTR _form$[ebp], 107		; 0000006bH
	je	$L1568
	cmp	DWORD PTR _form$[ebp], 103		; 00000067H
	je	$L1568
	cmp	DWORD PTR _form$[ebp], 105		; 00000069H
	je	$L1568
	cmp	DWORD PTR _form$[ebp], 102		; 00000066H
	je	$L1568
	cmp	DWORD PTR _form$[ebp], 104		; 00000068H
	je	$L1568
	cmp	DWORD PTR _form$[ebp], 0
	jne	$L1567
$L1568:
; Line 2500
	mov	eax, DWORD PTR _expr$[ebp]
	jmp	$L1562
; Line 2503
$L1567:
	cmp	DWORD PTR _form$[ebp], 83		; 00000053H
	jne	$L1569
; Line 2504
	mov	eax, DWORD PTR _expr$[ebp]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	call	_truthvalue_conversion
	add	esp, 4
	jmp	$L1562
; Line 2507
$L1569:
	cmp	DWORD PTR _form$[ebp], 60		; 0000003cH
	jne	$L1570
; Line 2511
	mov	eax, DWORD PTR _expr$[ebp]
	mov	eax, DWORD PTR [eax+32]
	push	eax
	call	_truthvalue_conversion
	add	esp, 4
	push	eax
	mov	eax, DWORD PTR _expr$[ebp]
	mov	eax, DWORD PTR [eax+28]
	push	eax
	call	_truthvalue_conversion
	add	esp, 4
	push	eax
	mov	eax, DWORD PTR _expr$[ebp]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	mov	eax, DWORD PTR _integer_type_node
	push	eax
	push	60					; 0000003cH
	call	_build
	add	esp, 20					; 00000014H
	jmp	$L1562
; Line 2514
$L1570:
; Line 2517
	cmp	DWORD PTR _form$[ebp], 113		; 00000071H
	jne	$L1571
	mov	eax, DWORD PTR _expr$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 5
	jne	$L1571
	mov	eax, DWORD PTR _expr$[ebp]
	mov	eax, DWORD PTR [eax+24]
	mov	eax, DWORD PTR [eax+8]
	mov	al, BYTE PTR [eax+38]
	and	eax, 255				; 000000ffH
	mov	ecx, DWORD PTR _expr$[ebp]
	mov	ecx, DWORD PTR [ecx+8]
	mov	cl, BYTE PTR [ecx+38]
	and	ecx, 255				; 000000ffH
	cmp	eax, ecx
	jge	$L1571
; Line 2518
	mov	eax, DWORD PTR _expr$[ebp]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	call	_truthvalue_conversion
	add	esp, 4
	jmp	$L1562
; Line 2520
$L1571:
; Line 2521
	push	113					; 00000071H
	mov	eax, DWORD PTR _integer_zero_node
	push	eax
	mov	eax, DWORD PTR _expr$[ebp]
	push	eax
	call	_default_conversion
	add	esp, 4
	push	eax
	push	107					; 0000006bH
	call	_build_binary_op_nodefault
	add	esp, 16					; 00000010H
	jmp	$L1562
; Line 2522
$L1562:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_truthvalue_conversion ENDP
_arg$ = 8
_invert_truthvalue PROC NEAR
; Line 2531
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 2532
	mov	eax, DWORD PTR _arg$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	mov	DWORD PTR -4+[ebp], eax
	jmp	$L1574
; Line 2534
$L1578:
; Line 2535
	mov	eax, DWORD PTR _arg$[ebp]
	mov	BYTE PTR [eax+12], 106			; 0000006aH
; Line 2536
	mov	eax, DWORD PTR _arg$[ebp]
	jmp	$L1573
; Line 2538
$L1579:
; Line 2539
	mov	eax, DWORD PTR _arg$[ebp]
	mov	BYTE PTR [eax+12], 107			; 0000006bH
; Line 2540
	mov	eax, DWORD PTR _arg$[ebp]
	jmp	$L1573
; Line 2542
$L1580:
; Line 2543
	mov	eax, DWORD PTR _arg$[ebp]
	mov	BYTE PTR [eax+12], 102			; 00000066H
; Line 2544
	mov	eax, DWORD PTR _arg$[ebp]
	jmp	$L1573
; Line 2546
$L1581:
; Line 2547
	mov	eax, DWORD PTR _arg$[ebp]
	mov	BYTE PTR [eax+12], 103			; 00000067H
; Line 2548
	mov	eax, DWORD PTR _arg$[ebp]
	jmp	$L1573
; Line 2550
$L1582:
; Line 2551
	mov	eax, DWORD PTR _arg$[ebp]
	mov	BYTE PTR [eax+12], 104			; 00000068H
; Line 2552
	mov	eax, DWORD PTR _arg$[ebp]
	jmp	$L1573
; Line 2554
$L1583:
; Line 2555
	mov	eax, DWORD PTR _arg$[ebp]
	mov	BYTE PTR [eax+12], 105			; 00000069H
; Line 2556
	mov	eax, DWORD PTR _arg$[ebp]
	jmp	$L1573
; Line 2558
$L1584:
; Line 2563
	push	0
	mov	eax, DWORD PTR _arg$[ebp]
	mov	eax, DWORD PTR [eax+28]
	push	eax
	push	101					; 00000065H
	call	_build_unary_op
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	mov	eax, DWORD PTR _arg$[ebp]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	push	101					; 00000065H
	call	_build_unary_op
	add	esp, 12					; 0000000cH
	push	eax
	mov	eax, DWORD PTR _arg$[ebp]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	push	100					; 00000064H
	call	_build
	add	esp, 16					; 00000010H
	jmp	$L1573
; Line 2565
$L1585:
; Line 2570
	push	0
	mov	eax, DWORD PTR _arg$[ebp]
	mov	eax, DWORD PTR [eax+28]
	push	eax
	push	101					; 00000065H
	call	_build_unary_op
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	mov	eax, DWORD PTR _arg$[ebp]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	push	101					; 00000065H
	call	_build_unary_op
	add	esp, 12					; 0000000cH
	push	eax
	mov	eax, DWORD PTR _arg$[ebp]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	push	99					; 00000063H
	call	_build
	add	esp, 16					; 00000010H
	jmp	$L1573
; Line 2572
$L1586:
; Line 2577
	push	0
	mov	eax, DWORD PTR _arg$[ebp]
	mov	eax, DWORD PTR [eax+28]
	push	eax
	push	101					; 00000065H
	call	_build_unary_op
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	mov	eax, DWORD PTR _arg$[ebp]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	push	101					; 00000065H
	call	_build_unary_op
	add	esp, 12					; 0000000cH
	push	eax
	mov	eax, DWORD PTR _arg$[ebp]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	push	98					; 00000062H
	call	_build
	add	esp, 16					; 00000010H
	jmp	$L1573
; Line 2579
$L1587:
; Line 2584
	push	0
	mov	eax, DWORD PTR _arg$[ebp]
	mov	eax, DWORD PTR [eax+28]
	push	eax
	push	101					; 00000065H
	call	_build_unary_op
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	mov	eax, DWORD PTR _arg$[ebp]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	push	101					; 00000065H
	call	_build_unary_op
	add	esp, 12					; 0000000cH
	push	eax
	mov	eax, DWORD PTR _arg$[ebp]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	push	97					; 00000061H
	call	_build
	add	esp, 16					; 00000010H
	jmp	$L1573
; Line 2586
$L1588:
; Line 2587
	mov	eax, DWORD PTR _arg$[ebp]
	mov	eax, DWORD PTR [eax+24]
	jmp	$L1573
; Line 2589
$L1589:
; Line 2592
	push	0
	mov	eax, DWORD PTR _arg$[ebp]
	mov	eax, DWORD PTR [eax+32]
	push	eax
	push	101					; 00000065H
	call	_build_unary_op
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	mov	eax, DWORD PTR _arg$[ebp]
	mov	eax, DWORD PTR [eax+28]
	push	eax
	push	101					; 00000065H
	call	_build_unary_op
	add	esp, 12					; 0000000cH
	push	eax
	mov	eax, DWORD PTR _arg$[ebp]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	mov	eax, DWORD PTR _arg$[ebp]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	push	60					; 0000003cH
	call	_build
	add	esp, 20					; 00000014H
	jmp	$L1573
; Line 2593
	jmp	$L1575
$L1574:
	sub	DWORD PTR -4+[ebp], 60			; 0000003cH
	cmp	DWORD PTR -4+[ebp], 47			; 0000002fH
	ja	$L1575
	shl	DWORD PTR -4+[ebp], 2
	mov	eax, DWORD PTR -4+[ebp]
	jmp	DWORD PTR $L2108[eax]
$L2108:
	DD	OFFSET $L1589
	DD	OFFSET $L1575
	DD	OFFSET $L1575
	DD	OFFSET $L1575
	DD	OFFSET $L1575
	DD	OFFSET $L1575
	DD	OFFSET $L1575
	DD	OFFSET $L1575
	DD	OFFSET $L1575
	DD	OFFSET $L1575
	DD	OFFSET $L1575
	DD	OFFSET $L1575
	DD	OFFSET $L1575
	DD	OFFSET $L1575
	DD	OFFSET $L1575
	DD	OFFSET $L1575
	DD	OFFSET $L1575
	DD	OFFSET $L1575
	DD	OFFSET $L1575
	DD	OFFSET $L1575
	DD	OFFSET $L1575
	DD	OFFSET $L1575
	DD	OFFSET $L1575
	DD	OFFSET $L1575
	DD	OFFSET $L1575
	DD	OFFSET $L1575
	DD	OFFSET $L1575
	DD	OFFSET $L1575
	DD	OFFSET $L1575
	DD	OFFSET $L1575
	DD	OFFSET $L1575
	DD	OFFSET $L1575
	DD	OFFSET $L1575
	DD	OFFSET $L1575
	DD	OFFSET $L1575
	DD	OFFSET $L1575
	DD	OFFSET $L1575
	DD	OFFSET $L1586
	DD	OFFSET $L1587
	DD	OFFSET $L1584
	DD	OFFSET $L1585
	DD	OFFSET $L1588
	DD	OFFSET $L1583
	DD	OFFSET $L1582
	DD	OFFSET $L1581
	DD	OFFSET $L1580
	DD	OFFSET $L1579
	DD	OFFSET $L1578
$L1575:
; Line 2594
	sub	eax, eax
	jmp	$L1573
; Line 2595
$L1573:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_invert_truthvalue ENDP
_TEXT	ENDS
EXTRN	_put_var_into_stack:NEAR
_DATA	SEGMENT
	ORG $+3
$SG1604	DB	'address of global register variable `%s'' requested', 00H
	ORG $+1
$SG1605	DB	'address of register variable `%s'' requested', 00H
_DATA	ENDS
_TEXT	SEGMENT
_exp$ = 8
_x$ = -4
_mark_addressable PROC NEAR
; Line 2604
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	push	ebx
	push	esi
	push	edi
; Line 2605
	mov	eax, DWORD PTR _exp$[ebp]
	mov	DWORD PTR _x$[ebp], eax
; Line 2606
$L1594:
; Line 2607
	mov	eax, DWORD PTR _x$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	mov	DWORD PTR -8+[ebp], eax
	jmp	$L1596
; Line 2609
$L1600:
; Line 2612
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+24]
	mov	DWORD PTR _x$[ebp], eax
; Line 2613
	jmp	$L1597
; Line 2615
$L1601:
; Line 2619
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 10					; 0000000aH
	test	al, 1
	je	$L1602
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 9
	test	al, 1
	jne	$L1602
; Line 2621
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 1
	test	al, 1
	je	$L1603
; Line 2624
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+40]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	push	OFFSET $SG1604
	call	_error
	add	esp, 8
; Line 2625
	sub	eax, eax
	jmp	$L1591
; Line 2627
$L1603:
; Line 2628
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+40]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	push	OFFSET $SG1605
	call	_warning
	add	esp, 8
; Line 2630
$L1602:
	mov	eax, DWORD PTR _x$[ebp]
	push	eax
	call	_put_var_into_stack
	add	esp, 4
; Line 2633
$L1607:
; Line 2634
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+16]
	or	eax, 512				; 00000200H
	mov	ecx, DWORD PTR _x$[ebp]
	mov	DWORD PTR [ecx+16], eax
; Line 2635
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+40]
	mov	eax, DWORD PTR [eax+16]
	or	eax, 512				; 00000200H
	mov	ecx, DWORD PTR _x$[ebp]
	mov	ecx, DWORD PTR [ecx+40]
	mov	DWORD PTR [ecx+16], eax
; Line 2637
$L1608:
; Line 2638
	mov	eax, 1
	jmp	$L1591
; Line 2639
	jmp	$L1597
$L1596:
	cmp	DWORD PTR -8+[ebp], 47			; 0000002fH
	jg	$L2109
	je	$L1600
	cmp	DWORD PTR -8+[ebp], 39			; 00000027H
	je	$L1607
	cmp	DWORD PTR -8+[ebp], 41			; 00000029H
	je	$L1601
	cmp	DWORD PTR -8+[ebp], 43			; 0000002bH
	jl	$L1608
	cmp	DWORD PTR -8+[ebp], 45			; 0000002dH
	jle	$L1601
	jmp	$L1608
$L2109:
	cmp	DWORD PTR -8+[ebp], 51			; 00000033H
	je	$L1600
	cmp	DWORD PTR -8+[ebp], 116			; 00000074H
	je	$L1600
	jmp	$L1608
$L1597:
	jmp	$L1594
$L1595:
; Line 2640
$L1591:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_mark_addressable ENDP
_TEXT	ENDS
EXTRN	_flag_cond_mismatch:DWORD
_DATA	SEGMENT
$SG1620	DB	'ANSI C forbids omitting the middle term of a ?: expressi'
	DB	'on', 00H
	ORG $+1
$SG1635	DB	'ANSI C forbids conditional expr with only one void side', 00H
$SG1646	DB	'ANSI C forbids conditional expr between `void *'' and fu'
	DB	'nction pointer', 00H
	ORG $+2
$SG1650	DB	'ANSI C forbids conditional expr between `void *'' and fu'
	DB	'nction pointer', 00H
	ORG $+2
$SG1652	DB	'pointer type mismatch in conditional expression', 00H
$SG1656	DB	'pointer/integer type mismatch in conditional expression', 00H
$SG1661	DB	'pointer/integer type mismatch in conditional expression', 00H
$SG1666	DB	'type mismatch in conditional expression', 00H
_DATA	ENDS
_TEXT	SEGMENT
_ifexp$ = 8
_op1$ = 12
_op2$ = 16
_type1$ = -8
_type2$ = -4
_code1$ = -20
_code2$ = -16
_result_type$ = -12
_build_conditional_expr PROC NEAR
; Line 2647
	push	ebp
	mov	ebp, esp
	sub	esp, 20					; 00000014H
	push	ebx
	push	esi
	push	edi
; Line 2652
	mov	DWORD PTR _result_type$[ebp], 0
; Line 2656
	cmp	DWORD PTR _op1$[ebp], 0
	jne	$L1618
; Line 2658
	cmp	DWORD PTR _pedantic, 0
	je	$L1619
; Line 2659
	push	OFFSET $SG1620
	call	_warning
	add	esp, 4
; Line 2660
$L1619:
	mov	eax, DWORD PTR _ifexp$[ebp]
	push	eax
	call	_save_expr
	add	esp, 4
	mov	DWORD PTR _op1$[ebp], eax
	mov	eax, DWORD PTR _op1$[ebp]
	mov	DWORD PTR _ifexp$[ebp], eax
; Line 2663
$L1618:
	mov	eax, DWORD PTR _ifexp$[ebp]
	push	eax
	call	_default_conversion
	add	esp, 4
	push	eax
	call	_truthvalue_conversion
	add	esp, 4
	mov	DWORD PTR _ifexp$[ebp], eax
; Line 2667
	mov	eax, DWORD PTR _ifexp$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	or	eax, eax
	je	$L1622
	mov	eax, DWORD PTR _op1$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	or	eax, eax
	je	$L1622
	mov	eax, DWORD PTR _op2$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	or	eax, eax
	jne	$L1621
$L1622:
; Line 2668
	mov	eax, DWORD PTR _error_mark_node
	jmp	$L1612
; Line 2691
$L1621:
	mov	eax, DWORD PTR _op1$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 4
	je	$L1623
; Line 2692
	mov	eax, DWORD PTR _op1$[ebp]
	push	eax
	call	_default_conversion
	add	esp, 4
	mov	DWORD PTR _op1$[ebp], eax
; Line 2693
$L1623:
	mov	eax, DWORD PTR _op2$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 4
	je	$L1624
; Line 2694
	mov	eax, DWORD PTR _op2$[ebp]
	push	eax
	call	_default_conversion
	add	esp, 4
	mov	DWORD PTR _op2$[ebp], eax
; Line 2696
$L1624:
	mov	eax, DWORD PTR _op1$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _type1$[ebp], eax
; Line 2697
	mov	eax, DWORD PTR _type1$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	mov	DWORD PTR _code1$[ebp], eax
; Line 2698
	mov	eax, DWORD PTR _op2$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _type2$[ebp], eax
; Line 2699
	mov	eax, DWORD PTR _type2$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	mov	DWORD PTR _code2$[ebp], eax
; Line 2703
	mov	eax, DWORD PTR _type1$[ebp]
	cmp	DWORD PTR _type2$[ebp], eax
	jne	$L1625
; Line 2704
	mov	eax, DWORD PTR _type1$[ebp]
	mov	DWORD PTR _result_type$[ebp], eax
; Line 2705
	jmp	$L1626
$L1625:
; Line 2706
	cmp	DWORD PTR _code1$[ebp], 5
	je	$L1628
	cmp	DWORD PTR _code1$[ebp], 6
	jne	$L1627
$L1628:
	cmp	DWORD PTR _code2$[ebp], 5
	je	$L1629
	cmp	DWORD PTR _code2$[ebp], 6
	jne	$L1627
$L1629:
; Line 2708
	mov	eax, DWORD PTR _type2$[ebp]
	push	eax
	mov	eax, DWORD PTR _type1$[ebp]
	push	eax
	call	_commontype
	add	esp, 8
	mov	DWORD PTR _result_type$[ebp], eax
; Line 2710
	jmp	$L1630
$L1627:
	cmp	DWORD PTR _code1$[ebp], 4
	je	$L1632
	cmp	DWORD PTR _code2$[ebp], 4
	jne	$L1631
$L1632:
; Line 2712
	cmp	DWORD PTR _pedantic, 0
	je	$L1633
	cmp	DWORD PTR _code1$[ebp], 4
	jne	$L1634
	cmp	DWORD PTR _code2$[ebp], 4
	je	$L1633
$L1634:
; Line 2713
	push	OFFSET $SG1635
	call	_warning
	add	esp, 4
; Line 2714
$L1633:
	mov	eax, DWORD PTR _void_type_node
	mov	DWORD PTR _result_type$[ebp], eax
; Line 2716
	jmp	$L1636
$L1631:
	cmp	DWORD PTR _code1$[ebp], 11		; 0000000bH
	jne	$L1637
	cmp	DWORD PTR _code2$[ebp], 11		; 0000000bH
	jne	$L1637
; Line 2718
	mov	eax, DWORD PTR _type2$[ebp]
	push	eax
	mov	eax, DWORD PTR _type1$[ebp]
	push	eax
	call	_comp_target_types
	add	esp, 8
	or	eax, eax
	je	$L1638
; Line 2719
	mov	eax, DWORD PTR _type2$[ebp]
	push	eax
	mov	eax, DWORD PTR _type1$[ebp]
	push	eax
	call	_commontype
	add	esp, 8
	mov	DWORD PTR _result_type$[ebp], eax
; Line 2720
	jmp	$L1639
$L1638:
	mov	eax, DWORD PTR _op1$[ebp]
	push	eax
	call	_integer_zerop
	add	esp, 4
	or	eax, eax
	je	$L1640
	mov	eax, DWORD PTR _type1$[ebp]
	mov	ecx, DWORD PTR _void_type_node
	cmp	DWORD PTR [eax+8], ecx
	jne	$L1640
; Line 2721
	mov	eax, DWORD PTR _type1$[ebp]
	push	eax
	mov	eax, DWORD PTR _type2$[ebp]
	push	eax
	call	_qualify_type
	add	esp, 8
	mov	DWORD PTR _result_type$[ebp], eax
; Line 2722
	jmp	$L1641
$L1640:
	mov	eax, DWORD PTR _op2$[ebp]
	push	eax
	call	_integer_zerop
	add	esp, 4
	or	eax, eax
	je	$L1642
	mov	eax, DWORD PTR _type2$[ebp]
	mov	ecx, DWORD PTR _void_type_node
	cmp	DWORD PTR [eax+8], ecx
	jne	$L1642
; Line 2723
	mov	eax, DWORD PTR _type2$[ebp]
	push	eax
	mov	eax, DWORD PTR _type1$[ebp]
	push	eax
	call	_qualify_type
	add	esp, 8
	mov	DWORD PTR _result_type$[ebp], eax
; Line 2724
	jmp	$L1643
$L1642:
	mov	eax, DWORD PTR _type1$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	ecx, DWORD PTR _void_type_node
	cmp	DWORD PTR [eax+68], ecx
	jne	$L1644
; Line 2726
	cmp	DWORD PTR _pedantic, 0
	je	$L1645
	mov	eax, DWORD PTR _type2$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 21					; 00000015H
	jne	$L1645
; Line 2727
	push	OFFSET $SG1646
	call	_warning
	add	esp, 4
; Line 2728
$L1645:
	mov	eax, DWORD PTR _type2$[ebp]
	push	eax
	mov	eax, DWORD PTR _type1$[ebp]
	push	eax
	call	_qualify_type
	add	esp, 8
	mov	DWORD PTR _result_type$[ebp], eax
; Line 2730
	jmp	$L1647
$L1644:
	mov	eax, DWORD PTR _type2$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	ecx, DWORD PTR _void_type_node
	cmp	DWORD PTR [eax+68], ecx
	jne	$L1648
; Line 2732
	cmp	DWORD PTR _pedantic, 0
	je	$L1649
	mov	eax, DWORD PTR _type1$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 21					; 00000015H
	jne	$L1649
; Line 2733
	push	OFFSET $SG1650
	call	_warning
	add	esp, 4
; Line 2734
$L1649:
	mov	eax, DWORD PTR _type1$[ebp]
	push	eax
	mov	eax, DWORD PTR _type2$[ebp]
	push	eax
	call	_qualify_type
	add	esp, 8
	mov	DWORD PTR _result_type$[ebp], eax
; Line 2736
	jmp	$L1651
$L1648:
; Line 2738
	push	OFFSET $SG1652
	call	_warning
	add	esp, 4
; Line 2739
	mov	eax, DWORD PTR _void_type_node
	push	eax
	call	_build_pointer_type
	add	esp, 4
	mov	DWORD PTR _result_type$[ebp], eax
; Line 2740
$L1651:
$L1647:
$L1643:
$L1641:
$L1639:
; Line 2742
	jmp	$L1653
$L1637:
	cmp	DWORD PTR _code1$[ebp], 11		; 0000000bH
	jne	$L1654
	cmp	DWORD PTR _code2$[ebp], 5
	jne	$L1654
; Line 2744
	mov	eax, DWORD PTR _op2$[ebp]
	push	eax
	call	_integer_zerop
	add	esp, 4
	or	eax, eax
	jne	$L1655
; Line 2745
	push	OFFSET $SG1656
	call	_warning
	add	esp, 4
; Line 2746
	jmp	$L1657
$L1655:
; Line 2748
	mov	eax, DWORD PTR _null_pointer_node
	mov	DWORD PTR _op2$[ebp], eax
; Line 2753
$L1657:
; Line 2754
	mov	eax, DWORD PTR _type1$[ebp]
	mov	DWORD PTR _result_type$[ebp], eax
; Line 2756
	jmp	$L1658
$L1654:
	cmp	DWORD PTR _code2$[ebp], 11		; 0000000bH
	jne	$L1659
	cmp	DWORD PTR _code1$[ebp], 5
	jne	$L1659
; Line 2758
	mov	eax, DWORD PTR _op1$[ebp]
	push	eax
	call	_integer_zerop
	add	esp, 4
	or	eax, eax
	jne	$L1660
; Line 2759
	push	OFFSET $SG1661
	call	_warning
	add	esp, 4
; Line 2760
	jmp	$L1662
$L1660:
; Line 2762
	mov	eax, DWORD PTR _null_pointer_node
	mov	DWORD PTR _op1$[ebp], eax
; Line 2767
$L1662:
; Line 2768
	mov	eax, DWORD PTR _type2$[ebp]
	mov	DWORD PTR _result_type$[ebp], eax
; Line 2771
$L1659:
$L1658:
$L1653:
$L1636:
$L1630:
$L1626:
	cmp	DWORD PTR _result_type$[ebp], 0
	jne	$L1663
; Line 2773
	cmp	DWORD PTR _flag_cond_mismatch, 0
	je	$L1664
; Line 2774
	mov	eax, DWORD PTR _void_type_node
	mov	DWORD PTR _result_type$[ebp], eax
; Line 2775
	jmp	$L1665
$L1664:
; Line 2777
	push	OFFSET $SG1666
	call	_error
	add	esp, 4
; Line 2778
	mov	eax, DWORD PTR _error_mark_node
	jmp	$L1612
; Line 2779
$L1665:
; Line 2782
$L1663:
	mov	eax, DWORD PTR _op1$[ebp]
	mov	ecx, DWORD PTR _result_type$[ebp]
	cmp	DWORD PTR [eax+8], ecx
	je	$L1667
; Line 2783
	mov	eax, DWORD PTR _op1$[ebp]
	push	eax
	mov	eax, DWORD PTR _result_type$[ebp]
	push	eax
	call	_convert
	add	esp, 8
	mov	DWORD PTR _op1$[ebp], eax
; Line 2784
$L1667:
	mov	eax, DWORD PTR _op2$[ebp]
	mov	ecx, DWORD PTR _result_type$[ebp]
	cmp	DWORD PTR [eax+8], ecx
	je	$L1668
; Line 2785
	mov	eax, DWORD PTR _op2$[ebp]
	push	eax
	mov	eax, DWORD PTR _result_type$[ebp]
	push	eax
	call	_convert
	add	esp, 8
	mov	DWORD PTR _op2$[ebp], eax
; Line 2824
$L1668:
	mov	eax, DWORD PTR _ifexp$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 35					; 00000023H
	jne	$L1669
; Line 2825
	mov	eax, DWORD PTR _ifexp$[ebp]
	push	eax
	call	_integer_zerop
	add	esp, 4
	or	eax, eax
	je	$L2110
	mov	eax, DWORD PTR _op2$[ebp]
	jmp	$L2111
$L2110:
	mov	eax, DWORD PTR _op1$[ebp]
$L2111:
	jmp	$L1612
; Line 2827
$L1669:
	mov	eax, DWORD PTR _op2$[ebp]
	push	eax
	mov	eax, DWORD PTR _op1$[ebp]
	push	eax
	mov	eax, DWORD PTR _ifexp$[ebp]
	push	eax
	mov	eax, DWORD PTR _result_type$[ebp]
	push	eax
	push	60					; 0000003cH
	call	_build
	add	esp, 20					; 00000014H
	jmp	$L1612
; Line 2828
$L1612:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_build_conditional_expr ENDP
_TEXT	ENDS
PUBLIC	_build_compound_expr
_TEXT	SEGMENT
_list$ = 8
_rest$ = -4
_build_compound_expr PROC NEAR
; Line 2836
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 2839
	mov	eax, DWORD PTR _list$[ebp]
	cmp	DWORD PTR [eax+4], 0
	jne	$L1673
; Line 2844
	mov	eax, DWORD PTR _list$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 113				; 00000071H
	jne	$L1674
	mov	eax, DWORD PTR _list$[ebp]
	mov	eax, DWORD PTR [eax+24]
	mov	ecx, DWORD PTR _list$[ebp]
	mov	ecx, DWORD PTR [ecx+8]
	cmp	DWORD PTR [eax+8], ecx
	jne	$L1674
; Line 2845
	mov	eax, DWORD PTR _list$[ebp]
	mov	eax, DWORD PTR [eax+24]
	mov	DWORD PTR _list$[ebp], eax
; Line 2847
$L1674:
	mov	eax, DWORD PTR _list$[ebp]
	mov	eax, DWORD PTR [eax+24]
	jmp	$L1671
; Line 2850
$L1673:
	mov	eax, DWORD PTR _list$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	call	_build_compound_expr
	add	esp, 4
	mov	DWORD PTR _rest$[ebp], eax
; Line 2859
	mov	eax, DWORD PTR _rest$[ebp]
	push	eax
	mov	eax, DWORD PTR _list$[ebp]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	mov	eax, DWORD PTR _rest$[ebp]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	push	53					; 00000035H
	call	_build
	add	esp, 16					; 00000010H
	jmp	$L1671
; Line 2860
$L1671:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_build_compound_expr ENDP
_TEXT	ENDS
PUBLIC	_build_c_cast
EXTRN	_warn_cast_qual:DWORD
_DATA	SEGMENT
$SG1683	DB	'cast specifies array type', 00H
	ORG $+2
$SG1688	DB	'ANSI C forbids casting nonscalar to the same type', 00H
	ORG $+2
$SG1695	DB	'cast discards `volatile'' from pointer target type', 00H
	ORG $+2
$SG1697	DB	'cast discards `const'' from pointer target type', 00H
_DATA	ENDS
_TEXT	SEGMENT
_type$ = 8
_expr$ = 12
_value$ = -4
_otype$1690 = -8
_nvalue$1699 = -12
_build_c_cast PROC NEAR
; Line 2868
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
	push	ebx
	push	esi
	push	edi
; Line 2869
	mov	eax, DWORD PTR _expr$[ebp]
	mov	DWORD PTR _value$[ebp], eax
; Line 2871
	mov	eax, DWORD PTR _error_mark_node
	cmp	DWORD PTR _type$[ebp], eax
	je	$L1680
	mov	eax, DWORD PTR _expr$[ebp]
	cmp	DWORD PTR _error_mark_node, eax
	jne	$L1679
$L1680:
; Line 2872
	mov	eax, DWORD PTR _error_mark_node
	jmp	$L1677
; Line 2873
$L1679:
	mov	eax, DWORD PTR _type$[ebp]
	mov	eax, DWORD PTR [eax+68]
	mov	DWORD PTR _type$[ebp], eax
; Line 2878
	mov	eax, DWORD PTR _value$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 113				; 00000071H
	jne	$L1681
	mov	eax, DWORD PTR _value$[ebp]
	mov	eax, DWORD PTR [eax+24]
	mov	ecx, DWORD PTR _value$[ebp]
	mov	ecx, DWORD PTR [ecx+8]
	cmp	DWORD PTR [eax+8], ecx
	jne	$L1681
; Line 2879
	mov	eax, DWORD PTR _value$[ebp]
	mov	eax, DWORD PTR [eax+24]
	mov	DWORD PTR _value$[ebp], eax
; Line 2881
$L1681:
	mov	eax, DWORD PTR _type$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 16					; 00000010H
	jne	$L1682
; Line 2883
	push	OFFSET $SG1683
	call	_error
	add	esp, 4
; Line 2884
	mov	eax, DWORD PTR _error_mark_node
	jmp	$L1677
; Line 2887
$L1682:
	mov	eax, DWORD PTR _value$[ebp]
	mov	ecx, DWORD PTR _type$[ebp]
	cmp	DWORD PTR [eax+8], ecx
	jne	$L1684
; Line 2889
	cmp	DWORD PTR _pedantic, 0
	je	$L1685
; Line 2892
	mov	eax, DWORD PTR _type$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 19					; 00000013H
	je	$L1687
	mov	eax, DWORD PTR _type$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 20					; 00000014H
	jne	$L1686
$L1687:
; Line 2893
	push	OFFSET $SG1688
	call	_warning
	add	esp, 4
; Line 2894
$L1686:
; Line 2895
$L1685:
; Line 2896
	jmp	$L1689
$L1684:
; Line 2902
	mov	eax, DWORD PTR _value$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 21					; 00000015H
	je	$L1692
	mov	eax, DWORD PTR _value$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 16					; 00000010H
	jne	$L1691
$L1692:
; Line 2903
	mov	eax, DWORD PTR _value$[ebp]
	push	eax
	call	_default_conversion
	add	esp, 4
	mov	DWORD PTR _value$[ebp], eax
; Line 2904
$L1691:
	mov	eax, DWORD PTR _value$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _otype$1690[ebp], eax
; Line 2910
	cmp	DWORD PTR _warn_cast_qual, 0
	je	$L1693
	mov	eax, DWORD PTR _type$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 11					; 0000000bH
	jne	$L1693
	mov	eax, DWORD PTR _otype$1690[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 11					; 0000000bH
	jne	$L1693
; Line 2913
	mov	eax, DWORD PTR _otype$1690[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 3
	test	al, 1
	je	$L1694
	mov	eax, DWORD PTR _type$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 3
	test	al, 1
	jne	$L1694
; Line 2914
	push	OFFSET $SG1695
	call	_warning
	add	esp, 4
; Line 2915
$L1694:
; Line 2916
	mov	eax, DWORD PTR _otype$1690[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 5
	test	al, 1
	je	$L1696
	mov	eax, DWORD PTR _type$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 5
	test	al, 1
	jne	$L1696
; Line 2917
	push	OFFSET $SG1697
	call	_warning
	add	esp, 4
; Line 2918
$L1696:
; Line 2920
$L1693:
	mov	eax, DWORD PTR _value$[ebp]
	push	eax
	mov	eax, DWORD PTR _type$[ebp]
	push	eax
	call	_convert
	add	esp, 8
	mov	DWORD PTR _value$[ebp], eax
; Line 2921
$L1689:
; Line 2923
	mov	eax, DWORD PTR _expr$[ebp]
	cmp	DWORD PTR _value$[ebp], eax
	jne	$L1698
; Line 2927
	mov	eax, DWORD PTR _value$[ebp]
	push	eax
	mov	eax, DWORD PTR _type$[ebp]
	push	eax
	push	113					; 00000071H
	call	_build
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _nvalue$1699[ebp], eax
; Line 2928
	mov	eax, DWORD PTR _value$[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 6
	and	eax, 1
	shl	eax, 6
	mov	ecx, DWORD PTR _nvalue$1699[ebp]
	mov	ecx, DWORD PTR [ecx+16]
	and	ecx, -65				; ffffffbfH
	or	eax, ecx
	mov	ecx, DWORD PTR _nvalue$1699[ebp]
	mov	DWORD PTR [ecx+16], eax
; Line 2929
	mov	eax, DWORD PTR _nvalue$1699[ebp]
	jmp	$L1677
; Line 2931
$L1698:
	mov	eax, DWORD PTR _value$[ebp]
	jmp	$L1677
; Line 2932
$L1677:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_build_c_cast ENDP
_TEXT	ENDS
EXTRN	_copy_node:NEAR
_DATA	SEGMENT
	ORG $+1
$SG1731	DB	'assignment', 00H
	ORG $+1
$SG1735	DB	'assignment', 00H
	ORG $+1
$SG1739	DB	'assignment', 00H
	ORG $+1
$SG1742	DB	'assignment', 00H
_DATA	ENDS
_TEXT	SEGMENT
_inner_lhs$1728 = -24
_result$1729 = -28
_lhs$ = 8
_modifycode$ = 12
_rhs$ = 16
_result$ = -16
_newrhs$ = -12
_lhstype$ = -8
_olhstype$ = -4
_cond$1718 = -20
_build_modify_expr PROC NEAR
; Line 2943
	push	ebp
	mov	ebp, esp
	sub	esp, 36					; 00000024H
	push	ebx
	push	esi
	push	edi
; Line 2946
	mov	eax, DWORD PTR _lhs$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _lhstype$[ebp], eax
; Line 2947
	mov	eax, DWORD PTR _lhstype$[ebp]
	mov	DWORD PTR _olhstype$[ebp], eax
; Line 2950
	mov	eax, DWORD PTR _lhs$[ebp]
	push	eax
	call	_require_complete_type
	add	esp, 4
	mov	DWORD PTR _lhs$[ebp], eax
; Line 2953
	mov	eax, DWORD PTR _lhs$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	or	eax, eax
	je	$L1709
	mov	eax, DWORD PTR _rhs$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	or	eax, eax
	jne	$L1708
$L1709:
; Line 2954
	mov	eax, DWORD PTR _error_mark_node
	jmp	$L1703
; Line 2958
$L1708:
; Line 2959
	mov	eax, DWORD PTR _rhs$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 113				; 00000071H
	jne	$L1710
	mov	eax, DWORD PTR _rhs$[ebp]
	mov	eax, DWORD PTR [eax+24]
	mov	ecx, DWORD PTR _rhs$[ebp]
	mov	ecx, DWORD PTR [ecx+8]
	cmp	DWORD PTR [eax+8], ecx
	jne	$L1710
; Line 2960
	mov	eax, DWORD PTR _rhs$[ebp]
	mov	eax, DWORD PTR [eax+24]
	mov	DWORD PTR _rhs$[ebp], eax
; Line 2962
$L1710:
	mov	eax, DWORD PTR _rhs$[ebp]
	mov	DWORD PTR _newrhs$[ebp], eax
; Line 2966
	cmp	DWORD PTR _pedantic, 0
	jne	$L1711
; Line 2967
	mov	eax, DWORD PTR _lhs$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	mov	DWORD PTR -32+[ebp], eax
	jmp	$L1712
; Line 2970
$L1716:
; Line 2974
	mov	eax, DWORD PTR _rhs$[ebp]
	push	eax
	mov	eax, DWORD PTR _modifycode$[ebp]
	push	eax
	mov	eax, DWORD PTR _lhs$[ebp]
	mov	eax, DWORD PTR [eax+28]
	push	eax
	call	_build_modify_expr
	add	esp, 12					; 0000000cH
	push	eax
	mov	eax, DWORD PTR _lhs$[ebp]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	mov	eax, DWORD PTR _lhstype$[ebp]
	push	eax
	push	53					; 00000035H
	call	_build
	add	esp, 16					; 00000010H
	jmp	$L1703
; Line 2977
$L1717:
; Line 2978
	mov	eax, DWORD PTR _rhs$[ebp]
	push	eax
	call	_save_expr
	add	esp, 4
	mov	DWORD PTR _rhs$[ebp], eax
; Line 2989
	mov	eax, DWORD PTR _rhs$[ebp]
	push	eax
	mov	eax, DWORD PTR _modifycode$[ebp]
	push	eax
	mov	eax, DWORD PTR _lhs$[ebp]
	mov	eax, DWORD PTR [eax+32]
	push	eax
	call	_build_modify_expr
	add	esp, 12					; 0000000cH
	push	eax
	mov	eax, DWORD PTR _rhs$[ebp]
	push	eax
	mov	eax, DWORD PTR _modifycode$[ebp]
	push	eax
	mov	eax, DWORD PTR _lhs$[ebp]
	mov	eax, DWORD PTR [eax+28]
	push	eax
	call	_build_modify_expr
	add	esp, 12					; 0000000cH
	push	eax
	mov	eax, DWORD PTR _lhs$[ebp]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	call	_build_conditional_expr
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _cond$1718[ebp], eax
; Line 2996
	mov	eax, DWORD PTR _cond$1718[ebp]
	push	eax
	mov	eax, DWORD PTR _rhs$[ebp]
	push	eax
	mov	eax, DWORD PTR _void_type_node
	push	eax
	call	_convert
	add	esp, 8
	push	eax
	mov	eax, DWORD PTR _lhs$[ebp]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	push	53					; 00000035H
	call	_build
	add	esp, 16					; 00000010H
	jmp	$L1703
; Line 2998
	jmp	$L1713
$L1712:
	cmp	DWORD PTR -32+[ebp], 53			; 00000035H
	je	$L1716
	cmp	DWORD PTR -32+[ebp], 60			; 0000003cH
	je	$L1717
	jmp	$L1713
$L1713:
; Line 3003
$L1711:
	cmp	DWORD PTR _modifycode$[ebp], 113	; 00000071H
	je	$L1719
; Line 3005
	mov	eax, DWORD PTR _lhs$[ebp]
	push	eax
	call	_stabilize_reference
	add	esp, 4
	mov	DWORD PTR _lhs$[ebp], eax
; Line 3006
	mov	eax, DWORD PTR _rhs$[ebp]
	push	eax
	mov	eax, DWORD PTR _lhs$[ebp]
	push	eax
	mov	eax, DWORD PTR _modifycode$[ebp]
	push	eax
	call	_build_binary_op
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _newrhs$[ebp], eax
; Line 3015
$L1719:
	cmp	DWORD PTR _pedantic, 0
	jne	$L1720
; Line 3016
	mov	eax, DWORD PTR _lhs$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	mov	DWORD PTR -36+[ebp], eax
	jmp	$L1721
; Line 3018
$L1725:
; Line 3026
	mov	eax, DWORD PTR _newrhs$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 16					; 00000010H
	je	$L1727
	mov	eax, DWORD PTR _newrhs$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 21					; 00000015H
	jne	$L1726
$L1727:
; Line 3027
	mov	eax, DWORD PTR _newrhs$[ebp]
	push	eax
	call	_default_conversion
	add	esp, 4
	mov	DWORD PTR _newrhs$[ebp], eax
; Line 3028
$L1726:
; Line 3029
	mov	eax, DWORD PTR _lhs$[ebp]
	mov	eax, DWORD PTR [eax+24]
	mov	DWORD PTR _inner_lhs$1728[ebp], eax
; Line 3032
	mov	eax, DWORD PTR _newrhs$[ebp]
	push	eax
	mov	eax, DWORD PTR _inner_lhs$1728[ebp]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	call	_convert
	add	esp, 8
	push	eax
	push	113					; 00000071H
	mov	eax, DWORD PTR _inner_lhs$1728[ebp]
	push	eax
	call	_build_modify_expr
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _result$1729[ebp], eax
; Line 3033
	mov	eax, DWORD PTR _result$1729[ebp]
	push	eax
	mov	eax, DWORD PTR _lhs$[ebp]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	call	_convert
	add	esp, 8
	jmp	$L1703
; Line 3035
	jmp	$L1722
$L1721:
	cmp	DWORD PTR -36+[ebp], 77			; 0000004dH
	jl	$L1722
	cmp	DWORD PTR -36+[ebp], 81			; 00000051H
	jle	$L1725
	cmp	DWORD PTR -36+[ebp], 112		; 00000070H
	jl	$L1722
	cmp	DWORD PTR -36+[ebp], 113		; 00000071H
	jle	$L1725
	jmp	$L1722
$L1722:
; Line 3040
$L1720:
	push	OFFSET $SG1731
	mov	eax, DWORD PTR _lhs$[ebp]
	push	eax
	call	_lvalue_or_else
	add	esp, 8
	or	eax, eax
	jne	$L1730
; Line 3041
	mov	eax, DWORD PTR _error_mark_node
	jmp	$L1703
; Line 3045
$L1730:
; Line 3048
	mov	eax, DWORD PTR _lhs$[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 5
	test	al, 1
	jne	$L1733
	mov	eax, DWORD PTR _lhstype$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 19					; 00000013H
	je	$L1734
	mov	eax, DWORD PTR _lhstype$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 20					; 00000014H
	jne	$L1732
$L1734:
	mov	eax, DWORD PTR _lhstype$[ebp]
	mov	al, BYTE PTR [eax+38]
	and	eax, 255				; 000000ffH
	or	eax, eax
	je	$L1732
$L1733:
; Line 3049
	push	OFFSET $SG1735
	mov	eax, DWORD PTR _lhs$[ebp]
	push	eax
	call	_readonly_warning
	add	esp, 8
; Line 3056
$L1732:
; Line 3059
	mov	eax, DWORD PTR _lhs$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 47					; 0000002fH
	jne	$L1736
	mov	eax, DWORD PTR _lhstype$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 5
	je	$L1737
	mov	eax, DWORD PTR _lhstype$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 6
	je	$L1737
	mov	eax, DWORD PTR _lhstype$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 8
	jne	$L1736
$L1737:
; Line 3060
	push	0
	mov	eax, DWORD PTR _lhs$[ebp]
	push	eax
	call	_get_unwidened
	add	esp, 8
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _lhstype$[ebp], eax
; Line 3065
$L1736:
	mov	eax, DWORD PTR _lhs$[ebp]
	mov	ecx, DWORD PTR _lhstype$[ebp]
	cmp	DWORD PTR [eax+8], ecx
	je	$L1738
; Line 3067
	mov	eax, DWORD PTR _lhs$[ebp]
	push	eax
	call	_copy_node
	add	esp, 4
	mov	DWORD PTR _lhs$[ebp], eax
; Line 3068
	mov	eax, DWORD PTR _lhstype$[ebp]
	mov	ecx, DWORD PTR _lhs$[ebp]
	mov	DWORD PTR [ecx+8], eax
; Line 3073
$L1738:
	push	OFFSET $SG1739
	mov	eax, DWORD PTR _newrhs$[ebp]
	push	eax
	mov	eax, DWORD PTR _lhstype$[ebp]
	push	eax
	call	_convert_for_assignment
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _newrhs$[ebp], eax
; Line 3074
	mov	eax, DWORD PTR _newrhs$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	or	eax, eax
	jne	$L1740
; Line 3075
	mov	eax, DWORD PTR _error_mark_node
	jmp	$L1703
; Line 3077
$L1740:
	mov	eax, DWORD PTR _newrhs$[ebp]
	push	eax
	mov	eax, DWORD PTR _lhs$[ebp]
	push	eax
	mov	eax, DWORD PTR _lhstype$[ebp]
	push	eax
	push	54					; 00000036H
	call	_build
	add	esp, 16					; 00000010H
	mov	DWORD PTR _result$[ebp], eax
; Line 3078
	mov	eax, DWORD PTR _result$[ebp]
	mov	eax, DWORD PTR [eax+16]
	or	eax, 8
	mov	ecx, DWORD PTR _result$[ebp]
	mov	DWORD PTR [ecx+16], eax
; Line 3085
	mov	eax, DWORD PTR _result$[ebp]
	mov	ecx, DWORD PTR _olhstype$[ebp]
	cmp	DWORD PTR [eax+8], ecx
	jne	$L1741
; Line 3086
	mov	eax, DWORD PTR _result$[ebp]
	jmp	$L1703
; Line 3087
$L1741:
	push	OFFSET $SG1742
	mov	eax, DWORD PTR _result$[ebp]
	push	eax
	mov	eax, DWORD PTR _olhstype$[ebp]
	push	eax
	call	_convert_for_assignment
	add	esp, 12					; 0000000cH
	jmp	$L1703
; Line 3088
$L1703:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_build_modify_expr ENDP
_TEXT	ENDS
PUBLIC	_language_lvalue_valid
_TEXT	SEGMENT
_language_lvalue_valid PROC NEAR
; Line 3096
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 3097
	mov	eax, 1
	jmp	$L1745
; Line 3098
$L1745:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_language_lvalue_valid ENDP
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+1
$SG1759	DB	'void value not ignored as it ought to be', 00H
	ORG $+3
$SG1772	DB	'%s between incompatible pointer types', 00H
	ORG $+2
$SG1775	DB	'%s of non-const * pointer from const *', 00H
	ORG $+1
$SG1777	DB	'%s of non-volatile * pointer from volatile *', 00H
	ORG $+3
$SG1779	DB	'%s between incompatible pointer types', 00H
	ORG $+2
$SG1783	DB	'%s of pointer from integer lacks a cast', 00H
$SG1786	DB	'%s of integer from pointer lacks a cast', 00H
$SG1787	DB	'incompatible types in %s', 00H
_DATA	ENDS
_TEXT	SEGMENT
_type$ = 8
_rhs$ = 12
_errtype$ = 16
_codel$ = -8
_rhstype$ = -4
_coder$ = -12
_ttl$1765 = -20
_ttr$1766 = -16
_convert_for_assignment PROC NEAR
; Line 3112
	push	ebp
	mov	ebp, esp
	sub	esp, 20					; 00000014H
	push	ebx
	push	esi
	push	edi
; Line 3113
	mov	eax, DWORD PTR _type$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	mov	DWORD PTR _codel$[ebp], eax
; Line 3120
	mov	eax, DWORD PTR _rhs$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 113				; 00000071H
	jne	$L1753
	mov	eax, DWORD PTR _rhs$[ebp]
	mov	eax, DWORD PTR [eax+24]
	mov	ecx, DWORD PTR _rhs$[ebp]
	mov	ecx, DWORD PTR [ecx+8]
	cmp	DWORD PTR [eax+8], ecx
	jne	$L1753
; Line 3121
	mov	eax, DWORD PTR _rhs$[ebp]
	mov	eax, DWORD PTR [eax+24]
	mov	DWORD PTR _rhs$[ebp], eax
; Line 3123
$L1753:
; Line 3124
	mov	eax, DWORD PTR _rhs$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 16					; 00000010H
	je	$L1755
	mov	eax, DWORD PTR _rhs$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 21					; 00000015H
	jne	$L1754
$L1755:
; Line 3125
	mov	eax, DWORD PTR _rhs$[ebp]
	push	eax
	call	_default_conversion
	add	esp, 4
	mov	DWORD PTR _rhs$[ebp], eax
; Line 3127
$L1754:
	mov	eax, DWORD PTR _rhs$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _rhstype$[ebp], eax
; Line 3128
	mov	eax, DWORD PTR _rhstype$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	mov	DWORD PTR _coder$[ebp], eax
; Line 3130
	cmp	DWORD PTR _coder$[ebp], 0
	jne	$L1756
; Line 3131
	mov	eax, DWORD PTR _error_mark_node
	jmp	$L1749
; Line 3133
$L1756:
	mov	eax, DWORD PTR _rhstype$[ebp]
	mov	ecx, DWORD PTR _type$[ebp]
	mov	ecx, DWORD PTR [ecx+68]
	cmp	DWORD PTR [eax+68], ecx
	jne	$L1757
; Line 3134
	mov	eax, DWORD PTR _rhs$[ebp]
	jmp	$L1749
; Line 3136
$L1757:
	cmp	DWORD PTR _coder$[ebp], 4
	jne	$L1758
; Line 3138
	push	OFFSET $SG1759
	call	_error
	add	esp, 4
; Line 3139
	mov	eax, DWORD PTR _error_mark_node
	jmp	$L1749
; Line 3142
$L1758:
; Line 3144
	cmp	DWORD PTR _codel$[ebp], 5
	je	$L1761
	cmp	DWORD PTR _codel$[ebp], 6
	je	$L1761
	cmp	DWORD PTR _codel$[ebp], 8
	jne	$L1760
$L1761:
	cmp	DWORD PTR _coder$[ebp], 5
	je	$L1762
	cmp	DWORD PTR _coder$[ebp], 6
	je	$L1762
	cmp	DWORD PTR _coder$[ebp], 8
	jne	$L1760
$L1762:
; Line 3146
	mov	eax, DWORD PTR _rhs$[ebp]
	push	eax
	mov	eax, DWORD PTR _type$[ebp]
	push	eax
	call	_convert
	add	esp, 8
	jmp	$L1749
; Line 3149
	jmp	$L1763
$L1760:
	cmp	DWORD PTR _codel$[ebp], 11		; 0000000bH
	jne	$L1764
	cmp	DWORD PTR _coder$[ebp], 11		; 0000000bH
	jne	$L1764
; Line 3151
	mov	eax, DWORD PTR _type$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _ttl$1765[ebp], eax
; Line 3152
	mov	eax, DWORD PTR _rhstype$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _ttr$1766[ebp], eax
; Line 3158
	mov	eax, DWORD PTR _ttl$1765[ebp]
	mov	ecx, DWORD PTR _void_type_node
	cmp	DWORD PTR [eax+68], ecx
	je	$L1768
	mov	eax, DWORD PTR _ttr$1766[ebp]
	mov	ecx, DWORD PTR _void_type_node
	cmp	DWORD PTR [eax+68], ecx
	je	$L1768
	mov	eax, DWORD PTR _rhstype$[ebp]
	push	eax
	mov	eax, DWORD PTR _type$[ebp]
	push	eax
	call	_comp_target_types
	add	esp, 8
	or	eax, eax
	je	$L1767
$L1768:
; Line 3165
	cmp	DWORD PTR _pedantic, 0
	je	$L1769
	mov	eax, DWORD PTR _ttl$1765[ebp]
	mov	ecx, DWORD PTR _void_type_node
	cmp	DWORD PTR [eax+68], ecx
	jne	$L1771
	mov	eax, DWORD PTR _ttr$1766[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 21					; 00000015H
	je	$L1770
$L1771:
	mov	eax, DWORD PTR _ttr$1766[ebp]
	mov	ecx, DWORD PTR _void_type_node
	cmp	DWORD PTR [eax+68], ecx
	jne	$L1769
	mov	eax, DWORD PTR _ttl$1765[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 21					; 00000015H
	jne	$L1769
$L1770:
; Line 3166
	mov	eax, DWORD PTR _errtype$[ebp]
	push	eax
	push	OFFSET $SG1772
	call	_warning
	add	esp, 8
; Line 3167
	jmp	$L1773
$L1769:
; Line 3169
	mov	eax, DWORD PTR _ttl$1765[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 5
	test	al, 1
	jne	$L1774
	mov	eax, DWORD PTR _ttr$1766[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 5
	test	al, 1
	je	$L1774
; Line 3170
	mov	eax, DWORD PTR _errtype$[ebp]
	push	eax
	push	OFFSET $SG1775
	call	_warning
	add	esp, 8
; Line 3171
$L1774:
	mov	eax, DWORD PTR _ttl$1765[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 3
	test	al, 1
	jne	$L1776
	mov	eax, DWORD PTR _ttr$1766[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 3
	test	al, 1
	je	$L1776
; Line 3172
	mov	eax, DWORD PTR _errtype$[ebp]
	push	eax
	push	OFFSET $SG1777
	call	_warning
	add	esp, 8
; Line 3173
$L1776:
$L1773:
; Line 3175
	jmp	$L1778
$L1767:
; Line 3176
	mov	eax, DWORD PTR _errtype$[ebp]
	push	eax
	push	OFFSET $SG1779
	call	_warning
	add	esp, 8
$L1778:
; Line 3177
	mov	eax, DWORD PTR _rhs$[ebp]
	push	eax
	mov	eax, DWORD PTR _type$[ebp]
	push	eax
	call	_convert
	add	esp, 8
	jmp	$L1749
; Line 3179
	jmp	$L1780
$L1764:
	cmp	DWORD PTR _codel$[ebp], 11		; 0000000bH
	jne	$L1781
	cmp	DWORD PTR _coder$[ebp], 5
	jne	$L1781
; Line 3181
	mov	eax, DWORD PTR _rhs$[ebp]
	push	eax
	call	_integer_zerop
	add	esp, 4
	or	eax, eax
	jne	$L1782
; Line 3183
	mov	eax, DWORD PTR _errtype$[ebp]
	push	eax
	push	OFFSET $SG1783
	call	_warning
	add	esp, 8
; Line 3184
	mov	eax, DWORD PTR _rhs$[ebp]
	push	eax
	mov	eax, DWORD PTR _type$[ebp]
	push	eax
	call	_convert
	add	esp, 8
	jmp	$L1749
; Line 3186
$L1782:
	mov	eax, DWORD PTR _null_pointer_node
	jmp	$L1749
; Line 3188
	jmp	$L1784
$L1781:
	cmp	DWORD PTR _codel$[ebp], 5
	jne	$L1785
	cmp	DWORD PTR _coder$[ebp], 11		; 0000000bH
	jne	$L1785
; Line 3190
	mov	eax, DWORD PTR _errtype$[ebp]
	push	eax
	push	OFFSET $SG1786
	call	_warning
	add	esp, 8
; Line 3191
	mov	eax, DWORD PTR _rhs$[ebp]
	push	eax
	mov	eax, DWORD PTR _type$[ebp]
	push	eax
	call	_convert
	add	esp, 8
	jmp	$L1749
; Line 3194
$L1785:
$L1784:
$L1780:
$L1763:
	mov	eax, DWORD PTR _errtype$[ebp]
	push	eax
	push	OFFSET $SG1787
	call	_error
	add	esp, 8
; Line 3195
	mov	eax, DWORD PTR _error_mark_node
	jmp	$L1749
; Line 3196
$L1749:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_convert_for_assignment ENDP
_valid0$1802 = -8
_valid1$1803 = -4
_valid0$1807 = -16
_valid1$1808 = -12
_value$ = 8
_initializer_constant_valid_p PROC NEAR
; Line 3210
	push	ebp
	mov	ebp, esp
	sub	esp, 20					; 00000014H
	push	ebx
	push	esi
	push	edi
; Line 3211
	mov	eax, DWORD PTR _value$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	mov	DWORD PTR -20+[ebp], eax
	jmp	$L1791
; Line 3213
$L1795:
; Line 3214
	mov	eax, DWORD PTR _value$[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 2
	and	eax, 1
	jmp	$L1790
; Line 3216
$L1796:
; Line 3219
	mov	eax, 1
	jmp	$L1790
; Line 3221
$L1797:
; Line 3222
	mov	eax, 2
	jmp	$L1790
; Line 3224
$L1798:
; Line 3228
	mov	eax, DWORD PTR _value$[ebp]
	mov	eax, DWORD PTR [eax+24]
	mov	eax, DWORD PTR [eax+8]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	mov	ecx, DWORD PTR _value$[ebp]
	mov	ecx, DWORD PTR [ecx+8]
	mov	cl, BYTE PTR [ecx+12]
	and	ecx, 255				; 000000ffH
	cmp	eax, ecx
	jne	$L1799
; Line 3229
	mov	eax, DWORD PTR _value$[ebp]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	call	_initializer_constant_valid_p
	add	esp, 4
	jmp	$L1790
; Line 3231
$L1799:
; Line 3232
	mov	eax, DWORD PTR _value$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 5
	jne	$L1800
	mov	eax, DWORD PTR _value$[ebp]
	mov	eax, DWORD PTR [eax+24]
	mov	eax, DWORD PTR [eax+8]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 11					; 0000000bH
	jne	$L1800
; Line 3233
	mov	eax, DWORD PTR _value$[ebp]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	call	_initializer_constant_valid_p
	add	esp, 4
	jmp	$L1790
; Line 3234
$L1800:
	sub	eax, eax
	jmp	$L1790
; Line 3236
$L1801:
; Line 3238
	mov	eax, DWORD PTR _value$[ebp]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	call	_initializer_constant_valid_p
	add	esp, 4
	mov	DWORD PTR _valid0$1802[ebp], eax
; Line 3239
	mov	eax, DWORD PTR _value$[ebp]
	mov	eax, DWORD PTR [eax+28]
	push	eax
	call	_initializer_constant_valid_p
	add	esp, 4
	mov	DWORD PTR _valid1$1803[ebp], eax
; Line 3240
	cmp	DWORD PTR _valid0$1802[ebp], 1
	jne	$L1804
	cmp	DWORD PTR _valid1$1803[ebp], 2
	jne	$L1804
; Line 3241
	mov	eax, 2
	jmp	$L1790
; Line 3242
$L1804:
	cmp	DWORD PTR _valid0$1802[ebp], 2
	jne	$L1805
	cmp	DWORD PTR _valid1$1803[ebp], 1
	jne	$L1805
; Line 3243
	mov	eax, 2
	jmp	$L1790
; Line 3244
$L1805:
	sub	eax, eax
	jmp	$L1790
; Line 3247
$L1806:
; Line 3249
	mov	eax, DWORD PTR _value$[ebp]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	call	_initializer_constant_valid_p
	add	esp, 4
	mov	DWORD PTR _valid0$1807[ebp], eax
; Line 3250
	mov	eax, DWORD PTR _value$[ebp]
	mov	eax, DWORD PTR [eax+28]
	push	eax
	call	_initializer_constant_valid_p
	add	esp, 4
	mov	DWORD PTR _valid1$1808[ebp], eax
; Line 3251
	cmp	DWORD PTR _valid0$1807[ebp], 2
	jne	$L1809
	cmp	DWORD PTR _valid1$1808[ebp], 1
	jne	$L1809
; Line 3252
	mov	eax, 2
	jmp	$L1790
; Line 3253
$L1809:
	sub	eax, eax
	jmp	$L1790
; Line 3255
	jmp	$L1792
$L1791:
	cmp	DWORD PTR -20+[ebp], 64			; 00000040H
	jg	$L2112
	je	$L1801
	cmp	DWORD PTR -20+[ebp], 35			; 00000023H
	jl	$L1792
	cmp	DWORD PTR -20+[ebp], 36			; 00000024H
	jle	$L1796
	cmp	DWORD PTR -20+[ebp], 38			; 00000026H
	je	$L1796
	cmp	DWORD PTR -20+[ebp], 52			; 00000034H
	je	$L1795
	jmp	$L1792
$L2112:
	cmp	DWORD PTR -20+[ebp], 65			; 00000041H
	je	$L1806
	cmp	DWORD PTR -20+[ebp], 112		; 00000070H
	jl	$L1792
	cmp	DWORD PTR -20+[ebp], 113		; 00000071H
	jle	$L1798
	cmp	DWORD PTR -20+[ebp], 116		; 00000074H
	je	$L1797
	jmp	$L1792
$L1792:
; Line 3257
	sub	eax, eax
	jmp	$L1790
; Line 3258
$L1790:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_initializer_constant_valid_p ENDP
_TEXT	ENDS
PUBLIC	_store_init_value
PUBLIC	_digest_init
_DATA	SEGMENT
	ORG $+3
$SG1819	DB	'initializer for static variable is not constant', 00H
$SG1822	DB	'initializer for static variable uses complicated arithme'
	DB	'tic', 00H
$SG1826	DB	'aggregate initializer is not constant', 00H
	ORG $+2
$SG1829	DB	'aggregate initializer uses complicated arithmetic', 00H
_DATA	ENDS
_TEXT	SEGMENT
_decl$ = 8
_init$ = 12
_value$ = -8
_type$ = -4
_store_init_value PROC NEAR
; Line 3268
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	push	ebx
	push	esi
	push	edi
; Line 3273
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _type$[ebp], eax
; Line 3274
	mov	eax, DWORD PTR _type$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	or	eax, eax
	jne	$L1815
; Line 3275
	jmp	$L1812
; Line 3279
$L1815:
	push	0
	mov	eax, DWORD PTR _init$[ebp]
	push	eax
	mov	eax, DWORD PTR _type$[ebp]
	push	eax
	call	_digest_init
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _value$[ebp], eax
; Line 3283
	mov	eax, DWORD PTR _value$[ebp]
	cmp	DWORD PTR _error_mark_node, eax
	jne	$L1816
; Line 3285
	jmp	$L1817
$L1816:
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 2
	test	al, 1
	je	$L1818
	mov	eax, DWORD PTR _value$[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 6
	test	al, 1
	jne	$L1818
; Line 3287
	push	OFFSET $SG1819
	call	_error
	add	esp, 4
; Line 3288
	mov	eax, DWORD PTR _error_mark_node
	mov	DWORD PTR _value$[ebp], eax
; Line 3290
	jmp	$L1820
$L1818:
; Line 3291
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 2
	test	al, 1
	je	$L1821
	mov	eax, DWORD PTR _value$[ebp]
	push	eax
	call	_initializer_constant_valid_p
	add	esp, 4
	or	eax, eax
	jne	$L1821
; Line 3293
	push	OFFSET $SG1822
	call	_error
	add	esp, 4
; Line 3294
	mov	eax, DWORD PTR _error_mark_node
	mov	DWORD PTR _value$[ebp], eax
; Line 3296
	jmp	$L1823
$L1821:
; Line 3298
	cmp	DWORD PTR _pedantic, 0
	je	$L1824
	mov	eax, DWORD PTR _value$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 52					; 00000034H
	jne	$L1824
; Line 3300
	mov	eax, DWORD PTR _value$[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 6
	test	al, 1
	jne	$L1825
; Line 3301
	push	OFFSET $SG1826
	call	_warning
	add	esp, 4
; Line 3302
	jmp	$L1827
$L1825:
	mov	eax, DWORD PTR _value$[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 2
	test	al, 1
	jne	$L1828
; Line 3303
	push	OFFSET $SG1829
	call	_warning
	add	esp, 4
; Line 3304
$L1828:
$L1827:
; Line 3305
$L1824:
$L1823:
$L1820:
$L1817:
; Line 3306
	mov	eax, DWORD PTR _value$[ebp]
	mov	ecx, DWORD PTR _decl$[ebp]
	mov	DWORD PTR [ecx+64], eax
; Line 3307
$L1812:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_store_init_value ENDP
_TEXT	ENDS
EXTRN	_build_nt:NEAR
_DATA	SEGMENT
	ORG $+2
$SG1849	DB	'char-array initialized from wide string', 00H
$SG1851	DB	'int-array initialized from non-wide string', 00H
	ORG $+1
$SG1855	DB	'initializer-string for array of chars is too long', 00H
	ORG $+2
$SG1859	DB	'array initialized from non-constant array expression', 00H
	ORG $+3
$SG1864	DB	'array initialized from non-constant array expression', 00H
	ORG $+3
$SG1867	DB	'single-expression nonscalar initializer has braces', 00H
	ORG $+1
$SG1872	DB	'union with no members cannot be initialized', 00H
$SG1880	DB	'initializer for scalar variable requires one element', 00H
	ORG $+3
$SG1882	DB	'initializer for scalar has extra braces', 00H
$SG1883	DB	'initialization', 00H
	ORG $+1
$SG1885	DB	'variable-sized object may not be initialized', 00H
	ORG $+3
$SG1893	DB	'invalid initializer', 00H
_DATA	ENDS
_TEXT	SEGMENT
_type$ = 8
_init$ = 12
_tail$ = 16
_code$ = -16
_element$ = -8
_old_tail_contents$ = -4
_raw_constructor$ = -12
_typ1$1842 = -20
_string$1847 = -24
_size$1853 = -28
_digest_init PROC NEAR
; Line 3321
	push	ebp
	mov	ebp, esp
	sub	esp, 32					; 00000020H
	push	ebx
	push	esi
	push	edi
; Line 3322
	mov	eax, DWORD PTR _type$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	mov	DWORD PTR _code$[ebp], eax
; Line 3323
	mov	DWORD PTR _element$[ebp], 0
; Line 3328
	mov	eax, DWORD PTR _init$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 52					; 00000034H
	jne	$L2113
	mov	eax, DWORD PTR _init$[ebp]
	cmp	DWORD PTR [eax+8], 0
	jne	$L2113
	mov	DWORD PTR _raw_constructor$[ebp], 1
	jmp	$L2114
$L2113:
	mov	DWORD PTR _raw_constructor$[ebp], 0
$L2114:
; Line 3333
	cmp	DWORD PTR _tail$[ebp], 0
	je	$L1838
; Line 3335
	mov	eax, DWORD PTR _tail$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _old_tail_contents$[ebp], eax
; Line 3336
	mov	eax, DWORD PTR _tail$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _tail$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 3339
$L1838:
	mov	eax, DWORD PTR _init$[ebp]
	cmp	DWORD PTR _error_mark_node, eax
	jne	$L1839
; Line 3340
	mov	eax, DWORD PTR _init$[ebp]
	jmp	$L1833
; Line 3342
$L1839:
; Line 3344
	cmp	DWORD PTR _init$[ebp], 0
	je	$L1840
	cmp	DWORD PTR _raw_constructor$[ebp], 0
	je	$L1840
	mov	eax, DWORD PTR _init$[ebp]
	cmp	DWORD PTR [eax+28], 0
	je	$L1840
	mov	eax, DWORD PTR _init$[ebp]
	mov	eax, DWORD PTR [eax+28]
	cmp	DWORD PTR [eax+4], 0
	jne	$L1840
; Line 3345
	mov	eax, DWORD PTR _init$[ebp]
	mov	eax, DWORD PTR [eax+28]
	mov	eax, DWORD PTR [eax+24]
	mov	DWORD PTR _element$[ebp], eax
; Line 3350
$L1840:
	cmp	DWORD PTR _code$[ebp], 16		; 00000010H
	jne	$L1841
; Line 3352
	mov	eax, DWORD PTR _type$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+68]
	mov	DWORD PTR _typ1$1842[ebp], eax
; Line 3359
	mov	eax, DWORD PTR _char_type_node
	cmp	DWORD PTR _typ1$1842[ebp], eax
	je	$L1844
	mov	eax, DWORD PTR _signed_char_type_node
	cmp	DWORD PTR _typ1$1842[ebp], eax
	je	$L1844
	mov	eax, DWORD PTR _unsigned_char_type_node
	cmp	DWORD PTR _typ1$1842[ebp], eax
	je	$L1844
	mov	eax, DWORD PTR _unsigned_type_node
	cmp	DWORD PTR _typ1$1842[ebp], eax
	je	$L1844
	mov	eax, DWORD PTR _integer_type_node
	cmp	DWORD PTR _typ1$1842[ebp], eax
	jne	$L1843
$L1844:
	cmp	DWORD PTR _init$[ebp], 0
	je	$L1846
	mov	eax, DWORD PTR _init$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 38					; 00000026H
	je	$L1845
$L1846:
	cmp	DWORD PTR _element$[ebp], 0
	je	$L1843
	mov	eax, DWORD PTR _element$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 38					; 00000026H
	jne	$L1843
$L1845:
; Line 3361
	cmp	DWORD PTR _element$[ebp], 0
	je	$L2115
	mov	eax, DWORD PTR _element$[ebp]
	mov	DWORD PTR _string$1847[ebp], eax
	jmp	$L2116
$L2115:
	mov	eax, DWORD PTR _init$[ebp]
	mov	DWORD PTR _string$1847[ebp], eax
$L2116:
; Line 3365
	mov	eax, DWORD PTR _string$1847[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+8]
	mov	ecx, DWORD PTR _char_type_node
	cmp	DWORD PTR [eax+68], ecx
	je	$L1848
	mov	eax, DWORD PTR _typ1$1842[ebp]
	mov	al, BYTE PTR [eax+38]
	and	eax, 255				; 000000ffH
	mov	ecx, DWORD PTR _char_type_node
	mov	cl, BYTE PTR [ecx+38]
	and	ecx, 255				; 000000ffH
	cmp	eax, ecx
	jne	$L1848
; Line 3367
	push	OFFSET $SG1849
	call	_error
	add	esp, 4
; Line 3368
	mov	eax, DWORD PTR _error_mark_node
	jmp	$L1833
; Line 3370
$L1848:
; Line 3372
	mov	eax, DWORD PTR _string$1847[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+8]
	mov	ecx, DWORD PTR _char_type_node
	cmp	DWORD PTR [eax+68], ecx
	jne	$L1850
	mov	eax, DWORD PTR _typ1$1842[ebp]
	mov	al, BYTE PTR [eax+38]
	and	eax, 255				; 000000ffH
	mov	ecx, DWORD PTR _integer_type_node
	mov	cl, BYTE PTR [ecx+38]
	and	ecx, 255				; 000000ffH
	cmp	eax, ecx
	jne	$L1850
; Line 3374
	push	OFFSET $SG1851
	call	_error
	add	esp, 4
; Line 3375
	mov	eax, DWORD PTR _error_mark_node
	jmp	$L1833
; Line 3378
$L1850:
	mov	eax, DWORD PTR _type$[ebp]
	mov	ecx, DWORD PTR _string$1847[ebp]
	mov	DWORD PTR [ecx+8], eax
; Line 3380
	mov	eax, DWORD PTR _type$[ebp]
	cmp	DWORD PTR [eax+20], 0
	je	$L1852
	mov	eax, DWORD PTR _type$[ebp]
	mov	eax, DWORD PTR [eax+28]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 6
	test	al, 1
	je	$L1852
; Line 3383
	mov	eax, DWORD PTR _type$[ebp]
	mov	al, BYTE PTR [eax+36]
	and	eax, 255				; 000000ffH
	mov	ecx, DWORD PTR _type$[ebp]
	mov	ecx, DWORD PTR [ecx+28]
	imul	eax, DWORD PTR [ecx+20]
	mov	DWORD PTR _size$1853[ebp], eax
; Line 3384
	mov	eax, DWORD PTR _size$1853[ebp]
	add	eax, 7
	cdq
	and	edx, 7
	add	eax, edx
	sar	eax, 3
	mov	DWORD PTR _size$1853[ebp], eax
; Line 3387
	mov	eax, DWORD PTR _string$1847[ebp]
	mov	eax, DWORD PTR [eax+24]
	dec	eax
	cmp	eax, DWORD PTR _size$1853[ebp]
	jle	$L1854
; Line 3388
	push	OFFSET $SG1855
	call	_warning
	add	esp, 4
; Line 3389
$L1854:
; Line 3390
$L1852:
	mov	eax, DWORD PTR _string$1847[ebp]
	jmp	$L1833
; Line 3392
$L1843:
; Line 3397
$L1841:
; Line 3399
	cmp	DWORD PTR _init$[ebp], 0
	je	$L1856
	mov	eax, DWORD PTR _init$[ebp]
	mov	ecx, DWORD PTR _type$[ebp]
	cmp	DWORD PTR [eax+8], ecx
	je	$L1857
	cmp	DWORD PTR _code$[ebp], 16		; 00000010H
	jne	$L1856
	mov	eax, DWORD PTR _init$[ebp]
	cmp	DWORD PTR [eax+8], 0
	je	$L1856
	mov	eax, DWORD PTR _type$[ebp]
	push	eax
	mov	eax, DWORD PTR _init$[ebp]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	call	_comptypes
	add	esp, 8
	or	eax, eax
	je	$L1856
$L1857:
; Line 3401
	cmp	DWORD PTR _code$[ebp], 16		; 00000010H
	jne	$L1858
	mov	eax, DWORD PTR _init$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 38					; 00000026H
	je	$L1858
; Line 3403
	push	OFFSET $SG1859
	call	_error
	add	esp, 4
; Line 3404
	mov	eax, DWORD PTR _error_mark_node
	jmp	$L1833
; Line 3406
$L1858:
	cmp	DWORD PTR _optimize, 0
	je	$L1860
	mov	eax, DWORD PTR _init$[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 5
	test	al, 1
	je	$L1860
	mov	eax, DWORD PTR _init$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 43					; 0000002bH
	jne	$L1860
; Line 3407
	mov	eax, DWORD PTR _init$[ebp]
	push	eax
	call	_decl_constant_value
	add	esp, 4
	jmp	$L1833
; Line 3408
$L1860:
	mov	eax, DWORD PTR _init$[ebp]
	jmp	$L1833
; Line 3411
$L1856:
; Line 3413
	cmp	DWORD PTR _element$[ebp], 0
	je	$L1861
	mov	eax, DWORD PTR _element$[ebp]
	mov	ecx, DWORD PTR _type$[ebp]
	cmp	DWORD PTR [eax+8], ecx
	je	$L1862
	cmp	DWORD PTR _code$[ebp], 16		; 00000010H
	jne	$L1861
	mov	eax, DWORD PTR _element$[ebp]
	cmp	DWORD PTR [eax+8], 0
	je	$L1861
	mov	eax, DWORD PTR _type$[ebp]
	push	eax
	mov	eax, DWORD PTR _element$[ebp]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	call	_comptypes
	add	esp, 8
	or	eax, eax
	je	$L1861
$L1862:
; Line 3415
	cmp	DWORD PTR _code$[ebp], 16		; 00000010H
	jne	$L1863
; Line 3417
	push	OFFSET $SG1864
	call	_error
	add	esp, 4
; Line 3418
	mov	eax, DWORD PTR _error_mark_node
	jmp	$L1833
; Line 3420
$L1863:
	cmp	DWORD PTR _pedantic, 0
	je	$L1865
	cmp	DWORD PTR _code$[ebp], 19		; 00000013H
	je	$L1866
	cmp	DWORD PTR _code$[ebp], 20		; 00000014H
	jne	$L1865
$L1866:
; Line 3421
	push	OFFSET $SG1867
	call	_warning
	add	esp, 4
; Line 3422
$L1865:
	cmp	DWORD PTR _optimize, 0
	je	$L1868
	mov	eax, DWORD PTR _element$[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 5
	test	al, 1
	je	$L1868
	mov	eax, DWORD PTR _element$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 43					; 0000002bH
	jne	$L1868
; Line 3423
	mov	eax, DWORD PTR _element$[ebp]
	push	eax
	call	_decl_constant_value
	add	esp, 4
	jmp	$L1833
; Line 3424
$L1868:
	mov	eax, DWORD PTR _element$[ebp]
	jmp	$L1833
; Line 3430
$L1861:
	cmp	DWORD PTR _code$[ebp], 20		; 00000014H
	jne	$L1869
; Line 3434
	mov	eax, DWORD PTR _type$[ebp]
	cmp	DWORD PTR [eax+20], 0
	jne	$L1871
; Line 3436
	push	OFFSET $SG1872
	call	_error
	add	esp, 4
; Line 3437
	mov	eax, DWORD PTR _error_mark_node
	jmp	$L1833
; Line 3440
$L1871:
	cmp	DWORD PTR _raw_constructor$[ebp], 0
	je	$L1873
; Line 3441
	push	0
	mov	eax, DWORD PTR _init$[ebp]
	push	eax
	mov	eax, DWORD PTR _type$[ebp]
	push	eax
	call	_process_init_constructor
	add	esp, 12					; 0000000cH
	jmp	$L1833
; Line 3442
	jmp	$L1874
$L1873:
	cmp	DWORD PTR _tail$[ebp], 0
	je	$L1875
; Line 3444
	mov	eax, DWORD PTR _old_tail_contents$[ebp]
	mov	ecx, DWORD PTR _tail$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 3445
	mov	eax, DWORD PTR _tail$[ebp]
	push	eax
	push	0
	mov	eax, DWORD PTR _type$[ebp]
	push	eax
	call	_process_init_constructor
	add	esp, 12					; 0000000cH
	jmp	$L1833
; Line 3447
$L1875:
$L1874:
; Line 3451
$L1869:
; Line 3452
	cmp	DWORD PTR _code$[ebp], 5
	je	$L1877
	cmp	DWORD PTR _code$[ebp], 6
	je	$L1877
	cmp	DWORD PTR _code$[ebp], 11		; 0000000bH
	je	$L1877
	cmp	DWORD PTR _code$[ebp], 8
	jne	$L1876
$L1877:
; Line 3454
	cmp	DWORD PTR _raw_constructor$[ebp], 0
	je	$L1878
; Line 3456
	cmp	DWORD PTR _element$[ebp], 0
	jne	$L1879
; Line 3458
	push	OFFSET $SG1880
	call	_error
	add	esp, 4
; Line 3459
	mov	eax, DWORD PTR _error_mark_node
	jmp	$L1833
; Line 3461
$L1879:
	mov	eax, DWORD PTR _element$[ebp]
	mov	DWORD PTR _init$[ebp], eax
; Line 3464
$L1878:
	mov	eax, DWORD PTR _init$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 52					; 00000034H
	jne	$L1881
; Line 3466
	push	OFFSET $SG1882
	call	_error
	add	esp, 4
; Line 3467
	mov	eax, DWORD PTR _error_mark_node
	jmp	$L1833
; Line 3470
$L1881:
; Line 3471
	push	OFFSET $SG1883
	mov	eax, DWORD PTR _init$[ebp]
	push	eax
	call	_default_conversion
	add	esp, 4
	push	eax
	mov	eax, DWORD PTR _type$[ebp]
	push	eax
	call	_convert_for_assignment
	add	esp, 12					; 0000000cH
	jmp	$L1833
; Line 3476
$L1876:
	mov	eax, DWORD PTR _type$[ebp]
	cmp	DWORD PTR [eax+28], 0
	je	$L1884
	mov	eax, DWORD PTR _type$[ebp]
	mov	eax, DWORD PTR [eax+28]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 6
	test	al, 1
	jne	$L1884
; Line 3478
	push	OFFSET $SG1885
	call	_error
	add	esp, 4
; Line 3479
	mov	eax, DWORD PTR _error_mark_node
	jmp	$L1833
; Line 3482
$L1884:
	cmp	DWORD PTR _code$[ebp], 16		; 00000010H
	je	$L1887
	cmp	DWORD PTR _code$[ebp], 19		; 00000013H
	jne	$L1886
$L1887:
; Line 3484
	cmp	DWORD PTR _raw_constructor$[ebp], 0
	je	$L1888
; Line 3485
	push	0
	mov	eax, DWORD PTR _init$[ebp]
	push	eax
	mov	eax, DWORD PTR _type$[ebp]
	push	eax
	call	_process_init_constructor
	add	esp, 12					; 0000000cH
	jmp	$L1833
; Line 3486
	jmp	$L1889
$L1888:
	cmp	DWORD PTR _tail$[ebp], 0
	je	$L1890
; Line 3488
	mov	eax, DWORD PTR _old_tail_contents$[ebp]
	mov	ecx, DWORD PTR _tail$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 3489
	mov	eax, DWORD PTR _tail$[ebp]
	push	eax
	push	0
	mov	eax, DWORD PTR _type$[ebp]
	push	eax
	call	_process_init_constructor
	add	esp, 12					; 0000000cH
	jmp	$L1833
; Line 3491
	jmp	$L1891
$L1890:
	cmp	DWORD PTR _flag_traditional, 0
	je	$L1892
; Line 3496
	push	0
	push	0
	mov	eax, DWORD PTR _init$[ebp]
	push	eax
	push	0
	call	_tree_cons
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	push	52					; 00000034H
	call	_build_nt
	add	esp, 12					; 0000000cH
	push	eax
	mov	eax, DWORD PTR _type$[ebp]
	push	eax
	call	_process_init_constructor
	add	esp, 12					; 0000000cH
	jmp	$L1833
; Line 3497
$L1892:
$L1891:
$L1889:
; Line 3499
$L1886:
	push	OFFSET $SG1893
	call	_error
	add	esp, 4
; Line 3500
	mov	eax, DWORD PTR _error_mark_node
	jmp	$L1833
; Line 3501
$L1833:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_digest_init ENDP
_TEXT	ENDS
EXTRN	_nreverse:NEAR
_DATA	SEGMENT
$SG1921	DB	'non-empty initializer for array of empty elements', 00H
	ORG $+2
$SG1959	DB	'excess elements in aggregate initializer', 00H
_DATA	ENDS
_TEXT	SEGMENT
_field$1929 = -48
_next1$1933 = -52
_tail1$1936 = -56
_field$1945 = -60
_next1$1946 = -64
_tail1$1948 = -68
_type$ = 8
_init$ = 12
_elts$ = 16
_tail$ = -24
_members$ = -16
_result$ = -20
_allconstant$ = -8
_allsimple$ = -12
_error_flag$ = -4
_domain$1907 = -28
_len$1908 = -36
_i$1909 = -32
_next1$1916 = -40
_tail1$1918 = -44
_process_init_constructor PROC NEAR
; Line 3521
	push	ebp
	mov	ebp, esp
	sub	esp, 68					; 00000044H
	push	ebx
	push	esi
	push	edi
; Line 3525
	mov	DWORD PTR _members$[ebp], 0
; Line 3527
	mov	DWORD PTR _allconstant$[ebp], 1
; Line 3528
	mov	DWORD PTR _allsimple$[ebp], 1
; Line 3529
	mov	DWORD PTR _error_flag$[ebp], 0
; Line 3534
	cmp	DWORD PTR _elts$[ebp], 0
	je	$L1904
; Line 3535
	mov	eax, DWORD PTR _elts$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _tail$[ebp], eax
; Line 3536
	jmp	$L1905
$L1904:
; Line 3537
	mov	eax, DWORD PTR _init$[ebp]
	mov	eax, DWORD PTR [eax+28]
	mov	DWORD PTR _tail$[ebp], eax
$L1905:
; Line 3543
	mov	eax, DWORD PTR _type$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 16					; 00000010H
	jne	$L1906
; Line 3545
	mov	eax, DWORD PTR _type$[ebp]
	mov	eax, DWORD PTR [eax+20]
	mov	DWORD PTR _domain$1907[ebp], eax
; Line 3549
	cmp	DWORD PTR _domain$1907[ebp], 0
	je	$L1910
; Line 3552
	mov	eax, DWORD PTR _domain$1907[ebp]
	mov	eax, DWORD PTR [eax+60]
	mov	eax, DWORD PTR [eax+20]
	mov	ecx, DWORD PTR _domain$1907[ebp]
	mov	ecx, DWORD PTR [ecx+24]
	sub	eax, DWORD PTR [ecx+20]
	inc	eax
	mov	DWORD PTR _len$1908[ebp], eax
; Line 3553
	jmp	$L1911
$L1910:
; Line 3554
	mov	DWORD PTR _len$1908[ebp], -1
$L1911:
; Line 3556
	mov	DWORD PTR _i$1909[ebp], 0
	jmp	$L1912
$L1913:
	inc	DWORD PTR _i$1909[ebp]
$L1912:
	cmp	DWORD PTR _len$1908[ebp], 0
	jl	$L1915
	mov	eax, DWORD PTR _len$1908[ebp]
	cmp	DWORD PTR _i$1909[ebp], eax
	jge	$L1914
$L1915:
	cmp	DWORD PTR _tail$[ebp], 0
	je	$L1914
; Line 3560
	mov	eax, DWORD PTR _tail$[ebp]
	cmp	DWORD PTR [eax+24], 0
	je	$L1917
; Line 3562
	mov	eax, DWORD PTR _tail$[ebp]
	mov	DWORD PTR _tail1$1918[ebp], eax
; Line 3564
	lea	eax, DWORD PTR _tail1$1918[ebp]
	push	eax
	mov	eax, DWORD PTR _tail$[ebp]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	mov	eax, DWORD PTR _type$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+68]
	push	eax
	call	_digest_init
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _next1$1916[ebp], eax
; Line 3565
	cmp	DWORD PTR _tail1$1918[ebp], 0
	je	$L1919
	mov	eax, DWORD PTR _tail1$1918[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 3
	je	$L1919
; Line 3566
	call	_abort
; Line 3567
$L1919:
	mov	eax, DWORD PTR _tail1$1918[ebp]
	cmp	DWORD PTR _tail$[ebp], eax
	jne	$L1920
	cmp	DWORD PTR _len$1908[ebp], 0
	jge	$L1920
; Line 3569
	push	OFFSET $SG1921
	call	_error
	add	esp, 4
; Line 3571
	mov	DWORD PTR _tail1$1918[ebp], 0
; Line 3573
$L1920:
	mov	eax, DWORD PTR _tail1$1918[ebp]
	mov	DWORD PTR _tail$[ebp], eax
; Line 3575
	jmp	$L1922
$L1917:
; Line 3577
	mov	eax, DWORD PTR _error_mark_node
	mov	DWORD PTR _next1$1916[ebp], eax
; Line 3578
	mov	eax, DWORD PTR _tail$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _tail$[ebp], eax
; Line 3579
$L1922:
; Line 3581
	mov	eax, DWORD PTR _next1$1916[ebp]
	cmp	DWORD PTR _error_mark_node, eax
	jne	$L1923
; Line 3582
	mov	DWORD PTR _error_flag$[ebp], 1
; Line 3583
	jmp	$L1924
$L1923:
	mov	eax, DWORD PTR _next1$1916[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 6
	test	al, 1
	jne	$L1925
; Line 3584
	mov	DWORD PTR _allconstant$[ebp], 0
; Line 3585
	jmp	$L1926
$L1925:
	mov	eax, DWORD PTR _next1$1916[ebp]
	push	eax
	call	_initializer_constant_valid_p
	add	esp, 4
	or	eax, eax
	jne	$L1927
; Line 3586
	mov	DWORD PTR _allsimple$[ebp], 0
; Line 3587
$L1927:
$L1926:
$L1924:
	mov	eax, DWORD PTR _members$[ebp]
	push	eax
	mov	eax, DWORD PTR _next1$1916[ebp]
	push	eax
	push	0
	call	_tree_cons
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _members$[ebp], eax
; Line 3588
	jmp	$L1913
$L1914:
; Line 3590
$L1906:
	mov	eax, DWORD PTR _type$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 19					; 00000013H
	jne	$L1928
; Line 3595
	mov	eax, DWORD PTR _type$[ebp]
	mov	eax, DWORD PTR [eax+20]
	mov	DWORD PTR _field$1929[ebp], eax
	jmp	$L1930
$L1931:
	mov	eax, DWORD PTR _field$1929[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _field$1929[ebp], eax
$L1930:
	cmp	DWORD PTR _field$1929[ebp], 0
	je	$L1932
	cmp	DWORD PTR _tail$[ebp], 0
	je	$L1932
; Line 3599
	mov	eax, DWORD PTR _field$1929[ebp]
	cmp	DWORD PTR [eax+40], 0
	jne	$L1934
; Line 3601
	mov	eax, DWORD PTR _members$[ebp]
	push	eax
	mov	eax, DWORD PTR _integer_zero_node
	push	eax
	mov	eax, DWORD PTR _field$1929[ebp]
	push	eax
	call	_tree_cons
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _members$[ebp], eax
; Line 3602
	jmp	$L1931
; Line 3605
$L1934:
	mov	eax, DWORD PTR _tail$[ebp]
	cmp	DWORD PTR [eax+24], 0
	je	$L1935
; Line 3607
	mov	eax, DWORD PTR _tail$[ebp]
	mov	DWORD PTR _tail1$1936[ebp], eax
; Line 3609
	lea	eax, DWORD PTR _tail1$1936[ebp]
	push	eax
	mov	eax, DWORD PTR _tail$[ebp]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	mov	eax, DWORD PTR _field$1929[ebp]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	call	_digest_init
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _next1$1933[ebp], eax
; Line 3610
	cmp	DWORD PTR _tail1$1936[ebp], 0
	je	$L1937
	mov	eax, DWORD PTR _tail1$1936[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 3
	je	$L1937
; Line 3611
	call	_abort
; Line 3612
$L1937:
	mov	eax, DWORD PTR _tail1$1936[ebp]
	mov	DWORD PTR _tail$[ebp], eax
; Line 3614
	jmp	$L1938
$L1935:
; Line 3616
	mov	eax, DWORD PTR _error_mark_node
	mov	DWORD PTR _next1$1933[ebp], eax
; Line 3617
	mov	eax, DWORD PTR _tail$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _tail$[ebp], eax
; Line 3618
$L1938:
; Line 3620
	mov	eax, DWORD PTR _next1$1933[ebp]
	cmp	DWORD PTR _error_mark_node, eax
	jne	$L1939
; Line 3621
	mov	DWORD PTR _error_flag$[ebp], 1
; Line 3622
	jmp	$L1940
$L1939:
	mov	eax, DWORD PTR _next1$1933[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 6
	test	al, 1
	jne	$L1941
; Line 3623
	mov	DWORD PTR _allconstant$[ebp], 0
; Line 3624
	jmp	$L1942
$L1941:
	mov	eax, DWORD PTR _next1$1933[ebp]
	push	eax
	call	_initializer_constant_valid_p
	add	esp, 4
	or	eax, eax
	jne	$L1943
; Line 3625
	mov	DWORD PTR _allsimple$[ebp], 0
; Line 3626
$L1943:
$L1942:
$L1940:
	mov	eax, DWORD PTR _members$[ebp]
	push	eax
	mov	eax, DWORD PTR _next1$1933[ebp]
	push	eax
	mov	eax, DWORD PTR _field$1929[ebp]
	push	eax
	call	_tree_cons
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _members$[ebp], eax
; Line 3627
	jmp	$L1931
$L1932:
; Line 3630
$L1928:
	mov	eax, DWORD PTR _type$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 20					; 00000014H
	jne	$L1944
; Line 3632
	mov	eax, DWORD PTR _type$[ebp]
	mov	eax, DWORD PTR [eax+20]
	mov	DWORD PTR _field$1945[ebp], eax
; Line 3637
	mov	eax, DWORD PTR _tail$[ebp]
	cmp	DWORD PTR [eax+24], 0
	je	$L1947
; Line 3639
	mov	eax, DWORD PTR _tail$[ebp]
	mov	DWORD PTR _tail1$1948[ebp], eax
; Line 3641
	lea	eax, DWORD PTR _tail1$1948[ebp]
	push	eax
	mov	eax, DWORD PTR _tail$[ebp]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	mov	eax, DWORD PTR _field$1945[ebp]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	call	_digest_init
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _next1$1946[ebp], eax
; Line 3642
	cmp	DWORD PTR _tail1$1948[ebp], 0
	je	$L1949
	mov	eax, DWORD PTR _tail1$1948[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 3
	je	$L1949
; Line 3643
	call	_abort
; Line 3644
$L1949:
	mov	eax, DWORD PTR _tail1$1948[ebp]
	mov	DWORD PTR _tail$[ebp], eax
; Line 3646
	jmp	$L1950
$L1947:
; Line 3648
	mov	eax, DWORD PTR _error_mark_node
	mov	DWORD PTR _next1$1946[ebp], eax
; Line 3649
	mov	eax, DWORD PTR _tail$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _tail$[ebp], eax
; Line 3650
$L1950:
; Line 3652
	mov	eax, DWORD PTR _error_mark_node
	cmp	DWORD PTR _next1$1946[ebp], eax
	jne	$L1951
; Line 3653
	mov	DWORD PTR _error_flag$[ebp], 1
; Line 3654
	jmp	$L1952
$L1951:
	mov	eax, DWORD PTR _next1$1946[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 6
	test	al, 1
	jne	$L1953
; Line 3655
	mov	DWORD PTR _allconstant$[ebp], 0
; Line 3656
	jmp	$L1954
$L1953:
	mov	eax, DWORD PTR _next1$1946[ebp]
	push	eax
	call	_initializer_constant_valid_p
	add	esp, 4
	or	eax, eax
	jne	$L1955
; Line 3657
	mov	DWORD PTR _allsimple$[ebp], 0
; Line 3658
$L1955:
$L1954:
$L1952:
	mov	eax, DWORD PTR _members$[ebp]
	push	eax
	mov	eax, DWORD PTR _next1$1946[ebp]
	push	eax
	mov	eax, DWORD PTR _field$1945[ebp]
	push	eax
	call	_tree_cons
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _members$[ebp], eax
; Line 3662
$L1944:
	cmp	DWORD PTR _elts$[ebp], 0
	je	$L1956
; Line 3663
	mov	eax, DWORD PTR _tail$[ebp]
	mov	ecx, DWORD PTR _elts$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 3666
	jmp	$L1957
$L1956:
	cmp	DWORD PTR _tail$[ebp], 0
	je	$L1958
; Line 3667
	push	OFFSET $SG1959
	call	_warning
	add	esp, 4
; Line 3669
$L1958:
$L1957:
	cmp	DWORD PTR _error_flag$[ebp], 0
	je	$L1960
; Line 3670
	mov	eax, DWORD PTR _error_mark_node
	jmp	$L1897
; Line 3672
$L1960:
	mov	eax, DWORD PTR _members$[ebp]
	push	eax
	call	_nreverse
	add	esp, 4
	push	eax
	push	0
	mov	eax, DWORD PTR _type$[ebp]
	push	eax
	push	52					; 00000034H
	call	_build
	add	esp, 16					; 00000010H
	mov	DWORD PTR _result$[ebp], eax
; Line 3673
	cmp	DWORD PTR _allconstant$[ebp], 0
	je	$L1961
	mov	eax, DWORD PTR _result$[ebp]
	mov	eax, DWORD PTR [eax+16]
	or	eax, 64					; 00000040H
	mov	ecx, DWORD PTR _result$[ebp]
	mov	DWORD PTR [ecx+16], eax
; Line 3674
$L1961:
	cmp	DWORD PTR _allconstant$[ebp], 0
	je	$L1962
	cmp	DWORD PTR _allsimple$[ebp], 0
	je	$L1962
	mov	eax, DWORD PTR _result$[ebp]
	mov	eax, DWORD PTR [eax+16]
	or	eax, 4
	mov	ecx, DWORD PTR _result$[ebp]
	mov	DWORD PTR [ecx+16], eax
; Line 3675
$L1962:
	mov	eax, DWORD PTR _result$[ebp]
	jmp	$L1897
; Line 3676
$L1897:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_process_init_constructor ENDP
_TEXT	ENDS
PUBLIC	_c_expand_asm_operands
EXTRN	_expand_expr:NEAR
EXTRN	_emit_queue:NEAR
EXTRN	_alloca:NEAR
EXTRN	_expand_asm_operands:NEAR
_DATA	SEGMENT
	ORG $+3
$SG1991	DB	'modification by `asm''', 00H
_DATA	ENDS
_TEXT	SEGMENT
_type$1987 = -20
_string$ = 8
_outputs$ = 12
_inputs$ = 16
_clobbers$ = 20
_vol$ = 24
_filename$ = 28
_line$ = 32
_noutputs$ = -12
_i$ = -4
_o$ = -8
_tail$ = -16
_c_expand_asm_operands PROC NEAR
; Line 3690
	push	ebp
	mov	ebp, esp
	sub	esp, 20					; 00000014H
	push	ebx
	push	esi
	push	edi
; Line 3691
	mov	eax, DWORD PTR _outputs$[ebp]
	push	eax
	call	_list_length
	add	esp, 4
	mov	DWORD PTR _noutputs$[ebp], eax
; Line 3694
	mov	eax, DWORD PTR _noutputs$[ebp]
	shl	eax, 2
	push	eax
	call	_alloca
	add	esp, 4
	mov	DWORD PTR _o$[ebp], eax
; Line 3698
	mov	DWORD PTR _i$[ebp], 0
	mov	eax, DWORD PTR _outputs$[ebp]
	mov	DWORD PTR _tail$[ebp], eax
	jmp	$L1977
$L1978:
	mov	eax, DWORD PTR _tail$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _tail$[ebp], eax
	inc	DWORD PTR _i$[ebp]
$L1977:
	cmp	DWORD PTR _tail$[ebp], 0
	je	$L1979
; Line 3699
	mov	eax, DWORD PTR _tail$[ebp]
	mov	eax, DWORD PTR [eax+24]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _o$[ebp]
	mov	DWORD PTR [edx+ecx*4], eax
	jmp	$L1978
$L1979:
; Line 3710
	mov	eax, DWORD PTR _line$[ebp]
	push	eax
	mov	eax, DWORD PTR _filename$[ebp]
	push	eax
	mov	eax, DWORD PTR _vol$[ebp]
	push	eax
	mov	eax, DWORD PTR _clobbers$[ebp]
	push	eax
	mov	eax, DWORD PTR _inputs$[ebp]
	push	eax
	mov	eax, DWORD PTR _outputs$[ebp]
	push	eax
	mov	eax, DWORD PTR _string$[ebp]
	push	eax
	call	_expand_asm_operands
	add	esp, 28					; 0000001cH
; Line 3713
	mov	DWORD PTR _i$[ebp], 0
	mov	eax, DWORD PTR _outputs$[ebp]
	mov	DWORD PTR _tail$[ebp], eax
	jmp	$L1981
$L1982:
	mov	eax, DWORD PTR _tail$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _tail$[ebp], eax
	inc	DWORD PTR _i$[ebp]
$L1981:
	cmp	DWORD PTR _tail$[ebp], 0
	je	$L1983
; Line 3715
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _o$[ebp]
	mov	edx, DWORD PTR _tail$[ebp]
	mov	edx, DWORD PTR [edx+24]
	cmp	DWORD PTR [ecx+eax*4], edx
	je	$L1984
; Line 3717
	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _tail$[ebp]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	push	113					; 00000071H
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _o$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4]
	push	eax
	call	_build_modify_expr
	add	esp, 12					; 0000000cH
	push	eax
	call	_expand_expr
	add	esp, 16					; 00000010H
; Line 3720
	jmp	$L1986
$L1984:
; Line 3722
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _o$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _type$1987[ebp], eax
; Line 3726
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _o$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 5
	test	al, 1
	jne	$L1989
	mov	eax, DWORD PTR _type$1987[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 19					; 00000013H
	je	$L1990
	mov	eax, DWORD PTR _type$1987[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 20					; 00000014H
	jne	$L1988
$L1990:
	mov	eax, DWORD PTR _type$1987[ebp]
	mov	al, BYTE PTR [eax+38]
	and	eax, 255				; 000000ffH
	or	eax, eax
	je	$L1988
$L1989:
; Line 3727
	push	OFFSET $SG1991
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _o$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4]
	push	eax
	call	_readonly_warning
	add	esp, 8
; Line 3728
$L1988:
$L1986:
; Line 3729
	jmp	$L1982
$L1983:
; Line 3732
	call	_emit_queue
; Line 3733
$L1971:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_c_expand_asm_operands ENDP
_TEXT	ENDS
PUBLIC	_c_expand_return
EXTRN	_expand_null_return:NEAR
EXTRN	_expand_return:NEAR
EXTRN	_current_function_returns_value:DWORD
EXTRN	_current_function_returns_null:DWORD
EXTRN	_warn_return_type:DWORD
_DATA	SEGMENT
	ORG $+2
$SG1998	DB	'function declared `volatile'' has a `return'' statement', 00H
	ORG $+2
$SG2001	DB	'`return'' with no value, in function returning non-void', 00H
	ORG $+1
$SG2007	DB	'`return'' with a value, in function returning void', 00H
	ORG $+2
$SG2010	DB	'return', 00H
_DATA	ENDS
_TEXT	SEGMENT
_retval$ = 8
_valtype$ = -4
_t$2009 = -8
_res$2011 = -12
_c_expand_return PROC NEAR
; Line 3742
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
	push	ebx
	push	esi
	push	edi
; Line 3743
	mov	eax, DWORD PTR _current_function_decl
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _valtype$[ebp], eax
; Line 3745
	mov	eax, DWORD PTR _current_function_decl
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 11					; 0000000bH
	test	al, 1
	je	$L1997
; Line 3746
	push	OFFSET $SG1998
	call	_warning
	add	esp, 4
; Line 3748
$L1997:
	cmp	DWORD PTR _retval$[ebp], 0
	jne	$L1999
; Line 3750
	mov	DWORD PTR _current_function_returns_null, 1
; Line 3751
	cmp	DWORD PTR _warn_return_type, 0
	je	$L2000
	cmp	DWORD PTR _valtype$[ebp], 0
	je	$L2000
	mov	eax, DWORD PTR _valtype$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 4
	je	$L2000
; Line 3752
	push	OFFSET $SG2001
	call	_warning
	add	esp, 4
; Line 3753
$L2000:
	call	_expand_null_return
; Line 3755
	jmp	$L2002
$L1999:
	cmp	DWORD PTR _valtype$[ebp], 0
	je	$L2004
	mov	eax, DWORD PTR _valtype$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 4
	jne	$L2003
$L2004:
; Line 3757
	mov	DWORD PTR _current_function_returns_null, 1
; Line 3758
	cmp	DWORD PTR _pedantic, 0
	jne	$L2006
	mov	eax, DWORD PTR _retval$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 4
	je	$L2005
$L2006:
; Line 3759
	push	OFFSET $SG2007
	call	_warning
	add	esp, 4
; Line 3760
$L2005:
	mov	eax, DWORD PTR _retval$[ebp]
	push	eax
	call	_expand_return
	add	esp, 4
; Line 3762
	jmp	$L2008
$L2003:
; Line 3764
	push	OFFSET $SG2010
	mov	eax, DWORD PTR _retval$[ebp]
	push	eax
	mov	eax, DWORD PTR _valtype$[ebp]
	push	eax
	call	_convert_for_assignment
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _t$2009[ebp], eax
; Line 3765
	mov	eax, DWORD PTR _current_function_decl
	mov	eax, DWORD PTR [eax+60]
	mov	DWORD PTR _res$2011[ebp], eax
; Line 3767
	mov	eax, DWORD PTR _t$2009[ebp]
	push	eax
	mov	eax, DWORD PTR _res$2011[ebp]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	call	_convert
	add	esp, 8
	push	eax
	mov	eax, DWORD PTR _res$2011[ebp]
	push	eax
	mov	eax, DWORD PTR _res$2011[ebp]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	push	54					; 00000036H
	call	_build
	add	esp, 16					; 00000010H
	mov	DWORD PTR _t$2009[ebp], eax
; Line 3768
	mov	eax, DWORD PTR _t$2009[ebp]
	push	eax
	call	_expand_return
	add	esp, 4
; Line 3769
	mov	DWORD PTR _current_function_returns_value, 1
; Line 3770
$L2008:
$L2002:
; Line 3771
$L1995:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_c_expand_return ENDP
_TEXT	ENDS
PUBLIC	_c_expand_start_case
EXTRN	_expand_start_case:NEAR
_DATA	SEGMENT
	ORG $+1
$SG2017	DB	'switch quantity not an integer', 00H
_DATA	ENDS
_TEXT	SEGMENT
_exp$ = 8
_code$ = -8
_type$ = -4
_index$2019 = -12
_c_expand_start_case PROC NEAR
; Line 3779
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
	push	ebx
	push	esi
	push	edi
; Line 3780
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	mov	DWORD PTR _code$[ebp], eax
; Line 3781
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _type$[ebp], eax
; Line 3783
	cmp	DWORD PTR _code$[ebp], 5
	je	$L2016
	cmp	DWORD PTR _code$[ebp], 8
	je	$L2016
	cmp	DWORD PTR _code$[ebp], 0
	je	$L2016
; Line 3785
	push	OFFSET $SG2017
	call	_error
	add	esp, 4
; Line 3786
	mov	eax, DWORD PTR _error_mark_node
	mov	DWORD PTR _exp$[ebp], eax
; Line 3788
	jmp	$L2018
$L2016:
; Line 3792
	mov	eax, DWORD PTR _exp$[ebp]
	push	eax
	call	_default_conversion
	add	esp, 4
	mov	DWORD PTR _exp$[ebp], eax
; Line 3793
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _type$[ebp], eax
; Line 3794
	push	0
	mov	eax, DWORD PTR _exp$[ebp]
	push	eax
	call	_get_unwidened
	add	esp, 8
	mov	DWORD PTR _index$2019[ebp], eax
; Line 3800
	sub	eax, eax
	mov	ecx, DWORD PTR _index$2019[ebp]
	mov	ecx, DWORD PTR [ecx+8]
	mov	ecx, DWORD PTR [ecx+16]
	shr	ecx, 12					; 0000000cH
	mov	edx, DWORD PTR _exp$[ebp]
	mov	edx, DWORD PTR [edx+8]
	mov	edx, DWORD PTR [edx+16]
	shr	edx, 12					; 0000000cH
	and	edx, 1
	xor	ecx, edx
	and	ecx, 1
	cmp	eax, ecx
	jne	$L2020
; Line 3801
	mov	eax, DWORD PTR _index$2019[ebp]
	mov	DWORD PTR _exp$[ebp], eax
; Line 3802
$L2020:
$L2018:
; Line 3804
	mov	eax, DWORD PTR _type$[ebp]
	push	eax
	mov	eax, DWORD PTR _exp$[ebp]
	push	eax
	push	1
	call	_expand_start_case
	add	esp, 12					; 0000000cH
; Line 3806
	mov	eax, DWORD PTR _exp$[ebp]
	jmp	$L2013
; Line 3807
$L2013:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_c_expand_start_case ENDP
_TEXT	ENDS
END
