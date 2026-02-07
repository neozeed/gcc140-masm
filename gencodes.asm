	TITLE	gencodes.c
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
PUBLIC	_rtl_obstack
_DATA	SEGMENT
COMM	_obstack:BYTE:024H
COMM	_insn_code_number:DWORD
_rtl_obstack DD	_obstack
_DATA	ENDS
PUBLIC	_gen_insn
EXTRN	_printf:NEAR
EXTRN	_strlen:NEAR
_DATA	SEGMENT
$SG475	DB	'  CODE_FOR_%s = %d,', 0aH, 00H
_DATA	ENDS
_TEXT	SEGMENT
; File gencodes.c
_insn$ = 8
_gen_insn PROC NEAR
; Line 45
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 48
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	call	_strlen
	add	esp, 4
	or	eax, eax
	je	$L474
; Line 50
	mov	eax, DWORD PTR _insn_code_number
	push	eax
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	push	OFFSET $SG475
	call	_printf
	add	esp, 12					; 0000000cH
; Line 51
$L474:
$L472:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_gen_insn ENDP
_TEXT	ENDS
PUBLIC	_xmalloc
PUBLIC	_fatal
EXTRN	_malloc:NEAR
_DATA	SEGMENT
	ORG $+3
$SG481	DB	'virtual memory exhausted', 00H
_DATA	ENDS
_TEXT	SEGMENT
_size$ = 8
_val$ = -4
_xmalloc PROC NEAR
; Line 55
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 56
	mov	eax, DWORD PTR _size$[ebp]
	push	eax
	call	_malloc
	add	esp, 4
	mov	DWORD PTR _val$[ebp], eax
; Line 58
	cmp	DWORD PTR _val$[ebp], 0
	jne	$L480
; Line 59
	push	0
	push	0
	push	OFFSET $SG481
	call	_fatal
	add	esp, 12					; 0000000cH
; Line 60
$L480:
	mov	eax, DWORD PTR _val$[ebp]
	jmp	$L477
; Line 61
$L477:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_xmalloc ENDP
_TEXT	ENDS
PUBLIC	_xrealloc
EXTRN	_realloc:NEAR
_DATA	SEGMENT
	ORG $+3
$SG489	DB	'virtual memory exhausted', 00H
_DATA	ENDS
_TEXT	SEGMENT
_ptr$ = 8
_size$ = 12
_result$ = -4
_xrealloc PROC NEAR
; Line 67
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 68
	mov	eax, DWORD PTR _size$[ebp]
	push	eax
	mov	eax, DWORD PTR _ptr$[ebp]
	push	eax
	call	_realloc
	add	esp, 8
	mov	DWORD PTR _result$[ebp], eax
; Line 69
	cmp	DWORD PTR _result$[ebp], 0
	jne	$L488
; Line 70
	push	0
	push	0
	push	OFFSET $SG489
	call	_fatal
	add	esp, 12					; 0000000cH
; Line 71
$L488:
	mov	eax, DWORD PTR _result$[ebp]
	jmp	$L485
; Line 72
$L485:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_xrealloc ENDP
_TEXT	ENDS
EXTRN	_fprintf:NEAR
EXTRN	_exit:NEAR
EXTRN	__iob:BYTE
_DATA	SEGMENT
	ORG $+3
$SG494	DB	'gencodes: ', 00H
	ORG $+1
$SG495	DB	0aH, 00H
_DATA	ENDS
_TEXT	SEGMENT
_s$ = 8
_a1$ = 12
_a2$ = 16
_fatal	PROC NEAR
; Line 77
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 78
	push	OFFSET $SG494
	mov	eax, OFFSET __iob
	add	eax, 64					; 00000040H
	push	eax
	call	_fprintf
	add	esp, 8
; Line 79
	mov	eax, DWORD PTR _a2$[ebp]
	push	eax
	mov	eax, DWORD PTR _a1$[ebp]
	push	eax
	mov	eax, DWORD PTR _s$[ebp]
	push	eax
	mov	eax, OFFSET __iob
	add	eax, 64					; 00000040H
	push	eax
	call	_fprintf
	add	esp, 16					; 00000010H
; Line 80
	push	OFFSET $SG495
	mov	eax, OFFSET __iob
	add	eax, 64					; 00000040H
	push	eax
	call	_fprintf
	add	esp, 8
; Line 81
	push	33					; 00000021H
	call	_exit
	add	esp, 4
; Line 82
$L493:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_fatal	ENDP
_TEXT	ENDS
PUBLIC	_fancy_abort
_DATA	SEGMENT
	ORG $+2
$SG498	DB	'Internal gcc abort.', 00H
_DATA	ENDS
_TEXT	SEGMENT
_fancy_abort PROC NEAR
; Line 89
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 90
	push	0
	push	0
	push	OFFSET $SG498
	call	_fatal
	add	esp, 12					; 0000000cH
; Line 91
$L497:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_fancy_abort ENDP
_TEXT	ENDS
PUBLIC	_main
EXTRN	_init_rtl:NEAR
EXTRN	_fopen:NEAR
EXTRN	_read_skip_spaces:NEAR
EXTRN	_free:NEAR
EXTRN	_perror:NEAR
EXTRN	_ungetc:NEAR
EXTRN	_read_rtx:NEAR
EXTRN	__obstack_begin:NEAR
EXTRN	_fflush:NEAR
_DATA	SEGMENT
$SG509	DB	'No input file name.', 00H
$SG510	DB	'r', 00H
	ORG $+2
$SG513	DB	'/* Generated automatically by the program `gencodes''', 0aH
	DB	'from the machine description file `md''.  */', 0aH, 0aH, 00H
	ORG $+1
$SG514	DB	'#ifndef MAX_INSN_CODE', 0aH, 0aH, 00H
$SG515	DB	'enum insn_code {', 0aH, 00H
	ORG $+2
$SG524	DB	'  CODE_FOR_nothing };', 0aH, 00H
	ORG $+1
$SG525	DB	0aH, '#define MAX_INSN_CODE ((int) CODE_FOR_nothing)', 0aH
	DB	00H
	ORG $+3
$SG526	DB	'#endif /* MAX_INSN_CODE */', 0aH, 00H
_DATA	ENDS
_TEXT	SEGMENT
_argc$ = 8
_argv$ = 12
_desc$ = -12
_infile$ = -8
_c$ = -4
_main	PROC NEAR
; Line 97
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
	push	ebx
	push	esi
	push	edi
; Line 103
	push	OFFSET _free
	push	OFFSET _xmalloc
	push	0
	push	0
	mov	eax, DWORD PTR _rtl_obstack
	push	eax
	call	__obstack_begin
	add	esp, 20					; 00000014H
; Line 105
	cmp	DWORD PTR _argc$[ebp], 1
	jg	$L508
; Line 106
	push	0
	push	0
	push	OFFSET $SG509
	call	_fatal
	add	esp, 12					; 0000000cH
; Line 108
$L508:
	push	OFFSET $SG510
	mov	eax, DWORD PTR _argv$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	call	_fopen
	add	esp, 8
	mov	DWORD PTR _infile$[ebp], eax
; Line 109
	cmp	DWORD PTR _infile$[ebp], 0
	jne	$L511
; Line 111
	mov	eax, DWORD PTR _argv$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	call	_perror
	add	esp, 4
; Line 112
	push	33					; 00000021H
	call	_exit
	add	esp, 4
; Line 115
$L511:
	call	_init_rtl
; Line 118
	push	OFFSET $SG513
	call	_printf
	add	esp, 4
; Line 120
	push	OFFSET $SG514
	call	_printf
	add	esp, 4
; Line 124
	mov	DWORD PTR _insn_code_number, 0
; Line 125
	push	OFFSET $SG515
	call	_printf
	add	esp, 4
; Line 127
$L517:
; Line 129
	mov	eax, DWORD PTR _infile$[ebp]
	push	eax
	call	_read_skip_spaces
	add	esp, 4
	mov	DWORD PTR _c$[ebp], eax
; Line 130
	cmp	DWORD PTR _c$[ebp], -1
	jne	$L520
; Line 131
	jmp	$L518
; Line 132
$L520:
	mov	eax, DWORD PTR _infile$[ebp]
	push	eax
	mov	eax, DWORD PTR _c$[ebp]
	push	eax
	call	_ungetc
	add	esp, 8
; Line 134
	mov	eax, DWORD PTR _infile$[ebp]
	push	eax
	call	_read_rtx
	add	esp, 4
	mov	DWORD PTR _desc$[ebp], eax
; Line 135
	mov	eax, DWORD PTR _desc$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 458752				; 00070000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L522
	mov	eax, DWORD PTR _desc$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 655360				; 000a0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L521
$L522:
; Line 137
	mov	eax, DWORD PTR _desc$[ebp]
	push	eax
	call	_gen_insn
	add	esp, 4
; Line 138
	inc	DWORD PTR _insn_code_number
; Line 140
$L521:
	mov	eax, DWORD PTR _desc$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 524288				; 00080000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L523
; Line 142
	inc	DWORD PTR _insn_code_number
; Line 144
$L523:
	jmp	$L517
$L518:
; Line 146
	push	OFFSET $SG524
	call	_printf
	add	esp, 4
; Line 148
	push	OFFSET $SG525
	call	_printf
	add	esp, 4
; Line 150
	push	OFFSET $SG526
	call	_printf
	add	esp, 4
; Line 152
	mov	eax, OFFSET __iob
	add	eax, 32					; 00000020H
	push	eax
	call	_fflush
	add	esp, 4
; Line 153
	mov	eax, DWORD PTR __iob+44
	and	eax, 32					; 00000020H
	cmp	eax, 1
	cmc
	sbb	eax, eax
	and	eax, 33					; 00000021H
	push	eax
	call	_exit
	add	esp, 4
; Line 154
$L502:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_main	ENDP
_TEXT	ENDS
END
