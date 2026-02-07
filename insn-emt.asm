	TITLE	insn-emt.c
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
PUBLIC	_gen_tstsi
EXTRN	_cc0_rtx:DWORD
EXTRN	_gen_rtx:NEAR
_TEXT	SEGMENT
; File insn-emt.c
_operand0$ = 8
_gen_tstsi PROC NEAR
; Line 24
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 25
	mov	eax, DWORD PTR _operand0$[ebp]
	push	eax
	mov	eax, DWORD PTR _cc0_rtx
	push	eax
	push	0
	push	25					; 00000019H
	call	_gen_rtx
	add	esp, 16					; 00000010H
	jmp	$L686
; Line 26
$L686:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_gen_tstsi ENDP
_TEXT	ENDS
PUBLIC	_gen_tsthi
_TEXT	SEGMENT
_operand0$ = 8
_gen_tsthi PROC NEAR
; Line 31
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 32
	mov	eax, DWORD PTR _operand0$[ebp]
	push	eax
	mov	eax, DWORD PTR _cc0_rtx
	push	eax
	push	0
	push	25					; 00000019H
	call	_gen_rtx
	add	esp, 16					; 00000010H
	jmp	$L688
; Line 33
$L688:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_gen_tsthi ENDP
_TEXT	ENDS
PUBLIC	_gen_tstqi
_TEXT	SEGMENT
_operand0$ = 8
_gen_tstqi PROC NEAR
; Line 38
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 39
	mov	eax, DWORD PTR _operand0$[ebp]
	push	eax
	mov	eax, DWORD PTR _cc0_rtx
	push	eax
	push	0
	push	25					; 00000019H
	call	_gen_rtx
	add	esp, 16					; 00000010H
	jmp	$L690
; Line 40
$L690:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_gen_tstqi ENDP
_TEXT	ENDS
PUBLIC	_gen_tstsf
EXTRN	_gen_rtvec:NEAR
_TEXT	SEGMENT
_operand0$ = 8
_gen_tstsf PROC NEAR
; Line 45
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 48
	push	0
	push	4
	push	34					; 00000022H
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	push	27					; 0000001bH
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	push	eax
	mov	eax, DWORD PTR _operand0$[ebp]
	push	eax
	mov	eax, DWORD PTR _cc0_rtx
	push	eax
	push	0
	push	25					; 00000019H
	call	_gen_rtx
	add	esp, 16					; 00000010H
	push	eax
	push	2
	call	_gen_rtvec
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	push	20					; 00000014H
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	jmp	$L692
; Line 49
$L692:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_gen_tstsf ENDP
_TEXT	ENDS
PUBLIC	_gen_tstdf
_TEXT	SEGMENT
_operand0$ = 8
_gen_tstdf PROC NEAR
; Line 54
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 57
	push	0
	push	4
	push	34					; 00000022H
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	push	27					; 0000001bH
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	push	eax
	mov	eax, DWORD PTR _operand0$[ebp]
	push	eax
	mov	eax, DWORD PTR _cc0_rtx
	push	eax
	push	0
	push	25					; 00000019H
	call	_gen_rtx
	add	esp, 16					; 00000010H
	push	eax
	push	2
	call	_gen_rtvec
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	push	20					; 00000014H
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	jmp	$L694
; Line 58
$L694:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_gen_tstdf ENDP
_TEXT	ENDS
PUBLIC	_gen_cmpsi
_TEXT	SEGMENT
_operand0$ = 8
_operand1$ = 12
_gen_cmpsi PROC NEAR
; Line 64
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 65
	mov	eax, DWORD PTR _operand1$[ebp]
	push	eax
	mov	eax, DWORD PTR _operand0$[ebp]
	push	eax
	push	0
	push	43					; 0000002bH
	call	_gen_rtx
	add	esp, 16					; 00000010H
	push	eax
	mov	eax, DWORD PTR _cc0_rtx
	push	eax
	push	0
	push	25					; 00000019H
	call	_gen_rtx
	add	esp, 16					; 00000010H
	jmp	$L697
; Line 66
$L697:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_gen_cmpsi ENDP
_TEXT	ENDS
PUBLIC	_gen_cmphi
_TEXT	SEGMENT
_operand0$ = 8
_operand1$ = 12
_gen_cmphi PROC NEAR
; Line 72
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 73
	mov	eax, DWORD PTR _operand1$[ebp]
	push	eax
	mov	eax, DWORD PTR _operand0$[ebp]
	push	eax
	push	0
	push	43					; 0000002bH
	call	_gen_rtx
	add	esp, 16					; 00000010H
	push	eax
	mov	eax, DWORD PTR _cc0_rtx
	push	eax
	push	0
	push	25					; 00000019H
	call	_gen_rtx
	add	esp, 16					; 00000010H
	jmp	$L700
; Line 74
$L700:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_gen_cmphi ENDP
_TEXT	ENDS
PUBLIC	_gen_cmpqi
_TEXT	SEGMENT
_operand0$ = 8
_operand1$ = 12
_gen_cmpqi PROC NEAR
; Line 80
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 81
	mov	eax, DWORD PTR _operand1$[ebp]
	push	eax
	mov	eax, DWORD PTR _operand0$[ebp]
	push	eax
	push	0
	push	43					; 0000002bH
	call	_gen_rtx
	add	esp, 16					; 00000010H
	push	eax
	mov	eax, DWORD PTR _cc0_rtx
	push	eax
	push	0
	push	25					; 00000019H
	call	_gen_rtx
	add	esp, 16					; 00000010H
	jmp	$L703
; Line 82
$L703:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_gen_cmpqi ENDP
_TEXT	ENDS
PUBLIC	_gen_cmpdf
_TEXT	SEGMENT
_operand0$ = 8
_operand1$ = 12
_gen_cmpdf PROC NEAR
; Line 88
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 91
	push	0
	push	4
	push	34					; 00000022H
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	push	27					; 0000001bH
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	push	eax
	mov	eax, DWORD PTR _operand1$[ebp]
	push	eax
	mov	eax, DWORD PTR _operand0$[ebp]
	push	eax
	push	0
	push	43					; 0000002bH
	call	_gen_rtx
	add	esp, 16					; 00000010H
	push	eax
	mov	eax, DWORD PTR _cc0_rtx
	push	eax
	push	0
	push	25					; 00000019H
	call	_gen_rtx
	add	esp, 16					; 00000010H
	push	eax
	push	2
	call	_gen_rtvec
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	push	20					; 00000014H
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	jmp	$L706
; Line 92
$L706:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_gen_cmpdf ENDP
_TEXT	ENDS
PUBLIC	_gen_cmpsf
_TEXT	SEGMENT
_operand0$ = 8
_operand1$ = 12
_gen_cmpsf PROC NEAR
; Line 98
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 101
	push	0
	push	4
	push	34					; 00000022H
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	push	27					; 0000001bH
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	push	eax
	mov	eax, DWORD PTR _operand1$[ebp]
	push	eax
	mov	eax, DWORD PTR _operand0$[ebp]
	push	eax
	push	0
	push	43					; 0000002bH
	call	_gen_rtx
	add	esp, 16					; 00000010H
	push	eax
	mov	eax, DWORD PTR _cc0_rtx
	push	eax
	push	0
	push	25					; 00000019H
	call	_gen_rtx
	add	esp, 16					; 00000010H
	push	eax
	push	2
	call	_gen_rtvec
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	push	20					; 00000014H
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	jmp	$L709
; Line 102
$L709:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_gen_cmpsf ENDP
_TEXT	ENDS
PUBLIC	_gen_movsi
_TEXT	SEGMENT
_operand0$ = 8
_operand1$ = 12
_gen_movsi PROC NEAR
; Line 108
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 109
	mov	eax, DWORD PTR _operand1$[ebp]
	push	eax
	mov	eax, DWORD PTR _operand0$[ebp]
	push	eax
	push	0
	push	25					; 00000019H
	call	_gen_rtx
	add	esp, 16					; 00000010H
	jmp	$L712
; Line 110
$L712:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_gen_movsi ENDP
_TEXT	ENDS
PUBLIC	_gen_movhi
_TEXT	SEGMENT
_operand0$ = 8
_operand1$ = 12
_gen_movhi PROC NEAR
; Line 116
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 117
	mov	eax, DWORD PTR _operand1$[ebp]
	push	eax
	mov	eax, DWORD PTR _operand0$[ebp]
	push	eax
	push	0
	push	25					; 00000019H
	call	_gen_rtx
	add	esp, 16					; 00000010H
	jmp	$L715
; Line 118
$L715:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_gen_movhi ENDP
_TEXT	ENDS
PUBLIC	_gen_movqi
_TEXT	SEGMENT
_operand0$ = 8
_operand1$ = 12
_gen_movqi PROC NEAR
; Line 124
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 125
	mov	eax, DWORD PTR _operand1$[ebp]
	push	eax
	mov	eax, DWORD PTR _operand0$[ebp]
	push	eax
	push	0
	push	25					; 00000019H
	call	_gen_rtx
	add	esp, 16					; 00000010H
	jmp	$L718
; Line 126
$L718:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_gen_movqi ENDP
_TEXT	ENDS
PUBLIC	_gen_movsf
_TEXT	SEGMENT
_operand0$ = 8
_operand1$ = 12
_gen_movsf PROC NEAR
; Line 132
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 133
	mov	eax, DWORD PTR _operand1$[ebp]
	push	eax
	mov	eax, DWORD PTR _operand0$[ebp]
	push	eax
	push	0
	push	25					; 00000019H
	call	_gen_rtx
	add	esp, 16					; 00000010H
	jmp	$L721
; Line 134
$L721:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_gen_movsf ENDP
_TEXT	ENDS
PUBLIC	_gen_movdf
_TEXT	SEGMENT
_operand0$ = 8
_operand1$ = 12
_gen_movdf PROC NEAR
; Line 140
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 141
	mov	eax, DWORD PTR _operand1$[ebp]
	push	eax
	mov	eax, DWORD PTR _operand0$[ebp]
	push	eax
	push	0
	push	25					; 00000019H
	call	_gen_rtx
	add	esp, 16					; 00000010H
	jmp	$L724
; Line 142
$L724:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_gen_movdf ENDP
_TEXT	ENDS
PUBLIC	_gen_movdi
_TEXT	SEGMENT
_operand0$ = 8
_operand1$ = 12
_gen_movdi PROC NEAR
; Line 148
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 149
	mov	eax, DWORD PTR _operand1$[ebp]
	push	eax
	mov	eax, DWORD PTR _operand0$[ebp]
	push	eax
	push	0
	push	25					; 00000019H
	call	_gen_rtx
	add	esp, 16					; 00000010H
	jmp	$L727
; Line 150
$L727:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_gen_movdi ENDP
_TEXT	ENDS
PUBLIC	_gen_truncsiqi2
_TEXT	SEGMENT
_operand0$ = 8
_operand1$ = 12
_gen_truncsiqi2 PROC NEAR
; Line 156
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 157
	mov	eax, DWORD PTR _operand1$[ebp]
	push	eax
	push	1
	push	79					; 0000004fH
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	push	eax
	mov	eax, DWORD PTR _operand0$[ebp]
	push	eax
	push	0
	push	25					; 00000019H
	call	_gen_rtx
	add	esp, 16					; 00000010H
	jmp	$L730
; Line 158
$L730:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_gen_truncsiqi2 ENDP
_TEXT	ENDS
PUBLIC	_gen_trunchiqi2
_TEXT	SEGMENT
_operand0$ = 8
_operand1$ = 12
_gen_trunchiqi2 PROC NEAR
; Line 164
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 165
	mov	eax, DWORD PTR _operand1$[ebp]
	push	eax
	push	1
	push	79					; 0000004fH
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	push	eax
	mov	eax, DWORD PTR _operand0$[ebp]
	push	eax
	push	0
	push	25					; 00000019H
	call	_gen_rtx
	add	esp, 16					; 00000010H
	jmp	$L733
; Line 166
$L733:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_gen_trunchiqi2 ENDP
_TEXT	ENDS
PUBLIC	_gen_truncsihi2
_TEXT	SEGMENT
_operand0$ = 8
_operand1$ = 12
_gen_truncsihi2 PROC NEAR
; Line 172
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 173
	mov	eax, DWORD PTR _operand1$[ebp]
	push	eax
	push	2
	push	79					; 0000004fH
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	push	eax
	mov	eax, DWORD PTR _operand0$[ebp]
	push	eax
	push	0
	push	25					; 00000019H
	call	_gen_rtx
	add	esp, 16					; 00000010H
	jmp	$L736
; Line 174
$L736:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_gen_truncsihi2 ENDP
_TEXT	ENDS
PUBLIC	_gen_zero_extendhisi2
_TEXT	SEGMENT
_operand0$ = 8
_operand1$ = 12
_gen_zero_extendhisi2 PROC NEAR
; Line 180
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 181
	mov	eax, DWORD PTR _operand1$[ebp]
	push	eax
	push	4
	push	78					; 0000004eH
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	push	eax
	mov	eax, DWORD PTR _operand0$[ebp]
	push	eax
	push	0
	push	25					; 00000019H
	call	_gen_rtx
	add	esp, 16					; 00000010H
	jmp	$L739
; Line 182
$L739:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_gen_zero_extendhisi2 ENDP
_TEXT	ENDS
PUBLIC	_gen_zero_extendqihi2
_TEXT	SEGMENT
_operand0$ = 8
_operand1$ = 12
_gen_zero_extendqihi2 PROC NEAR
; Line 188
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 189
	mov	eax, DWORD PTR _operand1$[ebp]
	push	eax
	push	2
	push	78					; 0000004eH
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	push	eax
	mov	eax, DWORD PTR _operand0$[ebp]
	push	eax
	push	0
	push	25					; 00000019H
	call	_gen_rtx
	add	esp, 16					; 00000010H
	jmp	$L742
; Line 190
$L742:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_gen_zero_extendqihi2 ENDP
_TEXT	ENDS
PUBLIC	_gen_zero_extendqisi2
_TEXT	SEGMENT
_operand0$ = 8
_operand1$ = 12
_gen_zero_extendqisi2 PROC NEAR
; Line 196
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 197
	mov	eax, DWORD PTR _operand1$[ebp]
	push	eax
	push	4
	push	78					; 0000004eH
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	push	eax
	mov	eax, DWORD PTR _operand0$[ebp]
	push	eax
	push	0
	push	25					; 00000019H
	call	_gen_rtx
	add	esp, 16					; 00000010H
	jmp	$L745
; Line 198
$L745:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_gen_zero_extendqisi2 ENDP
_TEXT	ENDS
PUBLIC	_gen_extendhisi2
_TEXT	SEGMENT
_operand0$ = 8
_operand1$ = 12
_gen_extendhisi2 PROC NEAR
; Line 204
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 205
	mov	eax, DWORD PTR _operand1$[ebp]
	push	eax
	push	4
	push	77					; 0000004dH
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	push	eax
	mov	eax, DWORD PTR _operand0$[ebp]
	push	eax
	push	0
	push	25					; 00000019H
	call	_gen_rtx
	add	esp, 16					; 00000010H
	jmp	$L748
; Line 206
$L748:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_gen_extendhisi2 ENDP
_TEXT	ENDS
PUBLIC	_gen_extendqihi2
_TEXT	SEGMENT
_operand0$ = 8
_operand1$ = 12
_gen_extendqihi2 PROC NEAR
; Line 212
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 213
	mov	eax, DWORD PTR _operand1$[ebp]
	push	eax
	push	2
	push	77					; 0000004dH
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	push	eax
	mov	eax, DWORD PTR _operand0$[ebp]
	push	eax
	push	0
	push	25					; 00000019H
	call	_gen_rtx
	add	esp, 16					; 00000010H
	jmp	$L751
; Line 214
$L751:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_gen_extendqihi2 ENDP
_TEXT	ENDS
PUBLIC	_gen_extendqisi2
_TEXT	SEGMENT
_operand0$ = 8
_operand1$ = 12
_gen_extendqisi2 PROC NEAR
; Line 220
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 221
	mov	eax, DWORD PTR _operand1$[ebp]
	push	eax
	push	4
	push	77					; 0000004dH
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	push	eax
	mov	eax, DWORD PTR _operand0$[ebp]
	push	eax
	push	0
	push	25					; 00000019H
	call	_gen_rtx
	add	esp, 16					; 00000010H
	jmp	$L754
; Line 222
$L754:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_gen_extendqisi2 ENDP
_TEXT	ENDS
PUBLIC	_gen_extendsfdf2
_TEXT	SEGMENT
_operand0$ = 8
_operand1$ = 12
_gen_extendsfdf2 PROC NEAR
; Line 228
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 229
	mov	eax, DWORD PTR _operand1$[ebp]
	push	eax
	push	11					; 0000000bH
	push	80					; 00000050H
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	push	eax
	mov	eax, DWORD PTR _operand0$[ebp]
	push	eax
	push	0
	push	25					; 00000019H
	call	_gen_rtx
	add	esp, 16					; 00000010H
	jmp	$L757
; Line 230
$L757:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_gen_extendsfdf2 ENDP
_TEXT	ENDS
PUBLIC	_gen_truncdfsf2
_TEXT	SEGMENT
_operand0$ = 8
_operand1$ = 12
_gen_truncdfsf2 PROC NEAR
; Line 236
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 237
	mov	eax, DWORD PTR _operand1$[ebp]
	push	eax
	push	10					; 0000000aH
	push	81					; 00000051H
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	push	eax
	mov	eax, DWORD PTR _operand0$[ebp]
	push	eax
	push	0
	push	25					; 00000019H
	call	_gen_rtx
	add	esp, 16					; 00000010H
	jmp	$L760
; Line 238
$L760:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_gen_truncdfsf2 ENDP
_TEXT	ENDS
PUBLIC	_gen_floatsisf2
_TEXT	SEGMENT
_operand0$ = 8
_operand1$ = 12
_gen_floatsisf2 PROC NEAR
; Line 244
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 245
	mov	eax, DWORD PTR _operand1$[ebp]
	push	eax
	push	10					; 0000000aH
	push	82					; 00000052H
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	push	eax
	mov	eax, DWORD PTR _operand0$[ebp]
	push	eax
	push	0
	push	25					; 00000019H
	call	_gen_rtx
	add	esp, 16					; 00000010H
	jmp	$L763
; Line 246
$L763:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_gen_floatsisf2 ENDP
_TEXT	ENDS
PUBLIC	_gen_floatsidf2
_TEXT	SEGMENT
_operand0$ = 8
_operand1$ = 12
_gen_floatsidf2 PROC NEAR
; Line 252
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 253
	mov	eax, DWORD PTR _operand1$[ebp]
	push	eax
	push	11					; 0000000bH
	push	82					; 00000052H
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	push	eax
	mov	eax, DWORD PTR _operand0$[ebp]
	push	eax
	push	0
	push	25					; 00000019H
	call	_gen_rtx
	add	esp, 16					; 00000010H
	jmp	$L766
; Line 254
$L766:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_gen_floatsidf2 ENDP
_TEXT	ENDS
PUBLIC	_gen_addsi3
_TEXT	SEGMENT
_operand1$ = 12
_operand2$ = 16
_operand0$ = 8
_gen_addsi3 PROC NEAR
; Line 261
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 262
	mov	eax, DWORD PTR _operand2$[ebp]
	push	eax
	mov	eax, DWORD PTR _operand1$[ebp]
	push	eax
	push	4
	push	44					; 0000002cH
	call	_gen_rtx
	add	esp, 16					; 00000010H
	push	eax
	mov	eax, DWORD PTR _operand0$[ebp]
	push	eax
	push	0
	push	25					; 00000019H
	call	_gen_rtx
	add	esp, 16					; 00000010H
	jmp	$L770
; Line 263
$L770:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_gen_addsi3 ENDP
_TEXT	ENDS
PUBLIC	_gen_addhi3
_TEXT	SEGMENT
_operand0$ = 8
_operand1$ = 12
_operand2$ = 16
_gen_addhi3 PROC NEAR
; Line 270
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 271
	mov	eax, DWORD PTR _operand2$[ebp]
	push	eax
	mov	eax, DWORD PTR _operand1$[ebp]
	push	eax
	push	2
	push	44					; 0000002cH
	call	_gen_rtx
	add	esp, 16					; 00000010H
	push	eax
	mov	eax, DWORD PTR _operand0$[ebp]
	push	eax
	push	0
	push	25					; 00000019H
	call	_gen_rtx
	add	esp, 16					; 00000010H
	jmp	$L774
; Line 272
$L774:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_gen_addhi3 ENDP
_TEXT	ENDS
PUBLIC	_gen_addqi3
_TEXT	SEGMENT
_operand0$ = 8
_operand1$ = 12
_operand2$ = 16
_gen_addqi3 PROC NEAR
; Line 279
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 280
	mov	eax, DWORD PTR _operand2$[ebp]
	push	eax
	mov	eax, DWORD PTR _operand1$[ebp]
	push	eax
	push	1
	push	44					; 0000002cH
	call	_gen_rtx
	add	esp, 16					; 00000010H
	push	eax
	mov	eax, DWORD PTR _operand0$[ebp]
	push	eax
	push	0
	push	25					; 00000019H
	call	_gen_rtx
	add	esp, 16					; 00000010H
	jmp	$L778
; Line 281
$L778:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_gen_addqi3 ENDP
_TEXT	ENDS
PUBLIC	_gen_adddf3
_TEXT	SEGMENT
_operand0$ = 8
_operand1$ = 12
_operand2$ = 16
_gen_adddf3 PROC NEAR
; Line 288
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 289
	mov	eax, DWORD PTR _operand2$[ebp]
	push	eax
	mov	eax, DWORD PTR _operand1$[ebp]
	push	eax
	push	11					; 0000000bH
	push	44					; 0000002cH
	call	_gen_rtx
	add	esp, 16					; 00000010H
	push	eax
	mov	eax, DWORD PTR _operand0$[ebp]
	push	eax
	push	0
	push	25					; 00000019H
	call	_gen_rtx
	add	esp, 16					; 00000010H
	jmp	$L782
; Line 290
$L782:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_gen_adddf3 ENDP
_TEXT	ENDS
PUBLIC	_gen_addsf3
_TEXT	SEGMENT
_operand0$ = 8
_operand1$ = 12
_operand2$ = 16
_gen_addsf3 PROC NEAR
; Line 297
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 298
	mov	eax, DWORD PTR _operand2$[ebp]
	push	eax
	mov	eax, DWORD PTR _operand1$[ebp]
	push	eax
	push	10					; 0000000aH
	push	44					; 0000002cH
	call	_gen_rtx
	add	esp, 16					; 00000010H
	push	eax
	mov	eax, DWORD PTR _operand0$[ebp]
	push	eax
	push	0
	push	25					; 00000019H
	call	_gen_rtx
	add	esp, 16					; 00000010H
	jmp	$L786
; Line 299
$L786:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_gen_addsf3 ENDP
_TEXT	ENDS
PUBLIC	_gen_subsi3
_TEXT	SEGMENT
_operand0$ = 8
_operand1$ = 12
_operand2$ = 16
_gen_subsi3 PROC NEAR
; Line 306
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 307
	mov	eax, DWORD PTR _operand2$[ebp]
	push	eax
	mov	eax, DWORD PTR _operand1$[ebp]
	push	eax
	push	4
	push	45					; 0000002dH
	call	_gen_rtx
	add	esp, 16					; 00000010H
	push	eax
	mov	eax, DWORD PTR _operand0$[ebp]
	push	eax
	push	0
	push	25					; 00000019H
	call	_gen_rtx
	add	esp, 16					; 00000010H
	jmp	$L790
; Line 308
$L790:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_gen_subsi3 ENDP
_TEXT	ENDS
PUBLIC	_gen_subhi3
_TEXT	SEGMENT
_operand0$ = 8
_operand1$ = 12
_operand2$ = 16
_gen_subhi3 PROC NEAR
; Line 315
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 316
	mov	eax, DWORD PTR _operand2$[ebp]
	push	eax
	mov	eax, DWORD PTR _operand1$[ebp]
	push	eax
	push	2
	push	45					; 0000002dH
	call	_gen_rtx
	add	esp, 16					; 00000010H
	push	eax
	mov	eax, DWORD PTR _operand0$[ebp]
	push	eax
	push	0
	push	25					; 00000019H
	call	_gen_rtx
	add	esp, 16					; 00000010H
	jmp	$L794
; Line 317
$L794:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_gen_subhi3 ENDP
_TEXT	ENDS
PUBLIC	_gen_subqi3
_TEXT	SEGMENT
_operand0$ = 8
_operand1$ = 12
_operand2$ = 16
_gen_subqi3 PROC NEAR
; Line 324
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 325
	mov	eax, DWORD PTR _operand2$[ebp]
	push	eax
	mov	eax, DWORD PTR _operand1$[ebp]
	push	eax
	push	1
	push	45					; 0000002dH
	call	_gen_rtx
	add	esp, 16					; 00000010H
	push	eax
	mov	eax, DWORD PTR _operand0$[ebp]
	push	eax
	push	0
	push	25					; 00000019H
	call	_gen_rtx
	add	esp, 16					; 00000010H
	jmp	$L798
; Line 326
$L798:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_gen_subqi3 ENDP
_TEXT	ENDS
PUBLIC	_gen_subdf3
_TEXT	SEGMENT
_operand0$ = 8
_operand1$ = 12
_operand2$ = 16
_gen_subdf3 PROC NEAR
; Line 333
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 334
	mov	eax, DWORD PTR _operand2$[ebp]
	push	eax
	mov	eax, DWORD PTR _operand1$[ebp]
	push	eax
	push	11					; 0000000bH
	push	45					; 0000002dH
	call	_gen_rtx
	add	esp, 16					; 00000010H
	push	eax
	mov	eax, DWORD PTR _operand0$[ebp]
	push	eax
	push	0
	push	25					; 00000019H
	call	_gen_rtx
	add	esp, 16					; 00000010H
	jmp	$L802
; Line 335
$L802:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_gen_subdf3 ENDP
_TEXT	ENDS
PUBLIC	_gen_subsf3
_TEXT	SEGMENT
_operand0$ = 8
_operand1$ = 12
_operand2$ = 16
_gen_subsf3 PROC NEAR
; Line 342
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 343
	mov	eax, DWORD PTR _operand2$[ebp]
	push	eax
	mov	eax, DWORD PTR _operand1$[ebp]
	push	eax
	push	10					; 0000000aH
	push	45					; 0000002dH
	call	_gen_rtx
	add	esp, 16					; 00000010H
	push	eax
	mov	eax, DWORD PTR _operand0$[ebp]
	push	eax
	push	0
	push	25					; 00000019H
	call	_gen_rtx
	add	esp, 16					; 00000010H
	jmp	$L806
; Line 344
$L806:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_gen_subsf3 ENDP
_TEXT	ENDS
PUBLIC	_gen_mulhi3
_TEXT	SEGMENT
_operand0$ = 8
_operand1$ = 12
_operand2$ = 16
_gen_mulhi3 PROC NEAR
; Line 351
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 352
	mov	eax, DWORD PTR _operand2$[ebp]
	push	eax
	mov	eax, DWORD PTR _operand1$[ebp]
	push	eax
	push	4
	push	47					; 0000002fH
	call	_gen_rtx
	add	esp, 16					; 00000010H
	push	eax
	mov	eax, DWORD PTR _operand0$[ebp]
	push	eax
	push	0
	push	25					; 00000019H
	call	_gen_rtx
	add	esp, 16					; 00000010H
	jmp	$L810
; Line 353
$L810:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_gen_mulhi3 ENDP
_TEXT	ENDS
PUBLIC	_gen_mulsi3
_TEXT	SEGMENT
_operand0$ = 8
_operand1$ = 12
_operand2$ = 16
_gen_mulsi3 PROC NEAR
; Line 360
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 361
	mov	eax, DWORD PTR _operand2$[ebp]
	push	eax
	mov	eax, DWORD PTR _operand1$[ebp]
	push	eax
	push	4
	push	47					; 0000002fH
	call	_gen_rtx
	add	esp, 16					; 00000010H
	push	eax
	mov	eax, DWORD PTR _operand0$[ebp]
	push	eax
	push	0
	push	25					; 00000019H
	call	_gen_rtx
	add	esp, 16					; 00000010H
	jmp	$L814
; Line 362
$L814:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_gen_mulsi3 ENDP
_TEXT	ENDS
PUBLIC	_gen_umulhi3
_TEXT	SEGMENT
_operand0$ = 8
_operand1$ = 12
_operand2$ = 16
_gen_umulhi3 PROC NEAR
; Line 369
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 372
	push	1
	push	2
	push	34					; 00000022H
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	push	27					; 0000001bH
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	push	eax
	mov	eax, DWORD PTR _operand2$[ebp]
	push	eax
	mov	eax, DWORD PTR _operand1$[ebp]
	push	eax
	push	4
	push	50					; 00000032H
	call	_gen_rtx
	add	esp, 16					; 00000010H
	push	eax
	mov	eax, DWORD PTR _operand0$[ebp]
	push	eax
	push	0
	push	25					; 00000019H
	call	_gen_rtx
	add	esp, 16					; 00000010H
	push	eax
	push	2
	call	_gen_rtvec
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	push	20					; 00000014H
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	jmp	$L818
; Line 373
$L818:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_gen_umulhi3 ENDP
_TEXT	ENDS
PUBLIC	_gen_umulsi3
_TEXT	SEGMENT
_operand0$ = 8
_operand1$ = 12
_operand2$ = 16
_gen_umulsi3 PROC NEAR
; Line 380
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 383
	push	1
	push	4
	push	34					; 00000022H
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	push	27					; 0000001bH
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	push	eax
	mov	eax, DWORD PTR _operand2$[ebp]
	push	eax
	mov	eax, DWORD PTR _operand1$[ebp]
	push	eax
	push	4
	push	50					; 00000032H
	call	_gen_rtx
	add	esp, 16					; 00000010H
	push	eax
	mov	eax, DWORD PTR _operand0$[ebp]
	push	eax
	push	0
	push	25					; 00000019H
	call	_gen_rtx
	add	esp, 16					; 00000010H
	push	eax
	push	2
	call	_gen_rtvec
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	push	20					; 00000014H
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	jmp	$L822
; Line 384
$L822:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_gen_umulsi3 ENDP
_TEXT	ENDS
PUBLIC	_gen_muldf3
_TEXT	SEGMENT
_operand0$ = 8
_operand1$ = 12
_operand2$ = 16
_gen_muldf3 PROC NEAR
; Line 391
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 392
	mov	eax, DWORD PTR _operand2$[ebp]
	push	eax
	mov	eax, DWORD PTR _operand1$[ebp]
	push	eax
	push	11					; 0000000bH
	push	47					; 0000002fH
	call	_gen_rtx
	add	esp, 16					; 00000010H
	push	eax
	mov	eax, DWORD PTR _operand0$[ebp]
	push	eax
	push	0
	push	25					; 00000019H
	call	_gen_rtx
	add	esp, 16					; 00000010H
	jmp	$L826
; Line 393
$L826:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_gen_muldf3 ENDP
_TEXT	ENDS
PUBLIC	_gen_mulsf3
_TEXT	SEGMENT
_operand0$ = 8
_operand1$ = 12
_operand2$ = 16
_gen_mulsf3 PROC NEAR
; Line 400
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 401
	mov	eax, DWORD PTR _operand2$[ebp]
	push	eax
	mov	eax, DWORD PTR _operand1$[ebp]
	push	eax
	push	10					; 0000000aH
	push	47					; 0000002fH
	call	_gen_rtx
	add	esp, 16					; 00000010H
	push	eax
	mov	eax, DWORD PTR _operand0$[ebp]
	push	eax
	push	0
	push	25					; 00000019H
	call	_gen_rtx
	add	esp, 16					; 00000010H
	jmp	$L830
; Line 402
$L830:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_gen_mulsf3 ENDP
_TEXT	ENDS
PUBLIC	_gen_divdf3
_TEXT	SEGMENT
_operand1$ = 12
_operand2$ = 16
_operand0$ = 8
_gen_divdf3 PROC NEAR
; Line 409
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 410
	mov	eax, DWORD PTR _operand2$[ebp]
	push	eax
	mov	eax, DWORD PTR _operand1$[ebp]
	push	eax
	push	11					; 0000000bH
	push	48					; 00000030H
	call	_gen_rtx
	add	esp, 16					; 00000010H
	push	eax
	mov	eax, DWORD PTR _operand0$[ebp]
	push	eax
	push	0
	push	25					; 00000019H
	call	_gen_rtx
	add	esp, 16					; 00000010H
	jmp	$L834
; Line 411
$L834:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_gen_divdf3 ENDP
_TEXT	ENDS
PUBLIC	_gen_divsf3
_TEXT	SEGMENT
_operand0$ = 8
_operand1$ = 12
_operand2$ = 16
_gen_divsf3 PROC NEAR
; Line 418
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 419
	mov	eax, DWORD PTR _operand2$[ebp]
	push	eax
	mov	eax, DWORD PTR _operand1$[ebp]
	push	eax
	push	10					; 0000000aH
	push	48					; 00000030H
	call	_gen_rtx
	add	esp, 16					; 00000010H
	push	eax
	mov	eax, DWORD PTR _operand0$[ebp]
	push	eax
	push	0
	push	25					; 00000019H
	call	_gen_rtx
	add	esp, 16					; 00000010H
	jmp	$L838
; Line 420
$L838:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_gen_divsf3 ENDP
_TEXT	ENDS
PUBLIC	_gen_divmodsi4
EXTRN	_emit:NEAR
EXTRN	_end_sequence:NEAR
EXTRN	_copy_to_mode_reg:NEAR
EXTRN	_start_sequence:NEAR
EXTRN	_gen_sequence:NEAR
EXTRN	_optimize:DWORD
_TEXT	SEGMENT
_operand0$ = 8
_operand1$ = 12
_operand2$ = 16
_operand3$ = 20
_emit_operand$ = -16
__val$ = -20
_gen_divmodsi4 PROC NEAR
; Line 428
	push	ebp
	mov	ebp, esp
	sub	esp, 20					; 00000014H
	push	ebx
	push	esi
	push	edi
; Line 431
	call	_start_sequence
; Line 432
	mov	eax, DWORD PTR _operand0$[ebp]
	mov	DWORD PTR _emit_operand$[ebp], eax
; Line 433
	mov	eax, DWORD PTR _operand1$[ebp]
	mov	DWORD PTR _emit_operand$[ebp+4], eax
; Line 434
	mov	eax, DWORD PTR _operand2$[ebp]
	mov	DWORD PTR _emit_operand$[ebp+8], eax
; Line 435
	mov	eax, DWORD PTR _operand3$[ebp]
	mov	DWORD PTR _emit_operand$[ebp+12], eax
; Line 439
	cmp	DWORD PTR _optimize, 0
	je	$L847
; Line 441
	mov	eax, DWORD PTR _emit_operand$[ebp+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L848
	mov	eax, DWORD PTR _emit_operand$[ebp+4]
	mov	eax, DWORD PTR [eax]
	shr	eax, 27					; 0000001bH
	test	al, 1
	je	$L848
; Line 442
	mov	eax, DWORD PTR _emit_operand$[ebp+4]
	push	eax
	push	4
	call	_copy_to_mode_reg
	add	esp, 8
	mov	DWORD PTR _emit_operand$[ebp+4], eax
; Line 443
$L848:
	mov	eax, DWORD PTR _emit_operand$[ebp+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L849
	mov	eax, DWORD PTR _emit_operand$[ebp+8]
	mov	eax, DWORD PTR [eax]
	shr	eax, 27					; 0000001bH
	test	al, 1
	je	$L849
; Line 444
	mov	eax, DWORD PTR _emit_operand$[ebp+8]
	push	eax
	push	4
	call	_copy_to_mode_reg
	add	esp, 8
	mov	DWORD PTR _emit_operand$[ebp+8], eax
; Line 445
$L849:
; Line 446
$L847:
; Line 447
	mov	eax, DWORD PTR _emit_operand$[ebp]
	mov	DWORD PTR _operand0$[ebp], eax
; Line 448
	mov	eax, DWORD PTR _emit_operand$[ebp+4]
	mov	DWORD PTR _operand1$[ebp], eax
; Line 449
	mov	eax, DWORD PTR _emit_operand$[ebp+8]
	mov	DWORD PTR _operand2$[ebp], eax
; Line 450
	mov	eax, DWORD PTR _emit_operand$[ebp+12]
	mov	DWORD PTR _operand3$[ebp], eax
; Line 453
	mov	eax, DWORD PTR _operand2$[ebp]
	push	eax
	mov	eax, DWORD PTR _operand1$[ebp]
	push	eax
	push	4
	push	49					; 00000031H
	call	_gen_rtx
	add	esp, 16					; 00000010H
	push	eax
	mov	eax, DWORD PTR _operand3$[ebp]
	push	eax
	push	0
	push	25					; 00000019H
	call	_gen_rtx
	add	esp, 16					; 00000010H
	push	eax
	mov	eax, DWORD PTR _operand2$[ebp]
	push	eax
	mov	eax, DWORD PTR _operand1$[ebp]
	push	eax
	push	4
	push	48					; 00000030H
	call	_gen_rtx
	add	esp, 16					; 00000010H
	push	eax
	mov	eax, DWORD PTR _operand0$[ebp]
	push	eax
	push	0
	push	25					; 00000019H
	call	_gen_rtx
	add	esp, 16					; 00000010H
	push	eax
	push	2
	call	_gen_rtvec
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	push	20					; 00000014H
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	push	eax
	call	_emit
	add	esp, 4
; Line 454
$_done$851:
; Line 455
	call	_gen_sequence
	mov	DWORD PTR __val$[ebp], eax
; Line 456
	call	_end_sequence
; Line 457
	mov	eax, DWORD PTR __val$[ebp]
	jmp	$L843
; Line 458
$L843:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_gen_divmodsi4 ENDP
_TEXT	ENDS
PUBLIC	_gen_udivmodsi4
EXTRN	_optimize:DWORD
_TEXT	SEGMENT
_operand0$ = 8
_operand1$ = 12
_operand2$ = 16
_operand3$ = 20
_emit_operand$ = -16
__val$ = -20
_gen_udivmodsi4 PROC NEAR
; Line 466
	push	ebp
	mov	ebp, esp
	sub	esp, 20					; 00000014H
	push	ebx
	push	esi
	push	edi
; Line 469
	call	_start_sequence
; Line 470
	mov	eax, DWORD PTR _operand0$[ebp]
	mov	DWORD PTR _emit_operand$[ebp], eax
; Line 471
	mov	eax, DWORD PTR _operand1$[ebp]
	mov	DWORD PTR _emit_operand$[ebp+4], eax
; Line 472
	mov	eax, DWORD PTR _operand2$[ebp]
	mov	DWORD PTR _emit_operand$[ebp+8], eax
; Line 473
	mov	eax, DWORD PTR _operand3$[ebp]
	mov	DWORD PTR _emit_operand$[ebp+12], eax
; Line 477
	cmp	DWORD PTR _optimize, 0
	je	$L861
; Line 479
	mov	eax, DWORD PTR _emit_operand$[ebp+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L862
	mov	eax, DWORD PTR _emit_operand$[ebp+4]
	mov	eax, DWORD PTR [eax]
	shr	eax, 27					; 0000001bH
	test	al, 1
	je	$L862
; Line 480
	mov	eax, DWORD PTR _emit_operand$[ebp+4]
	push	eax
	push	4
	call	_copy_to_mode_reg
	add	esp, 8
	mov	DWORD PTR _emit_operand$[ebp+4], eax
; Line 481
$L862:
	mov	eax, DWORD PTR _emit_operand$[ebp+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L863
	mov	eax, DWORD PTR _emit_operand$[ebp+8]
	mov	eax, DWORD PTR [eax]
	shr	eax, 27					; 0000001bH
	test	al, 1
	je	$L863
; Line 482
	mov	eax, DWORD PTR _emit_operand$[ebp+8]
	push	eax
	push	4
	call	_copy_to_mode_reg
	add	esp, 8
	mov	DWORD PTR _emit_operand$[ebp+8], eax
; Line 483
$L863:
; Line 484
$L861:
; Line 485
	mov	eax, DWORD PTR _emit_operand$[ebp]
	mov	DWORD PTR _operand0$[ebp], eax
; Line 486
	mov	eax, DWORD PTR _emit_operand$[ebp+4]
	mov	DWORD PTR _operand1$[ebp], eax
; Line 487
	mov	eax, DWORD PTR _emit_operand$[ebp+8]
	mov	DWORD PTR _operand2$[ebp], eax
; Line 488
	mov	eax, DWORD PTR _emit_operand$[ebp+12]
	mov	DWORD PTR _operand3$[ebp], eax
; Line 491
	mov	eax, DWORD PTR _operand2$[ebp]
	push	eax
	mov	eax, DWORD PTR _operand1$[ebp]
	push	eax
	push	4
	push	52					; 00000034H
	call	_gen_rtx
	add	esp, 16					; 00000010H
	push	eax
	mov	eax, DWORD PTR _operand3$[ebp]
	push	eax
	push	0
	push	25					; 00000019H
	call	_gen_rtx
	add	esp, 16					; 00000010H
	push	eax
	mov	eax, DWORD PTR _operand2$[ebp]
	push	eax
	mov	eax, DWORD PTR _operand1$[ebp]
	push	eax
	push	4
	push	51					; 00000033H
	call	_gen_rtx
	add	esp, 16					; 00000010H
	push	eax
	mov	eax, DWORD PTR _operand0$[ebp]
	push	eax
	push	0
	push	25					; 00000019H
	call	_gen_rtx
	add	esp, 16					; 00000010H
	push	eax
	push	2
	call	_gen_rtvec
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	push	20					; 00000014H
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	push	eax
	call	_emit
	add	esp, 4
; Line 492
$_done$864:
; Line 493
	call	_gen_sequence
	mov	DWORD PTR __val$[ebp], eax
; Line 494
	call	_end_sequence
; Line 495
	mov	eax, DWORD PTR __val$[ebp]
	jmp	$L857
; Line 496
$L857:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_gen_udivmodsi4 ENDP
_TEXT	ENDS
PUBLIC	_gen_andsi3
_TEXT	SEGMENT
_operand0$ = 8
_operand1$ = 12
_operand2$ = 16
_gen_andsi3 PROC NEAR
; Line 503
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 504
	mov	eax, DWORD PTR _operand2$[ebp]
	push	eax
	mov	eax, DWORD PTR _operand1$[ebp]
	push	eax
	push	4
	push	53					; 00000035H
	call	_gen_rtx
	add	esp, 16					; 00000010H
	push	eax
	mov	eax, DWORD PTR _operand0$[ebp]
	push	eax
	push	0
	push	25					; 00000019H
	call	_gen_rtx
	add	esp, 16					; 00000010H
	jmp	$L868
; Line 505
$L868:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_gen_andsi3 ENDP
_TEXT	ENDS
PUBLIC	_gen_andhi3
_TEXT	SEGMENT
_operand0$ = 8
_operand1$ = 12
_operand2$ = 16
_gen_andhi3 PROC NEAR
; Line 512
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 513
	mov	eax, DWORD PTR _operand2$[ebp]
	push	eax
	mov	eax, DWORD PTR _operand1$[ebp]
	push	eax
	push	2
	push	53					; 00000035H
	call	_gen_rtx
	add	esp, 16					; 00000010H
	push	eax
	mov	eax, DWORD PTR _operand0$[ebp]
	push	eax
	push	0
	push	25					; 00000019H
	call	_gen_rtx
	add	esp, 16					; 00000010H
	jmp	$L872
; Line 514
$L872:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_gen_andhi3 ENDP
_TEXT	ENDS
PUBLIC	_gen_andqi3
_TEXT	SEGMENT
_operand0$ = 8
_operand1$ = 12
_operand2$ = 16
_gen_andqi3 PROC NEAR
; Line 521
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 522
	mov	eax, DWORD PTR _operand2$[ebp]
	push	eax
	mov	eax, DWORD PTR _operand1$[ebp]
	push	eax
	push	1
	push	53					; 00000035H
	call	_gen_rtx
	add	esp, 16					; 00000010H
	push	eax
	mov	eax, DWORD PTR _operand0$[ebp]
	push	eax
	push	0
	push	25					; 00000019H
	call	_gen_rtx
	add	esp, 16					; 00000010H
	jmp	$L876
; Line 523
$L876:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_gen_andqi3 ENDP
_TEXT	ENDS
PUBLIC	_gen_iorsi3
_TEXT	SEGMENT
_operand0$ = 8
_operand1$ = 12
_operand2$ = 16
_gen_iorsi3 PROC NEAR
; Line 530
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 531
	mov	eax, DWORD PTR _operand2$[ebp]
	push	eax
	mov	eax, DWORD PTR _operand1$[ebp]
	push	eax
	push	4
	push	54					; 00000036H
	call	_gen_rtx
	add	esp, 16					; 00000010H
	push	eax
	mov	eax, DWORD PTR _operand0$[ebp]
	push	eax
	push	0
	push	25					; 00000019H
	call	_gen_rtx
	add	esp, 16					; 00000010H
	jmp	$L880
; Line 532
$L880:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_gen_iorsi3 ENDP
_TEXT	ENDS
PUBLIC	_gen_iorhi3
_TEXT	SEGMENT
_operand0$ = 8
_operand1$ = 12
_operand2$ = 16
_gen_iorhi3 PROC NEAR
; Line 539
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 540
	mov	eax, DWORD PTR _operand2$[ebp]
	push	eax
	mov	eax, DWORD PTR _operand1$[ebp]
	push	eax
	push	2
	push	54					; 00000036H
	call	_gen_rtx
	add	esp, 16					; 00000010H
	push	eax
	mov	eax, DWORD PTR _operand0$[ebp]
	push	eax
	push	0
	push	25					; 00000019H
	call	_gen_rtx
	add	esp, 16					; 00000010H
	jmp	$L884
; Line 541
$L884:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_gen_iorhi3 ENDP
_TEXT	ENDS
PUBLIC	_gen_iorqi3
_TEXT	SEGMENT
_operand0$ = 8
_operand1$ = 12
_operand2$ = 16
_gen_iorqi3 PROC NEAR
; Line 548
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 549
	mov	eax, DWORD PTR _operand2$[ebp]
	push	eax
	mov	eax, DWORD PTR _operand1$[ebp]
	push	eax
	push	1
	push	54					; 00000036H
	call	_gen_rtx
	add	esp, 16					; 00000010H
	push	eax
	mov	eax, DWORD PTR _operand0$[ebp]
	push	eax
	push	0
	push	25					; 00000019H
	call	_gen_rtx
	add	esp, 16					; 00000010H
	jmp	$L888
; Line 550
$L888:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_gen_iorqi3 ENDP
_TEXT	ENDS
PUBLIC	_gen_xorsi3
_TEXT	SEGMENT
_operand0$ = 8
_operand1$ = 12
_operand2$ = 16
_gen_xorsi3 PROC NEAR
; Line 557
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 558
	mov	eax, DWORD PTR _operand2$[ebp]
	push	eax
	mov	eax, DWORD PTR _operand1$[ebp]
	push	eax
	push	4
	push	55					; 00000037H
	call	_gen_rtx
	add	esp, 16					; 00000010H
	push	eax
	mov	eax, DWORD PTR _operand0$[ebp]
	push	eax
	push	0
	push	25					; 00000019H
	call	_gen_rtx
	add	esp, 16					; 00000010H
	jmp	$L892
; Line 559
$L892:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_gen_xorsi3 ENDP
_TEXT	ENDS
PUBLIC	_gen_xorhi3
_TEXT	SEGMENT
_operand0$ = 8
_operand1$ = 12
_operand2$ = 16
_gen_xorhi3 PROC NEAR
; Line 566
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 567
	mov	eax, DWORD PTR _operand2$[ebp]
	push	eax
	mov	eax, DWORD PTR _operand1$[ebp]
	push	eax
	push	2
	push	55					; 00000037H
	call	_gen_rtx
	add	esp, 16					; 00000010H
	push	eax
	mov	eax, DWORD PTR _operand0$[ebp]
	push	eax
	push	0
	push	25					; 00000019H
	call	_gen_rtx
	add	esp, 16					; 00000010H
	jmp	$L896
; Line 568
$L896:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_gen_xorhi3 ENDP
_TEXT	ENDS
PUBLIC	_gen_xorqi3
_TEXT	SEGMENT
_operand0$ = 8
_operand1$ = 12
_operand2$ = 16
_gen_xorqi3 PROC NEAR
; Line 575
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 576
	mov	eax, DWORD PTR _operand2$[ebp]
	push	eax
	mov	eax, DWORD PTR _operand1$[ebp]
	push	eax
	push	1
	push	55					; 00000037H
	call	_gen_rtx
	add	esp, 16					; 00000010H
	push	eax
	mov	eax, DWORD PTR _operand0$[ebp]
	push	eax
	push	0
	push	25					; 00000019H
	call	_gen_rtx
	add	esp, 16					; 00000010H
	jmp	$L900
; Line 577
$L900:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_gen_xorqi3 ENDP
_TEXT	ENDS
PUBLIC	_gen_negsi2
_TEXT	SEGMENT
_operand0$ = 8
_operand1$ = 12
_gen_negsi2 PROC NEAR
; Line 583
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 584
	mov	eax, DWORD PTR _operand1$[ebp]
	push	eax
	push	4
	push	46					; 0000002eH
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	push	eax
	mov	eax, DWORD PTR _operand0$[ebp]
	push	eax
	push	0
	push	25					; 00000019H
	call	_gen_rtx
	add	esp, 16					; 00000010H
	jmp	$L903
; Line 585
$L903:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_gen_negsi2 ENDP
_TEXT	ENDS
PUBLIC	_gen_neghi2
_TEXT	SEGMENT
_operand0$ = 8
_operand1$ = 12
_gen_neghi2 PROC NEAR
; Line 591
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 592
	mov	eax, DWORD PTR _operand1$[ebp]
	push	eax
	push	2
	push	46					; 0000002eH
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	push	eax
	mov	eax, DWORD PTR _operand0$[ebp]
	push	eax
	push	0
	push	25					; 00000019H
	call	_gen_rtx
	add	esp, 16					; 00000010H
	jmp	$L906
; Line 593
$L906:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_gen_neghi2 ENDP
_TEXT	ENDS
PUBLIC	_gen_negqi2
_TEXT	SEGMENT
_operand0$ = 8
_operand1$ = 12
_gen_negqi2 PROC NEAR
; Line 599
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 600
	mov	eax, DWORD PTR _operand1$[ebp]
	push	eax
	push	1
	push	46					; 0000002eH
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	push	eax
	mov	eax, DWORD PTR _operand0$[ebp]
	push	eax
	push	0
	push	25					; 00000019H
	call	_gen_rtx
	add	esp, 16					; 00000010H
	jmp	$L909
; Line 601
$L909:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_gen_negqi2 ENDP
_TEXT	ENDS
PUBLIC	_gen_negsf2
_TEXT	SEGMENT
_operand0$ = 8
_operand1$ = 12
_gen_negsf2 PROC NEAR
; Line 607
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 608
	mov	eax, DWORD PTR _operand1$[ebp]
	push	eax
	push	10					; 0000000aH
	push	46					; 0000002eH
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	push	eax
	mov	eax, DWORD PTR _operand0$[ebp]
	push	eax
	push	0
	push	25					; 00000019H
	call	_gen_rtx
	add	esp, 16					; 00000010H
	jmp	$L912
; Line 609
$L912:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_gen_negsf2 ENDP
_TEXT	ENDS
PUBLIC	_gen_negdf2
_TEXT	SEGMENT
_operand0$ = 8
_operand1$ = 12
_gen_negdf2 PROC NEAR
; Line 615
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 616
	mov	eax, DWORD PTR _operand1$[ebp]
	push	eax
	push	11					; 0000000bH
	push	46					; 0000002eH
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	push	eax
	mov	eax, DWORD PTR _operand0$[ebp]
	push	eax
	push	0
	push	25					; 00000019H
	call	_gen_rtx
	add	esp, 16					; 00000010H
	jmp	$L915
; Line 617
$L915:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_gen_negdf2 ENDP
_TEXT	ENDS
PUBLIC	_gen_abssf2
_TEXT	SEGMENT
_operand0$ = 8
_operand1$ = 12
_gen_abssf2 PROC NEAR
; Line 623
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 624
	mov	eax, DWORD PTR _operand1$[ebp]
	push	eax
	push	10					; 0000000aH
	push	86					; 00000056H
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	push	eax
	mov	eax, DWORD PTR _operand0$[ebp]
	push	eax
	push	0
	push	25					; 00000019H
	call	_gen_rtx
	add	esp, 16					; 00000010H
	jmp	$L918
; Line 625
$L918:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_gen_abssf2 ENDP
_TEXT	ENDS
PUBLIC	_gen_absdf2
_TEXT	SEGMENT
_operand0$ = 8
_operand1$ = 12
_gen_absdf2 PROC NEAR
; Line 631
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 632
	mov	eax, DWORD PTR _operand1$[ebp]
	push	eax
	push	11					; 0000000bH
	push	86					; 00000056H
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	push	eax
	mov	eax, DWORD PTR _operand0$[ebp]
	push	eax
	push	0
	push	25					; 00000019H
	call	_gen_rtx
	add	esp, 16					; 00000010H
	jmp	$L921
; Line 633
$L921:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_gen_absdf2 ENDP
_TEXT	ENDS
PUBLIC	_gen_one_cmplsi2
_TEXT	SEGMENT
_operand0$ = 8
_operand1$ = 12
_gen_one_cmplsi2 PROC NEAR
; Line 639
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 640
	mov	eax, DWORD PTR _operand1$[ebp]
	push	eax
	push	4
	push	56					; 00000038H
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	push	eax
	mov	eax, DWORD PTR _operand0$[ebp]
	push	eax
	push	0
	push	25					; 00000019H
	call	_gen_rtx
	add	esp, 16					; 00000010H
	jmp	$L924
; Line 641
$L924:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_gen_one_cmplsi2 ENDP
_TEXT	ENDS
PUBLIC	_gen_one_cmplhi2
_TEXT	SEGMENT
_operand0$ = 8
_operand1$ = 12
_gen_one_cmplhi2 PROC NEAR
; Line 647
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 648
	mov	eax, DWORD PTR _operand1$[ebp]
	push	eax
	push	2
	push	56					; 00000038H
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	push	eax
	mov	eax, DWORD PTR _operand0$[ebp]
	push	eax
	push	0
	push	25					; 00000019H
	call	_gen_rtx
	add	esp, 16					; 00000010H
	jmp	$L927
; Line 649
$L927:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_gen_one_cmplhi2 ENDP
_TEXT	ENDS
PUBLIC	_gen_one_cmplqi2
_TEXT	SEGMENT
_operand0$ = 8
_operand1$ = 12
_gen_one_cmplqi2 PROC NEAR
; Line 655
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 656
	mov	eax, DWORD PTR _operand1$[ebp]
	push	eax
	push	1
	push	56					; 00000038H
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	push	eax
	mov	eax, DWORD PTR _operand0$[ebp]
	push	eax
	push	0
	push	25					; 00000019H
	call	_gen_rtx
	add	esp, 16					; 00000010H
	jmp	$L930
; Line 657
$L930:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_gen_one_cmplqi2 ENDP
_TEXT	ENDS
PUBLIC	_gen_ashlsi3
_TEXT	SEGMENT
_operand0$ = 8
_operand1$ = 12
_operand2$ = 16
_gen_ashlsi3 PROC NEAR
; Line 664
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 665
	mov	eax, DWORD PTR _operand2$[ebp]
	push	eax
	mov	eax, DWORD PTR _operand1$[ebp]
	push	eax
	push	4
	push	58					; 0000003aH
	call	_gen_rtx
	add	esp, 16					; 00000010H
	push	eax
	mov	eax, DWORD PTR _operand0$[ebp]
	push	eax
	push	0
	push	25					; 00000019H
	call	_gen_rtx
	add	esp, 16					; 00000010H
	jmp	$L934
; Line 666
$L934:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_gen_ashlsi3 ENDP
_TEXT	ENDS
PUBLIC	_gen_ashlhi3
_TEXT	SEGMENT
_operand0$ = 8
_operand1$ = 12
_operand2$ = 16
_gen_ashlhi3 PROC NEAR
; Line 673
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 674
	mov	eax, DWORD PTR _operand2$[ebp]
	push	eax
	mov	eax, DWORD PTR _operand1$[ebp]
	push	eax
	push	2
	push	58					; 0000003aH
	call	_gen_rtx
	add	esp, 16					; 00000010H
	push	eax
	mov	eax, DWORD PTR _operand0$[ebp]
	push	eax
	push	0
	push	25					; 00000019H
	call	_gen_rtx
	add	esp, 16					; 00000010H
	jmp	$L938
; Line 675
$L938:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_gen_ashlhi3 ENDP
_TEXT	ENDS
PUBLIC	_gen_ashlqi3
_TEXT	SEGMENT
_operand0$ = 8
_operand1$ = 12
_operand2$ = 16
_gen_ashlqi3 PROC NEAR
; Line 682
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 683
	mov	eax, DWORD PTR _operand2$[ebp]
	push	eax
	mov	eax, DWORD PTR _operand1$[ebp]
	push	eax
	push	1
	push	58					; 0000003aH
	call	_gen_rtx
	add	esp, 16					; 00000010H
	push	eax
	mov	eax, DWORD PTR _operand0$[ebp]
	push	eax
	push	0
	push	25					; 00000019H
	call	_gen_rtx
	add	esp, 16					; 00000010H
	jmp	$L942
; Line 684
$L942:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_gen_ashlqi3 ENDP
_TEXT	ENDS
PUBLIC	_gen_ashrsi3
_TEXT	SEGMENT
_operand0$ = 8
_operand1$ = 12
_operand2$ = 16
_gen_ashrsi3 PROC NEAR
; Line 691
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 692
	mov	eax, DWORD PTR _operand2$[ebp]
	push	eax
	mov	eax, DWORD PTR _operand1$[ebp]
	push	eax
	push	4
	push	60					; 0000003cH
	call	_gen_rtx
	add	esp, 16					; 00000010H
	push	eax
	mov	eax, DWORD PTR _operand0$[ebp]
	push	eax
	push	0
	push	25					; 00000019H
	call	_gen_rtx
	add	esp, 16					; 00000010H
	jmp	$L946
; Line 693
$L946:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_gen_ashrsi3 ENDP
_TEXT	ENDS
PUBLIC	_gen_ashrhi3
_TEXT	SEGMENT
_operand0$ = 8
_operand1$ = 12
_operand2$ = 16
_gen_ashrhi3 PROC NEAR
; Line 700
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 701
	mov	eax, DWORD PTR _operand2$[ebp]
	push	eax
	mov	eax, DWORD PTR _operand1$[ebp]
	push	eax
	push	2
	push	60					; 0000003cH
	call	_gen_rtx
	add	esp, 16					; 00000010H
	push	eax
	mov	eax, DWORD PTR _operand0$[ebp]
	push	eax
	push	0
	push	25					; 00000019H
	call	_gen_rtx
	add	esp, 16					; 00000010H
	jmp	$L950
; Line 702
$L950:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_gen_ashrhi3 ENDP
_TEXT	ENDS
PUBLIC	_gen_ashrqi3
_TEXT	SEGMENT
_operand0$ = 8
_operand1$ = 12
_operand2$ = 16
_gen_ashrqi3 PROC NEAR
; Line 709
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 710
	mov	eax, DWORD PTR _operand2$[ebp]
	push	eax
	mov	eax, DWORD PTR _operand1$[ebp]
	push	eax
	push	1
	push	60					; 0000003cH
	call	_gen_rtx
	add	esp, 16					; 00000010H
	push	eax
	mov	eax, DWORD PTR _operand0$[ebp]
	push	eax
	push	0
	push	25					; 00000019H
	call	_gen_rtx
	add	esp, 16					; 00000010H
	jmp	$L954
; Line 711
$L954:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_gen_ashrqi3 ENDP
_TEXT	ENDS
PUBLIC	_gen_lshlsi3
_TEXT	SEGMENT
_operand0$ = 8
_operand1$ = 12
_operand2$ = 16
_gen_lshlsi3 PROC NEAR
; Line 718
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 719
	mov	eax, DWORD PTR _operand2$[ebp]
	push	eax
	mov	eax, DWORD PTR _operand1$[ebp]
	push	eax
	push	4
	push	57					; 00000039H
	call	_gen_rtx
	add	esp, 16					; 00000010H
	push	eax
	mov	eax, DWORD PTR _operand0$[ebp]
	push	eax
	push	0
	push	25					; 00000019H
	call	_gen_rtx
	add	esp, 16					; 00000010H
	jmp	$L958
; Line 720
$L958:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_gen_lshlsi3 ENDP
_TEXT	ENDS
PUBLIC	_gen_lshlhi3
_TEXT	SEGMENT
_operand1$ = 12
_operand2$ = 16
_operand0$ = 8
_gen_lshlhi3 PROC NEAR
; Line 727
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 728
	mov	eax, DWORD PTR _operand2$[ebp]
	push	eax
	mov	eax, DWORD PTR _operand1$[ebp]
	push	eax
	push	2
	push	57					; 00000039H
	call	_gen_rtx
	add	esp, 16					; 00000010H
	push	eax
	mov	eax, DWORD PTR _operand0$[ebp]
	push	eax
	push	0
	push	25					; 00000019H
	call	_gen_rtx
	add	esp, 16					; 00000010H
	jmp	$L962
; Line 729
$L962:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_gen_lshlhi3 ENDP
_TEXT	ENDS
PUBLIC	_gen_lshlqi3
_TEXT	SEGMENT
_operand0$ = 8
_operand1$ = 12
_operand2$ = 16
_gen_lshlqi3 PROC NEAR
; Line 736
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 737
	mov	eax, DWORD PTR _operand2$[ebp]
	push	eax
	mov	eax, DWORD PTR _operand1$[ebp]
	push	eax
	push	1
	push	57					; 00000039H
	call	_gen_rtx
	add	esp, 16					; 00000010H
	push	eax
	mov	eax, DWORD PTR _operand0$[ebp]
	push	eax
	push	0
	push	25					; 00000019H
	call	_gen_rtx
	add	esp, 16					; 00000010H
	jmp	$L966
; Line 738
$L966:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_gen_lshlqi3 ENDP
_TEXT	ENDS
PUBLIC	_gen_lshrsi3
_TEXT	SEGMENT
_operand0$ = 8
_operand1$ = 12
_operand2$ = 16
_gen_lshrsi3 PROC NEAR
; Line 745
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 746
	mov	eax, DWORD PTR _operand2$[ebp]
	push	eax
	mov	eax, DWORD PTR _operand1$[ebp]
	push	eax
	push	4
	push	61					; 0000003dH
	call	_gen_rtx
	add	esp, 16					; 00000010H
	push	eax
	mov	eax, DWORD PTR _operand0$[ebp]
	push	eax
	push	0
	push	25					; 00000019H
	call	_gen_rtx
	add	esp, 16					; 00000010H
	jmp	$L970
; Line 747
$L970:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_gen_lshrsi3 ENDP
_TEXT	ENDS
PUBLIC	_gen_lshrhi3
_TEXT	SEGMENT
_operand0$ = 8
_operand1$ = 12
_operand2$ = 16
_gen_lshrhi3 PROC NEAR
; Line 754
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 755
	mov	eax, DWORD PTR _operand2$[ebp]
	push	eax
	mov	eax, DWORD PTR _operand1$[ebp]
	push	eax
	push	2
	push	61					; 0000003dH
	call	_gen_rtx
	add	esp, 16					; 00000010H
	push	eax
	mov	eax, DWORD PTR _operand0$[ebp]
	push	eax
	push	0
	push	25					; 00000019H
	call	_gen_rtx
	add	esp, 16					; 00000010H
	jmp	$L974
; Line 756
$L974:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_gen_lshrhi3 ENDP
_TEXT	ENDS
PUBLIC	_gen_lshrqi3
_TEXT	SEGMENT
_operand0$ = 8
_operand1$ = 12
_operand2$ = 16
_gen_lshrqi3 PROC NEAR
; Line 763
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 764
	mov	eax, DWORD PTR _operand2$[ebp]
	push	eax
	mov	eax, DWORD PTR _operand1$[ebp]
	push	eax
	push	1
	push	61					; 0000003dH
	call	_gen_rtx
	add	esp, 16					; 00000010H
	push	eax
	mov	eax, DWORD PTR _operand0$[ebp]
	push	eax
	push	0
	push	25					; 00000019H
	call	_gen_rtx
	add	esp, 16					; 00000010H
	jmp	$L978
; Line 765
$L978:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_gen_lshrqi3 ENDP
_TEXT	ENDS
PUBLIC	_gen_rotlsi3
_TEXT	SEGMENT
_operand0$ = 8
_operand1$ = 12
_operand2$ = 16
_gen_rotlsi3 PROC NEAR
; Line 772
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 773
	mov	eax, DWORD PTR _operand2$[ebp]
	push	eax
	mov	eax, DWORD PTR _operand1$[ebp]
	push	eax
	push	4
	push	59					; 0000003bH
	call	_gen_rtx
	add	esp, 16					; 00000010H
	push	eax
	mov	eax, DWORD PTR _operand0$[ebp]
	push	eax
	push	0
	push	25					; 00000019H
	call	_gen_rtx
	add	esp, 16					; 00000010H
	jmp	$L982
; Line 774
$L982:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_gen_rotlsi3 ENDP
_TEXT	ENDS
PUBLIC	_gen_rotlhi3
_TEXT	SEGMENT
_operand0$ = 8
_operand1$ = 12
_operand2$ = 16
_gen_rotlhi3 PROC NEAR
; Line 781
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 782
	mov	eax, DWORD PTR _operand2$[ebp]
	push	eax
	mov	eax, DWORD PTR _operand1$[ebp]
	push	eax
	push	2
	push	59					; 0000003bH
	call	_gen_rtx
	add	esp, 16					; 00000010H
	push	eax
	mov	eax, DWORD PTR _operand0$[ebp]
	push	eax
	push	0
	push	25					; 00000019H
	call	_gen_rtx
	add	esp, 16					; 00000010H
	jmp	$L986
; Line 783
$L986:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_gen_rotlhi3 ENDP
_TEXT	ENDS
PUBLIC	_gen_rotlqi3
_TEXT	SEGMENT
_operand0$ = 8
_operand1$ = 12
_operand2$ = 16
_gen_rotlqi3 PROC NEAR
; Line 790
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 791
	mov	eax, DWORD PTR _operand2$[ebp]
	push	eax
	mov	eax, DWORD PTR _operand1$[ebp]
	push	eax
	push	1
	push	59					; 0000003bH
	call	_gen_rtx
	add	esp, 16					; 00000010H
	push	eax
	mov	eax, DWORD PTR _operand0$[ebp]
	push	eax
	push	0
	push	25					; 00000019H
	call	_gen_rtx
	add	esp, 16					; 00000010H
	jmp	$L990
; Line 792
$L990:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_gen_rotlqi3 ENDP
_TEXT	ENDS
PUBLIC	_gen_rotrsi3
_TEXT	SEGMENT
_operand0$ = 8
_operand1$ = 12
_operand2$ = 16
_gen_rotrsi3 PROC NEAR
; Line 799
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 800
	mov	eax, DWORD PTR _operand2$[ebp]
	push	eax
	mov	eax, DWORD PTR _operand1$[ebp]
	push	eax
	push	4
	push	62					; 0000003eH
	call	_gen_rtx
	add	esp, 16					; 00000010H
	push	eax
	mov	eax, DWORD PTR _operand0$[ebp]
	push	eax
	push	0
	push	25					; 00000019H
	call	_gen_rtx
	add	esp, 16					; 00000010H
	jmp	$L994
; Line 801
$L994:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_gen_rotrsi3 ENDP
_TEXT	ENDS
PUBLIC	_gen_rotrhi3
_TEXT	SEGMENT
_operand0$ = 8
_operand1$ = 12
_operand2$ = 16
_gen_rotrhi3 PROC NEAR
; Line 808
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 809
	mov	eax, DWORD PTR _operand2$[ebp]
	push	eax
	mov	eax, DWORD PTR _operand1$[ebp]
	push	eax
	push	2
	push	62					; 0000003eH
	call	_gen_rtx
	add	esp, 16					; 00000010H
	push	eax
	mov	eax, DWORD PTR _operand0$[ebp]
	push	eax
	push	0
	push	25					; 00000019H
	call	_gen_rtx
	add	esp, 16					; 00000010H
	jmp	$L998
; Line 810
$L998:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_gen_rotrhi3 ENDP
_TEXT	ENDS
PUBLIC	_gen_rotrqi3
_TEXT	SEGMENT
_operand0$ = 8
_operand1$ = 12
_operand2$ = 16
_gen_rotrqi3 PROC NEAR
; Line 817
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 818
	mov	eax, DWORD PTR _operand2$[ebp]
	push	eax
	mov	eax, DWORD PTR _operand1$[ebp]
	push	eax
	push	1
	push	62					; 0000003eH
	call	_gen_rtx
	add	esp, 16					; 00000010H
	push	eax
	mov	eax, DWORD PTR _operand0$[ebp]
	push	eax
	push	0
	push	25					; 00000019H
	call	_gen_rtx
	add	esp, 16					; 00000010H
	jmp	$L1002
; Line 819
$L1002:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_gen_rotrqi3 ENDP
_TEXT	ENDS
PUBLIC	_gen_seq
EXTRN	_const0_rtx:DWORD
_TEXT	SEGMENT
_operand0$ = 8
_gen_seq PROC NEAR
; Line 824
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 825
	mov	eax, DWORD PTR _const0_rtx
	push	eax
	mov	eax, DWORD PTR _cc0_rtx
	push	eax
	push	0
	push	68					; 00000044H
	call	_gen_rtx
	add	esp, 16					; 00000010H
	push	eax
	mov	eax, DWORD PTR _operand0$[ebp]
	push	eax
	push	0
	push	25					; 00000019H
	call	_gen_rtx
	add	esp, 16					; 00000010H
	jmp	$L1004
; Line 826
$L1004:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_gen_seq ENDP
_TEXT	ENDS
PUBLIC	_gen_sne
_TEXT	SEGMENT
_operand0$ = 8
_gen_sne PROC NEAR
; Line 831
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 832
	mov	eax, DWORD PTR _const0_rtx
	push	eax
	mov	eax, DWORD PTR _cc0_rtx
	push	eax
	push	0
	push	67					; 00000043H
	call	_gen_rtx
	add	esp, 16					; 00000010H
	push	eax
	mov	eax, DWORD PTR _operand0$[ebp]
	push	eax
	push	0
	push	25					; 00000019H
	call	_gen_rtx
	add	esp, 16					; 00000010H
	jmp	$L1006
; Line 833
$L1006:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_gen_sne ENDP
_TEXT	ENDS
PUBLIC	_gen_sgt
_TEXT	SEGMENT
_operand0$ = 8
_gen_sgt PROC NEAR
; Line 838
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 839
	mov	eax, DWORD PTR _const0_rtx
	push	eax
	mov	eax, DWORD PTR _cc0_rtx
	push	eax
	push	0
	push	70					; 00000046H
	call	_gen_rtx
	add	esp, 16					; 00000010H
	push	eax
	mov	eax, DWORD PTR _operand0$[ebp]
	push	eax
	push	0
	push	25					; 00000019H
	call	_gen_rtx
	add	esp, 16					; 00000010H
	jmp	$L1008
; Line 840
$L1008:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_gen_sgt ENDP
_TEXT	ENDS
PUBLIC	_gen_sgtu
_TEXT	SEGMENT
_operand0$ = 8
_gen_sgtu PROC NEAR
; Line 845
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 846
	mov	eax, DWORD PTR _const0_rtx
	push	eax
	mov	eax, DWORD PTR _cc0_rtx
	push	eax
	push	0
	push	74					; 0000004aH
	call	_gen_rtx
	add	esp, 16					; 00000010H
	push	eax
	mov	eax, DWORD PTR _operand0$[ebp]
	push	eax
	push	0
	push	25					; 00000019H
	call	_gen_rtx
	add	esp, 16					; 00000010H
	jmp	$L1010
; Line 847
$L1010:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_gen_sgtu ENDP
_TEXT	ENDS
PUBLIC	_gen_slt
_TEXT	SEGMENT
_operand0$ = 8
_gen_slt PROC NEAR
; Line 852
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 853
	mov	eax, DWORD PTR _const0_rtx
	push	eax
	mov	eax, DWORD PTR _cc0_rtx
	push	eax
	push	0
	push	72					; 00000048H
	call	_gen_rtx
	add	esp, 16					; 00000010H
	push	eax
	mov	eax, DWORD PTR _operand0$[ebp]
	push	eax
	push	0
	push	25					; 00000019H
	call	_gen_rtx
	add	esp, 16					; 00000010H
	jmp	$L1012
; Line 854
$L1012:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_gen_slt ENDP
_TEXT	ENDS
PUBLIC	_gen_sltu
_TEXT	SEGMENT
_operand0$ = 8
_gen_sltu PROC NEAR
; Line 859
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 860
	mov	eax, DWORD PTR _const0_rtx
	push	eax
	mov	eax, DWORD PTR _cc0_rtx
	push	eax
	push	0
	push	76					; 0000004cH
	call	_gen_rtx
	add	esp, 16					; 00000010H
	push	eax
	mov	eax, DWORD PTR _operand0$[ebp]
	push	eax
	push	0
	push	25					; 00000019H
	call	_gen_rtx
	add	esp, 16					; 00000010H
	jmp	$L1014
; Line 861
$L1014:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_gen_sltu ENDP
_TEXT	ENDS
PUBLIC	_gen_sge
_TEXT	SEGMENT
_operand0$ = 8
_gen_sge PROC NEAR
; Line 866
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 867
	mov	eax, DWORD PTR _const0_rtx
	push	eax
	mov	eax, DWORD PTR _cc0_rtx
	push	eax
	push	0
	push	69					; 00000045H
	call	_gen_rtx
	add	esp, 16					; 00000010H
	push	eax
	mov	eax, DWORD PTR _operand0$[ebp]
	push	eax
	push	0
	push	25					; 00000019H
	call	_gen_rtx
	add	esp, 16					; 00000010H
	jmp	$L1016
; Line 868
$L1016:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_gen_sge ENDP
_TEXT	ENDS
PUBLIC	_gen_sgeu
_TEXT	SEGMENT
_operand0$ = 8
_gen_sgeu PROC NEAR
; Line 873
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 874
	mov	eax, DWORD PTR _const0_rtx
	push	eax
	mov	eax, DWORD PTR _cc0_rtx
	push	eax
	push	0
	push	73					; 00000049H
	call	_gen_rtx
	add	esp, 16					; 00000010H
	push	eax
	mov	eax, DWORD PTR _operand0$[ebp]
	push	eax
	push	0
	push	25					; 00000019H
	call	_gen_rtx
	add	esp, 16					; 00000010H
	jmp	$L1018
; Line 875
$L1018:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_gen_sgeu ENDP
_TEXT	ENDS
PUBLIC	_gen_sle
_TEXT	SEGMENT
_operand0$ = 8
_gen_sle PROC NEAR
; Line 880
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 881
	mov	eax, DWORD PTR _const0_rtx
	push	eax
	mov	eax, DWORD PTR _cc0_rtx
	push	eax
	push	0
	push	71					; 00000047H
	call	_gen_rtx
	add	esp, 16					; 00000010H
	push	eax
	mov	eax, DWORD PTR _operand0$[ebp]
	push	eax
	push	0
	push	25					; 00000019H
	call	_gen_rtx
	add	esp, 16					; 00000010H
	jmp	$L1020
; Line 882
$L1020:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_gen_sle ENDP
_TEXT	ENDS
PUBLIC	_gen_sleu
_TEXT	SEGMENT
_operand0$ = 8
_gen_sleu PROC NEAR
; Line 887
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 888
	mov	eax, DWORD PTR _const0_rtx
	push	eax
	mov	eax, DWORD PTR _cc0_rtx
	push	eax
	push	0
	push	75					; 0000004bH
	call	_gen_rtx
	add	esp, 16					; 00000010H
	push	eax
	mov	eax, DWORD PTR _operand0$[ebp]
	push	eax
	push	0
	push	25					; 00000019H
	call	_gen_rtx
	add	esp, 16					; 00000010H
	jmp	$L1022
; Line 889
$L1022:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_gen_sleu ENDP
_TEXT	ENDS
PUBLIC	_gen_beq
EXTRN	_pc_rtx:DWORD
_TEXT	SEGMENT
_operand0$ = 8
_gen_beq PROC NEAR
; Line 894
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 895
	mov	eax, DWORD PTR _pc_rtx
	push	eax
	mov	eax, DWORD PTR _operand0$[ebp]
	push	eax
	push	0
	push	38					; 00000026H
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	push	eax
	mov	eax, DWORD PTR _const0_rtx
	push	eax
	mov	eax, DWORD PTR _cc0_rtx
	push	eax
	push	0
	push	68					; 00000044H
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
	jmp	$L1024
; Line 896
$L1024:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_gen_beq ENDP
_TEXT	ENDS
PUBLIC	_gen_bne
_TEXT	SEGMENT
_operand0$ = 8
_gen_bne PROC NEAR
; Line 901
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 902
	mov	eax, DWORD PTR _pc_rtx
	push	eax
	mov	eax, DWORD PTR _operand0$[ebp]
	push	eax
	push	0
	push	38					; 00000026H
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	push	eax
	mov	eax, DWORD PTR _const0_rtx
	push	eax
	mov	eax, DWORD PTR _cc0_rtx
	push	eax
	push	0
	push	67					; 00000043H
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
	jmp	$L1026
; Line 903
$L1026:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_gen_bne ENDP
_TEXT	ENDS
PUBLIC	_gen_bgt
_TEXT	SEGMENT
_operand0$ = 8
_gen_bgt PROC NEAR
; Line 908
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 909
	mov	eax, DWORD PTR _pc_rtx
	push	eax
	mov	eax, DWORD PTR _operand0$[ebp]
	push	eax
	push	0
	push	38					; 00000026H
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	push	eax
	mov	eax, DWORD PTR _const0_rtx
	push	eax
	mov	eax, DWORD PTR _cc0_rtx
	push	eax
	push	0
	push	70					; 00000046H
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
	jmp	$L1028
; Line 910
$L1028:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_gen_bgt ENDP
_TEXT	ENDS
PUBLIC	_gen_bgtu
_TEXT	SEGMENT
_operand0$ = 8
_gen_bgtu PROC NEAR
; Line 915
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 916
	mov	eax, DWORD PTR _pc_rtx
	push	eax
	mov	eax, DWORD PTR _operand0$[ebp]
	push	eax
	push	0
	push	38					; 00000026H
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	push	eax
	mov	eax, DWORD PTR _const0_rtx
	push	eax
	mov	eax, DWORD PTR _cc0_rtx
	push	eax
	push	0
	push	74					; 0000004aH
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
	jmp	$L1030
; Line 917
$L1030:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_gen_bgtu ENDP
_TEXT	ENDS
PUBLIC	_gen_blt
EXTRN	_fconst0_rtx:DWORD
EXTRN	_dconst0_rtx:DWORD
EXTRN	_abort:NEAR
EXTRN	_emit_insn:NEAR
EXTRN	_emit_jump_insn:NEAR
EXTRN	_mode_class:BYTE
EXTRN	_sequence_stack:DWORD
_TEXT	SEGMENT
_operand0$ = 8
_emit_operand$ = -4
__val$ = -8
_prev$1036 = -12
_body$1037 = -20
_comp$1038 = -16
_op0$1043 = -24
_op1$1044 = -28
_new$1046 = -32
_gen_blt PROC NEAR
; Line 922
	push	ebp
	mov	ebp, esp
	sub	esp, 40					; 00000028H
	push	ebx
	push	esi
	push	edi
; Line 925
	call	_start_sequence
; Line 926
	mov	eax, DWORD PTR _operand0$[ebp]
	mov	DWORD PTR _emit_operand$[ebp], eax
; Line 930
	mov	eax, DWORD PTR _sequence_stack
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _prev$1036[ebp], eax
; Line 931
	mov	eax, DWORD PTR _prev$1036[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	DWORD PTR _body$1037[ebp], eax
; Line 933
	mov	eax, DWORD PTR _body$1037[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1638400				; 00190000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1039
; Line 934
	mov	eax, DWORD PTR _body$1037[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _comp$1038[ebp], eax
; Line 935
	jmp	$L1040
$L1039:
; Line 936
	mov	eax, DWORD PTR _body$1037[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _comp$1038[ebp], eax
$L1040:
; Line 940
	mov	eax, DWORD PTR _comp$1038[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2818048				; 002b0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1092
	mov	eax, DWORD PTR _comp$1038[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	sar	eax, 22					; 00000016H
	mov	eax, DWORD PTR _mode_class[eax]
	sub	eax, 2
	cmp	eax, 1
	sbb	eax, eax
	neg	eax
	mov	DWORD PTR -36+[ebp], eax
	jmp	$L1093
$L1092:
	mov	eax, DWORD PTR _comp$1038[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	sar	eax, 22					; 00000016H
	mov	eax, DWORD PTR _mode_class[eax]
	sub	eax, 2
	cmp	eax, 1
	sbb	eax, eax
	neg	eax
	mov	DWORD PTR -36+[ebp], eax
$L1093:
	cmp	DWORD PTR -36+[ebp], 0
	je	$L1041
; Line 942
	mov	eax, DWORD PTR _comp$1038[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2818048				; 002b0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1042
; Line 944
	mov	eax, DWORD PTR _comp$1038[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _op0$1043[ebp], eax
; Line 945
	mov	eax, DWORD PTR _comp$1038[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _op1$1044[ebp], eax
; Line 946
	mov	eax, DWORD PTR _op1$1044[ebp]
	mov	ecx, DWORD PTR _comp$1038[ebp]
	mov	DWORD PTR [ecx+4], eax
; Line 947
	mov	eax, DWORD PTR _op0$1043[ebp]
	mov	ecx, DWORD PTR _comp$1038[ebp]
	mov	DWORD PTR [ecx+8], eax
; Line 949
	jmp	$L1045
$L1042:
; Line 952
	mov	eax, DWORD PTR _comp$1038[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	mov	ecx, 167772160				; 0a000000H
	and	ecx, -16777216				; ff000000H
	cmp	eax, ecx
	jne	$L1094
	mov	eax, DWORD PTR _fconst0_rtx
	mov	DWORD PTR -40+[ebp], eax
	jmp	$L1095
$L1094:
	mov	eax, DWORD PTR _comp$1038[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	mov	ecx, 184549376				; 0b000000H
	and	ecx, -16777216				; ff000000H
	cmp	eax, ecx
	jne	$L1096
	mov	eax, DWORD PTR _dconst0_rtx
	mov	DWORD PTR -40+[ebp], eax
	jmp	$L1097
$L1096:
	mov	eax, DWORD PTR _comp$1038[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	sar	eax, 22					; 00000016H
	cmp	DWORD PTR _mode_class[eax], 1
	jne	$L1098
	mov	eax, DWORD PTR _const0_rtx
	mov	DWORD PTR -40+[ebp], eax
	jmp	$L1099
$L1098:
	call	_abort
	mov	DWORD PTR -40+[ebp], 0
$L1099:
$L1097:
$L1095:
	mov	eax, DWORD PTR _comp$1038[ebp]
	push	eax
	mov	eax, DWORD PTR -40+[ebp]
	push	eax
	push	0
	push	43					; 0000002bH
	call	_gen_rtx
	add	esp, 16					; 00000010H
	mov	DWORD PTR _new$1046[ebp], eax
; Line 953
	mov	eax, DWORD PTR _body$1037[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1638400				; 00190000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1048
; Line 954
	mov	eax, DWORD PTR _new$1046[ebp]
	mov	ecx, DWORD PTR _body$1037[ebp]
	mov	DWORD PTR [ecx+8], eax
; Line 955
	jmp	$L1049
$L1048:
; Line 956
	mov	eax, DWORD PTR _new$1046[ebp]
	mov	ecx, DWORD PTR _body$1037[ebp]
	mov	ecx, DWORD PTR [ecx+4]
	mov	ecx, DWORD PTR [ecx+4]
	mov	DWORD PTR [ecx+8], eax
$L1049:
; Line 957
$L1045:
; Line 958
	mov	eax, DWORD PTR _emit_operand$[ebp]
	push	eax
	call	_gen_bgt
	add	esp, 4
	push	eax
	call	_emit_insn
	add	esp, 4
; Line 959
	jmp	$_done$1050
; Line 961
$L1041:
; Line 962
	mov	eax, DWORD PTR _emit_operand$[ebp]
	mov	DWORD PTR _operand0$[ebp], eax
; Line 963
	mov	eax, DWORD PTR _pc_rtx
	push	eax
	mov	eax, DWORD PTR _operand0$[ebp]
	push	eax
	push	0
	push	38					; 00000026H
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	push	eax
	mov	eax, DWORD PTR _const0_rtx
	push	eax
	mov	eax, DWORD PTR _cc0_rtx
	push	eax
	push	0
	push	72					; 00000048H
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
	call	_emit_jump_insn
	add	esp, 4
; Line 964
$_done$1050:
; Line 965
	call	_gen_sequence
	mov	DWORD PTR __val$[ebp], eax
; Line 966
	call	_end_sequence
; Line 967
	mov	eax, DWORD PTR __val$[ebp]
	jmp	$L1032
; Line 968
$L1032:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_gen_blt ENDP
_TEXT	ENDS
PUBLIC	_gen_bltu
_TEXT	SEGMENT
_operand0$ = 8
_gen_bltu PROC NEAR
; Line 973
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 974
	mov	eax, DWORD PTR _pc_rtx
	push	eax
	mov	eax, DWORD PTR _operand0$[ebp]
	push	eax
	push	0
	push	38					; 00000026H
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	push	eax
	mov	eax, DWORD PTR _const0_rtx
	push	eax
	mov	eax, DWORD PTR _cc0_rtx
	push	eax
	push	0
	push	76					; 0000004cH
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
	jmp	$L1052
; Line 975
$L1052:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_gen_bltu ENDP
_TEXT	ENDS
PUBLIC	_gen_bge
_TEXT	SEGMENT
_operand0$ = 8
_gen_bge PROC NEAR
; Line 980
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 981
	mov	eax, DWORD PTR _pc_rtx
	push	eax
	mov	eax, DWORD PTR _operand0$[ebp]
	push	eax
	push	0
	push	38					; 00000026H
	call	_gen_rtx
	add	esp, 12					; 0000000cH
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
	jmp	$L1054
; Line 982
$L1054:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_gen_bge ENDP
_TEXT	ENDS
PUBLIC	_gen_bgeu
_TEXT	SEGMENT
_operand0$ = 8
_gen_bgeu PROC NEAR
; Line 987
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 988
	mov	eax, DWORD PTR _pc_rtx
	push	eax
	mov	eax, DWORD PTR _operand0$[ebp]
	push	eax
	push	0
	push	38					; 00000026H
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	push	eax
	mov	eax, DWORD PTR _const0_rtx
	push	eax
	mov	eax, DWORD PTR _cc0_rtx
	push	eax
	push	0
	push	73					; 00000049H
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
	jmp	$L1056
; Line 989
$L1056:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_gen_bgeu ENDP
_TEXT	ENDS
PUBLIC	_gen_ble
EXTRN	_sequence_stack:DWORD
_TEXT	SEGMENT
_operand0$ = 8
_emit_operand$ = -4
__val$ = -8
_prev$1062 = -12
_body$1063 = -20
_comp$1064 = -16
_op0$1069 = -24
_op1$1070 = -28
_new$1072 = -32
_gen_ble PROC NEAR
; Line 994
	push	ebp
	mov	ebp, esp
	sub	esp, 40					; 00000028H
	push	ebx
	push	esi
	push	edi
; Line 997
	call	_start_sequence
; Line 998
	mov	eax, DWORD PTR _operand0$[ebp]
	mov	DWORD PTR _emit_operand$[ebp], eax
; Line 1002
	mov	eax, DWORD PTR _sequence_stack
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _prev$1062[ebp], eax
; Line 1003
	mov	eax, DWORD PTR _prev$1062[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	DWORD PTR _body$1063[ebp], eax
; Line 1005
	mov	eax, DWORD PTR _body$1063[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1638400				; 00190000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1065
; Line 1006
	mov	eax, DWORD PTR _body$1063[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _comp$1064[ebp], eax
; Line 1007
	jmp	$L1066
$L1065:
; Line 1008
	mov	eax, DWORD PTR _body$1063[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _comp$1064[ebp], eax
$L1066:
; Line 1012
	mov	eax, DWORD PTR _comp$1064[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2818048				; 002b0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1100
	mov	eax, DWORD PTR _comp$1064[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	sar	eax, 22					; 00000016H
	mov	eax, DWORD PTR _mode_class[eax]
	sub	eax, 2
	cmp	eax, 1
	sbb	eax, eax
	neg	eax
	mov	DWORD PTR -36+[ebp], eax
	jmp	$L1101
$L1100:
	mov	eax, DWORD PTR _comp$1064[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	sar	eax, 22					; 00000016H
	mov	eax, DWORD PTR _mode_class[eax]
	sub	eax, 2
	cmp	eax, 1
	sbb	eax, eax
	neg	eax
	mov	DWORD PTR -36+[ebp], eax
$L1101:
	cmp	DWORD PTR -36+[ebp], 0
	je	$L1067
; Line 1014
	mov	eax, DWORD PTR _comp$1064[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2818048				; 002b0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1068
; Line 1016
	mov	eax, DWORD PTR _comp$1064[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _op0$1069[ebp], eax
; Line 1017
	mov	eax, DWORD PTR _comp$1064[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _op1$1070[ebp], eax
; Line 1018
	mov	eax, DWORD PTR _op1$1070[ebp]
	mov	ecx, DWORD PTR _comp$1064[ebp]
	mov	DWORD PTR [ecx+4], eax
; Line 1019
	mov	eax, DWORD PTR _op0$1069[ebp]
	mov	ecx, DWORD PTR _comp$1064[ebp]
	mov	DWORD PTR [ecx+8], eax
; Line 1021
	jmp	$L1071
$L1068:
; Line 1024
	mov	eax, DWORD PTR _comp$1064[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	mov	ecx, 167772160				; 0a000000H
	and	ecx, -16777216				; ff000000H
	cmp	eax, ecx
	jne	$L1102
	mov	eax, DWORD PTR _fconst0_rtx
	mov	DWORD PTR -40+[ebp], eax
	jmp	$L1103
$L1102:
	mov	eax, DWORD PTR _comp$1064[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	mov	ecx, 184549376				; 0b000000H
	and	ecx, -16777216				; ff000000H
	cmp	eax, ecx
	jne	$L1104
	mov	eax, DWORD PTR _dconst0_rtx
	mov	DWORD PTR -40+[ebp], eax
	jmp	$L1105
$L1104:
	mov	eax, DWORD PTR _comp$1064[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	sar	eax, 22					; 00000016H
	cmp	DWORD PTR _mode_class[eax], 1
	jne	$L1106
	mov	eax, DWORD PTR _const0_rtx
	mov	DWORD PTR -40+[ebp], eax
	jmp	$L1107
$L1106:
	call	_abort
	mov	DWORD PTR -40+[ebp], 0
$L1107:
$L1105:
$L1103:
	mov	eax, DWORD PTR _comp$1064[ebp]
	push	eax
	mov	eax, DWORD PTR -40+[ebp]
	push	eax
	push	0
	push	43					; 0000002bH
	call	_gen_rtx
	add	esp, 16					; 00000010H
	mov	DWORD PTR _new$1072[ebp], eax
; Line 1025
	mov	eax, DWORD PTR _body$1063[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1638400				; 00190000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1073
; Line 1026
	mov	eax, DWORD PTR _new$1072[ebp]
	mov	ecx, DWORD PTR _body$1063[ebp]
	mov	DWORD PTR [ecx+8], eax
; Line 1027
	jmp	$L1074
$L1073:
; Line 1028
	mov	eax, DWORD PTR _new$1072[ebp]
	mov	ecx, DWORD PTR _body$1063[ebp]
	mov	ecx, DWORD PTR [ecx+4]
	mov	ecx, DWORD PTR [ecx+4]
	mov	DWORD PTR [ecx+8], eax
$L1074:
; Line 1029
$L1071:
; Line 1030
	mov	eax, DWORD PTR _emit_operand$[ebp]
	push	eax
	call	_gen_bge
	add	esp, 4
	push	eax
	call	_emit_insn
	add	esp, 4
; Line 1031
	jmp	$_done$1075
; Line 1033
$L1067:
; Line 1034
	mov	eax, DWORD PTR _emit_operand$[ebp]
	mov	DWORD PTR _operand0$[ebp], eax
; Line 1035
	mov	eax, DWORD PTR _pc_rtx
	push	eax
	mov	eax, DWORD PTR _operand0$[ebp]
	push	eax
	push	0
	push	38					; 00000026H
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	push	eax
	mov	eax, DWORD PTR _const0_rtx
	push	eax
	mov	eax, DWORD PTR _cc0_rtx
	push	eax
	push	0
	push	71					; 00000047H
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
	call	_emit_jump_insn
	add	esp, 4
; Line 1036
$_done$1075:
; Line 1037
	call	_gen_sequence
	mov	DWORD PTR __val$[ebp], eax
; Line 1038
	call	_end_sequence
; Line 1039
	mov	eax, DWORD PTR __val$[ebp]
	jmp	$L1058
; Line 1040
$L1058:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_gen_ble ENDP
_TEXT	ENDS
PUBLIC	_gen_bleu
_TEXT	SEGMENT
_operand0$ = 8
_gen_bleu PROC NEAR
; Line 1045
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 1046
	mov	eax, DWORD PTR _pc_rtx
	push	eax
	mov	eax, DWORD PTR _operand0$[ebp]
	push	eax
	push	0
	push	38					; 00000026H
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	push	eax
	mov	eax, DWORD PTR _const0_rtx
	push	eax
	mov	eax, DWORD PTR _cc0_rtx
	push	eax
	push	0
	push	75					; 0000004bH
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
	jmp	$L1077
; Line 1047
$L1077:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_gen_bleu ENDP
_TEXT	ENDS
PUBLIC	_gen_jump
_TEXT	SEGMENT
_operand0$ = 8
_gen_jump PROC NEAR
; Line 1052
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 1053
	mov	eax, DWORD PTR _operand0$[ebp]
	push	eax
	push	0
	push	38					; 00000026H
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	push	eax
	mov	eax, DWORD PTR _pc_rtx
	push	eax
	push	0
	push	25					; 00000019H
	call	_gen_rtx
	add	esp, 16					; 00000010H
	jmp	$L1079
; Line 1054
$L1079:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_gen_jump ENDP
_TEXT	ENDS
PUBLIC	_gen_tablejump
_TEXT	SEGMENT
_operand0$ = 8
_operand1$ = 12
_gen_tablejump PROC NEAR
; Line 1060
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 1063
	mov	eax, DWORD PTR _operand1$[ebp]
	push	eax
	push	0
	push	38					; 00000026H
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	push	26					; 0000001aH
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	push	eax
	mov	eax, DWORD PTR _operand0$[ebp]
	push	eax
	mov	eax, DWORD PTR _pc_rtx
	push	eax
	push	0
	push	25					; 00000019H
	call	_gen_rtx
	add	esp, 16					; 00000010H
	push	eax
	push	2
	call	_gen_rtvec
	add	esp, 12					; 0000000cH
	push	eax
	push	0
	push	20					; 00000014H
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	jmp	$L1082
; Line 1064
$L1082:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_gen_tablejump ENDP
_TEXT	ENDS
PUBLIC	_gen_call
_TEXT	SEGMENT
_operand0$ = 8
_operand1$ = 12
_gen_call PROC NEAR
; Line 1070
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 1071
	mov	eax, DWORD PTR _operand1$[ebp]
	push	eax
	mov	eax, DWORD PTR _operand0$[ebp]
	push	eax
	push	0
	push	28					; 0000001cH
	call	_gen_rtx
	add	esp, 16					; 00000010H
	jmp	$L1085
; Line 1072
$L1085:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_gen_call ENDP
_TEXT	ENDS
PUBLIC	_gen_call_value
_TEXT	SEGMENT
_operand2$ = 16
_operand0$ = 8
_operand1$ = 12
_gen_call_value PROC NEAR
; Line 1079
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 1080
	mov	eax, DWORD PTR _operand2$[ebp]
	push	eax
	mov	eax, DWORD PTR _operand1$[ebp]
	push	eax
	push	0
	push	28					; 0000001cH
	call	_gen_rtx
	add	esp, 16					; 00000010H
	push	eax
	mov	eax, DWORD PTR _operand0$[ebp]
	push	eax
	push	0
	push	25					; 00000019H
	call	_gen_rtx
	add	esp, 16					; 00000010H
	jmp	$L1089
; Line 1081
$L1089:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_gen_call_value ENDP
_TEXT	ENDS
PUBLIC	_gen_nop
_TEXT	SEGMENT
_gen_nop PROC NEAR
; Line 1085
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 1086
	mov	eax, DWORD PTR _const0_rtx
	jmp	$L1090
; Line 1087
$L1090:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_gen_nop ENDP
_TEXT	ENDS
END
