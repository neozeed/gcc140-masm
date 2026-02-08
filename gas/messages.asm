	TITLE	messages.c
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
PUBLIC	_bad_error
_DATA	SEGMENT
_bad_error DD	00H
_DATA	ENDS
PUBLIC	_as_perror
EXTRN	_as_where:NEAR
EXTRN	_fprintf:NEAR
EXTRN	_errno:DWORD
EXTRN	__sys_errlist:BYTE
EXTRN	__sys_nerr:DWORD
EXTRN	__iob:BYTE
_DATA	SEGMENT
$SG379	DB	'Unknown error #%d.', 0aH, 00H
$SG381	DB	'%s.', 0aH, 00H
_DATA	ENDS
_TEXT	SEGMENT
; File messages.c
_gripe$ = 8
_filename$ = 12
_as_perror PROC NEAR
; Line 75
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 82
	call	_as_where
; Line 83
	mov	eax, DWORD PTR _filename$[ebp]
	push	eax
	mov	eax, DWORD PTR _gripe$[ebp]
	push	eax
	mov	eax, OFFSET __iob
	add	eax, 64					; 00000040H
	push	eax
	call	_fprintf
	add	esp, 12					; 0000000cH
; Line 84
	mov	eax, DWORD PTR __sys_nerr
	cmp	DWORD PTR _errno, eax
	jle	$L378
; Line 85
	mov	eax, DWORD PTR _errno
	push	eax
	push	OFFSET $SG379
	mov	eax, OFFSET __iob
	add	eax, 64					; 00000040H
	push	eax
	call	_fprintf
	add	esp, 12					; 0000000cH
; Line 86
	jmp	$L380
$L378:
; Line 87
	mov	eax, DWORD PTR _errno
	mov	eax, DWORD PTR __sys_errlist[eax*4]
	push	eax
	push	OFFSET $SG381
	mov	eax, OFFSET __iob
	add	eax, 64					; 00000040H
	push	eax
	call	_fprintf
	add	esp, 12					; 0000000cH
$L380:
; Line 88
	mov	DWORD PTR _errno, 0
; Line 89
$L377:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_as_perror ENDP
_TEXT	ENDS
PUBLIC	_as_warn
EXTRN	_vfprintf:NEAR
EXTRN	_flagseen:BYTE
EXTRN	__flsbuf:NEAR
_TEXT	SEGMENT
_args$ = -4
_Format$ = 8
_va_alist$ = 12
_as_warn PROC NEAR
; Line 118
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 121
	movsx	eax, BYTE PTR _flagseen+87
	or	eax, eax
	jne	$L387
; Line 123
	call	_as_where
; Line 124
	lea	eax, DWORD PTR _va_alist$[ebp]
	mov	DWORD PTR _args$[ebp], eax
; Line 125
	mov	eax, DWORD PTR _args$[ebp]
	push	eax
	mov	eax, DWORD PTR _Format$[ebp]
	push	eax
	mov	eax, OFFSET __iob
	add	eax, 64					; 00000040H
	push	eax
	call	_vfprintf
	add	esp, 12					; 0000000cH
; Line 126
	mov	DWORD PTR _args$[ebp], 0
; Line 127
	dec	DWORD PTR __iob+68
	js	$L400
	mov	eax, DWORD PTR __iob+64
	mov	BYTE PTR [eax], 10			; 0000000aH
	inc	DWORD PTR __iob+64
	jmp	$L401
$L400:
	mov	eax, OFFSET __iob
	add	eax, 64					; 00000040H
	push	eax
	push	10					; 0000000aH
	call	__flsbuf
	add	esp, 8
$L401:
; Line 129
$L387:
$L385:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_as_warn ENDP
_TEXT	ENDS
PUBLIC	_as_bad
_TEXT	SEGMENT
_Format$ = 8
_va_alist$ = 12
_args$ = -4
_as_bad	PROC NEAR
; Line 169
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 172
	mov	DWORD PTR _bad_error, 1
; Line 173
	call	_as_where
; Line 174
	lea	eax, DWORD PTR _va_alist$[ebp]
	mov	DWORD PTR _args$[ebp], eax
; Line 175
	mov	eax, DWORD PTR _args$[ebp]
	push	eax
	mov	eax, DWORD PTR _Format$[ebp]
	push	eax
	mov	eax, OFFSET __iob
	add	eax, 64					; 00000040H
	push	eax
	call	_vfprintf
	add	esp, 12					; 0000000cH
; Line 176
	mov	DWORD PTR _args$[ebp], 0
; Line 177
	dec	DWORD PTR __iob+68
	js	$L402
	mov	eax, DWORD PTR __iob+64
	mov	BYTE PTR [eax], 10			; 0000000aH
	inc	DWORD PTR __iob+64
	jmp	$L403
$L402:
	mov	eax, OFFSET __iob
	add	eax, 64					; 00000040H
	push	eax
	push	10					; 0000000aH
	call	__flsbuf
	add	esp, 8
$L403:
; Line 178
$L391:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_as_bad	ENDP
_TEXT	ENDS
PUBLIC	_as_fatal
EXTRN	_exit:NEAR
_DATA	SEGMENT
	ORG $+3
$SG398	DB	'FATAL:', 00H
_DATA	ENDS
_TEXT	SEGMENT
_Format$ = 8
_va_alist$ = 12
_args$ = -4
_as_fatal PROC NEAR
; Line 217
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 220
	call	_as_where
; Line 221
	lea	eax, DWORD PTR _va_alist$[ebp]
	mov	DWORD PTR _args$[ebp], eax
; Line 222
	push	OFFSET $SG398
	mov	eax, OFFSET __iob
	add	eax, 64					; 00000040H
	push	eax
	call	_fprintf
	add	esp, 8
; Line 223
	mov	eax, DWORD PTR _args$[ebp]
	push	eax
	mov	eax, DWORD PTR _Format$[ebp]
	push	eax
	mov	eax, OFFSET __iob
	add	eax, 64					; 00000040H
	push	eax
	call	_vfprintf
	add	esp, 12					; 0000000cH
; Line 224
	dec	DWORD PTR __iob+68
	js	$L404
	mov	eax, DWORD PTR __iob+64
	mov	BYTE PTR [eax], 10			; 0000000aH
	inc	DWORD PTR __iob+64
	jmp	$L405
$L404:
	mov	eax, OFFSET __iob
	add	eax, 64					; 00000040H
	push	eax
	push	10					; 0000000aH
	call	__flsbuf
	add	esp, 8
$L405:
; Line 225
	mov	DWORD PTR _args$[ebp], 0
; Line 226
	push	42					; 0000002aH
	call	_exit
	add	esp, 4
; Line 227
$L396:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_as_fatal ENDP
_TEXT	ENDS
END
