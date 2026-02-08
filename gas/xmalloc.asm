	TITLE	xmalloc.c
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
PUBLIC	_xmalloc
EXTRN	_malloc:NEAR
EXTRN	_fprintf:NEAR
EXTRN	__iob:BYTE
EXTRN	_exit:NEAR
_DATA	SEGMENT
$SG333	DB	'virtual memory exceeded', 00H
_DATA	ENDS
_TEXT	SEGMENT
; File xmalloc.c
_n$ = 8
_retval$ = -4
_xmalloc PROC NEAR
; Line 51
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 56
	mov	eax, DWORD PTR _n$[ebp]
	push	eax
	call	_malloc
	add	esp, 4
	mov	DWORD PTR _retval$[ebp], eax
	cmp	DWORD PTR _retval$[ebp], 0
	jne	$L332
; Line 58
	push	OFFSET $SG333
	mov	eax, OFFSET __iob
	add	eax, 64					; 00000040H
	push	eax
	call	_fprintf
	add	esp, 8
; Line 59
	push	-1
	call	_exit
	add	esp, 4
; Line 61
$L332:
	mov	eax, DWORD PTR _retval$[ebp]
	jmp	$L330
; Line 62
$L330:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_xmalloc ENDP
_TEXT	ENDS
END
