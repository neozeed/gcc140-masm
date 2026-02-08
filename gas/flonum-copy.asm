	TITLE	flonum-copy.c
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
PUBLIC	_flonum_copy
EXTRN	_memset:NEAR
EXTRN	_memcpy:NEAR
_TEXT	SEGMENT
; File flonum-copy.c
_shorten$129 = -12
_in$ = 8
_out$ = 12
_in_length$ = -8
_out_length$ = -4
_flonum_copy PROC NEAR
; Line 30
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
	push	ebx
	push	esi
	push	edi
; Line 34
	mov	eax, DWORD PTR _in$[ebp]
	mov	al, BYTE PTR [eax+16]
	mov	ecx, DWORD PTR _out$[ebp]
	mov	BYTE PTR [ecx+16], al
; Line 35
	mov	eax, DWORD PTR _in$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	ecx, DWORD PTR _in$[ebp]
	sub	eax, DWORD PTR [ecx]
	sar	eax, 1
	mov	DWORD PTR _in_length$[ebp], eax
; Line 36
	cmp	DWORD PTR _in_length$[ebp], 0
	jge	$L122
; Line 38
	mov	eax, DWORD PTR _out$[ebp]
	mov	eax, DWORD PTR [eax]
	sub	eax, 2
	mov	ecx, DWORD PTR _out$[ebp]
	mov	DWORD PTR [ecx+8], eax
; Line 40
	jmp	$L123
$L122:
; Line 42
	mov	eax, DWORD PTR _out$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _out$[ebp]
	sub	eax, DWORD PTR [ecx]
	sar	eax, 1
	mov	DWORD PTR _out_length$[ebp], eax
; Line 47
	mov	eax, DWORD PTR _in_length$[ebp]
	cmp	DWORD PTR _out_length$[ebp], eax
	jl	$L124
; Line 54
	mov	eax, DWORD PTR _in_length$[ebp]
	cmp	DWORD PTR _out_length$[ebp], eax
	jle	$L125
; Line 56
	mov	eax, DWORD PTR _out_length$[ebp]
	sub	eax, DWORD PTR _in_length$[ebp]
	push	eax
	push	0
	mov	eax, DWORD PTR _in_length$[ebp]
	add	eax, eax
	mov	ecx, DWORD PTR _out$[ebp]
	add	eax, DWORD PTR [ecx]
	add	eax, 2
	push	eax
	call	_memset
	add	esp, 12					; 0000000cH
; Line 58
$L125:
; Line 59
	mov	eax, DWORD PTR _in_length$[ebp]
	lea	eax, DWORD PTR [eax*2+2]
	push	eax
	mov	eax, DWORD PTR _in$[ebp]
	mov	eax, DWORD PTR [eax]
	push	eax
	mov	eax, DWORD PTR _out$[ebp]
	mov	eax, DWORD PTR [eax]
	push	eax
	call	_memcpy
	add	esp, 12					; 0000000cH
; Line 60
	mov	eax, DWORD PTR _in$[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	ecx, DWORD PTR _out$[ebp]
	mov	DWORD PTR [ecx+12], eax
; Line 61
	mov	eax, DWORD PTR _in$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	ecx, DWORD PTR _in$[ebp]
	sub	eax, DWORD PTR [ecx]
	and	eax, -2					; fffffffeH
	sar	eax, 0
	mov	ecx, eax
	add	eax, eax
	sub	eax, ecx
	mov	ecx, DWORD PTR _out$[ebp]
	add	eax, DWORD PTR [ecx]
	mov	ecx, DWORD PTR _out$[ebp]
	mov	DWORD PTR [ecx+8], eax
; Line 63
	jmp	$L128
$L124:
; Line 67
	mov	eax, DWORD PTR _in_length$[ebp]
	sub	eax, DWORD PTR _out_length$[ebp]
	mov	DWORD PTR _shorten$129[ebp], eax
; Line 69
	mov	eax, DWORD PTR _out_length$[ebp]
	lea	eax, DWORD PTR [eax*2+2]
	push	eax
	mov	eax, DWORD PTR _shorten$129[ebp]
	add	eax, eax
	mov	ecx, DWORD PTR _in$[ebp]
	add	eax, DWORD PTR [ecx]
	push	eax
	mov	eax, DWORD PTR _out$[ebp]
	mov	eax, DWORD PTR [eax]
	push	eax
	call	_memcpy
	add	esp, 12					; 0000000cH
; Line 70
	mov	eax, DWORD PTR _out$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _out$[ebp]
	mov	DWORD PTR [ecx+8], eax
; Line 71
	mov	eax, DWORD PTR _in$[ebp]
	mov	eax, DWORD PTR [eax+12]
	add	eax, DWORD PTR _shorten$129[ebp]
	mov	ecx, DWORD PTR _out$[ebp]
	mov	DWORD PTR [ecx+12], eax
; Line 72
$L128:
; Line 73
$L123:
; Line 74
$L119:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_flonum_copy ENDP
_TEXT	ENDS
END
