	TITLE	alloca.c
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
_SCCSid$S105 DB	'@(#)alloca.c', 09H, '1.1', 00H
	ORG $+3
_?addr@?1??find_stack_direction@@9@9$S113 DD 00H
_last_alloca_header$S122 DD 00H
_DATA	ENDS
_BSS	SEGMENT
_stack_dir$S109 DD 01H DUP (?)
_BSS	ENDS
_TEXT	SEGMENT
; File alloca.c
_dummy$ = -4
_find_stack_direction PROC NEAR
; Line 84
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 89
	cmp	DWORD PTR _?addr@?1??find_stack_direction@@9@9$S113, 0
	jne	$L115
; Line 91
	lea	eax, DWORD PTR _dummy$[ebp]
	mov	DWORD PTR _?addr@?1??find_stack_direction@@9@9$S113, eax
; Line 93
	call	_find_stack_direction
; Line 95
	jmp	$L116
$L115:
; Line 96
	lea	eax, DWORD PTR _dummy$[ebp]
	cmp	DWORD PTR _?addr@?1??find_stack_direction@@9@9$S113, eax
	jae	$L117
; Line 97
	mov	DWORD PTR _stack_dir$S109, 1
; Line 98
	jmp	$L118
$L117:
; Line 99
	mov	DWORD PTR _stack_dir$S109, -1
$L118:
$L116:
; Line 100
$L111:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_find_stack_direction ENDP
_TEXT	ENDS
PUBLIC	_alloca
EXTRN	_free:NEAR
EXTRN	_xmalloc:NEAR
_TEXT	SEGMENT
_hp$129 = -12
_np$136 = -16
_new$139 = -20
_size$ = 8
_probe$ = -8
_depth$ = -4
_alloca	PROC NEAR
; Line 141
	push	ebp
	mov	ebp, esp
	sub	esp, 20					; 00000014H
	push	ebx
	push	esi
	push	edi
; Line 143
	lea	eax, DWORD PTR _probe$[ebp]
	mov	DWORD PTR _depth$[ebp], eax
; Line 146
	cmp	DWORD PTR _stack_dir$S109, 0
	jne	$L128
; Line 147
	call	_find_stack_direction
; Line 153
$L128:
; Line 156
	mov	eax, DWORD PTR _last_alloca_header$S122
	mov	DWORD PTR _hp$129[ebp], eax
$L131:
	cmp	DWORD PTR _hp$129[ebp], 0
	je	$L132
; Line 158
	cmp	DWORD PTR _stack_dir$S109, 0
	jle	$L135
	mov	eax, DWORD PTR _hp$129[ebp]
	mov	ecx, DWORD PTR _depth$[ebp]
	cmp	DWORD PTR [eax+4], ecx
	ja	$L134
$L135:
	cmp	DWORD PTR _stack_dir$S109, 0
	jge	$L133
	mov	eax, DWORD PTR _hp$129[ebp]
	mov	ecx, DWORD PTR _depth$[ebp]
	cmp	DWORD PTR [eax+4], ecx
	jae	$L133
$L134:
; Line 160
	mov	eax, DWORD PTR _hp$129[ebp]
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _np$136[ebp], eax
; Line 162
	mov	eax, DWORD PTR _hp$129[ebp]
	push	eax
	call	_free
	add	esp, 4
; Line 164
	mov	eax, DWORD PTR _np$136[ebp]
	mov	DWORD PTR _hp$129[ebp], eax
; Line 166
	jmp	$L137
$L133:
; Line 167
	jmp	$L132
$L137:
	jmp	$L131
$L132:
; Line 169
	mov	eax, DWORD PTR _hp$129[ebp]
	mov	DWORD PTR _last_alloca_header$S122, eax
; Line 172
	cmp	DWORD PTR _size$[ebp], 0
	jne	$L138
; Line 173
	sub	eax, eax
	jmp	$L125
; Line 177
$L138:
; Line 178
	mov	eax, DWORD PTR _size$[ebp]
	add	eax, 8
	push	eax
	call	_xmalloc
	add	esp, 4
	mov	DWORD PTR _new$139[ebp], eax
; Line 181
	mov	eax, DWORD PTR _last_alloca_header$S122
	mov	ecx, DWORD PTR _new$139[ebp]
	mov	DWORD PTR [ecx], eax
; Line 182
	mov	eax, DWORD PTR _depth$[ebp]
	mov	ecx, DWORD PTR _new$139[ebp]
	mov	DWORD PTR [ecx+4], eax
; Line 184
	mov	eax, DWORD PTR _new$139[ebp]
	mov	DWORD PTR _last_alloca_header$S122, eax
; Line 188
	mov	eax, DWORD PTR _new$139[ebp]
	add	eax, 8
	jmp	$L125
; Line 190
$L125:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_alloca	ENDP
_TEXT	ENDS
END
