	TITLE	app.c
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
_DATA	SEGMENT
COMM	_scrub_file:DWORD
COMM	_scrub_string:DWORD
COMM	_scrub_last_string:DWORD
_symbol_chars$S218 DB '$._ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstu'
	DB	'vwxyz0123456789', 00H
_DATA	ENDS
PUBLIC	_do_scrub_begin
EXTRN	_comment_chars:BYTE
EXTRN	_line_comment_chars:BYTE
EXTRN	_memset:NEAR
_BSS	SEGMENT
_lex$S217 DB	0100H DUP (?)
_BSS	ENDS
_TEXT	SEGMENT
; File app.c
_p$ = -4
_do_scrub_begin PROC NEAR
; Line 53
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 56
	push	256					; 00000100H
	push	0
	push	OFFSET _lex$S217
	call	_memset
	add	esp, 12					; 0000000cH
; Line 57
	movsx	eax, BYTE PTR _lex$S217+32
	or	al, 2
	mov	BYTE PTR _lex$S217+32, al
; Line 58
	movsx	eax, BYTE PTR _lex$S217+9
	or	al, 2
	mov	BYTE PTR _lex$S217+9, al
; Line 59
	mov	DWORD PTR _p$[ebp], OFFSET _symbol_chars$S218
	jmp	$L225
$L226:
	inc	DWORD PTR _p$[ebp]
$L225:
	mov	eax, DWORD PTR _p$[ebp]
	movsx	eax, BYTE PTR [eax]
	or	eax, eax
	je	$L227
; Line 60
	mov	eax, DWORD PTR _p$[ebp]
	movsx	eax, BYTE PTR [eax]
	movsx	eax, BYTE PTR _lex$S217[eax]
	or	al, 1
	mov	ecx, DWORD PTR _p$[ebp]
	movsx	ecx, BYTE PTR [ecx]
	mov	BYTE PTR _lex$S217[ecx], al
	jmp	$L226
$L227:
; Line 61
	movsx	eax, BYTE PTR _lex$S217+10
	or	al, 4
	mov	BYTE PTR _lex$S217+10, al
; Line 65
	movsx	eax, BYTE PTR _lex$S217+59
	or	al, 4
	mov	BYTE PTR _lex$S217+59, al
; Line 66
	mov	DWORD PTR _p$[ebp], OFFSET _comment_chars
	jmp	$L228
$L229:
	inc	DWORD PTR _p$[ebp]
$L228:
	mov	eax, DWORD PTR _p$[ebp]
	movsx	eax, BYTE PTR [eax]
	or	eax, eax
	je	$L230
; Line 67
	mov	eax, DWORD PTR _p$[ebp]
	movsx	eax, BYTE PTR [eax]
	movsx	eax, BYTE PTR _lex$S217[eax]
	or	al, 8
	mov	ecx, DWORD PTR _p$[ebp]
	movsx	ecx, BYTE PTR [ecx]
	mov	BYTE PTR _lex$S217[ecx], al
	jmp	$L229
$L230:
; Line 68
	mov	DWORD PTR _p$[ebp], OFFSET _line_comment_chars
	jmp	$L231
$L232:
	inc	DWORD PTR _p$[ebp]
$L231:
	mov	eax, DWORD PTR _p$[ebp]
	movsx	eax, BYTE PTR [eax]
	or	eax, eax
	je	$L233
; Line 69
	mov	eax, DWORD PTR _p$[ebp]
	movsx	eax, BYTE PTR [eax]
	movsx	eax, BYTE PTR _lex$S217[eax]
	or	al, 16					; 00000010H
	mov	ecx, DWORD PTR _p$[ebp]
	movsx	ecx, BYTE PTR [ecx]
	mov	BYTE PTR _lex$S217[ecx], al
	jmp	$L232
$L233:
; Line 70
$L222:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_do_scrub_begin ENDP
_TEXT	ENDS
PUBLIC	_scrub_from_file
EXTRN	__filbuf:NEAR
_TEXT	SEGMENT
_scrub_from_file PROC NEAR
; Line 76
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 77
	mov	eax, DWORD PTR _scrub_file
	dec	DWORD PTR [eax+4]
	mov	eax, DWORD PTR _scrub_file
	cmp	DWORD PTR [eax+4], 0
	jl	$L393
	mov	eax, DWORD PTR _scrub_file
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR -4+[ebp], eax
	mov	eax, DWORD PTR _scrub_file
	inc	DWORD PTR [eax]
	mov	eax, DWORD PTR -4+[ebp]
	movsx	eax, BYTE PTR [eax]
	and	eax, 255				; 000000ffH
	jmp	$L394
$L393:
	mov	eax, DWORD PTR _scrub_file
	push	eax
	call	__filbuf
	add	esp, 4
$L394:
	jmp	$L236
; Line 78
$L236:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_scrub_from_file ENDP
_TEXT	ENDS
PUBLIC	_scrub_to_file
EXTRN	_ungetc:NEAR
_TEXT	SEGMENT
_ch$ = 8
_scrub_to_file PROC NEAR
; Line 83
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 84
	mov	eax, DWORD PTR _scrub_file
	push	eax
	mov	eax, DWORD PTR _ch$[ebp]
	push	eax
	call	_ungetc
	add	esp, 8
; Line 85
$L239:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_scrub_to_file ENDP
_TEXT	ENDS
PUBLIC	_scrub_from_string
_TEXT	SEGMENT
_scrub_from_string PROC NEAR
; Line 92
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 93
	mov	eax, DWORD PTR _scrub_last_string
	cmp	DWORD PTR _scrub_string, eax
	jne	$L395
	mov	eax, -1
	jmp	$L396
$L395:
	mov	eax, DWORD PTR _scrub_string
	mov	DWORD PTR -4+[ebp], eax
	inc	DWORD PTR _scrub_string
	mov	eax, DWORD PTR -4+[ebp]
	movsx	eax, BYTE PTR [eax]
$L396:
	jmp	$L243
; Line 94
$L243:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_scrub_from_string ENDP
_TEXT	ENDS
PUBLIC	_scrub_to_string
_TEXT	SEGMENT
_ch$ = 8
_scrub_to_string PROC NEAR
; Line 99
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 100
	dec	DWORD PTR _scrub_string
	mov	al, BYTE PTR _ch$[ebp]
	mov	ecx, DWORD PTR _scrub_string
	mov	BYTE PTR [ecx], al
; Line 101
$L246:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_scrub_to_string ENDP
_TEXT	ENDS
PUBLIC	_do_scrub_next_char
EXTRN	_sprintf:NEAR
EXTRN	_as_warn:NEAR
_BSS	SEGMENT
_?out_string@?1??do_scrub_next_char@@9@9$S256 DD 01H DUP (?)
_?out_buf@?1??do_scrub_next_char@@9@9$S258 DB 014H DUP (?)
_?add_newlines@?1??do_scrub_next_char@@9@9$S260 DD 01H DUP (?)
_?state@?1??do_scrub_next_char@@9@9$S252 DD 01H DUP (?)
_?old_state@?1??do_scrub_next_char@@9@9$S254 DD 01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
	ORG $+2
$SG284	DB	'; .file ', 00H
	ORG $+3
$SG296	DB	'End of file in string: inserted ''"''', 00H
$SG306	DB	'Unknown escape ''\%c'' in string: Ignored', 00H
$SG308	DB	'End of file in string: ''"'' inserted', 00H
$SG344	DB	'End of file in ''/'' ''*'' string: */ inserted', 00H
	ORG $+1
$SG353	DB	'End-of-file after a '': ', 00H, ' inserted', 00H
	ORG $+2
$SG354	DB	'(%d)', 00H
	ORG $+3
$SG367	DB	'EOF in comment:  Newline inserted', 00H
	ORG $+2
$SG374	DB	'EOF in Comment: Newline inserted', 00H
	ORG $+3
$SG375	DB	'.line ', 00H
	ORG $+1
$SG383	DB	'EOF in comment:  Newline inserted', 00H
	ORG $+2
$SG391	DB	'End-of-File not at end of a line', 00H
_DATA	ENDS
_TEXT	SEGMENT
_ch$ = -4
_get$ = 8
_unget$ = 12
_do_scrub_next_char PROC NEAR
; Line 108
	push	ebp
	mov	ebp, esp
	sub	esp, 24					; 00000018H
	push	ebx
	push	esi
	push	edi
; Line 129
	cmp	DWORD PTR _?state@?1??do_scrub_next_char@@9@9$S252, -1
	jne	$L262
; Line 130
	mov	eax, DWORD PTR _?out_string@?1??do_scrub_next_char@@9@9$S256
	movsx	eax, BYTE PTR [eax]
	mov	DWORD PTR _ch$[ebp], eax
	inc	DWORD PTR _?out_string@?1??do_scrub_next_char@@9@9$S256
; Line 131
	mov	eax, DWORD PTR _?out_string@?1??do_scrub_next_char@@9@9$S256
	movsx	eax, BYTE PTR [eax]
	or	eax, eax
	jne	$L263
; Line 132
	mov	eax, DWORD PTR _?old_state@?1??do_scrub_next_char@@9@9$S254
	mov	DWORD PTR _?state@?1??do_scrub_next_char@@9@9$S252, eax
; Line 133
	mov	DWORD PTR _?old_state@?1??do_scrub_next_char@@9@9$S254, 3
; Line 135
$L263:
	mov	eax, DWORD PTR _ch$[ebp]
	jmp	$L250
; Line 137
$L262:
	cmp	DWORD PTR _?state@?1??do_scrub_next_char@@9@9$S252, -2 ; fffffffeH
	jne	$L264
; Line 138
$L266:
; Line 139
$L268:
	call	DWORD PTR _get$[ebp]
	mov	DWORD PTR _ch$[ebp], eax
; Line 140
$L269:
	cmp	DWORD PTR _ch$[ebp], -1
	je	$L271
	cmp	DWORD PTR _ch$[ebp], 10			; 0000000aH
	je	$L271
	cmp	DWORD PTR _ch$[ebp], 42			; 0000002aH
	jne	$L268
$L271:
$L270:
; Line 141
	cmp	DWORD PTR _ch$[ebp], 10			; 0000000aH
	je	$L273
	cmp	DWORD PTR _ch$[ebp], -1
	jne	$L272
$L273:
; Line 142
	mov	eax, DWORD PTR _ch$[ebp]
	jmp	$L250
; Line 143
$L272:
	call	DWORD PTR _get$[ebp]
	mov	DWORD PTR _ch$[ebp], eax
; Line 144
	cmp	DWORD PTR _ch$[ebp], -1
	je	$L275
	cmp	DWORD PTR _ch$[ebp], 47			; 0000002fH
	jne	$L274
$L275:
; Line 145
	jmp	$L267
; Line 146
$L274:
	mov	eax, DWORD PTR _ch$[ebp]
	push	eax
	call	DWORD PTR _unget$[ebp]
	add	esp, 4
; Line 147
	jmp	$L266
$L267:
; Line 148
	mov	eax, DWORD PTR _?old_state@?1??do_scrub_next_char@@9@9$S254
	mov	DWORD PTR _?state@?1??do_scrub_next_char@@9@9$S252, eax
; Line 149
	mov	eax, 32					; 00000020H
	jmp	$L250
; Line 151
$L264:
	cmp	DWORD PTR _?state@?1??do_scrub_next_char@@9@9$S252, 4
	jne	$L276
; Line 152
	call	DWORD PTR _get$[ebp]
	mov	DWORD PTR _ch$[ebp], eax
; Line 153
	cmp	DWORD PTR _ch$[ebp], -1
	je	$L278
	cmp	DWORD PTR _ch$[ebp], 48			; 00000030H
	jl	$L277
	cmp	DWORD PTR _ch$[ebp], 57			; 00000039H
	jg	$L277
$L278:
; Line 154
	mov	eax, DWORD PTR _ch$[ebp]
	jmp	$L250
; Line 155
	jmp	$L279
$L277:
; Line 156
$L281:
	cmp	DWORD PTR _ch$[ebp], -1
	je	$L282
	mov	eax, DWORD PTR _ch$[ebp]
	movsx	eax, BYTE PTR _lex$S217[eax]
	test	al, 2
	je	$L282
; Line 157
	call	DWORD PTR _get$[ebp]
	mov	DWORD PTR _ch$[ebp], eax
	jmp	$L281
$L282:
; Line 158
	cmp	DWORD PTR _ch$[ebp], 34			; 00000022H
	jne	$L283
; Line 159
	mov	eax, DWORD PTR _ch$[ebp]
	push	eax
	call	DWORD PTR _unget$[ebp]
	add	esp, 4
; Line 160
	mov	DWORD PTR _?out_string@?1??do_scrub_next_char@@9@9$S256, OFFSET $SG284
; Line 161
	mov	DWORD PTR _?old_state@?1??do_scrub_next_char@@9@9$S254, 7
; Line 162
	mov	DWORD PTR _?state@?1??do_scrub_next_char@@9@9$S252, -1
; Line 163
	mov	eax, DWORD PTR _?out_string@?1??do_scrub_next_char@@9@9$S256
	mov	DWORD PTR -8+[ebp], eax
	inc	DWORD PTR _?out_string@?1??do_scrub_next_char@@9@9$S256
	mov	eax, DWORD PTR -8+[ebp]
	movsx	eax, BYTE PTR [eax]
	jmp	$L250
; Line 164
	jmp	$L285
$L283:
; Line 165
$L287:
	cmp	DWORD PTR _ch$[ebp], -1
	je	$L288
	cmp	DWORD PTR _ch$[ebp], 10			; 0000000aH
	je	$L288
; Line 166
	call	DWORD PTR _get$[ebp]
	mov	DWORD PTR _ch$[ebp], eax
	jmp	$L287
$L288:
; Line 167
	mov	eax, DWORD PTR _ch$[ebp]
	jmp	$L250
; Line 168
$L285:
; Line 169
$L279:
; Line 171
$L276:
	cmp	DWORD PTR _?state@?1??do_scrub_next_char@@9@9$S252, 5
	jne	$L289
; Line 172
	call	DWORD PTR _get$[ebp]
	mov	DWORD PTR _ch$[ebp], eax
; Line 173
	cmp	DWORD PTR _ch$[ebp], 34			; 00000022H
	jne	$L290
; Line 174
	mov	eax, DWORD PTR _?old_state@?1??do_scrub_next_char@@9@9$S254
	mov	DWORD PTR _?state@?1??do_scrub_next_char@@9@9$S252, eax
; Line 175
	mov	eax, 34					; 00000022H
	jmp	$L250
; Line 176
	jmp	$L291
$L290:
	cmp	DWORD PTR _ch$[ebp], 92			; 0000005cH
	jne	$L292
; Line 177
	mov	DWORD PTR _?state@?1??do_scrub_next_char@@9@9$S252, 6
; Line 178
	mov	eax, DWORD PTR _ch$[ebp]
	jmp	$L250
; Line 179
	jmp	$L293
$L292:
	cmp	DWORD PTR _ch$[ebp], -1
	jne	$L294
; Line 180
	push	OFFSET $SG296
	call	_as_warn
	add	esp, 4
; Line 181
	mov	eax, DWORD PTR _?old_state@?1??do_scrub_next_char@@9@9$S254
	mov	DWORD PTR _?state@?1??do_scrub_next_char@@9@9$S252, eax
; Line 182
	push	10					; 0000000aH
	call	DWORD PTR _unget$[ebp]
	add	esp, 4
; Line 183
	mov	eax, 34					; 00000022H
	jmp	$L250
; Line 184
	jmp	$L297
$L294:
; Line 185
	mov	eax, DWORD PTR _ch$[ebp]
	jmp	$L250
; Line 186
$L297:
$L293:
$L291:
; Line 188
$L289:
	cmp	DWORD PTR _?state@?1??do_scrub_next_char@@9@9$S252, 6
	jne	$L298
; Line 189
	mov	DWORD PTR _?state@?1??do_scrub_next_char@@9@9$S252, 5
; Line 190
	call	DWORD PTR _get$[ebp]
	mov	DWORD PTR _ch$[ebp], eax
; Line 191
	mov	eax, DWORD PTR _ch$[ebp]
	mov	DWORD PTR -20+[ebp], eax
	jmp	$L299
; Line 195
$L303:
; Line 196
	push	110					; 0000006eH
	call	DWORD PTR _unget$[ebp]
	add	esp, 4
; Line 197
	inc	DWORD PTR _?add_newlines@?1??do_scrub_next_char@@9@9$S260
; Line 198
	mov	eax, 92					; 0000005cH
	jmp	$L250
; Line 200
$L304:
; Line 215
	jmp	$L300
; Line 216
$L305:
; Line 217
	mov	eax, DWORD PTR _ch$[ebp]
	push	eax
	push	OFFSET $SG306
	call	_as_warn
	add	esp, 8
; Line 218
	jmp	$L300
; Line 220
$L307:
; Line 221
	push	OFFSET $SG308
	call	_as_warn
	add	esp, 4
; Line 222
	mov	eax, 34					; 00000022H
	jmp	$L250
; Line 223
	jmp	$L300
$L299:
	cmp	DWORD PTR -20+[ebp], 98			; 00000062H
	jg	$L397
	je	$L300
	cmp	DWORD PTR -20+[ebp], 34			; 00000022H
	jg	$L398
	je	$L300
	cmp	DWORD PTR -20+[ebp], -1
	je	$L307
	cmp	DWORD PTR -20+[ebp], 10			; 0000000aH
	je	$L303
	jmp	$L305
$L398:
	cmp	DWORD PTR -20+[ebp], 48			; 00000030H
	jl	$L305
	cmp	DWORD PTR -20+[ebp], 55			; 00000037H
	jle	$L300
	cmp	DWORD PTR -20+[ebp], 92			; 0000005cH
	je	$L300
	jmp	$L305
$L397:
	cmp	DWORD PTR -20+[ebp], 102		; 00000066H
	je	$L300
	cmp	DWORD PTR -20+[ebp], 110		; 0000006eH
	je	$L300
	cmp	DWORD PTR -20+[ebp], 114		; 00000072H
	je	$L300
	cmp	DWORD PTR -20+[ebp], 116		; 00000074H
	je	$L300
	jmp	$L305
$L300:
; Line 224
	mov	eax, DWORD PTR _ch$[ebp]
	jmp	$L250
; Line 227
$L298:
	cmp	DWORD PTR _?state@?1??do_scrub_next_char@@9@9$S252, 7
	jne	$L309
; Line 228
	call	DWORD PTR _get$[ebp]
	mov	DWORD PTR _ch$[ebp], eax
; Line 229
	mov	DWORD PTR _?state@?1??do_scrub_next_char@@9@9$S252, 5
; Line 230
	mov	DWORD PTR _?old_state@?1??do_scrub_next_char@@9@9$S254, 8
; Line 231
	mov	eax, DWORD PTR _ch$[ebp]
	jmp	$L250
; Line 234
$L309:
	cmp	DWORD PTR _?state@?1??do_scrub_next_char@@9@9$S252, 8
	jne	$L310
; Line 235
$L311:
	call	DWORD PTR _get$[ebp]
	mov	DWORD PTR _ch$[ebp], eax
; Line 236
$L312:
	cmp	DWORD PTR _ch$[ebp], 10			; 0000000aH
	jne	$L311
$L313:
; Line 237
	mov	DWORD PTR _?state@?1??do_scrub_next_char@@9@9$S252, 0
; Line 238
	mov	eax, DWORD PTR _ch$[ebp]
	jmp	$L250
; Line 241
$L310:
$flushchar$314:
; Line 242
	call	DWORD PTR _get$[ebp]
	mov	DWORD PTR _ch$[ebp], eax
; Line 243
	mov	eax, DWORD PTR _ch$[ebp]
	mov	DWORD PTR -24+[ebp], eax
	jmp	$L315
; Line 244
$L319:
; Line 246
$L320:
	call	DWORD PTR _get$[ebp]
	mov	DWORD PTR _ch$[ebp], eax
; Line 247
$L321:
	cmp	DWORD PTR _ch$[ebp], -1
	je	$L323
	mov	eax, DWORD PTR _ch$[ebp]
	movsx	eax, BYTE PTR _lex$S217[eax]
	test	al, 2
	jne	$L320
$L323:
$L322:
; Line 248
	cmp	DWORD PTR _ch$[ebp], -1
	jne	$L324
; Line 249
	mov	eax, DWORD PTR _ch$[ebp]
	jmp	$L250
; Line 250
$L324:
	mov	eax, DWORD PTR _ch$[ebp]
	movsx	eax, BYTE PTR _lex$S217[eax]
	test	al, 8
	jne	$L326
	cmp	DWORD PTR _?state@?1??do_scrub_next_char@@9@9$S252, 0
	jne	$L327
	mov	eax, DWORD PTR _ch$[ebp]
	movsx	eax, BYTE PTR _lex$S217[eax]
	test	al, 16					; 00000010H
	jne	$L326
$L327:
	cmp	DWORD PTR _ch$[ebp], 47			; 0000002fH
	je	$L326
	mov	eax, DWORD PTR _ch$[ebp]
	movsx	eax, BYTE PTR _lex$S217[eax]
	test	al, 4
	je	$L325
$L326:
; Line 251
	mov	eax, DWORD PTR _ch$[ebp]
	push	eax
	call	DWORD PTR _unget$[ebp]
	add	esp, 4
; Line 252
	jmp	$flushchar$314
; Line 254
$L325:
	mov	eax, DWORD PTR _ch$[ebp]
	push	eax
	call	DWORD PTR _unget$[ebp]
	add	esp, 4
; Line 255
	cmp	DWORD PTR _?state@?1??do_scrub_next_char@@9@9$S252, 0
	je	$L329
	cmp	DWORD PTR _?state@?1??do_scrub_next_char@@9@9$S252, 2
	jne	$L328
$L329:
; Line 256
	inc	DWORD PTR _?state@?1??do_scrub_next_char@@9@9$S252
; Line 257
	mov	eax, 32					; 00000020H
	jmp	$L250
; Line 258
	jmp	$L330
$L328:
	jmp	$flushchar$314
$L330:
; Line 260
$L331:
; Line 261
	call	DWORD PTR _get$[ebp]
	mov	DWORD PTR _ch$[ebp], eax
; Line 262
	cmp	DWORD PTR _ch$[ebp], 42			; 0000002aH
	jne	$L332
; Line 263
$L334:
; Line 264
$L336:
; Line 265
	call	DWORD PTR _get$[ebp]
	mov	DWORD PTR _ch$[ebp], eax
; Line 266
	cmp	DWORD PTR _ch$[ebp], 10			; 0000000aH
	jne	$L339
; Line 267
	inc	DWORD PTR _?add_newlines@?1??do_scrub_next_char@@9@9$S260
; Line 268
$L339:
$L337:
	cmp	DWORD PTR _ch$[ebp], -1
	je	$L340
	cmp	DWORD PTR _ch$[ebp], 42			; 0000002aH
	jne	$L336
$L340:
$L338:
; Line 269
	call	DWORD PTR _get$[ebp]
	mov	DWORD PTR _ch$[ebp], eax
; Line 270
	cmp	DWORD PTR _ch$[ebp], -1
	je	$L342
	cmp	DWORD PTR _ch$[ebp], 47			; 0000002fH
	jne	$L341
$L342:
; Line 271
	jmp	$L335
; Line 272
$L341:
	mov	eax, DWORD PTR _ch$[ebp]
	push	eax
	call	DWORD PTR _unget$[ebp]
	add	esp, 4
; Line 273
	jmp	$L334
$L335:
; Line 274
	cmp	DWORD PTR _ch$[ebp], -1
	jne	$L343
; Line 275
	push	OFFSET $SG344
	call	_as_warn
	add	esp, 4
; Line 277
$L343:
	push	32					; 00000020H
	call	DWORD PTR _unget$[ebp]
	add	esp, 4
; Line 278
	jmp	$flushchar$314
; Line 279
	jmp	$L345
$L332:
; Line 280
	movsx	eax, BYTE PTR _lex$S217+47
	test	al, 8
	jne	$L347
	cmp	DWORD PTR _?state@?1??do_scrub_next_char@@9@9$S252, 0
	jne	$L346
	movsx	eax, BYTE PTR _lex$S217+47
	test	al, 16					; 00000010H
	je	$L346
$L347:
; Line 281
	mov	eax, DWORD PTR _ch$[ebp]
	push	eax
	call	DWORD PTR _unget$[ebp]
	add	esp, 4
; Line 282
	mov	DWORD PTR _ch$[ebp], 47			; 0000002fH
; Line 283
	jmp	$deal_misc$348
; Line 285
$L346:
	cmp	DWORD PTR _ch$[ebp], -1
	je	$L349
; Line 286
	mov	eax, DWORD PTR _ch$[ebp]
	push	eax
	call	DWORD PTR _unget$[ebp]
	add	esp, 4
; Line 287
$L349:
	mov	eax, 47					; 0000002fH
	jmp	$L250
; Line 288
$L345:
; Line 289
	jmp	$L316
; Line 291
$L350:
; Line 292
	mov	eax, DWORD PTR _?state@?1??do_scrub_next_char@@9@9$S252
	mov	DWORD PTR _?old_state@?1??do_scrub_next_char@@9@9$S254, eax
; Line 293
	mov	DWORD PTR _?state@?1??do_scrub_next_char@@9@9$S252, 5
; Line 294
	mov	eax, 34					; 00000022H
	jmp	$L250
; Line 295
	jmp	$L316
; Line 297
$L351:
; Line 298
	call	DWORD PTR _get$[ebp]
	mov	DWORD PTR _ch$[ebp], eax
; Line 299
	cmp	DWORD PTR _ch$[ebp], -1
	jne	$L352
; Line 300
	push	OFFSET $SG353
	call	_as_warn
	add	esp, 4
; Line 301
	mov	DWORD PTR _ch$[ebp], 0
; Line 303
$L352:
	mov	eax, DWORD PTR _ch$[ebp]
	and	eax, 255				; 000000ffH
	push	eax
	push	OFFSET $SG354
	push	OFFSET _?out_buf@?1??do_scrub_next_char@@9@9$S258
	call	_sprintf
	add	esp, 12					; 0000000cH
; Line 304
	mov	eax, DWORD PTR _?state@?1??do_scrub_next_char@@9@9$S252
	mov	DWORD PTR _?old_state@?1??do_scrub_next_char@@9@9$S254, eax
; Line 305
	mov	DWORD PTR _?state@?1??do_scrub_next_char@@9@9$S252, -1
; Line 306
	mov	DWORD PTR _?out_string@?1??do_scrub_next_char@@9@9$S256, OFFSET _?out_buf@?1??do_scrub_next_char@@9@9$S258
; Line 307
	mov	eax, DWORD PTR _?out_string@?1??do_scrub_next_char@@9@9$S256
	mov	DWORD PTR -12+[ebp], eax
	inc	DWORD PTR _?out_string@?1??do_scrub_next_char@@9@9$S256
	mov	eax, DWORD PTR -12+[ebp]
	movsx	eax, BYTE PTR [eax]
	jmp	$L250
; Line 309
$L355:
; Line 310
	cmp	DWORD PTR _?state@?1??do_scrub_next_char@@9@9$S252, 3
	je	$L356
; Line 311
	mov	DWORD PTR _?state@?1??do_scrub_next_char@@9@9$S252, 0
; Line 312
$L356:
	mov	eax, DWORD PTR _ch$[ebp]
	jmp	$L250
; Line 314
$L357:
; Line 315
	cmp	DWORD PTR _?add_newlines@?1??do_scrub_next_char@@9@9$S260, 0
	je	$L358
; Line 316
	dec	DWORD PTR _?add_newlines@?1??do_scrub_next_char@@9@9$S260
; Line 317
	mov	eax, DWORD PTR _ch$[ebp]
	push	eax
	call	DWORD PTR _unget$[ebp]
	add	esp, 4
; Line 319
$L358:
$L359:
; Line 320
	mov	DWORD PTR _?state@?1??do_scrub_next_char@@9@9$S252, 0
; Line 321
	mov	eax, DWORD PTR _ch$[ebp]
	jmp	$L250
; Line 323
$L360:
; Line 324
$deal_misc$348:
; Line 325
	cmp	DWORD PTR _?state@?1??do_scrub_next_char@@9@9$S252, 0
	jne	$L361
	mov	eax, DWORD PTR _ch$[ebp]
	movsx	eax, BYTE PTR _lex$S217[eax]
	test	al, 16					; 00000010H
	je	$L361
; Line 326
$L362:
	call	DWORD PTR _get$[ebp]
	mov	DWORD PTR _ch$[ebp], eax
; Line 327
$L363:
	cmp	DWORD PTR _ch$[ebp], -1
	je	$L365
	mov	eax, DWORD PTR _ch$[ebp]
	movsx	eax, BYTE PTR _lex$S217[eax]
	test	al, 2
	jne	$L362
$L365:
$L364:
; Line 328
	cmp	DWORD PTR _ch$[ebp], -1
	jne	$L366
; Line 329
	push	OFFSET $SG367
	call	_as_warn
	add	esp, 4
; Line 330
	mov	eax, 10					; 0000000aH
	jmp	$L250
; Line 332
$L366:
	cmp	DWORD PTR _ch$[ebp], 48			; 00000030H
	jl	$L369
	cmp	DWORD PTR _ch$[ebp], 57			; 00000039H
	jle	$L368
$L369:
; Line 333
$L371:
	cmp	DWORD PTR _ch$[ebp], -1
	je	$L372
	cmp	DWORD PTR _ch$[ebp], 10			; 0000000aH
	je	$L372
; Line 334
	call	DWORD PTR _get$[ebp]
	mov	DWORD PTR _ch$[ebp], eax
	jmp	$L371
$L372:
; Line 335
	cmp	DWORD PTR _ch$[ebp], -1
	jne	$L373
; Line 336
	push	OFFSET $SG374
	call	_as_warn
	add	esp, 4
; Line 337
$L373:
	mov	DWORD PTR _?state@?1??do_scrub_next_char@@9@9$S252, 0
; Line 338
	mov	eax, 10					; 0000000aH
	jmp	$L250
; Line 340
$L368:
	mov	eax, DWORD PTR _ch$[ebp]
	push	eax
	call	DWORD PTR _unget$[ebp]
	add	esp, 4
; Line 341
	mov	DWORD PTR _?old_state@?1??do_scrub_next_char@@9@9$S254, 4
; Line 342
	mov	DWORD PTR _?state@?1??do_scrub_next_char@@9@9$S252, -1
; Line 343
	mov	DWORD PTR _?out_string@?1??do_scrub_next_char@@9@9$S256, OFFSET $SG375
; Line 344
	mov	eax, DWORD PTR _?out_string@?1??do_scrub_next_char@@9@9$S256
	mov	DWORD PTR -16+[ebp], eax
	inc	DWORD PTR _?out_string@?1??do_scrub_next_char@@9@9$S256
	mov	eax, DWORD PTR -16+[ebp]
	movsx	eax, BYTE PTR [eax]
	jmp	$L250
; Line 346
	jmp	$L376
$L361:
	mov	eax, DWORD PTR _ch$[ebp]
	movsx	eax, BYTE PTR _lex$S217[eax]
	test	al, 8
	je	$L377
; Line 347
$L378:
	call	DWORD PTR _get$[ebp]
	mov	DWORD PTR _ch$[ebp], eax
; Line 348
$L379:
	cmp	DWORD PTR _ch$[ebp], -1
	je	$L381
	cmp	DWORD PTR _ch$[ebp], 10			; 0000000aH
	jne	$L378
$L381:
$L380:
; Line 349
	cmp	DWORD PTR _ch$[ebp], -1
	jne	$L382
; Line 350
	push	OFFSET $SG383
	call	_as_warn
	add	esp, 4
; Line 351
$L382:
	mov	DWORD PTR _?state@?1??do_scrub_next_char@@9@9$S252, 0
; Line 352
	mov	eax, 10					; 0000000aH
	jmp	$L250
; Line 354
	jmp	$L384
$L377:
	cmp	DWORD PTR _?state@?1??do_scrub_next_char@@9@9$S252, 0
	jne	$L385
; Line 355
	mov	DWORD PTR _?state@?1??do_scrub_next_char@@9@9$S252, 2
; Line 356
	mov	eax, DWORD PTR _ch$[ebp]
	jmp	$L250
; Line 357
	jmp	$L386
$L385:
	cmp	DWORD PTR _?state@?1??do_scrub_next_char@@9@9$S252, 1
	jne	$L387
; Line 358
	mov	DWORD PTR _?state@?1??do_scrub_next_char@@9@9$S252, 2
; Line 359
	mov	eax, DWORD PTR _ch$[ebp]
	jmp	$L250
; Line 360
	jmp	$L388
$L387:
; Line 361
	mov	eax, DWORD PTR _ch$[ebp]
	jmp	$L250
; Line 363
$L388:
$L386:
$L384:
$L376:
; Line 364
$L389:
; Line 365
	cmp	DWORD PTR _?state@?1??do_scrub_next_char@@9@9$S252, 0
	jne	$L390
; Line 366
	mov	eax, DWORD PTR _ch$[ebp]
	jmp	$L250
; Line 367
$L390:
	push	OFFSET $SG391
	call	_as_warn
	add	esp, 4
; Line 368
	jmp	$L316
$L315:
	cmp	DWORD PTR -24+[ebp], 34			; 00000022H
	jg	$L399
	je	$L350
	cmp	DWORD PTR -24+[ebp], -1
	je	$L389
	cmp	DWORD PTR -24+[ebp], 9
	je	$L319
	cmp	DWORD PTR -24+[ebp], 10			; 0000000aH
	je	$L357
	cmp	DWORD PTR -24+[ebp], 32			; 00000020H
	je	$L319
	jmp	$L360
$L399:
	cmp	DWORD PTR -24+[ebp], 39			; 00000027H
	je	$L351
	cmp	DWORD PTR -24+[ebp], 47			; 0000002fH
	je	$L331
	cmp	DWORD PTR -24+[ebp], 58			; 0000003aH
	je	$L355
	cmp	DWORD PTR -24+[ebp], 59			; 0000003bH
	je	$L359
	jmp	$L360
$L316:
; Line 369
	mov	eax, -1
	jmp	$L250
; Line 370
$L250:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_do_scrub_next_char ENDP
_TEXT	ENDS
END
