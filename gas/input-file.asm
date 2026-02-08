	TITLE	input-file.c
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
_BSS	SEGMENT PARA USE32 PUBLIC 'BSS'
_BSS	ENDS
_TLS	SEGMENT DWORD USE32 PUBLIC 'TLS'
_TLS	ENDS
FLAT	GROUP _DATA, CONST, _BSS
	ASSUME	CS: FLAT, DS: FLAT, SS: FLAT
endif
PUBLIC	_preprocess
_DATA	SEGMENT
COMM	_f_in:DWORD
COMM	_file_name:DWORD
_preprocess DD	00H
_DATA	ENDS
PUBLIC	_input_file_begin
_TEXT	SEGMENT
; File input-file.c
_input_file_begin PROC NEAR
; Line 76
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 78
	mov	DWORD PTR _f_in, 0
; Line 79
$L228:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_input_file_begin ENDP
_TEXT	ENDS
PUBLIC	_input_file_end
_TEXT	SEGMENT
_input_file_end PROC NEAR
; Line 83
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 84
$L229:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_input_file_end ENDP
_TEXT	ENDS
PUBLIC	_input_file_buffer_size
_TEXT	SEGMENT
_input_file_buffer_size PROC NEAR
; Line 88
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 89
	mov	eax, 32768				; 00008000H
	jmp	$L230
; Line 90
$L230:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_input_file_buffer_size ENDP
_TEXT	ENDS
PUBLIC	_input_file_is_open
_TEXT	SEGMENT
_input_file_is_open PROC NEAR
; Line 94
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 96
	cmp	DWORD PTR _f_in, 1
	sbb	eax, eax
	inc	eax
	jmp	$L231
; Line 97
$L231:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_input_file_is_open ENDP
_TEXT	ENDS
PUBLIC	_input_file_open
EXTRN	_fopen:NEAR
EXTRN	_as_perror:NEAR
EXTRN	_ungetc:NEAR
EXTRN	__iob:BYTE
EXTRN	__filbuf:NEAR
EXTRN	_strcmp:NEAR
EXTRN	_strchr:NEAR
EXTRN	_fgets:NEAR
_DATA	SEGMENT
$SG238	DB	'r', 00H
	ORG $+2
$SG240	DB	'{standard input}', 00H
	ORG $+3
$SG242	DB	'Can''t open %s for reading', 00H
	ORG $+2
$SG247	DB	'O_APP', 0aH, 00H
_DATA	ENDS
_TEXT	SEGMENT
_filename$ = 8
_pre$ = 12
_c$ = -84
_buf$ = -80
_input_file_open PROC NEAR
; Line 180
	push	ebp
	mov	ebp, esp
	sub	esp, 84					; 00000054H
	push	ebx
	push	esi
	push	edi
; Line 184
	mov	eax, DWORD PTR _pre$[ebp]
	mov	DWORD PTR _preprocess, eax
; Line 187
	mov	eax, DWORD PTR _filename$[ebp]
	movsx	eax, BYTE PTR [eax]
	or	eax, eax
	je	$L237
; Line 188
	push	OFFSET $SG238
	mov	eax, DWORD PTR _filename$[ebp]
	push	eax
	call	_fopen
	add	esp, 8
	mov	DWORD PTR _f_in, eax
; Line 189
	mov	eax, DWORD PTR _filename$[ebp]
	mov	DWORD PTR _file_name, eax
; Line 190
	jmp	$L239
$L237:
; Line 191
	mov	DWORD PTR _f_in, OFFSET __iob
; Line 192
	mov	DWORD PTR _file_name, OFFSET $SG240
; Line 193
$L239:
; Line 194
	cmp	DWORD PTR _f_in, 0
	jne	$L241
; Line 195
	mov	eax, DWORD PTR _file_name
	push	eax
	push	OFFSET $SG242
	call	_as_perror
	add	esp, 8
; Line 196
	jmp	$L234
; Line 203
$L241:
	mov	eax, DWORD PTR _f_in
	dec	DWORD PTR [eax+4]
	mov	eax, DWORD PTR _f_in
	cmp	DWORD PTR [eax+4], 0
	jl	$L280
	mov	eax, DWORD PTR _f_in
	mov	eax, DWORD PTR [eax]
	movsx	eax, BYTE PTR [eax]
	and	eax, 255				; 000000ffH
	mov	DWORD PTR _c$[ebp], eax
	mov	eax, DWORD PTR _f_in
	inc	DWORD PTR [eax]
	jmp	$L281
$L280:
	mov	eax, DWORD PTR _f_in
	push	eax
	call	__filbuf
	add	esp, 4
	mov	DWORD PTR _c$[ebp], eax
$L281:
; Line 204
	cmp	DWORD PTR _c$[ebp], 35			; 00000023H
	jne	$L243
; Line 205
	mov	eax, DWORD PTR _f_in
	dec	DWORD PTR [eax+4]
	mov	eax, DWORD PTR _f_in
	cmp	DWORD PTR [eax+4], 0
	jl	$L282
	mov	eax, DWORD PTR _f_in
	mov	eax, DWORD PTR [eax]
	movsx	eax, BYTE PTR [eax]
	and	eax, 255				; 000000ffH
	mov	DWORD PTR _c$[ebp], eax
	mov	eax, DWORD PTR _f_in
	inc	DWORD PTR [eax]
	jmp	$L283
$L282:
	mov	eax, DWORD PTR _f_in
	push	eax
	call	__filbuf
	add	esp, 4
	mov	DWORD PTR _c$[ebp], eax
$L283:
; Line 206
	cmp	DWORD PTR _c$[ebp], 78			; 0000004eH
	jne	$L244
; Line 207
	mov	eax, DWORD PTR _f_in
	push	eax
	push	80					; 00000050H
	lea	eax, DWORD PTR _buf$[ebp]
	push	eax
	call	_fgets
	add	esp, 12					; 0000000cH
; Line 208
	push	OFFSET $SG247
	lea	eax, DWORD PTR _buf$[ebp]
	push	eax
	call	_strcmp
	add	esp, 8
	or	eax, eax
	jne	$L246
; Line 209
	mov	DWORD PTR _preprocess, 0
; Line 210
$L246:
	push	10					; 0000000aH
	lea	eax, DWORD PTR _buf$[ebp]
	push	eax
	call	_strchr
	add	esp, 8
	or	eax, eax
	jne	$L249
; Line 211
	mov	eax, DWORD PTR _f_in
	push	eax
	push	35					; 00000023H
	call	_ungetc
	add	esp, 8
; Line 212
	jmp	$L250
$L249:
; Line 213
	mov	eax, DWORD PTR _f_in
	push	eax
	push	10					; 0000000aH
	call	_ungetc
	add	esp, 8
$L250:
; Line 214
	jmp	$L251
$L244:
	cmp	DWORD PTR _c$[ebp], 10			; 0000000aH
	jne	$L252
; Line 215
	mov	eax, DWORD PTR _f_in
	push	eax
	push	10					; 0000000aH
	call	_ungetc
	add	esp, 8
; Line 216
	jmp	$L253
$L252:
; Line 217
	mov	eax, DWORD PTR _f_in
	push	eax
	push	35					; 00000023H
	call	_ungetc
	add	esp, 8
$L253:
$L251:
; Line 218
	jmp	$L254
$L243:
; Line 219
	mov	eax, DWORD PTR _f_in
	push	eax
	mov	eax, DWORD PTR _c$[ebp]
	push	eax
	call	_ungetc
	add	esp, 8
$L254:
; Line 242
$L234:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_input_file_open ENDP
_TEXT	ENDS
PUBLIC	_input_file_give_next_buffer
EXTRN	_fread:NEAR
EXTRN	_scrub_from_file:NEAR
EXTRN	_scrub_to_file:NEAR
EXTRN	_do_scrub_next_char:NEAR
EXTRN	_fclose:NEAR
EXTRN	_scrub_file:DWORD
_DATA	SEGMENT
	ORG $+1
$SG274	DB	'Can''t read from %s', 00H
	ORG $+1
$SG278	DB	'Can''t close %s', 00H
_DATA	ENDS
_TEXT	SEGMENT
_return_value$ = -4
_size$ = -8
_p$261 = -12
_n$262 = -16
_ch$263 = -20
_where$ = 8
_input_file_give_next_buffer PROC NEAR
; Line 248
	push	ebp
	mov	ebp, esp
	sub	esp, 20					; 00000014H
	push	ebx
	push	esi
	push	edi
; Line 252
	cmp	DWORD PTR _f_in, 0
	jne	$L259
; Line 253
	sub	eax, eax
	jmp	$L256
; Line 261
$L259:
	cmp	DWORD PTR _preprocess, 0
	je	$L260
; Line 270
	mov	eax, DWORD PTR _f_in
	mov	DWORD PTR _scrub_file, eax
; Line 271
	mov	eax, DWORD PTR _where$[ebp]
	mov	DWORD PTR _p$261[ebp], eax
	mov	DWORD PTR _n$262[ebp], 32768		; 00008000H
	jmp	$L268
$L269:
	dec	DWORD PTR _n$262[ebp]
$L268:
	cmp	DWORD PTR _n$262[ebp], 0
	je	$L270
; Line 272
	push	OFFSET _scrub_to_file
	push	OFFSET _scrub_from_file
	call	_do_scrub_next_char
	add	esp, 8
	mov	DWORD PTR _ch$263[ebp], eax
; Line 273
	cmp	DWORD PTR _ch$263[ebp], -1
	jne	$L271
; Line 274
	jmp	$L270
; Line 275
$L271:
	mov	al, BYTE PTR _ch$263[ebp]
	mov	ecx, DWORD PTR _p$261[ebp]
	mov	BYTE PTR [ecx], al
	inc	DWORD PTR _p$261[ebp]
; Line 276
	jmp	$L269
$L270:
; Line 277
	mov	eax, 32768				; 00008000H
	sub	eax, DWORD PTR _n$262[ebp]
	mov	DWORD PTR _size$[ebp], eax
; Line 278
	jmp	$L272
$L260:
; Line 279
	mov	eax, DWORD PTR _f_in
	push	eax
	push	32768					; 00008000H
	push	1
	mov	eax, DWORD PTR _where$[ebp]
	push	eax
	call	_fread
	add	esp, 16					; 00000010H
	mov	DWORD PTR _size$[ebp], eax
$L272:
; Line 280
	cmp	DWORD PTR _size$[ebp], 0
	jge	$L273
; Line 282
	mov	eax, DWORD PTR _file_name
	push	eax
	push	OFFSET $SG274
	call	_as_perror
	add	esp, 8
; Line 283
	mov	DWORD PTR _size$[ebp], 0
; Line 285
$L273:
	cmp	DWORD PTR _size$[ebp], 0
	je	$L275
; Line 286
	mov	eax, DWORD PTR _size$[ebp]
	add	eax, DWORD PTR _where$[ebp]
	mov	DWORD PTR _return_value$[ebp], eax
; Line 287
	jmp	$L276
$L275:
; Line 289
	mov	eax, DWORD PTR _f_in
	push	eax
	call	_fclose
	add	esp, 4
	or	eax, eax
	je	$L277
; Line 290
	mov	eax, DWORD PTR _file_name
	push	eax
	push	OFFSET $SG278
	call	_as_perror
	add	esp, 8
; Line 291
$L277:
	mov	DWORD PTR _f_in, 0
; Line 292
	mov	DWORD PTR _return_value$[ebp], 0
; Line 293
$L276:
; Line 294
	mov	eax, DWORD PTR _return_value$[ebp]
	jmp	$L256
; Line 295
$L256:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_input_file_give_next_buffer ENDP
_TEXT	ENDS
END
