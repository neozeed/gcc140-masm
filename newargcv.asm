	TITLE	newargcv.c
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
COMM	_ARG:QWORD
_DATA	ENDS
PUBLIC	_new_argc_argv
EXTRN	_strcpy:NEAR
EXTRN	_fopen:NEAR
EXTRN	_fscanf:NEAR
EXTRN	_free:NEAR
EXTRN	_malloc:NEAR
EXTRN	_fclose:NEAR
EXTRN	_strlen:NEAR
_DATA	SEGMENT
$SG248	DB	'r', 00H
	ORG $+2
$SG254	DB	'%s', 00H
_DATA	ENDS
_TEXT	SEGMENT
; File newargcv.c
_argc$ = 8
_argv$ = 12
_root$ = -1044
_last$ = -12
_arg$ = -4
_buf$ = -1040
_i$ = -8
_f$ = -16
_new_argc_argv PROC NEAR
; Line 24
	push	ebp
	mov	ebp, esp
	sub	esp, 1044				; 00000414H
	push	ebx
	push	esi
	push	edi
; Line 25
	mov	DWORD PTR _root$[ebp], 0
; Line 30
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L244
$L245:
	inc	DWORD PTR _i$[ebp]
$L244:
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _argv$[ebp]
	mov	ecx, DWORD PTR [ecx]
	cmp	DWORD PTR [ecx+eax*4], 0
	je	$L246
; Line 32
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _argv$[ebp]
	mov	ecx, DWORD PTR [ecx]
	mov	eax, DWORD PTR [ecx+eax*4]
	movsx	eax, BYTE PTR [eax]
	cmp	eax, 64					; 00000040H
	jne	$L247
; Line 34
	push	OFFSET $SG248
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _argv$[ebp]
	mov	ecx, DWORD PTR [ecx]
	mov	eax, DWORD PTR [ecx+eax*4]
	inc	eax
	push	eax
	call	_fopen
	add	esp, 8
	mov	DWORD PTR _f$[ebp], eax
; Line 35
	cmp	DWORD PTR _f$[ebp], 0
	jne	$L249
; Line 36
	jmp	$regular_arg$250
; Line 37
$L249:
$L252:
	lea	eax, DWORD PTR _buf$[ebp]
	push	eax
	push	OFFSET $SG254
	mov	eax, DWORD PTR _f$[ebp]
	push	eax
	call	_fscanf
	add	esp, 12					; 0000000cH
	cmp	eax, 1
	jne	$L253
; Line 39
	push	8
	call	_malloc
	add	esp, 4
	mov	DWORD PTR _arg$[ebp], eax
; Line 40
	mov	eax, DWORD PTR _arg$[ebp]
	mov	DWORD PTR [eax], 0
; Line 41
	lea	eax, DWORD PTR _buf$[ebp]
	push	eax
	call	_strlen
	add	esp, 4
	inc	eax
	push	eax
	call	_malloc
	add	esp, 4
	mov	ecx, DWORD PTR _arg$[ebp]
	mov	DWORD PTR [ecx+4], eax
; Line 42
	lea	eax, DWORD PTR _buf$[ebp]
	push	eax
	mov	eax, DWORD PTR _arg$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	call	_strcpy
	add	esp, 8
; Line 43
	cmp	DWORD PTR _root$[ebp], 0
	jne	$L257
; Line 44
	mov	eax, DWORD PTR _arg$[ebp]
	mov	DWORD PTR _last$[ebp], eax
	mov	eax, DWORD PTR _last$[ebp]
	mov	DWORD PTR _root$[ebp], eax
; Line 45
	jmp	$L258
$L257:
; Line 47
	mov	eax, DWORD PTR _arg$[ebp]
	mov	ecx, DWORD PTR _last$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 48
	mov	eax, DWORD PTR _arg$[ebp]
	mov	DWORD PTR _last$[ebp], eax
; Line 49
$L258:
; Line 50
	jmp	$L252
$L253:
; Line 51
	mov	eax, DWORD PTR _f$[ebp]
	push	eax
	call	_fclose
	add	esp, 4
; Line 53
	jmp	$L259
$L247:
; Line 55
$regular_arg$250:
; Line 56
	push	8
	call	_malloc
	add	esp, 4
	mov	DWORD PTR _arg$[ebp], eax
; Line 57
	mov	eax, DWORD PTR _arg$[ebp]
	mov	DWORD PTR [eax], 0
; Line 58
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _argv$[ebp]
	mov	ecx, DWORD PTR [ecx]
	mov	eax, DWORD PTR [ecx+eax*4]
	mov	ecx, DWORD PTR _arg$[ebp]
	mov	DWORD PTR [ecx+4], eax
; Line 59
	cmp	DWORD PTR _root$[ebp], 0
	jne	$L260
; Line 60
	mov	eax, DWORD PTR _arg$[ebp]
	mov	DWORD PTR _last$[ebp], eax
	mov	eax, DWORD PTR _last$[ebp]
	mov	DWORD PTR _root$[ebp], eax
; Line 61
	jmp	$L261
$L260:
; Line 63
	mov	eax, DWORD PTR _arg$[ebp]
	mov	ecx, DWORD PTR _last$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 64
	mov	eax, DWORD PTR _arg$[ebp]
	mov	DWORD PTR _last$[ebp], eax
; Line 65
$L261:
; Line 66
$L259:
; Line 67
	jmp	$L245
$L246:
; Line 68
	mov	eax, DWORD PTR _argc$[ebp]
	mov	DWORD PTR [eax], 1
	mov	eax, DWORD PTR _root$[ebp]
	mov	DWORD PTR _arg$[ebp], eax
	jmp	$L262
$L263:
	mov	eax, DWORD PTR _arg$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _arg$[ebp], eax
$L262:
	cmp	DWORD PTR _arg$[ebp], 0
	je	$L264
; Line 69
	mov	eax, DWORD PTR _argc$[ebp]
	inc	DWORD PTR [eax]
	jmp	$L263
$L264:
; Line 70
	mov	eax, DWORD PTR _argc$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 2
	push	eax
	call	_malloc
	add	esp, 4
	mov	ecx, DWORD PTR _argv$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 71
	mov	eax, DWORD PTR _argc$[ebp]
	mov	DWORD PTR [eax], 0
	mov	eax, DWORD PTR _root$[ebp]
	mov	DWORD PTR _arg$[ebp], eax
	jmp	$L265
$L266:
	mov	eax, DWORD PTR _arg$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _arg$[ebp], eax
$L265:
	cmp	DWORD PTR _arg$[ebp], 0
	je	$L267
; Line 72
	mov	eax, DWORD PTR _arg$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _argc$[ebp]
	mov	ecx, DWORD PTR [ecx]
	mov	edx, DWORD PTR _argv$[ebp]
	mov	edx, DWORD PTR [edx]
	mov	DWORD PTR [edx+ecx*4], eax
	mov	eax, DWORD PTR _argc$[ebp]
	inc	DWORD PTR [eax]
	jmp	$L266
$L267:
; Line 73
$L269:
	cmp	DWORD PTR _root$[ebp], 0
	je	$L270
; Line 75
	mov	eax, DWORD PTR _root$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _arg$[ebp], eax
; Line 76
	mov	eax, DWORD PTR _root$[ebp]
	push	eax
	call	_free
	add	esp, 4
; Line 77
	mov	eax, DWORD PTR _arg$[ebp]
	mov	DWORD PTR _root$[ebp], eax
; Line 78
	jmp	$L269
$L270:
; Line 79
	mov	eax, DWORD PTR _argc$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	ecx, DWORD PTR _argv$[ebp]
	mov	ecx, DWORD PTR [ecx]
	mov	DWORD PTR [ecx+eax*4], 0
; Line 80
$L237:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_new_argc_argv ENDP
_TEXT	ENDS
END
