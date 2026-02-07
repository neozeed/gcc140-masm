	TITLE	pragma.c
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
_pack_align$S105 DD 020H
_was_pragma$S106 DD 00H
_DATA	ENDS
PUBLIC	_pragma_pack
_TEXT	SEGMENT
; File pragma.c
_val$ = 8
_pragma_pack PROC NEAR
; Line 8
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 9
	mov	eax, DWORD PTR _val$[ebp]
	shl	eax, 3
	mov	DWORD PTR _pack_align$S105, eax
; Line 10
	mov	DWORD PTR _was_pragma$S106, 1
; Line 11
$L109:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_pragma_pack ENDP
_TEXT	ENDS
PUBLIC	_pragma_align_val
_TEXT	SEGMENT
_pragma_align_val PROC NEAR
; Line 14
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 15
	mov	eax, DWORD PTR _pack_align$S105
	jmp	$L111
; Line 16
$L111:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_pragma_align_val ENDP
_TEXT	ENDS
PUBLIC	_pragma_pack_default
_TEXT	SEGMENT
_pragma_pack_default PROC NEAR
; Line 19
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 20
	mov	DWORD PTR _pack_align$S105, 32		; 00000020H
; Line 21
$L113:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_pragma_pack_default ENDP
_TEXT	ENDS
PUBLIC	_pragma_pack_seen
_TEXT	SEGMENT
_pragma_pack_seen PROC NEAR
; Line 24
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 25
	mov	eax, DWORD PTR _was_pragma$S106
	jmp	$L115
; Line 26
$L115:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_pragma_pack_seen ENDP
_TEXT	ENDS
END
