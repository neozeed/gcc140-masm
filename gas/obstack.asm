	TITLE	obstack.c
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
COMM	__obstack:DWORD
_DATA	ENDS
PUBLIC	__obstack_begin
_TEXT	SEGMENT
; File obstack.c
_h$ = 8
_size$ = 12
_alignment$ = 16
_chunkfun$ = 20
_freefun$ = 24
_chunk$ = -4
_extra$122 = -8
__obstack_begin PROC NEAR
; Line 60
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	push	ebx
	push	esi
	push	edi
; Line 63
	cmp	DWORD PTR _alignment$[ebp], 0
	jne	$L120
; Line 64
	mov	DWORD PTR _alignment$[ebp], 8
; Line 65
$L120:
	cmp	DWORD PTR _size$[ebp], 0
	jne	$L121
; Line 78
	mov	DWORD PTR _extra$122[ebp], 24		; 00000018H
; Line 79
	mov	eax, 4096				; 00001000H
	sub	eax, DWORD PTR _extra$122[ebp]
	mov	DWORD PTR _size$[ebp], eax
; Line 82
$L121:
	mov	eax, DWORD PTR _chunkfun$[ebp]
	mov	ecx, DWORD PTR _h$[ebp]
	mov	DWORD PTR [ecx+28], eax
; Line 83
	mov	eax, DWORD PTR _freefun$[ebp]
	mov	ecx, DWORD PTR _h$[ebp]
	mov	DWORD PTR [ecx+32], eax
; Line 84
	mov	eax, DWORD PTR _size$[ebp]
	mov	ecx, DWORD PTR _h$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 85
	mov	eax, DWORD PTR _alignment$[ebp]
	dec	eax
	mov	ecx, DWORD PTR _h$[ebp]
	mov	DWORD PTR [ecx+24], eax
; Line 87
	mov	eax, DWORD PTR _h$[ebp]
	mov	eax, DWORD PTR [eax]
	push	eax
	mov	eax, DWORD PTR _h$[ebp]
	call	DWORD PTR [eax+28]
	add	esp, 4
	mov	ecx, DWORD PTR _h$[ebp]
	mov	DWORD PTR [ecx+4], eax
	mov	eax, DWORD PTR _h$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _chunk$[ebp], eax
; Line 88
	mov	eax, DWORD PTR _chunk$[ebp]
	add	eax, 8
	mov	ecx, DWORD PTR _h$[ebp]
	mov	DWORD PTR [ecx+8], eax
	mov	eax, DWORD PTR _h$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	ecx, DWORD PTR _h$[ebp]
	mov	DWORD PTR [ecx+12], eax
; Line 90
	mov	eax, DWORD PTR _h$[ebp]
	mov	eax, DWORD PTR [eax]
	add	eax, DWORD PTR _chunk$[ebp]
	mov	ecx, DWORD PTR _chunk$[ebp]
	mov	DWORD PTR [ecx], eax
	mov	eax, DWORD PTR _chunk$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	ecx, DWORD PTR _h$[ebp]
	mov	DWORD PTR [ecx+16], eax
; Line 91
	mov	eax, DWORD PTR _chunk$[ebp]
	mov	DWORD PTR [eax+4], 0
; Line 92
$L118:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
__obstack_begin ENDP
_TEXT	ENDS
PUBLIC	__obstack_newchunk
_TEXT	SEGMENT
_new_size$ = -12
_obj_size$ = -8
_i$ = -4
_already$ = -24
_h$ = 8
_length$ = 12
_old_chunk$ = -20
_new_chunk$ = -16
__obstack_newchunk PROC NEAR
; Line 104
	push	ebp
	mov	ebp, esp
	sub	esp, 24					; 00000018H
	push	ebx
	push	esi
	push	edi
; Line 105
	mov	eax, DWORD PTR _h$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _old_chunk$[ebp], eax
; Line 108
	mov	eax, DWORD PTR _h$[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	ecx, DWORD PTR _h$[ebp]
	sub	eax, DWORD PTR [ecx+8]
	mov	DWORD PTR _obj_size$[ebp], eax
; Line 113
	mov	eax, DWORD PTR _obj_size$[ebp]
	sar	eax, 3
	add	eax, DWORD PTR _obj_size$[ebp]
	add	eax, DWORD PTR _length$[ebp]
	add	eax, 100				; 00000064H
	mov	DWORD PTR _new_size$[ebp], eax
; Line 114
	mov	eax, DWORD PTR _h$[ebp]
	mov	ecx, DWORD PTR _new_size$[ebp]
	cmp	DWORD PTR [eax], ecx
	jle	$L132
; Line 115
	mov	eax, DWORD PTR _h$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _new_size$[ebp], eax
; Line 118
$L132:
	mov	eax, DWORD PTR _new_size$[ebp]
	push	eax
	mov	eax, DWORD PTR _h$[ebp]
	call	DWORD PTR [eax+28]
	add	esp, 4
	mov	ecx, DWORD PTR _h$[ebp]
	mov	DWORD PTR [ecx+4], eax
	mov	eax, DWORD PTR _h$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _new_chunk$[ebp], eax
; Line 119
	mov	eax, DWORD PTR _old_chunk$[ebp]
	mov	ecx, DWORD PTR _new_chunk$[ebp]
	mov	DWORD PTR [ecx+4], eax
; Line 120
	mov	eax, DWORD PTR _new_size$[ebp]
	add	eax, DWORD PTR _new_chunk$[ebp]
	mov	ecx, DWORD PTR _h$[ebp]
	mov	DWORD PTR [ecx+16], eax
	mov	eax, DWORD PTR _h$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	ecx, DWORD PTR _new_chunk$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 125
	mov	eax, DWORD PTR _h$[ebp]
	mov	eax, DWORD PTR [eax+24]
	inc	eax
	cmp	eax, 8
	jb	$L133
; Line 128
	mov	eax, DWORD PTR _obj_size$[ebp]
	shr	eax, 2
	dec	eax
	mov	DWORD PTR _i$[ebp], eax
	jmp	$L134
$L135:
	dec	DWORD PTR _i$[ebp]
$L134:
	cmp	DWORD PTR _i$[ebp], 0
	jl	$L136
; Line 130
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _h$[ebp]
	mov	ecx, DWORD PTR [ecx+8]
	mov	eax, DWORD PTR [ecx+eax*4]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _new_chunk$[ebp]
	mov	DWORD PTR [edx+ecx*4+8], eax
	jmp	$L135
$L136:
; Line 134
	mov	eax, DWORD PTR _obj_size$[ebp]
	and	eax, -4					; fffffffcH
	mov	ecx, eax
	add	eax, eax
	sub	eax, ecx
	mov	DWORD PTR _already$[ebp], eax
; Line 136
	jmp	$L137
$L133:
; Line 137
	mov	DWORD PTR _already$[ebp], 0
$L137:
; Line 139
	mov	eax, DWORD PTR _already$[ebp]
	mov	DWORD PTR _i$[ebp], eax
	jmp	$L138
$L139:
	inc	DWORD PTR _i$[ebp]
$L138:
	mov	eax, DWORD PTR _obj_size$[ebp]
	cmp	DWORD PTR _i$[ebp], eax
	jge	$L140
; Line 140
	mov	eax, DWORD PTR _h$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	al, BYTE PTR [eax+ecx]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _new_chunk$[ebp]
	mov	BYTE PTR [ecx+edx+8], al
	jmp	$L139
$L140:
; Line 144
	mov	eax, DWORD PTR _h$[ebp]
	mov	ecx, DWORD PTR _old_chunk$[ebp]
	add	ecx, 8
	cmp	DWORD PTR [eax+8], ecx
	jne	$L141
; Line 146
	mov	eax, DWORD PTR _old_chunk$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _new_chunk$[ebp]
	mov	DWORD PTR [ecx+4], eax
; Line 147
	mov	eax, DWORD PTR _old_chunk$[ebp]
	push	eax
	mov	eax, DWORD PTR _h$[ebp]
	call	DWORD PTR [eax+32]
	add	esp, 4
; Line 150
$L141:
	mov	eax, DWORD PTR _new_chunk$[ebp]
	add	eax, 8
	mov	ecx, DWORD PTR _h$[ebp]
	mov	DWORD PTR [ecx+8], eax
; Line 151
	mov	eax, DWORD PTR _h$[ebp]
	mov	eax, DWORD PTR [eax+8]
	add	eax, DWORD PTR _obj_size$[ebp]
	mov	ecx, DWORD PTR _h$[ebp]
	mov	DWORD PTR [ecx+12], eax
; Line 152
$L125:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
__obstack_newchunk ENDP
_TEXT	ENDS
PUBLIC	__obstack_allocated_p
_TEXT	SEGMENT
_h$ = 8
_obj$ = 12
_lp$ = -8
_plp$ = -4
__obstack_allocated_p PROC NEAR
; Line 162
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	push	ebx
	push	esi
	push	edi
; Line 166
	mov	eax, DWORD PTR _h$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _lp$[ebp], eax
; Line 167
$L149:
	cmp	DWORD PTR _lp$[ebp], 0
	je	$L150
	mov	eax, DWORD PTR _obj$[ebp]
	cmp	DWORD PTR _lp$[ebp], eax
	ja	$L151
	mov	eax, DWORD PTR _lp$[ebp]
	mov	ecx, DWORD PTR _obj$[ebp]
	cmp	DWORD PTR [eax], ecx
	jae	$L150
$L151:
; Line 169
	mov	eax, DWORD PTR _lp$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _plp$[ebp], eax
; Line 170
	mov	eax, DWORD PTR _plp$[ebp]
	mov	DWORD PTR _lp$[ebp], eax
; Line 171
	jmp	$L149
$L150:
; Line 172
	cmp	DWORD PTR _lp$[ebp], 1
	sbb	eax, eax
	inc	eax
	jmp	$L145
; Line 173
$L145:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
__obstack_allocated_p ENDP
_TEXT	ENDS
PUBLIC	__obstack_free
EXTRN	_abort:NEAR
_TEXT	SEGMENT
_h$ = 8
_obj$ = 12
_lp$ = -8
_plp$ = -4
__obstack_free PROC NEAR
; Line 187
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	push	ebx
	push	esi
	push	edi
; Line 191
	mov	eax, DWORD PTR _h$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _lp$[ebp], eax
; Line 195
$L158:
	cmp	DWORD PTR _lp$[ebp], 0
	je	$L159
	mov	eax, DWORD PTR _obj$[ebp]
	cmp	DWORD PTR _lp$[ebp], eax
	jae	$L160
	mov	eax, DWORD PTR _lp$[ebp]
	mov	ecx, DWORD PTR _obj$[ebp]
	cmp	DWORD PTR [eax], ecx
	jae	$L159
$L160:
; Line 197
	mov	eax, DWORD PTR _lp$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _plp$[ebp], eax
; Line 198
	mov	eax, DWORD PTR _lp$[ebp]
	push	eax
	mov	eax, DWORD PTR _h$[ebp]
	call	DWORD PTR [eax+32]
	add	esp, 4
; Line 199
	mov	eax, DWORD PTR _plp$[ebp]
	mov	DWORD PTR _lp$[ebp], eax
; Line 200
	jmp	$L158
$L159:
; Line 201
	cmp	DWORD PTR _lp$[ebp], 0
	je	$L161
; Line 203
	mov	eax, DWORD PTR _obj$[ebp]
	mov	ecx, DWORD PTR _h$[ebp]
	mov	DWORD PTR [ecx+12], eax
	mov	eax, DWORD PTR _h$[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	ecx, DWORD PTR _h$[ebp]
	mov	DWORD PTR [ecx+8], eax
; Line 204
	mov	eax, DWORD PTR _lp$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	ecx, DWORD PTR _h$[ebp]
	mov	DWORD PTR [ecx+16], eax
; Line 205
	mov	eax, DWORD PTR _lp$[ebp]
	mov	ecx, DWORD PTR _h$[ebp]
	mov	DWORD PTR [ecx+4], eax
; Line 207
	jmp	$L162
$L161:
	cmp	DWORD PTR _obj$[ebp], 0
	je	$L163
; Line 209
	call	_abort
; Line 210
$L163:
$L162:
$L154:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
__obstack_free ENDP
_TEXT	ENDS
END
