	TITLE	genflags.c
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
_rtl_obstack DD	_obstack
_DATA	ENDS
PUBLIC	_gen_insn
EXTRN	_printf:NEAR
EXTRN	_strlen:NEAR
_DATA	SEGMENT
$SG474	DB	'1', 00H
	ORG $+2
$SG475	DB	'#define HAVE_%s (%s)', 0aH, 00H
	ORG $+2
$SG476	DB	'extern rtx gen_%s ();', 0aH, 00H
_DATA	ENDS
_TEXT	SEGMENT
; File genflags.c
_insn$ = 8
_gen_insn PROC NEAR
; Line 43
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 46
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	call	_strlen
	add	esp, 4
	or	eax, eax
	jne	$L473
; Line 47
	jmp	$L471
; Line 49
$L473:
; Line 50
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+12]
	push	eax
	call	_strlen
	add	esp, 4
	or	eax, eax
	je	$L523
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	DWORD PTR -4+[ebp], eax
	jmp	$L524
$L523:
	mov	DWORD PTR -4+[ebp], OFFSET $SG474
$L524:
	mov	eax, DWORD PTR -4+[ebp]
	push	eax
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	push	OFFSET $SG475
	call	_printf
	add	esp, 12					; 0000000cH
; Line 51
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	push	OFFSET $SG476
	call	_printf
	add	esp, 8
; Line 52
$L471:
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
	ORG $+1
$SG482	DB	'virtual memory exhausted', 00H
_DATA	ENDS
_TEXT	SEGMENT
_size$ = 8
_val$ = -4
_xmalloc PROC NEAR
; Line 56
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 57
	mov	eax, DWORD PTR _size$[ebp]
	push	eax
	call	_malloc
	add	esp, 4
	mov	DWORD PTR _val$[ebp], eax
; Line 59
	cmp	DWORD PTR _val$[ebp], 0
	jne	$L481
; Line 60
	push	0
	push	0
	push	OFFSET $SG482
	call	_fatal
	add	esp, 12					; 0000000cH
; Line 62
$L481:
	mov	eax, DWORD PTR _val$[ebp]
	jmp	$L478
; Line 63
$L478:
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
$SG490	DB	'virtual memory exhausted', 00H
_DATA	ENDS
_TEXT	SEGMENT
_ptr$ = 8
_size$ = 12
_result$ = -4
_xrealloc PROC NEAR
; Line 69
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 70
	mov	eax, DWORD PTR _size$[ebp]
	push	eax
	mov	eax, DWORD PTR _ptr$[ebp]
	push	eax
	call	_realloc
	add	esp, 8
	mov	DWORD PTR _result$[ebp], eax
; Line 71
	cmp	DWORD PTR _result$[ebp], 0
	jne	$L489
; Line 72
	push	0
	push	0
	push	OFFSET $SG490
	call	_fatal
	add	esp, 12					; 0000000cH
; Line 73
$L489:
	mov	eax, DWORD PTR _result$[ebp]
	jmp	$L486
; Line 74
$L486:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_xrealloc ENDP
_TEXT	ENDS
EXTRN	_fprintf:NEAR
EXTRN	__iob:BYTE
EXTRN	_exit:NEAR
_DATA	SEGMENT
	ORG $+3
$SG495	DB	'genflags: ', 00H
	ORG $+1
$SG496	DB	0aH, 00H
_DATA	ENDS
_TEXT	SEGMENT
_s$ = 8
_a1$ = 12
_a2$ = 16
_fatal	PROC NEAR
; Line 79
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 80
	push	OFFSET $SG495
	mov	eax, OFFSET __iob
	add	eax, 64					; 00000040H
	push	eax
	call	_fprintf
	add	esp, 8
; Line 81
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
; Line 82
	push	OFFSET $SG496
	mov	eax, OFFSET __iob
	add	eax, 64					; 00000040H
	push	eax
	call	_fprintf
	add	esp, 8
; Line 83
	push	33					; 00000021H
	call	_exit
	add	esp, 4
; Line 84
$L494:
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
$SG499	DB	'Internal gcc abort.', 00H
_DATA	ENDS
_TEXT	SEGMENT
_fancy_abort PROC NEAR
; Line 91
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 92
	push	0
	push	0
	push	OFFSET $SG499
	call	_fatal
	add	esp, 12					; 0000000cH
; Line 93
$L498:
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
EXTRN	_fflush:NEAR
EXTRN	__obstack_begin:NEAR
_DATA	SEGMENT
$SG510	DB	'No input file name.', 00H
$SG511	DB	'r', 00H
	ORG $+2
$SG514	DB	'/* Generated automatically by the program `genflags''', 0aH
	DB	'from the machine description file `md''.  */', 0aH, 0aH, 00H
_DATA	ENDS
_TEXT	SEGMENT
_argc$ = 8
_argv$ = 12
_desc$ = -12
_infile$ = -8
_c$ = -4
_main	PROC NEAR
; Line 99
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
	push	ebx
	push	esi
	push	edi
; Line 105
	push	OFFSET _free
	push	OFFSET _xmalloc
	push	0
	push	0
	mov	eax, DWORD PTR _rtl_obstack
	push	eax
	call	__obstack_begin
	add	esp, 20					; 00000014H
; Line 107
	cmp	DWORD PTR _argc$[ebp], 1
	jg	$L509
; Line 108
	push	0
	push	0
	push	OFFSET $SG510
	call	_fatal
	add	esp, 12					; 0000000cH
; Line 110
$L509:
	push	OFFSET $SG511
	mov	eax, DWORD PTR _argv$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	call	_fopen
	add	esp, 8
	mov	DWORD PTR _infile$[ebp], eax
; Line 111
	cmp	DWORD PTR _infile$[ebp], 0
	jne	$L512
; Line 113
	mov	eax, DWORD PTR _argv$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	call	_perror
	add	esp, 4
; Line 114
	push	33					; 00000021H
	call	_exit
	add	esp, 4
; Line 117
$L512:
	call	_init_rtl
; Line 120
	push	OFFSET $SG514
	call	_printf
	add	esp, 4
; Line 124
$L516:
; Line 126
	mov	eax, DWORD PTR _infile$[ebp]
	push	eax
	call	_read_skip_spaces
	add	esp, 4
	mov	DWORD PTR _c$[ebp], eax
; Line 127
	cmp	DWORD PTR _c$[ebp], -1
	jne	$L519
; Line 128
	jmp	$L517
; Line 129
$L519:
	mov	eax, DWORD PTR _infile$[ebp]
	push	eax
	mov	eax, DWORD PTR _c$[ebp]
	push	eax
	call	_ungetc
	add	esp, 8
; Line 131
	mov	eax, DWORD PTR _infile$[ebp]
	push	eax
	call	_read_rtx
	add	esp, 4
	mov	DWORD PTR _desc$[ebp], eax
; Line 132
	mov	eax, DWORD PTR _desc$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 458752				; 00070000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L521
	mov	eax, DWORD PTR _desc$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 655360				; 000a0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L520
$L521:
; Line 133
	mov	eax, DWORD PTR _desc$[ebp]
	push	eax
	call	_gen_insn
	add	esp, 4
; Line 134
$L520:
	jmp	$L516
$L517:
; Line 136
	mov	eax, OFFSET __iob
	add	eax, 32					; 00000020H
	push	eax
	call	_fflush
	add	esp, 4
; Line 137
	mov	eax, DWORD PTR __iob+44
	and	eax, 32					; 00000020H
	cmp	eax, 1
	cmc
	sbb	eax, eax
	and	eax, 33					; 00000021H
	push	eax
	call	_exit
	add	esp, 4
; Line 138
$L503:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_main	ENDP
_TEXT	ENDS
END
