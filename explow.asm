	TITLE	explow.c
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
PUBLIC	_plus_constant
EXTRN	_gen_rtx:NEAR
_TEXT	SEGMENT
; File explow.c
_x$ = 8
_c$ = 12
_code$ = -8
_mode$ = -4
_all_constant$ = -12
_plus_constant PROC NEAR
; Line 33
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
	push	ebx
	push	esi
	push	edi
; Line 34
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	sar	eax, 16					; 00000010H
	mov	DWORD PTR _code$[ebp], eax
; Line 35
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	mov	DWORD PTR _mode$[ebp], eax
; Line 36
	mov	DWORD PTR _all_constant$[ebp], 0
; Line 38
	cmp	DWORD PTR _c$[ebp], 0
	jne	$L915
; Line 39
	mov	eax, DWORD PTR _x$[ebp]
	jmp	$L911
; Line 41
$L915:
	cmp	DWORD PTR _code$[ebp], 30		; 0000001eH
	jne	$L916
; Line 42
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	add	eax, DWORD PTR _c$[ebp]
	push	eax
	push	0
	push	30					; 0000001eH
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	jmp	$L911
; Line 46
$L916:
	cmp	DWORD PTR _code$[ebp], 32		; 00000020H
	jne	$L917
; Line 48
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _x$[ebp], eax
; Line 49
	mov	DWORD PTR _all_constant$[ebp], 1
; Line 51
	jmp	$L918
$L917:
	cmp	DWORD PTR _code$[ebp], 39		; 00000027H
	je	$L920
	cmp	DWORD PTR _code$[ebp], 38		; 00000026H
	jne	$L919
$L920:
; Line 52
	mov	DWORD PTR _all_constant$[ebp], 1
; Line 60
$L919:
$L918:
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2883584				; 002c0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L921
; Line 62
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L922
; Line 64
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	add	DWORD PTR _c$[ebp], eax
; Line 65
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _x$[ebp], eax
; Line 67
	jmp	$L923
$L922:
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L924
; Line 69
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+4]
	add	DWORD PTR _c$[ebp], eax
; Line 70
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _x$[ebp], eax
; Line 72
	jmp	$L925
$L924:
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2490368				; 00260000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L927
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2555904				; 00270000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L927
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L927
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2097152				; 00200000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L926
$L927:
; Line 76
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	mov	eax, DWORD PTR _c$[ebp]
	push	eax
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	call	_plus_constant
	add	esp, 8
	push	eax
	mov	eax, DWORD PTR _mode$[ebp]
	push	eax
	push	44					; 0000002cH
	call	_gen_rtx
	add	esp, 16					; 00000010H
	jmp	$L911
; Line 78
	jmp	$L928
$L926:
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2490368				; 00260000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L930
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2555904				; 00270000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L930
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L930
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2097152				; 00200000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L929
$L930:
; Line 82
	mov	eax, DWORD PTR _c$[ebp]
	push	eax
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	call	_plus_constant
	add	esp, 8
	push	eax
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	mov	eax, DWORD PTR _mode$[ebp]
	push	eax
	push	44					; 0000002cH
	call	_gen_rtx
	add	esp, 16					; 00000010H
	jmp	$L911
; Line 101
$L929:
$L928:
$L925:
$L923:
; Line 102
$L921:
	cmp	DWORD PTR _c$[ebp], 0
	je	$L931
; Line 103
	mov	eax, DWORD PTR _c$[ebp]
	push	eax
	push	0
	push	30					; 0000001eH
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	push	eax
	mov	eax, DWORD PTR _x$[ebp]
	push	eax
	mov	eax, DWORD PTR _mode$[ebp]
	push	eax
	push	44					; 0000002cH
	call	_gen_rtx
	add	esp, 16					; 00000010H
	mov	DWORD PTR _x$[ebp], eax
; Line 105
$L931:
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2555904				; 00270000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L933
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2490368				; 00260000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L932
$L933:
; Line 106
	mov	eax, DWORD PTR _x$[ebp]
	jmp	$L911
; Line 107
	jmp	$L934
$L932:
	cmp	DWORD PTR _all_constant$[ebp], 0
	je	$L935
; Line 108
	mov	eax, DWORD PTR _x$[ebp]
	push	eax
	mov	eax, DWORD PTR _mode$[ebp]
	push	eax
	push	32					; 00000020H
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	jmp	$L911
; Line 109
	jmp	$L936
$L935:
; Line 110
	mov	eax, DWORD PTR _x$[ebp]
	jmp	$L911
$L936:
$L934:
; Line 111
$L911:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_plus_constant ENDP
_TEXT	ENDS
PUBLIC	_eliminate_constant_term
_TEXT	SEGMENT
_x$ = 8
_constptr$ = 12
_c$ = -8
_x0$ = -12
_x1$ = -4
_eliminate_constant_term PROC NEAR
; Line 122
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
	push	ebx
	push	esi
	push	edi
; Line 126
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2883584				; 002c0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L943
; Line 127
	mov	eax, DWORD PTR _x$[ebp]
	jmp	$L939
; Line 130
$L943:
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L944
; Line 132
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _constptr$[ebp]
	add	DWORD PTR [ecx], eax
; Line 133
	mov	eax, DWORD PTR _constptr$[ebp]
	push	eax
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	call	_eliminate_constant_term
	add	esp, 8
	jmp	$L939
; Line 136
$L944:
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L945
; Line 138
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _constptr$[ebp]
	add	DWORD PTR [ecx], eax
; Line 139
	mov	eax, DWORD PTR _constptr$[ebp]
	push	eax
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	call	_eliminate_constant_term
	add	esp, 8
	jmp	$L939
; Line 142
$L945:
	mov	DWORD PTR _c$[ebp], 0
; Line 143
	lea	eax, DWORD PTR _c$[ebp]
	push	eax
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	call	_eliminate_constant_term
	add	esp, 8
	mov	DWORD PTR _x0$[ebp], eax
; Line 144
	lea	eax, DWORD PTR _c$[ebp]
	push	eax
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	call	_eliminate_constant_term
	add	esp, 8
	mov	DWORD PTR _x1$[ebp], eax
; Line 145
	mov	eax, DWORD PTR _x$[ebp]
	mov	ecx, DWORD PTR _x1$[ebp]
	cmp	DWORD PTR [eax+8], ecx
	jne	$L947
	mov	eax, DWORD PTR _x$[ebp]
	mov	ecx, DWORD PTR _x0$[ebp]
	cmp	DWORD PTR [eax+4], ecx
	je	$L946
$L947:
; Line 147
	mov	eax, DWORD PTR _c$[ebp]
	mov	ecx, DWORD PTR _constptr$[ebp]
	add	DWORD PTR [ecx], eax
; Line 148
	mov	eax, DWORD PTR _x1$[ebp]
	push	eax
	mov	eax, DWORD PTR _x0$[ebp]
	push	eax
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	push	eax
	push	44					; 0000002cH
	call	_gen_rtx
	add	esp, 16					; 00000010H
	jmp	$L939
; Line 150
$L946:
	mov	eax, DWORD PTR _x$[ebp]
	jmp	$L939
; Line 151
$L939:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_eliminate_constant_term ENDP
_TEXT	ENDS
PUBLIC	_expr_size
EXTRN	_expand_expr:NEAR
EXTRN	_size_in_bytes:NEAR
_TEXT	SEGMENT
_exp$ = 8
_expr_size PROC NEAR
; Line 158
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 159
	push	0
	push	4
	push	0
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	call	_size_in_bytes
	add	esp, 4
	push	eax
	call	_expand_expr
	add	esp, 16					; 00000010H
	jmp	$L949
; Line 160
$L949:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_expr_size ENDP
_TEXT	ENDS
PUBLIC	_lookup_static_chain
EXTRN	_abort:NEAR
_TEXT	SEGMENT
_lookup_static_chain PROC NEAR
; Line 167
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 168
	call	_abort
; Line 169
$L951:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_lookup_static_chain ENDP
_TEXT	ENDS
PUBLIC	_force_reg
EXTRN	_mark_reg_pointer:NEAR
_TEXT	SEGMENT
_op0$963 = -8
_op1$964 = -12
_x$ = 8
_temp$958 = -4
_break_out_memory_refs PROC NEAR
; Line 186
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
	push	ebx
	push	esi
	push	edi
; Line 188
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2424832				; 00250000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L957
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2097152				; 00200000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L957
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2555904				; 00270000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L956
$L957:
; Line 190
	mov	eax, DWORD PTR _x$[ebp]
	push	eax
	push	4
	call	_force_reg
	add	esp, 8
	mov	DWORD PTR _temp$958[ebp], eax
; Line 191
	mov	eax, DWORD PTR _temp$958[ebp]
	push	eax
	call	_mark_reg_pointer
	add	esp, 4
; Line 192
	mov	eax, DWORD PTR _temp$958[ebp]
	mov	DWORD PTR _x$[ebp], eax
; Line 194
	jmp	$L960
$L956:
; Line 195
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2883584				; 002c0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L962
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2949120				; 002d0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L962
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 3080192				; 002f0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L961
$L962:
; Line 197
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	call	_break_out_memory_refs
	add	esp, 4
	mov	DWORD PTR _op0$963[ebp], eax
; Line 198
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	call	_break_out_memory_refs
	add	esp, 4
	mov	DWORD PTR _op1$964[ebp], eax
; Line 199
	mov	eax, DWORD PTR _x$[ebp]
	mov	ecx, DWORD PTR _op0$963[ebp]
	cmp	DWORD PTR [eax+4], ecx
	jne	$L966
	mov	eax, DWORD PTR _x$[ebp]
	mov	ecx, DWORD PTR _op1$964[ebp]
	cmp	DWORD PTR [eax+8], ecx
	je	$L965
$L966:
; Line 200
	mov	eax, DWORD PTR _op1$964[ebp]
	push	eax
	mov	eax, DWORD PTR _op0$963[ebp]
	push	eax
	push	4
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	sar	eax, 16					; 00000010H
	push	eax
	call	_gen_rtx
	add	esp, 16					; 00000010H
	mov	DWORD PTR _x$[ebp], eax
; Line 201
$L965:
; Line 202
$L961:
$L960:
	mov	eax, DWORD PTR _x$[ebp]
	jmp	$L955
; Line 203
$L955:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_break_out_memory_refs ENDP
_TEXT	ENDS
PUBLIC	_copy_all_regs
PUBLIC	_copy_to_reg
_TEXT	SEGMENT
_x$ = 8
_op0$976 = -4
_op1$977 = -8
_copy_all_regs PROC NEAR
; Line 221
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	push	ebx
	push	esi
	push	edi
; Line 222
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L969
; Line 224
	mov	eax, DWORD PTR _x$[ebp]
	cmp	DWORD PTR [eax+4], 6
	je	$L970
; Line 225
	mov	eax, DWORD PTR _x$[ebp]
	push	eax
	call	_copy_to_reg
	add	esp, 4
	mov	DWORD PTR _x$[ebp], eax
; Line 226
$L970:
; Line 227
	jmp	$L971
$L969:
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2424832				; 00250000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L972
; Line 228
	mov	eax, DWORD PTR _x$[ebp]
	push	eax
	call	_copy_to_reg
	add	esp, 4
	mov	DWORD PTR _x$[ebp], eax
; Line 229
	jmp	$L973
$L972:
; Line 230
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2883584				; 002c0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L975
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2949120				; 002d0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L975
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 3080192				; 002f0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L974
$L975:
; Line 232
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	call	_copy_all_regs
	add	esp, 4
	mov	DWORD PTR _op0$976[ebp], eax
; Line 233
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	call	_copy_all_regs
	add	esp, 4
	mov	DWORD PTR _op1$977[ebp], eax
; Line 234
	mov	eax, DWORD PTR _x$[ebp]
	mov	ecx, DWORD PTR _op0$976[ebp]
	cmp	DWORD PTR [eax+4], ecx
	jne	$L979
	mov	eax, DWORD PTR _x$[ebp]
	mov	ecx, DWORD PTR _op1$977[ebp]
	cmp	DWORD PTR [eax+8], ecx
	je	$L978
$L979:
; Line 235
	mov	eax, DWORD PTR _op1$977[ebp]
	push	eax
	mov	eax, DWORD PTR _op0$976[ebp]
	push	eax
	push	4
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	sar	eax, 16					; 00000010H
	push	eax
	call	_gen_rtx
	add	esp, 16					; 00000010H
	mov	DWORD PTR _x$[ebp], eax
; Line 236
$L978:
; Line 237
$L974:
$L973:
$L971:
	mov	eax, DWORD PTR _x$[ebp]
	jmp	$L968
; Line 238
$L968:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_copy_all_regs ENDP
_TEXT	ENDS
PUBLIC	_memory_address
EXTRN	_general_operand:NEAR
EXTRN	_optimize:DWORD
EXTRN	_frame_pointer_rtx:DWORD
EXTRN	_arg_pointer_rtx:DWORD
EXTRN	_gen_reg_rtx:NEAR
EXTRN	_flag_force_addr:DWORD
EXTRN	_memory_address_p:NEAR
EXTRN	_force_operand:NEAR
EXTRN	_cse_not_expected:DWORD
EXTRN	_emit_move_insn:NEAR
_TEXT	SEGMENT
_mode$ = 8
_x$ = 12
_oldx$ = -4
_ch$1062 = -8
_temp$1140 = -16
_val$1141 = -12
_temp$1146 = -24
_val$1147 = -20
_constant_term$1150 = -28
_y$1151 = -32
_memory_address PROC NEAR
; Line 248
	push	ebp
	mov	ebp, esp
	sub	esp, 32					; 00000020H
	push	ebx
	push	esi
	push	edi
; Line 253
	cmp	DWORD PTR _cse_not_expected, 0
	jne	$L984
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2490368				; 00260000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L985
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2555904				; 00270000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L985
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L985
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2097152				; 00200000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L984
$L985:
; Line 254
	mov	eax, DWORD PTR _x$[ebp]
	push	eax
	push	4
	call	_force_reg
	add	esp, 8
	jmp	$L982
; Line 260
$L984:
; Line 261
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2686976				; 00290000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L986
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L986
; Line 262
	mov	eax, DWORD PTR _x$[ebp]
	jmp	$L982
; Line 268
$L986:
	mov	eax, DWORD PTR _x$[ebp]
	mov	DWORD PTR _oldx$[ebp], eax
; Line 269
	cmp	DWORD PTR _cse_not_expected, 0
	jne	$L987
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L987
; Line 270
	mov	eax, DWORD PTR _x$[ebp]
	push	eax
	call	_break_out_memory_refs
	add	esp, 4
	mov	DWORD PTR _x$[ebp], eax
; Line 273
$L987:
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2490368				; 00260000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L989
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2555904				; 00270000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L989
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L989
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2097152				; 00200000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L988
$L989:
	jmp	$win$990
$L988:
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L993
	mov	eax, DWORD PTR _x$[ebp]
	cmp	DWORD PTR [eax+4], 7
	jl	$L992
	mov	eax, DWORD PTR _x$[ebp]
	cmp	DWORD PTR [eax+4], 10			; 0000000aH
	jge	$L992
$L993:
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 3080192				; 002f0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L991
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L991
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	cmp	DWORD PTR [eax+4], 7
	jl	$L994
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	cmp	DWORD PTR [eax+4], 10			; 0000000aH
	jl	$L991
$L994:
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L991
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	cmp	DWORD PTR [eax+4], 2
	je	$L995
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	cmp	DWORD PTR [eax+4], 4
	je	$L995
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	cmp	DWORD PTR [eax+4], 8
	jne	$L991
$L995:
$L992:
	jmp	$win$990
$L991:
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L996
	mov	eax, DWORD PTR _x$[ebp]
	cmp	DWORD PTR [eax+4], 7
	jle	$L997
	mov	eax, DWORD PTR _x$[ebp]
	cmp	DWORD PTR [eax+4], 10			; 0000000aH
	jl	$L996
$L997:
	jmp	$win$990
$L996:
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2883584				; 002c0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L998
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1000
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	cmp	DWORD PTR [eax+4], 7
	jl	$L999
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	cmp	DWORD PTR [eax+4], 10			; 0000000aH
	jge	$L999
$L1000:
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 3080192				; 002f0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L998
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L998
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	cmp	DWORD PTR [eax+4], 7
	jl	$L1001
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	cmp	DWORD PTR [eax+4], 10			; 0000000aH
	jl	$L998
$L1001:
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L998
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+8]
	cmp	DWORD PTR [eax+4], 2
	je	$L1002
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+8]
	cmp	DWORD PTR [eax+4], 4
	je	$L1002
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+8]
	cmp	DWORD PTR [eax+4], 8
	jne	$L998
$L1002:
$L999:
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1003
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	cmp	DWORD PTR [eax+4], 7
	jle	$L1004
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	cmp	DWORD PTR [eax+4], 10			; 0000000aH
	jl	$L1003
$L1004:
	jmp	$win$990
$L1003:
$L998:
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2883584				; 002c0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1005
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1007
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	cmp	DWORD PTR [eax+4], 7
	jl	$L1006
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	cmp	DWORD PTR [eax+4], 10			; 0000000aH
	jge	$L1006
$L1007:
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 3080192				; 002f0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1005
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1005
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+4]
	cmp	DWORD PTR [eax+4], 7
	jl	$L1008
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+4]
	cmp	DWORD PTR [eax+4], 10			; 0000000aH
	jl	$L1005
$L1008:
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1005
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+8]
	cmp	DWORD PTR [eax+4], 2
	je	$L1009
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+8]
	cmp	DWORD PTR [eax+4], 4
	je	$L1009
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+8]
	cmp	DWORD PTR [eax+4], 8
	jne	$L1005
$L1009:
$L1006:
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1010
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	cmp	DWORD PTR [eax+4], 7
	jle	$L1011
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	cmp	DWORD PTR [eax+4], 10			; 0000000aH
	jl	$L1010
$L1011:
	jmp	$win$990
$L1010:
$L1005:
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2883584				; 002c0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1012
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2490368				; 00260000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1014
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2555904				; 00270000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1014
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1014
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2097152				; 00200000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1013
$L1014:
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1017
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	cmp	DWORD PTR [eax+4], 7
	jl	$L1016
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	cmp	DWORD PTR [eax+4], 10			; 0000000aH
	jge	$L1016
$L1017:
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 3080192				; 002f0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1015
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1015
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	cmp	DWORD PTR [eax+4], 7
	jl	$L1018
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	cmp	DWORD PTR [eax+4], 10			; 0000000aH
	jl	$L1015
$L1018:
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1015
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+8]
	cmp	DWORD PTR [eax+4], 2
	je	$L1019
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+8]
	cmp	DWORD PTR [eax+4], 4
	je	$L1019
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+8]
	cmp	DWORD PTR [eax+4], 8
	jne	$L1015
$L1019:
$L1016:
	jmp	$win$990
$L1015:
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1020
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	cmp	DWORD PTR [eax+4], 7
	jle	$L1021
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	cmp	DWORD PTR [eax+4], 10			; 0000000aH
	jl	$L1020
$L1021:
	jmp	$win$990
$L1020:
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2883584				; 002c0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1022
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1024
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	cmp	DWORD PTR [eax+4], 7
	jl	$L1023
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	cmp	DWORD PTR [eax+4], 10			; 0000000aH
	jge	$L1023
$L1024:
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 3080192				; 002f0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1022
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1022
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	cmp	DWORD PTR [eax+4], 7
	jl	$L1025
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	cmp	DWORD PTR [eax+4], 10			; 0000000aH
	jl	$L1022
$L1025:
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1022
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+8]
	cmp	DWORD PTR [eax+4], 2
	je	$L1026
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+8]
	cmp	DWORD PTR [eax+4], 4
	je	$L1026
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+8]
	cmp	DWORD PTR [eax+4], 8
	jne	$L1022
$L1026:
$L1023:
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1027
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+8]
	cmp	DWORD PTR [eax+4], 7
	jle	$L1028
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+8]
	cmp	DWORD PTR [eax+4], 10			; 0000000aH
	jl	$L1027
$L1028:
	jmp	$win$990
$L1027:
$L1022:
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2883584				; 002c0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1029
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1031
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+8]
	cmp	DWORD PTR [eax+4], 7
	jl	$L1030
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+8]
	cmp	DWORD PTR [eax+4], 10			; 0000000aH
	jge	$L1030
$L1031:
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 3080192				; 002f0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1029
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1029
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+4]
	cmp	DWORD PTR [eax+4], 7
	jl	$L1032
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+4]
	cmp	DWORD PTR [eax+4], 10			; 0000000aH
	jl	$L1029
$L1032:
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1029
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+8]
	cmp	DWORD PTR [eax+4], 2
	je	$L1033
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+8]
	cmp	DWORD PTR [eax+4], 4
	je	$L1033
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+8]
	cmp	DWORD PTR [eax+4], 8
	jne	$L1029
$L1033:
$L1030:
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1034
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	cmp	DWORD PTR [eax+4], 7
	jle	$L1035
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	cmp	DWORD PTR [eax+4], 10			; 0000000aH
	jl	$L1034
$L1035:
	jmp	$win$990
$L1034:
$L1029:
$L1013:
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2490368				; 00260000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1037
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2555904				; 00270000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1037
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1037
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2097152				; 00200000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1036
$L1037:
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1040
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	cmp	DWORD PTR [eax+4], 7
	jl	$L1039
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	cmp	DWORD PTR [eax+4], 10			; 0000000aH
	jge	$L1039
$L1040:
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 3080192				; 002f0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1038
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1038
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+4]
	cmp	DWORD PTR [eax+4], 7
	jl	$L1041
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+4]
	cmp	DWORD PTR [eax+4], 10			; 0000000aH
	jl	$L1038
$L1041:
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1038
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+8]
	cmp	DWORD PTR [eax+4], 2
	je	$L1042
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+8]
	cmp	DWORD PTR [eax+4], 4
	je	$L1042
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+8]
	cmp	DWORD PTR [eax+4], 8
	jne	$L1038
$L1042:
$L1039:
	jmp	$win$990
$L1038:
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1043
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	cmp	DWORD PTR [eax+4], 7
	jle	$L1044
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	cmp	DWORD PTR [eax+4], 10			; 0000000aH
	jl	$L1043
$L1044:
	jmp	$win$990
$L1043:
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2883584				; 002c0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1045
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1047
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+4]
	cmp	DWORD PTR [eax+4], 7
	jl	$L1046
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+4]
	cmp	DWORD PTR [eax+4], 10			; 0000000aH
	jge	$L1046
$L1047:
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 3080192				; 002f0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1045
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1045
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	cmp	DWORD PTR [eax+4], 7
	jl	$L1048
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	cmp	DWORD PTR [eax+4], 10			; 0000000aH
	jl	$L1045
$L1048:
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1045
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+8]
	cmp	DWORD PTR [eax+4], 2
	je	$L1049
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+8]
	cmp	DWORD PTR [eax+4], 4
	je	$L1049
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+8]
	cmp	DWORD PTR [eax+4], 8
	jne	$L1045
$L1049:
$L1046:
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1050
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+8]
	cmp	DWORD PTR [eax+4], 7
	jle	$L1051
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+8]
	cmp	DWORD PTR [eax+4], 10			; 0000000aH
	jl	$L1050
$L1051:
	jmp	$win$990
$L1050:
$L1045:
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2883584				; 002c0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1052
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1054
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+8]
	cmp	DWORD PTR [eax+4], 7
	jl	$L1053
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+8]
	cmp	DWORD PTR [eax+4], 10			; 0000000aH
	jge	$L1053
$L1054:
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 3080192				; 002f0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1052
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1052
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+4]
	cmp	DWORD PTR [eax+4], 7
	jl	$L1055
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+4]
	cmp	DWORD PTR [eax+4], 10			; 0000000aH
	jl	$L1052
$L1055:
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1052
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+8]
	cmp	DWORD PTR [eax+4], 2
	je	$L1056
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+8]
	cmp	DWORD PTR [eax+4], 4
	je	$L1056
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+8]
	cmp	DWORD PTR [eax+4], 8
	jne	$L1052
$L1056:
$L1053:
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1057
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+4]
	cmp	DWORD PTR [eax+4], 7
	jle	$L1058
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+4]
	cmp	DWORD PTR [eax+4], 10			; 0000000aH
	jl	$L1057
$L1058:
	jmp	$win$990
$L1057:
$L1052:
$L1036:
$L1012:
; Line 277
	mov	eax, DWORD PTR _oldx$[ebp]
	push	eax
	mov	eax, DWORD PTR _mode$[ebp]
	push	eax
	call	_memory_address_p
	add	esp, 8
	or	eax, eax
	je	$L1060
; Line 278
	jmp	$win2$1061
; Line 284
$L1060:
	mov	eax, DWORD PTR _oldx$[ebp]
	sub	eax, DWORD PTR _x$[ebp]
	cmp	eax, 1
	sbb	eax, eax
	inc	eax
	mov	DWORD PTR _ch$1062[ebp], eax
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2883584				; 002c0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1063
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 3080192				; 002f0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1064
	mov	DWORD PTR _ch$1062[ebp], 1
	push	0
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	call	_force_operand
	add	esp, 8
	mov	ecx, DWORD PTR _x$[ebp]
	mov	DWORD PTR [ecx+4], eax
$L1064:
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 3080192				; 002f0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1065
	mov	DWORD PTR _ch$1062[ebp], 1
	push	0
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	call	_force_operand
	add	esp, 8
	mov	ecx, DWORD PTR _x$[ebp]
	mov	DWORD PTR [ecx+8], eax
$L1065:
	cmp	DWORD PTR _ch$1062[ebp], 0
	je	$L1066
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1066
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1066
	mov	eax, DWORD PTR _x$[ebp]
	jmp	$L982
$L1066:
	cmp	DWORD PTR _ch$1062[ebp], 0
	je	$L1067
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2490368				; 00260000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1069
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2555904				; 00270000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1069
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1069
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2097152				; 00200000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1068
$L1069:
	jmp	$win$990
$L1068:
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1072
	mov	eax, DWORD PTR _x$[ebp]
	cmp	DWORD PTR [eax+4], 7
	jl	$L1071
	mov	eax, DWORD PTR _x$[ebp]
	cmp	DWORD PTR [eax+4], 10			; 0000000aH
	jge	$L1071
$L1072:
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 3080192				; 002f0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1070
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1070
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	cmp	DWORD PTR [eax+4], 7
	jl	$L1073
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	cmp	DWORD PTR [eax+4], 10			; 0000000aH
	jl	$L1070
$L1073:
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1070
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	cmp	DWORD PTR [eax+4], 2
	je	$L1074
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	cmp	DWORD PTR [eax+4], 4
	je	$L1074
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	cmp	DWORD PTR [eax+4], 8
	jne	$L1070
$L1074:
$L1071:
	jmp	$win$990
$L1070:
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1075
	mov	eax, DWORD PTR _x$[ebp]
	cmp	DWORD PTR [eax+4], 7
	jle	$L1076
	mov	eax, DWORD PTR _x$[ebp]
	cmp	DWORD PTR [eax+4], 10			; 0000000aH
	jl	$L1075
$L1076:
	jmp	$win$990
$L1075:
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2883584				; 002c0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1077
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1079
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	cmp	DWORD PTR [eax+4], 7
	jl	$L1078
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	cmp	DWORD PTR [eax+4], 10			; 0000000aH
	jge	$L1078
$L1079:
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 3080192				; 002f0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1077
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1077
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	cmp	DWORD PTR [eax+4], 7
	jl	$L1080
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	cmp	DWORD PTR [eax+4], 10			; 0000000aH
	jl	$L1077
$L1080:
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1077
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+8]
	cmp	DWORD PTR [eax+4], 2
	je	$L1081
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+8]
	cmp	DWORD PTR [eax+4], 4
	je	$L1081
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+8]
	cmp	DWORD PTR [eax+4], 8
	jne	$L1077
$L1081:
$L1078:
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1082
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	cmp	DWORD PTR [eax+4], 7
	jle	$L1083
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	cmp	DWORD PTR [eax+4], 10			; 0000000aH
	jl	$L1082
$L1083:
	jmp	$win$990
$L1082:
$L1077:
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2883584				; 002c0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1084
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1086
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	cmp	DWORD PTR [eax+4], 7
	jl	$L1085
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	cmp	DWORD PTR [eax+4], 10			; 0000000aH
	jge	$L1085
$L1086:
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 3080192				; 002f0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1084
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1084
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+4]
	cmp	DWORD PTR [eax+4], 7
	jl	$L1087
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+4]
	cmp	DWORD PTR [eax+4], 10			; 0000000aH
	jl	$L1084
$L1087:
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1084
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+8]
	cmp	DWORD PTR [eax+4], 2
	je	$L1088
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+8]
	cmp	DWORD PTR [eax+4], 4
	je	$L1088
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+8]
	cmp	DWORD PTR [eax+4], 8
	jne	$L1084
$L1088:
$L1085:
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1089
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	cmp	DWORD PTR [eax+4], 7
	jle	$L1090
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	cmp	DWORD PTR [eax+4], 10			; 0000000aH
	jl	$L1089
$L1090:
	jmp	$win$990
$L1089:
$L1084:
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2883584				; 002c0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1091
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2490368				; 00260000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1093
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2555904				; 00270000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1093
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1093
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2097152				; 00200000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1092
$L1093:
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1096
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	cmp	DWORD PTR [eax+4], 7
	jl	$L1095
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	cmp	DWORD PTR [eax+4], 10			; 0000000aH
	jge	$L1095
$L1096:
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 3080192				; 002f0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1094
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1094
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	cmp	DWORD PTR [eax+4], 7
	jl	$L1097
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	cmp	DWORD PTR [eax+4], 10			; 0000000aH
	jl	$L1094
$L1097:
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1094
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+8]
	cmp	DWORD PTR [eax+4], 2
	je	$L1098
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+8]
	cmp	DWORD PTR [eax+4], 4
	je	$L1098
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+8]
	cmp	DWORD PTR [eax+4], 8
	jne	$L1094
$L1098:
$L1095:
	jmp	$win$990
$L1094:
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1099
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	cmp	DWORD PTR [eax+4], 7
	jle	$L1100
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	cmp	DWORD PTR [eax+4], 10			; 0000000aH
	jl	$L1099
$L1100:
	jmp	$win$990
$L1099:
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2883584				; 002c0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1101
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1103
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	cmp	DWORD PTR [eax+4], 7
	jl	$L1102
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	cmp	DWORD PTR [eax+4], 10			; 0000000aH
	jge	$L1102
$L1103:
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 3080192				; 002f0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1101
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1101
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	cmp	DWORD PTR [eax+4], 7
	jl	$L1104
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	cmp	DWORD PTR [eax+4], 10			; 0000000aH
	jl	$L1101
$L1104:
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1101
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+8]
	cmp	DWORD PTR [eax+4], 2
	je	$L1105
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+8]
	cmp	DWORD PTR [eax+4], 4
	je	$L1105
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+8]
	cmp	DWORD PTR [eax+4], 8
	jne	$L1101
$L1105:
$L1102:
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1106
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+8]
	cmp	DWORD PTR [eax+4], 7
	jle	$L1107
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+8]
	cmp	DWORD PTR [eax+4], 10			; 0000000aH
	jl	$L1106
$L1107:
	jmp	$win$990
$L1106:
$L1101:
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2883584				; 002c0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1108
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1110
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+8]
	cmp	DWORD PTR [eax+4], 7
	jl	$L1109
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+8]
	cmp	DWORD PTR [eax+4], 10			; 0000000aH
	jge	$L1109
$L1110:
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 3080192				; 002f0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1108
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1108
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+4]
	cmp	DWORD PTR [eax+4], 7
	jl	$L1111
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+4]
	cmp	DWORD PTR [eax+4], 10			; 0000000aH
	jl	$L1108
$L1111:
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1108
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+8]
	cmp	DWORD PTR [eax+4], 2
	je	$L1112
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+8]
	cmp	DWORD PTR [eax+4], 4
	je	$L1112
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+8]
	cmp	DWORD PTR [eax+4], 8
	jne	$L1108
$L1112:
$L1109:
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1113
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	cmp	DWORD PTR [eax+4], 7
	jle	$L1114
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	cmp	DWORD PTR [eax+4], 10			; 0000000aH
	jl	$L1113
$L1114:
	jmp	$win$990
$L1113:
$L1108:
$L1092:
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2490368				; 00260000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1116
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2555904				; 00270000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1116
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1116
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2097152				; 00200000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1115
$L1116:
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1119
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	cmp	DWORD PTR [eax+4], 7
	jl	$L1118
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	cmp	DWORD PTR [eax+4], 10			; 0000000aH
	jge	$L1118
$L1119:
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 3080192				; 002f0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1117
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1117
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+4]
	cmp	DWORD PTR [eax+4], 7
	jl	$L1120
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+4]
	cmp	DWORD PTR [eax+4], 10			; 0000000aH
	jl	$L1117
$L1120:
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1117
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+8]
	cmp	DWORD PTR [eax+4], 2
	je	$L1121
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+8]
	cmp	DWORD PTR [eax+4], 4
	je	$L1121
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+8]
	cmp	DWORD PTR [eax+4], 8
	jne	$L1117
$L1121:
$L1118:
	jmp	$win$990
$L1117:
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1122
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	cmp	DWORD PTR [eax+4], 7
	jle	$L1123
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	cmp	DWORD PTR [eax+4], 10			; 0000000aH
	jl	$L1122
$L1123:
	jmp	$win$990
$L1122:
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2883584				; 002c0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1124
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1126
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+4]
	cmp	DWORD PTR [eax+4], 7
	jl	$L1125
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+4]
	cmp	DWORD PTR [eax+4], 10			; 0000000aH
	jge	$L1125
$L1126:
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 3080192				; 002f0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1124
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1124
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	cmp	DWORD PTR [eax+4], 7
	jl	$L1127
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	cmp	DWORD PTR [eax+4], 10			; 0000000aH
	jl	$L1124
$L1127:
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1124
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+8]
	cmp	DWORD PTR [eax+4], 2
	je	$L1128
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+8]
	cmp	DWORD PTR [eax+4], 4
	je	$L1128
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+8]
	cmp	DWORD PTR [eax+4], 8
	jne	$L1124
$L1128:
$L1125:
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1129
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+8]
	cmp	DWORD PTR [eax+4], 7
	jle	$L1130
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+8]
	cmp	DWORD PTR [eax+4], 10			; 0000000aH
	jl	$L1129
$L1130:
	jmp	$win$990
$L1129:
$L1124:
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2883584				; 002c0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1131
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1133
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+8]
	cmp	DWORD PTR [eax+4], 7
	jl	$L1132
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+8]
	cmp	DWORD PTR [eax+4], 10			; 0000000aH
	jge	$L1132
$L1133:
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 3080192				; 002f0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1131
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1131
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+4]
	cmp	DWORD PTR [eax+4], 7
	jl	$L1134
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+4]
	cmp	DWORD PTR [eax+4], 10			; 0000000aH
	jl	$L1131
$L1134:
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1131
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+8]
	cmp	DWORD PTR [eax+4], 2
	je	$L1135
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+8]
	cmp	DWORD PTR [eax+4], 4
	je	$L1135
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+8]
	cmp	DWORD PTR [eax+4], 8
	jne	$L1131
$L1135:
$L1132:
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1136
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+4]
	cmp	DWORD PTR [eax+4], 7
	jle	$L1137
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+4]
	cmp	DWORD PTR [eax+4], 10			; 0000000aH
	jl	$L1136
$L1137:
	jmp	$win$990
$L1136:
$L1131:
$L1115:
$L1091:
$L1067:
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1139
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 5046272				; 004d0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1138
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1138
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	mov	ecx, 33554432				; 02000000H
	and	ecx, -16777216				; ff000000H
	cmp	eax, ecx
	jne	$L1138
$L1139:
	push	4
	call	_gen_reg_rtx
	add	esp, 4
	mov	DWORD PTR _temp$1140[ebp], eax
	mov	eax, DWORD PTR _temp$1140[ebp]
	push	eax
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	call	_force_operand
	add	esp, 8
	mov	DWORD PTR _val$1141[ebp], eax
	mov	eax, DWORD PTR _temp$1140[ebp]
	cmp	DWORD PTR _val$1141[ebp], eax
	je	$L1142
	push	0
	mov	eax, DWORD PTR _val$1141[ebp]
	push	eax
	mov	eax, DWORD PTR _temp$1140[ebp]
	push	eax
	call	_emit_move_insn
	add	esp, 12					; 0000000cH
$L1142:
	mov	eax, DWORD PTR _temp$1140[ebp]
	mov	ecx, DWORD PTR _x$[ebp]
	mov	DWORD PTR [ecx+8], eax
	mov	eax, DWORD PTR _x$[ebp]
	jmp	$L982
	jmp	$L1143
$L1138:
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1145
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 5046272				; 004d0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1144
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1144
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	mov	ecx, 33554432				; 02000000H
	and	ecx, -16777216				; ff000000H
	cmp	eax, ecx
	jne	$L1144
$L1145:
	push	4
	call	_gen_reg_rtx
	add	esp, 4
	mov	DWORD PTR _temp$1146[ebp], eax
	mov	eax, DWORD PTR _temp$1146[ebp]
	push	eax
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	call	_force_operand
	add	esp, 8
	mov	DWORD PTR _val$1147[ebp], eax
	mov	eax, DWORD PTR _temp$1146[ebp]
	cmp	DWORD PTR _val$1147[ebp], eax
	je	$L1148
	push	0
	mov	eax, DWORD PTR _val$1147[ebp]
	push	eax
	mov	eax, DWORD PTR _temp$1146[ebp]
	push	eax
	call	_emit_move_insn
	add	esp, 12					; 0000000cH
$L1148:
	mov	eax, DWORD PTR _temp$1146[ebp]
	mov	ecx, DWORD PTR _x$[ebp]
	mov	DWORD PTR [ecx+4], eax
	mov	eax, DWORD PTR _x$[ebp]
	jmp	$L982
$L1144:
$L1143:
$L1063:
; Line 295
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2883584				; 002c0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1149
; Line 297
	mov	DWORD PTR _constant_term$1150[ebp], 0
; Line 298
	lea	eax, DWORD PTR _constant_term$1150[ebp]
	push	eax
	mov	eax, DWORD PTR _x$[ebp]
	push	eax
	call	_eliminate_constant_term
	add	esp, 8
	mov	DWORD PTR _y$1151[ebp], eax
; Line 300
	cmp	DWORD PTR _constant_term$1150[ebp], 0
	je	$L1153
	mov	eax, DWORD PTR _y$1151[ebp]
	push	eax
	mov	eax, DWORD PTR _mode$[ebp]
	push	eax
	call	_memory_address_p
	add	esp, 8
	or	eax, eax
	jne	$L1152
$L1153:
; Line 301
	push	0
	mov	eax, DWORD PTR _x$[ebp]
	push	eax
	call	_force_operand
	add	esp, 8
	jmp	$L982
; Line 303
$L1152:
	mov	eax, DWORD PTR _constant_term$1150[ebp]
	push	eax
	mov	eax, DWORD PTR _y$1151[ebp]
	push	eax
	call	_copy_to_reg
	add	esp, 4
	push	eax
	call	_plus_constant
	add	esp, 8
	mov	DWORD PTR _y$1151[ebp], eax
; Line 304
	mov	eax, DWORD PTR _y$1151[ebp]
	push	eax
	mov	eax, DWORD PTR _mode$[ebp]
	push	eax
	call	_memory_address_p
	add	esp, 8
	or	eax, eax
	jne	$L1154
; Line 305
	push	0
	mov	eax, DWORD PTR _x$[ebp]
	push	eax
	call	_force_operand
	add	esp, 8
	jmp	$L982
; Line 306
$L1154:
	mov	eax, DWORD PTR _y$1151[ebp]
	jmp	$L982
; Line 308
$L1149:
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 3080192				; 002f0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1156
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2949120				; 002d0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1155
$L1156:
; Line 309
	push	0
	mov	eax, DWORD PTR _x$[ebp]
	push	eax
	call	_force_operand
	add	esp, 8
	jmp	$L982
; Line 313
$L1155:
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1157
; Line 314
	mov	eax, DWORD PTR _x$[ebp]
	push	eax
	call	_copy_to_reg
	add	esp, 4
	jmp	$L982
; Line 318
$L1157:
	mov	eax, DWORD PTR _x$[ebp]
	push	eax
	push	4
	call	_force_reg
	add	esp, 8
	jmp	$L982
; Line 320
$win2$1061:
; Line 321
	mov	eax, DWORD PTR _oldx$[ebp]
	mov	DWORD PTR _x$[ebp], eax
; Line 322
$win$990:
; Line 328
	cmp	DWORD PTR _flag_force_addr, 0
	je	$L1158
	cmp	DWORD PTR _optimize, 0
	je	$L1158
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1158
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2883584				; 002c0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1159
	mov	eax, DWORD PTR _x$[ebp]
	mov	ecx, DWORD PTR _frame_pointer_rtx
	cmp	DWORD PTR [eax+4], ecx
	je	$L1158
	mov	eax, DWORD PTR _x$[ebp]
	mov	ecx, DWORD PTR _arg_pointer_rtx
	cmp	DWORD PTR [eax+4], ecx
	je	$L1158
$L1159:
; Line 330
	push	4
	mov	eax, DWORD PTR _x$[ebp]
	push	eax
	call	_general_operand
	add	esp, 8
	or	eax, eax
	je	$L1161
; Line 331
	mov	eax, DWORD PTR _x$[ebp]
	push	eax
	push	4
	call	_force_reg
	add	esp, 8
	jmp	$L982
; Line 332
	jmp	$L1162
$L1161:
; Line 333
	push	0
	mov	eax, DWORD PTR _x$[ebp]
	push	eax
	call	_force_operand
	add	esp, 8
	jmp	$L982
$L1162:
; Line 335
$L1158:
	mov	eax, DWORD PTR _x$[ebp]
	jmp	$L982
; Line 336
$L982:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_memory_address ENDP
_TEXT	ENDS
PUBLIC	_memory_address_noforce
_TEXT	SEGMENT
_mode$ = 8
_x$ = 12
_ambient_force_addr$ = -8
_val$ = -4
_memory_address_noforce PROC NEAR
; Line 344
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	push	ebx
	push	esi
	push	edi
; Line 345
	mov	eax, DWORD PTR _flag_force_addr
	mov	DWORD PTR _ambient_force_addr$[ebp], eax
; Line 348
	mov	DWORD PTR _flag_force_addr, 0
; Line 349
	mov	eax, DWORD PTR _x$[ebp]
	push	eax
	mov	eax, DWORD PTR _mode$[ebp]
	push	eax
	call	_memory_address
	add	esp, 8
	mov	DWORD PTR _val$[ebp], eax
; Line 350
	mov	eax, DWORD PTR _ambient_force_addr$[ebp]
	mov	DWORD PTR _flag_force_addr, eax
; Line 351
	mov	eax, DWORD PTR _val$[ebp]
	jmp	$L1165
; Line 352
$L1165:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_memory_address_noforce ENDP
_TEXT	ENDS
PUBLIC	_stabilize
EXTRN	_rtx_unstable_p:NEAR
_TEXT	SEGMENT
_x$ = 8
_addr$ = -4
_temp$1174 = -12
_mem$1175 = -8
_stabilize PROC NEAR
; Line 362
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
	push	ebx
	push	esi
	push	edi
; Line 364
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2424832				; 00250000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1171
; Line 365
	mov	eax, DWORD PTR _x$[ebp]
	jmp	$L1169
; Line 366
$L1171:
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _addr$[ebp], eax
; Line 367
	mov	eax, DWORD PTR _addr$[ebp]
	push	eax
	call	_rtx_unstable_p
	add	esp, 4
	or	eax, eax
	je	$L1173
; Line 369
	mov	eax, DWORD PTR _addr$[ebp]
	push	eax
	call	_copy_all_regs
	add	esp, 4
	mov	DWORD PTR _temp$1174[ebp], eax
; Line 371
	mov	eax, DWORD PTR _temp$1174[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1176
; Line 372
	mov	eax, DWORD PTR _temp$1174[ebp]
	push	eax
	call	_copy_to_reg
	add	esp, 4
	mov	DWORD PTR _temp$1174[ebp], eax
; Line 373
$L1176:
	mov	eax, DWORD PTR _temp$1174[ebp]
	push	eax
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	push	eax
	push	37					; 00000025H
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _mem$1175[ebp], eax
; Line 376
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2883584				; 002c0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1178
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shr	eax, 28					; 0000001cH
	test	al, 1
	je	$L1177
$L1178:
; Line 377
	mov	eax, DWORD PTR _mem$1175[ebp]
	mov	eax, DWORD PTR [eax]
	or	eax, 268435456				; 10000000H
	mov	ecx, DWORD PTR _mem$1175[ebp]
	mov	DWORD PTR [ecx], eax
; Line 378
$L1177:
	mov	eax, DWORD PTR _mem$1175[ebp]
	jmp	$L1169
; Line 380
$L1173:
	mov	eax, DWORD PTR _x$[ebp]
	jmp	$L1169
; Line 381
$L1169:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_stabilize ENDP
_x$ = 8
_temp$ = -4
_copy_to_reg PROC NEAR
; Line 388
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 389
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	push	eax
	call	_gen_reg_rtx
	add	esp, 4
	mov	DWORD PTR _temp$[ebp], eax
; Line 393
	push	0
	mov	eax, DWORD PTR _x$[ebp]
	push	eax
	call	_general_operand
	add	esp, 8
	or	eax, eax
	jne	$L1182
; Line 394
	mov	eax, DWORD PTR _temp$[ebp]
	push	eax
	mov	eax, DWORD PTR _x$[ebp]
	push	eax
	call	_force_operand
	add	esp, 8
	mov	DWORD PTR _x$[ebp], eax
; Line 396
$L1182:
	mov	eax, DWORD PTR _x$[ebp]
	cmp	DWORD PTR _temp$[ebp], eax
	je	$L1183
; Line 397
	mov	eax, DWORD PTR _x$[ebp]
	push	eax
	mov	eax, DWORD PTR _temp$[ebp]
	push	eax
	call	_emit_move_insn
	add	esp, 8
; Line 399
$L1183:
	mov	eax, DWORD PTR _temp$[ebp]
	jmp	$L1180
; Line 400
$L1180:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_copy_to_reg ENDP
_TEXT	ENDS
PUBLIC	_copy_addr_to_reg
PUBLIC	_copy_to_mode_reg
_TEXT	SEGMENT
_x$ = 8
_copy_addr_to_reg PROC NEAR
; Line 408
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 409
	mov	eax, DWORD PTR _x$[ebp]
	push	eax
	push	4
	call	_copy_to_mode_reg
	add	esp, 8
	jmp	$L1185
; Line 410
$L1185:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_copy_addr_to_reg ENDP
_mode$ = 8
_x$ = 12
_temp$ = -4
_copy_to_mode_reg PROC NEAR
; Line 419
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 420
	mov	eax, DWORD PTR _mode$[ebp]
	push	eax
	call	_gen_reg_rtx
	add	esp, 4
	mov	DWORD PTR _temp$[ebp], eax
; Line 424
	push	0
	mov	eax, DWORD PTR _x$[ebp]
	push	eax
	call	_general_operand
	add	esp, 8
	or	eax, eax
	jne	$L1190
; Line 425
	mov	eax, DWORD PTR _temp$[ebp]
	push	eax
	mov	eax, DWORD PTR _x$[ebp]
	push	eax
	call	_force_operand
	add	esp, 8
	mov	DWORD PTR _x$[ebp], eax
; Line 427
$L1190:
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	cmp	eax, DWORD PTR _mode$[ebp]
	je	$L1191
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	sub	ecx, ecx
	and	ecx, -16777216				; ff000000H
	cmp	eax, ecx
	je	$L1191
; Line 428
	call	_abort
; Line 429
$L1191:
	mov	eax, DWORD PTR _x$[ebp]
	cmp	DWORD PTR _temp$[ebp], eax
	je	$L1192
; Line 430
	mov	eax, DWORD PTR _x$[ebp]
	push	eax
	mov	eax, DWORD PTR _temp$[ebp]
	push	eax
	call	_emit_move_insn
	add	esp, 8
; Line 431
$L1192:
	mov	eax, DWORD PTR _temp$[ebp]
	jmp	$L1188
; Line 432
$L1188:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_copy_to_mode_reg ENDP
_mode$ = 8
_x$ = 12
_temp$ = -4
_insn$ = -8
_force_reg PROC NEAR
; Line 446
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	push	ebx
	push	esi
	push	edi
; Line 449
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1198
; Line 450
	mov	eax, DWORD PTR _x$[ebp]
	jmp	$L1195
; Line 451
$L1198:
	mov	eax, DWORD PTR _mode$[ebp]
	push	eax
	call	_gen_reg_rtx
	add	esp, 4
	mov	DWORD PTR _temp$[ebp], eax
; Line 452
	mov	eax, DWORD PTR _x$[ebp]
	push	eax
	mov	eax, DWORD PTR _temp$[ebp]
	push	eax
	call	_emit_move_insn
	add	esp, 8
	mov	DWORD PTR _insn$[ebp], eax
; Line 455
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2490368				; 00260000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1200
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2555904				; 00270000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1200
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1200
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2097152				; 00200000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1199
$L1200:
; Line 456
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+28]
	push	eax
	mov	eax, DWORD PTR _x$[ebp]
	push	eax
	push	3
	push	2
	call	_gen_rtx
	add	esp, 16					; 00000010H
	mov	ecx, DWORD PTR _insn$[ebp]
	mov	DWORD PTR [ecx+28], eax
; Line 457
$L1199:
	mov	eax, DWORD PTR _temp$[ebp]
	jmp	$L1195
; Line 458
$L1195:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_force_reg ENDP
_TEXT	ENDS
PUBLIC	_force_not_mem
_TEXT	SEGMENT
_x$ = 8
_temp$ = -4
_force_not_mem PROC NEAR
; Line 466
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 468
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2424832				; 00250000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1205
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	mov	ecx, 436207616				; 1a000000H
	and	ecx, -16777216				; ff000000H
	cmp	eax, ecx
	jne	$L1204
$L1205:
; Line 469
	mov	eax, DWORD PTR _x$[ebp]
	jmp	$L1202
; Line 470
$L1204:
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	push	eax
	call	_gen_reg_rtx
	add	esp, 4
	mov	DWORD PTR _temp$[ebp], eax
; Line 471
	mov	eax, DWORD PTR _x$[ebp]
	push	eax
	mov	eax, DWORD PTR _temp$[ebp]
	push	eax
	call	_emit_move_insn
	add	esp, 8
; Line 472
	mov	eax, DWORD PTR _temp$[ebp]
	jmp	$L1202
; Line 473
$L1202:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_force_not_mem ENDP
_TEXT	ENDS
PUBLIC	_copy_to_suggested_reg
_TEXT	SEGMENT
_x$ = 8
_target$ = 12
_temp$ = -4
_copy_to_suggested_reg PROC NEAR
; Line 481
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 483
	cmp	DWORD PTR _target$[ebp], 0
	je	$L1210
	mov	eax, DWORD PTR _target$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1210
; Line 484
	mov	eax, DWORD PTR _target$[ebp]
	mov	DWORD PTR _temp$[ebp], eax
; Line 485
	jmp	$L1211
$L1210:
; Line 486
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	push	eax
	call	_gen_reg_rtx
	add	esp, 4
	mov	DWORD PTR _temp$[ebp], eax
$L1211:
; Line 487
	mov	eax, DWORD PTR _x$[ebp]
	push	eax
	mov	eax, DWORD PTR _temp$[ebp]
	push	eax
	call	_emit_move_insn
	add	esp, 8
; Line 488
	mov	eax, DWORD PTR _temp$[ebp]
	jmp	$L1208
; Line 489
$L1208:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_copy_to_suggested_reg ENDP
_TEXT	ENDS
PUBLIC	_adjust_stack
EXTRN	_stack_pointer_rtx:DWORD
EXTRN	_gen_add2_insn:NEAR
EXTRN	_protect_from_queue:NEAR
EXTRN	_emit_insn:NEAR
_TEXT	SEGMENT
_adjust$ = 8
_adjust_stack PROC NEAR
; Line 497
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 498
	push	0
	mov	eax, DWORD PTR _adjust$[ebp]
	push	eax
	call	_protect_from_queue
	add	esp, 8
	mov	DWORD PTR _adjust$[ebp], eax
; Line 501
	mov	eax, DWORD PTR _adjust$[ebp]
	push	eax
	mov	eax, DWORD PTR _stack_pointer_rtx
	push	eax
	call	_gen_add2_insn
	add	esp, 8
	push	eax
	call	_emit_insn
	add	esp, 4
; Line 505
$L1213:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_adjust_stack ENDP
_TEXT	ENDS
PUBLIC	_anti_adjust_stack
EXTRN	_gen_sub2_insn:NEAR
_TEXT	SEGMENT
_adjust$ = 8
_anti_adjust_stack PROC NEAR
; Line 513
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 514
	push	0
	mov	eax, DWORD PTR _adjust$[ebp]
	push	eax
	call	_protect_from_queue
	add	esp, 8
	mov	DWORD PTR _adjust$[ebp], eax
; Line 517
	mov	eax, DWORD PTR _adjust$[ebp]
	push	eax
	mov	eax, DWORD PTR _stack_pointer_rtx
	push	eax
	call	_gen_sub2_insn
	add	esp, 8
	push	eax
	call	_emit_insn
	add	esp, 4
; Line 521
$L1215:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_anti_adjust_stack ENDP
_TEXT	ENDS
PUBLIC	_round_push
EXTRN	_expand_mult:NEAR
EXTRN	_expand_divmod:NEAR
_TEXT	SEGMENT
_size$ = 8
_align$ = -4
_new$1221 = -8
_round_push PROC NEAR
; Line 529
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	push	ebx
	push	esi
	push	edi
; Line 531
	mov	DWORD PTR _align$[ebp], 4
; Line 532
	cmp	DWORD PTR _align$[ebp], 1
	jne	$L1219
; Line 533
	mov	eax, DWORD PTR _size$[ebp]
	jmp	$L1217
; Line 534
$L1219:
	mov	eax, DWORD PTR _size$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1220
; Line 536
	mov	eax, DWORD PTR _size$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _align$[ebp]
	lea	eax, DWORD PTR [eax+ecx-1]
	cdq
	idiv	DWORD PTR _align$[ebp]
	imul	eax, DWORD PTR _align$[ebp]
	mov	DWORD PTR _new$1221[ebp], eax
; Line 537
	mov	eax, DWORD PTR _size$[ebp]
	mov	ecx, DWORD PTR _new$1221[ebp]
	cmp	DWORD PTR [eax+4], ecx
	je	$L1222
; Line 538
	mov	eax, DWORD PTR _new$1221[ebp]
	push	eax
	push	0
	push	30					; 0000001eH
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _size$[ebp], eax
; Line 539
$L1222:
; Line 540
	jmp	$L1223
$L1220:
; Line 544
	push	1
	push	0
	mov	eax, DWORD PTR _align$[ebp]
	push	eax
	push	0
	push	30					; 0000001eH
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	push	eax
	mov	eax, DWORD PTR _size$[ebp]
	push	eax
	push	4
	push	68					; 00000044H
	push	0
	call	_expand_divmod
	add	esp, 28					; 0000001cH
	mov	DWORD PTR _size$[ebp], eax
; Line 547
	push	1
	push	0
	mov	eax, DWORD PTR _align$[ebp]
	push	eax
	push	0
	push	30					; 0000001eH
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	push	eax
	mov	eax, DWORD PTR _size$[ebp]
	push	eax
	push	4
	call	_expand_mult
	add	esp, 20					; 00000014H
	mov	DWORD PTR _size$[ebp], eax
; Line 548
$L1223:
; Line 550
	mov	eax, DWORD PTR _size$[ebp]
	jmp	$L1217
; Line 551
$L1217:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_round_push ENDP
_TEXT	ENDS
PUBLIC	_hard_function_value
_TEXT	SEGMENT
_valtype$ = 8
_hard_function_value PROC NEAR
; Line 563
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 564
	mov	eax, DWORD PTR _valtype$[ebp]
	mov	eax, DWORD PTR [eax+32]
	shl	eax, 24					; 00000018H
	and	eax, -16777216				; ff000000H
	mov	ecx, 167772160				; 0a000000H
	and	ecx, -16777216				; ff000000H
	cmp	eax, ecx
	je	$L1232
	mov	eax, DWORD PTR _valtype$[ebp]
	mov	eax, DWORD PTR [eax+32]
	shl	eax, 24					; 00000018H
	and	eax, -16777216				; ff000000H
	mov	ecx, 184549376				; 0b000000H
	and	ecx, -16777216				; ff000000H
	cmp	eax, ecx
	jne	$L1230
$L1232:
	mov	DWORD PTR -4+[ebp], 8
	jmp	$L1231
$L1230:
	mov	DWORD PTR -4+[ebp], 0
$L1231:
	mov	eax, DWORD PTR -4+[ebp]
	push	eax
	mov	eax, DWORD PTR _valtype$[ebp]
	mov	eax, DWORD PTR [eax+32]
	shl	eax, 24					; 00000018H
	sar	eax, 24					; 00000018H
	push	eax
	push	34					; 00000022H
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	jmp	$L1226
; Line 565
$L1226:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_hard_function_value ENDP
_TEXT	ENDS
PUBLIC	_hard_libcall_value
_TEXT	SEGMENT
_mode$ = 8
_hard_libcall_value PROC NEAR
; Line 573
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 574
	cmp	DWORD PTR _mode$[ebp], 10		; 0000000aH
	je	$L1235
	cmp	DWORD PTR _mode$[ebp], 11		; 0000000bH
	jne	$L1233
$L1235:
	mov	DWORD PTR -4+[ebp], 8
	jmp	$L1234
$L1233:
	mov	DWORD PTR -4+[ebp], 0
$L1234:
	mov	eax, DWORD PTR -4+[ebp]
	push	eax
	mov	eax, DWORD PTR _mode$[ebp]
	push	eax
	push	34					; 00000022H
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	jmp	$L1228
; Line 575
$L1228:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_hard_libcall_value ENDP
_TEXT	ENDS
END
