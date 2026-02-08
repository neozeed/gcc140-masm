	TITLE	xrealloc.c
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
PUBLIC	_xrealloc
EXTRN	_fprintf:NEAR
EXTRN	_realloc:NEAR
EXTRN	__iob:BYTE
EXTRN	_exit:NEAR
_DATA	SEGMENT
$SG333	DB	'virtual memory exceeded', 00H
_DATA	ENDS
_TEXT	SEGMENT
; File xrealloc.c
_ptr$ = 8
_n$ = 12
_xrealloc PROC NEAR
; Line 56
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 60
	mov	eax, DWORD PTR _n$[ebp]
	push	eax
	mov	eax, DWORD PTR _ptr$[ebp]
	push	eax
	call	_realloc
	add	esp, 8
	mov	DWORD PTR _ptr$[ebp], eax
	cmp	DWORD PTR _ptr$[ebp], 0
	jne	$L332
; Line 61
	push	OFFSET $SG333
	mov	eax, OFFSET __iob
	add	eax, 64					; 00000040H
	push	eax
	call	_fprintf
	add	esp, 8
; Line 62
	push	-1
	call	_exit
	add	esp, 4
; Line 64
$L332:
	mov	eax, DWORD PTR _ptr$[ebp]
	jmp	$L331
; Line 65
$L331:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_xrealloc ENDP
_TEXT	ENDS
END
