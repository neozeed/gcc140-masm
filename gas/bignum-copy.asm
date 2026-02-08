	TITLE	bignum-copy.c
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
PUBLIC	_bignum_copy
EXTRN	_memcpy:NEAR
EXTRN	_memset:NEAR
_TEXT	SEGMENT
; File bignum-copy.c
_in$ = 8
_in_length$ = 12
_out$ = 16
_out_length$ = 20
_significant_littlenums_dropped$ = -4
_p$114 = -8
_bignum_copy PROC NEAR
; Line 45
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	push	ebx
	push	esi
	push	edi
; Line 48
	mov	eax, DWORD PTR _in_length$[ebp]
	cmp	DWORD PTR _out_length$[ebp], eax
	jge	$L113
; Line 52
	mov	eax, DWORD PTR _out_length$[ebp]
	add	eax, eax
	push	eax
	mov	eax, DWORD PTR _in$[ebp]
	push	eax
	mov	eax, DWORD PTR _out$[ebp]
	push	eax
	call	_memcpy
	add	esp, 12					; 0000000cH
; Line 53
	mov	eax, DWORD PTR _in_length$[ebp]
	add	eax, eax
	add	eax, DWORD PTR _in$[ebp]
	sub	eax, 2
	mov	DWORD PTR _p$114[ebp], eax
	jmp	$L116
$L117:
	sub	DWORD PTR _p$114[ebp], 2
$L116:
	mov	eax, DWORD PTR _in$[ebp]
	cmp	DWORD PTR _p$114[ebp], eax
	jb	$L118
; Line 55
	mov	eax, DWORD PTR _p$114[ebp]
	mov	ax, WORD PTR [eax]
	and	eax, 65535				; 0000ffffH
	or	eax, eax
	je	$L119
	jmp	$L118
; Line 56
$L119:
	jmp	$L117
$L118:
; Line 57
	mov	eax, DWORD PTR _p$114[ebp]
	sub	eax, DWORD PTR _in$[ebp]
	sar	eax, 1
	sub	eax, DWORD PTR _in_length$[ebp]
	inc	eax
	mov	DWORD PTR _significant_littlenums_dropped$[ebp], eax
; Line 58
	cmp	DWORD PTR _significant_littlenums_dropped$[ebp], 0
	jge	$L120
; Line 60
	mov	DWORD PTR _significant_littlenums_dropped$[ebp], 0
; Line 62
$L120:
; Line 63
	jmp	$L121
$L113:
; Line 65
	mov	eax, DWORD PTR _in_length$[ebp]
	add	eax, eax
	push	eax
	mov	eax, DWORD PTR _in$[ebp]
	push	eax
	mov	eax, DWORD PTR _out$[ebp]
	push	eax
	call	_memcpy
	add	esp, 12					; 0000000cH
; Line 66
	mov	eax, DWORD PTR _in_length$[ebp]
	cmp	DWORD PTR _out_length$[ebp], eax
	jle	$L122
; Line 68
	mov	eax, DWORD PTR _out_length$[ebp]
	sub	eax, DWORD PTR _in_length$[ebp]
	add	eax, eax
	push	eax
	push	0
	mov	eax, DWORD PTR _out_length$[ebp]
	add	eax, eax
	add	eax, DWORD PTR _out$[ebp]
	push	eax
	call	_memset
	add	esp, 12					; 0000000cH
; Line 70
$L122:
	mov	DWORD PTR _significant_littlenums_dropped$[ebp], 0
; Line 71
$L121:
; Line 72
	mov	eax, DWORD PTR _significant_littlenums_dropped$[ebp]
	jmp	$L111
; Line 73
$L111:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_bignum_copy ENDP
_TEXT	ENDS
END
