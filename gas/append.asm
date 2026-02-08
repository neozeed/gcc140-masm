	TITLE	append.c
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
PUBLIC	_append
EXTRN	_memcpy:NEAR
_TEXT	SEGMENT
; File append.c
_charPP$ = 8
_fromP$ = 12
_length$ = 16
_append	PROC NEAR
; Line 30
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 31
	cmp	DWORD PTR _length$[ebp], 0
	je	$L110
; Line 32
	mov	eax, DWORD PTR _length$[ebp]
	push	eax
	mov	eax, DWORD PTR _fromP$[ebp]
	push	eax
	mov	eax, DWORD PTR _charPP$[ebp]
	mov	eax, DWORD PTR [eax]
	push	eax
	call	_memcpy
	add	esp, 12					; 0000000cH
; Line 33
	mov	eax, DWORD PTR _length$[ebp]
	mov	ecx, DWORD PTR _charPP$[ebp]
	add	DWORD PTR [ecx], eax
; Line 35
$L110:
$L109:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_append	ENDP
_TEXT	ENDS
END
