	TITLE	output-file.c
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
PUBLIC	_output_file_create
EXTRN	_fopen:NEAR
EXTRN	_as_perror:NEAR
EXTRN	_exit:NEAR
EXTRN	__iob:BYTE
_BSS	SEGMENT
_stdoutput$S218 DD 01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
$SG225	DB	'wb', 00H
	ORG $+1
$SG226	DB	'FATAL: Can''t create %s', 00H
_DATA	ENDS
_TEXT	SEGMENT
; File output-file.c
_name$ = 8
_output_file_create PROC NEAR
; Line 38
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 39
	mov	eax, DWORD PTR _name$[ebp]
	movsx	eax, BYTE PTR [eax]
	cmp	eax, 45					; 0000002dH
	jne	$L222
	mov	eax, DWORD PTR _name$[ebp]
	movsx	eax, BYTE PTR [eax+1]
	or	eax, eax
	jne	$L222
; Line 40
	mov	eax, OFFSET __iob
	add	eax, 32					; 00000020H
	mov	DWORD PTR _stdoutput$S218, eax
; Line 41
	jmp	$L223
$L222:
	push	OFFSET $SG225
	mov	eax, DWORD PTR _name$[ebp]
	push	eax
	call	_fopen
	add	esp, 8
	mov	DWORD PTR _stdoutput$S218, eax
	cmp	DWORD PTR _stdoutput$S218, 0
	jne	$L224
; Line 43
	mov	eax, DWORD PTR _name$[ebp]
	push	eax
	push	OFFSET $SG226
	call	_as_perror
	add	esp, 8
; Line 44
	push	42					; 0000002aH
	call	_exit
	add	esp, 4
; Line 46
$L224:
$L223:
$L221:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_output_file_create ENDP
_TEXT	ENDS
PUBLIC	_output_file_close
EXTRN	_fclose:NEAR
_DATA	SEGMENT
	ORG $+1
$SG232	DB	'FATAL: Can''t close %s', 00H
_DATA	ENDS
_TEXT	SEGMENT
_filename$ = 8
_output_file_close PROC NEAR
; Line 53
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 54
	mov	eax, DWORD PTR _stdoutput$S218
	push	eax
	call	_fclose
	add	esp, 4
	cmp	eax, -1
	jne	$L231
; Line 56
	mov	eax, DWORD PTR _filename$[ebp]
	push	eax
	push	OFFSET $SG232
	call	_as_perror
	add	esp, 8
; Line 57
	push	42					; 0000002aH
	call	_exit
	add	esp, 4
; Line 59
$L231:
	mov	DWORD PTR _stdoutput$S218, 0
; Line 60
$L230:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_output_file_close ENDP
_TEXT	ENDS
PUBLIC	_output_file_append
EXTRN	_as_fatal:NEAR
EXTRN	__flsbuf:NEAR
_DATA	SEGMENT
	ORG $+2
$SG242	DB	'Failed to emit an object byte', 00H
	ORG $+2
$SG244	DB	'Can''t continue', 00H
_DATA	ENDS
_TEXT	SEGMENT
_where$ = 8
_length$ = 12
_filename$ = 16
_output_file_append PROC NEAR
; Line 67
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 69
	jmp	$L238
$L239:
	dec	DWORD PTR _length$[ebp]
	inc	DWORD PTR _where$[ebp]
$L238:
	cmp	DWORD PTR _length$[ebp], 0
	je	$L240
; Line 71
	mov	eax, DWORD PTR _stdoutput$S218
	dec	DWORD PTR [eax+4]
	mov	eax, DWORD PTR _stdoutput$S218
	cmp	DWORD PTR [eax+4], 0
	jl	$L246
	mov	eax, DWORD PTR _where$[ebp]
	mov	al, BYTE PTR [eax]
	mov	ecx, DWORD PTR _stdoutput$S218
	mov	ecx, DWORD PTR [ecx]
	mov	BYTE PTR [ecx], al
	mov	eax, DWORD PTR _stdoutput$S218
	inc	DWORD PTR [eax]
	jmp	$L247
$L246:
	mov	eax, DWORD PTR _stdoutput$S218
	push	eax
	mov	eax, DWORD PTR _where$[ebp]
	movsx	eax, BYTE PTR [eax]
	push	eax
	call	__flsbuf
	add	esp, 8
$L247:
; Line 72
	mov	eax, DWORD PTR _stdoutput$S218
	test	BYTE PTR [eax+12], 32			; 00000020H
	je	$L241
; Line 75
	mov	eax, DWORD PTR _filename$[ebp]
	push	eax
	push	OFFSET $SG242
	call	_as_perror
	add	esp, 8
; Line 76
	push	OFFSET $SG244
	call	_as_fatal
	add	esp, 4
; Line 78
$L241:
	jmp	$L239
$L240:
; Line 79
$L237:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_output_file_append ENDP
_TEXT	ENDS
END
