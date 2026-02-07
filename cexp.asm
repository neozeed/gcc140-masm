	TITLE	cexp.c
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
COMM	_yychar:DWORD
COMM	_yylval:QWORD
COMM	_yynerrs:DWORD
COMM	_expression_value:DWORD
_yytranslate$S248 DB 00H
	DB	02H
	DB	02H
	DB	02H
	DB	02H
	DB	02H
	DB	02H
	DB	02H
	DB	02H
	DB	02H
	DB	02H
	DB	02H
	DB	02H
	DB	02H
	DB	02H
	DB	02H
	DB	02H
	DB	02H
	DB	02H
	DB	02H
	DB	02H
	DB	02H
	DB	02H
	DB	02H
	DB	02H
	DB	02H
	DB	02H
	DB	02H
	DB	02H
	DB	02H
	DB	02H
	DB	02H
	DB	02H
	DB	01dH
	DB	02H
	DB	02H
	DB	02H
	DB	01bH
	DB	0eH
	DB	02H
	DB	01fH
	DB	020H
	DB	019H
	DB	017H
	DB	09H
	DB	018H
	DB	02H
	DB	01aH
	DB	02H
	DB	02H
	DB	02H
	DB	02H
	DB	02H
	DB	02H
	DB	02H
	DB	02H
	DB	02H
	DB	02H
	DB	08H
	DB	02H
	DB	011H
	DB	02H
	DB	012H
	DB	07H
	DB	02H
	DB	02H
	DB	02H
	DB	02H
	DB	02H
	DB	02H
	DB	02H
	DB	02H
	DB	02H
	DB	02H
	DB	02H
	DB	02H
	DB	02H
	DB	02H
	DB	02H
	DB	02H
	DB	02H
	DB	02H
	DB	02H
	DB	02H
	DB	02H
	DB	02H
	DB	02H
	DB	02H
	DB	02H
	DB	02H
	DB	02H
	DB	02H
	DB	02H
	DB	02H
	DB	0dH
	DB	02H
	DB	02H
	DB	02H
	DB	02H
	DB	02H
	DB	02H
	DB	02H
	DB	02H
	DB	02H
	DB	02H
	DB	02H
	DB	02H
	DB	02H
	DB	02H
	DB	02H
	DB	02H
	DB	02H
	DB	02H
	DB	02H
	DB	02H
	DB	02H
	DB	02H
	DB	02H
	DB	02H
	DB	02H
	DB	02H
	DB	02H
	DB	02H
	DB	02H
	DB	0cH
	DB	02H
	DB	01eH
	DB	02H
	DB	02H
	DB	02H
	DB	02H
	DB	02H
	DB	02H
	DB	02H
	DB	02H
	DB	02H
	DB	02H
	DB	02H
	DB	02H
	DB	02H
	DB	02H
	DB	02H
	DB	02H
	DB	02H
	DB	02H
	DB	02H
	DB	02H
	DB	02H
	DB	02H
	DB	02H
	DB	02H
	DB	02H
	DB	02H
	DB	02H
	DB	02H
	DB	02H
	DB	02H
	DB	02H
	DB	02H
	DB	02H
	DB	02H
	DB	02H
	DB	02H
	DB	02H
	DB	02H
	DB	02H
	DB	02H
	DB	02H
	DB	02H
	DB	02H
	DB	02H
	DB	02H
	DB	02H
	DB	02H
	DB	02H
	DB	02H
	DB	02H
	DB	02H
	DB	02H
	DB	02H
	DB	02H
	DB	02H
	DB	02H
	DB	02H
	DB	02H
	DB	02H
	DB	02H
	DB	02H
	DB	02H
	DB	02H
	DB	02H
	DB	02H
	DB	02H
	DB	02H
	DB	02H
	DB	02H
	DB	02H
	DB	02H
	DB	02H
	DB	02H
	DB	02H
	DB	02H
	DB	02H
	DB	02H
	DB	02H
	DB	02H
	DB	02H
	DB	02H
	DB	02H
	DB	02H
	DB	02H
	DB	02H
	DB	02H
	DB	02H
	DB	02H
	DB	02H
	DB	02H
	DB	02H
	DB	02H
	DB	02H
	DB	02H
	DB	02H
	DB	02H
	DB	02H
	DB	02H
	DB	02H
	DB	02H
	DB	02H
	DB	02H
	DB	02H
	DB	02H
	DB	02H
	DB	02H
	DB	02H
	DB	02H
	DB	02H
	DB	02H
	DB	02H
	DB	02H
	DB	02H
	DB	02H
	DB	02H
	DB	02H
	DB	02H
	DB	02H
	DB	02H
	DB	02H
	DB	02H
	DB	02H
	DB	02H
	DB	02H
	DB	02H
	DB	02H
	DB	02H
	DB	02H
	DB	02H
	DB	01H
	DB	02H
	DB	03H
	DB	04H
	DB	05H
	DB	06H
	DB	0aH
	DB	0bH
	DB	0fH
	DB	010H
	DB	013H
	DB	014H
	DB	015H
	DB	016H
	DB	01cH
	ORG $+1
_yyprhs$S249 DW	00H
	DW	00H
	DW	02H
	DW	04H
	DW	08H
	DW	0bH
	DW	0eH
	DW	011H
	DW	014H
	DW	018H
	DW	01cH
	DW	020H
	DW	024H
	DW	028H
	DW	02cH
	DW	030H
	DW	034H
	DW	038H
	DW	03cH
	DW	040H
	DW	044H
	DW	048H
	DW	04cH
	DW	050H
	DW	054H
	DW	058H
	DW	05cH
	DW	060H
	DW	066H
	DW	068H
	DW	06aH
	ORG $+2
_yyrhs$S250 DW	022H
	DW	00H
	DW	023H
	DW	00H
	DW	022H
	DW	09H
	DW	023H
	DW	00H
	DW	018H
	DW	023H
	DW	00H
	DW	01dH
	DW	023H
	DW	00H
	DW	017H
	DW	023H
	DW	00H
	DW	01eH
	DW	023H
	DW	00H
	DW	01fH
	DW	022H
	DW	020H
	DW	00H
	DW	023H
	DW	019H
	DW	023H
	DW	00H
	DW	023H
	DW	01aH
	DW	023H
	DW	00H
	DW	023H
	DW	01bH
	DW	023H
	DW	00H
	DW	023H
	DW	017H
	DW	023H
	DW	00H
	DW	023H
	DW	018H
	DW	023H
	DW	00H
	DW	023H
	DW	015H
	DW	023H
	DW	00H
	DW	023H
	DW	016H
	DW	023H
	DW	00H
	DW	023H
	DW	0fH
	DW	023H
	DW	00H
	DW	023H
	DW	010H
	DW	023H
	DW	00H
	DW	023H
	DW	013H
	DW	023H
	DW	00H
	DW	023H
	DW	014H
	DW	023H
	DW	00H
	DW	023H
	DW	011H
	DW	023H
	DW	00H
	DW	023H
	DW	012H
	DW	023H
	DW	00H
	DW	023H
	DW	0eH
	DW	023H
	DW	00H
	DW	023H
	DW	0dH
	DW	023H
	DW	00H
	DW	023H
	DW	0cH
	DW	023H
	DW	00H
	DW	023H
	DW	0bH
	DW	023H
	DW	00H
	DW	023H
	DW	0aH
	DW	023H
	DW	00H
	DW	023H
	DW	07H
	DW	023H
	DW	08H
	DW	023H
	DW	00H
	DW	03H
	DW	00H
	DW	04H
	DW	00H
	DW	05H
	DW	00H
_yyr1$S251 DW	00H
	DW	021H
	DW	022H
	DW	022H
	DW	023H
	DW	023H
	DW	023H
	DW	023H
	DW	023H
	DW	023H
	DW	023H
	DW	023H
	DW	023H
	DW	023H
	DW	023H
	DW	023H
	DW	023H
	DW	023H
	DW	023H
	DW	023H
	DW	023H
	DW	023H
	DW	023H
	DW	023H
	DW	023H
	DW	023H
	DW	023H
	DW	023H
	DW	023H
	DW	023H
	DW	023H
	ORG $+2
_yyr2$S252 DW	00H
	DW	01H
	DW	01H
	DW	03H
	DW	02H
	DW	02H
	DW	02H
	DW	02H
	DW	03H
	DW	03H
	DW	03H
	DW	03H
	DW	03H
	DW	03H
	DW	03H
	DW	03H
	DW	03H
	DW	03H
	DW	03H
	DW	03H
	DW	03H
	DW	03H
	DW	03H
	DW	03H
	DW	03H
	DW	03H
	DW	03H
	DW	05H
	DW	01H
	DW	01H
	DW	01H
	ORG $+2
_yydefact$S253 DW 00H
	DW	01cH
	DW	01dH
	DW	01eH
	DW	00H
	DW	00H
	DW	00H
	DW	00H
	DW	00H
	DW	01H
	DW	02H
	DW	06H
	DW	04H
	DW	05H
	DW	07H
	DW	00H
	DW	00H
	DW	00H
	DW	00H
	DW	00H
	DW	00H
	DW	00H
	DW	00H
	DW	00H
	DW	00H
	DW	00H
	DW	00H
	DW	00H
	DW	00H
	DW	00H
	DW	00H
	DW	00H
	DW	00H
	DW	00H
	DW	00H
	DW	00H
	DW	08H
	DW	03H
	DW	00H
	DW	01aH
	DW	019H
	DW	018H
	DW	017H
	DW	016H
	DW	010H
	DW	011H
	DW	014H
	DW	015H
	DW	012H
	DW	013H
	DW	0eH
	DW	0fH
	DW	0cH
	DW	0dH
	DW	09H
	DW	0aH
	DW	0bH
	DW	00H
	DW	01bH
	DW	00H
	DW	00H
	DW	00H
	ORG $+4
_yydefgoto$S254 DW 03bH
	DW	09H
	DW	0aH
	ORG $+2
_yypact$S255 DW	01fH
	DW	08000H
	DW	08000H
	DW	08000H
	DW	01fH
	DW	01fH
	DW	01fH
	DW	01fH
	DW	01fH
	DW	01H
	DW	04dH
	DW	08000H
	DW	08000H
	DW	08000H
	DW	08000H
	DW	00H
	DW	01fH
	DW	01fH
	DW	01fH
	DW	01fH
	DW	01fH
	DW	01fH
	DW	01fH
	DW	01fH
	DW	01fH
	DW	01fH
	DW	01fH
	DW	01fH
	DW	01fH
	DW	01fH
	DW	01fH
	DW	01fH
	DW	01fH
	DW	01fH
	DW	01fH
	DW	01fH
	DW	08000H
	DW	04dH
	DW	038H
	DW	05eH
	DW	019H
	DW	06dH
	DW	07bH
	DW	088H
	DW	093H
	DW	093H
	DW	09aH
	DW	09aH
	DW	09aH
	DW	09aH
	DW	0ffedH
	DW	0ffedH
	DW	020H
	DW	020H
	DW	08000H
	DW	08000H
	DW	08000H
	DW	01fH
	DW	04dH
	DW	0bH
	DW	021H
	DW	08000H
	ORG $+4
_yypgoto$S256 DW 08000H
	DW	030H
	DW	0fffcH
	ORG $+2
_yytable$S257 DW 0bH
	DW	0cH
	DW	0dH
	DW	0eH
	DW	01fH
	DW	020H
	DW	021H
	DW	022H
	DW	023H
	DW	010H
	DW	010H
	DW	03cH
	DW	025H
	DW	026H
	DW	027H
	DW	028H
	DW	029H
	DW	02aH
	DW	02bH
	DW	02cH
	DW	02dH
	DW	02eH
	DW	02fH
	DW	030H
	DW	031H
	DW	032H
	DW	033H
	DW	034H
	DW	035H
	DW	036H
	DW	037H
	DW	038H
	DW	024H
	DW	03dH
	DW	01H
	DW	02H
	DW	03H
	DW	014H
	DW	015H
	DW	016H
	DW	017H
	DW	018H
	DW	019H
	DW	01aH
	DW	01bH
	DW	01cH
	DW	01dH
	DW	01eH
	DW	01fH
	DW	020H
	DW	021H
	DW	022H
	DW	023H
	DW	03aH
	DW	04H
	DW	05H
	DW	0fH
	DW	021H
	DW	022H
	DW	023H
	DW	06H
	DW	07H
	DW	08H
	DW	011H
	DW	039H
	DW	00H
	DW	012H
	DW	013H
	DW	014H
	DW	015H
	DW	016H
	DW	017H
	DW	018H
	DW	019H
	DW	01aH
	DW	01bH
	DW	01cH
	DW	01dH
	DW	01eH
	DW	01fH
	DW	020H
	DW	021H
	DW	022H
	DW	023H
	DW	011H
	DW	00H
	DW	00H
	DW	012H
	DW	013H
	DW	014H
	DW	015H
	DW	016H
	DW	017H
	DW	018H
	DW	019H
	DW	01aH
	DW	01bH
	DW	01cH
	DW	01dH
	DW	01eH
	DW	01fH
	DW	020H
	DW	021H
	DW	022H
	DW	023H
	DW	013H
	DW	014H
	DW	015H
	DW	016H
	DW	017H
	DW	018H
	DW	019H
	DW	01aH
	DW	01bH
	DW	01cH
	DW	01dH
	DW	01eH
	DW	01fH
	DW	020H
	DW	021H
	DW	022H
	DW	023H
	DW	015H
	DW	016H
	DW	017H
	DW	018H
	DW	019H
	DW	01aH
	DW	01bH
	DW	01cH
	DW	01dH
	DW	01eH
	DW	01fH
	DW	020H
	DW	021H
	DW	022H
	DW	023H
	DW	016H
	DW	017H
	DW	018H
	DW	019H
	DW	01aH
	DW	01bH
	DW	01cH
	DW	01dH
	DW	01eH
	DW	01fH
	DW	020H
	DW	021H
	DW	022H
	DW	023H
	DW	017H
	DW	018H
	DW	019H
	DW	01aH
	DW	01bH
	DW	01cH
	DW	01dH
	DW	01eH
	DW	01fH
	DW	020H
	DW	021H
	DW	022H
	DW	023H
	DW	019H
	DW	01aH
	DW	01bH
	DW	01cH
	DW	01dH
	DW	01eH
	DW	01fH
	DW	020H
	DW	021H
	DW	022H
	DW	023H
	DW	01dH
	DW	01eH
	DW	01fH
	DW	020H
	DW	021H
	DW	022H
	DW	023H
	ORG $+4
_yycheck$S258 DW 04H
	DW	05H
	DW	06H
	DW	07H
	DW	017H
	DW	018H
	DW	019H
	DW	01aH
	DW	01bH
	DW	09H
	DW	09H
	DW	00H
	DW	010H
	DW	011H
	DW	012H
	DW	013H
	DW	014H
	DW	015H
	DW	016H
	DW	017H
	DW	018H
	DW	019H
	DW	01aH
	DW	01bH
	DW	01cH
	DW	01dH
	DW	01eH
	DW	01fH
	DW	020H
	DW	021H
	DW	022H
	DW	023H
	DW	020H
	DW	00H
	DW	03H
	DW	04H
	DW	05H
	DW	0cH
	DW	0dH
	DW	0eH
	DW	0fH
	DW	010H
	DW	011H
	DW	012H
	DW	013H
	DW	014H
	DW	015H
	DW	016H
	DW	017H
	DW	018H
	DW	019H
	DW	01aH
	DW	01bH
	DW	039H
	DW	017H
	DW	018H
	DW	08H
	DW	019H
	DW	01aH
	DW	01bH
	DW	01dH
	DW	01eH
	DW	01fH
	DW	07H
	DW	08H
	DW	0ffffH
	DW	0aH
	DW	0bH
	DW	0cH
	DW	0dH
	DW	0eH
	DW	0fH
	DW	010H
	DW	011H
	DW	012H
	DW	013H
	DW	014H
	DW	015H
	DW	016H
	DW	017H
	DW	018H
	DW	019H
	DW	01aH
	DW	01bH
	DW	07H
	DW	0ffffH
	DW	0ffffH
	DW	0aH
	DW	0bH
	DW	0cH
	DW	0dH
	DW	0eH
	DW	0fH
	DW	010H
	DW	011H
	DW	012H
	DW	013H
	DW	014H
	DW	015H
	DW	016H
	DW	017H
	DW	018H
	DW	019H
	DW	01aH
	DW	01bH
	DW	0bH
	DW	0cH
	DW	0dH
	DW	0eH
	DW	0fH
	DW	010H
	DW	011H
	DW	012H
	DW	013H
	DW	014H
	DW	015H
	DW	016H
	DW	017H
	DW	018H
	DW	019H
	DW	01aH
	DW	01bH
	DW	0dH
	DW	0eH
	DW	0fH
	DW	010H
	DW	011H
	DW	012H
	DW	013H
	DW	014H
	DW	015H
	DW	016H
	DW	017H
	DW	018H
	DW	019H
	DW	01aH
	DW	01bH
	DW	0eH
	DW	0fH
	DW	010H
	DW	011H
	DW	012H
	DW	013H
	DW	014H
	DW	015H
	DW	016H
	DW	017H
	DW	018H
	DW	019H
	DW	01aH
	DW	01bH
	DW	0fH
	DW	010H
	DW	011H
	DW	012H
	DW	013H
	DW	014H
	DW	015H
	DW	016H
	DW	017H
	DW	018H
	DW	019H
	DW	01aH
	DW	01bH
	DW	011H
	DW	012H
	DW	013H
	DW	014H
	DW	015H
	DW	016H
	DW	017H
	DW	018H
	DW	019H
	DW	01aH
	DW	01bH
	DW	015H
	DW	016H
	DW	017H
	DW	018H
	DW	019H
	DW	01aH
	DW	01bH
$SG439	DB	'&&', 00H
	ORG $+1
$SG440	DB	'||', 00H
	ORG $+1
$SG441	DB	'<<', 00H
	ORG $+1
$SG442	DB	'>>', 00H
	ORG $+1
$SG443	DB	'==', 00H
	ORG $+1
$SG444	DB	'!=', 00H
	ORG $+1
$SG445	DB	'<=', 00H
	ORG $+1
$SG446	DB	'>=', 00H
	ORG $+5
_tokentab2$S438 DD $SG439
	DD	0107H
	DD	$SG440
	DD	0106H
	DD	$SG441
	DD	010cH
	DD	$SG442
	DD	010dH
	DD	$SG443
	DD	0108H
	DD	$SG444
	DD	0109H
	DD	$SG445
	DD	010aH
	DD	$SG446
	DD	010bH
	DD	00H
	DD	0105H
_DATA	ENDS
_TEXT	SEGMENT
; File bison.simple
_from$ = 8
_to$ = 12
_count$ = 16
_f$ = -8
_t$ = -12
_i$ = -4
___yy_bcopy PROC NEAR
; Line 141
	push	ebp
	mov	ebp, esp
	sub	esp, 16					; 00000010H
	push	ebx
	push	esi
	push	edi
; Line 142
	mov	eax, DWORD PTR _from$[ebp]
	mov	DWORD PTR _f$[ebp], eax
; Line 143
	mov	eax, DWORD PTR _to$[ebp]
	mov	DWORD PTR _t$[ebp], eax
; Line 144
	mov	eax, DWORD PTR _count$[ebp]
	mov	DWORD PTR _i$[ebp], eax
; Line 146
$L271:
	mov	eax, DWORD PTR _i$[ebp]
	mov	DWORD PTR -16+[ebp], eax
	dec	DWORD PTR _i$[ebp]
	cmp	DWORD PTR -16+[ebp], 0
	jle	$L272
; Line 147
	mov	eax, DWORD PTR _f$[ebp]
	mov	al, BYTE PTR [eax]
	mov	ecx, DWORD PTR _t$[ebp]
	mov	BYTE PTR [ecx], al
	inc	DWORD PTR _f$[ebp]
	inc	DWORD PTR _t$[ebp]
	jmp	$L271
$L272:
; Line 148
$L266:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
___yy_bcopy ENDP
_TEXT	ENDS
PUBLIC	_yyparse
PUBLIC	_yylex
PUBLIC	_yyerror
EXTRN	_error:NEAR
EXTRN	_alloca:NEAR
_DATA	SEGMENT
$SG294	DB	'parser stack overflow', 00H
	ORG $+2
$SG333	DB	'division by zero in #if', 00H
$SG338	DB	'division by zero in #if', 00H
$SG379	DB	'parse error', 00H
_DATA	ENDS
_TEXT	SEGMENT
_yystate$ = -432
_yyn$ = -420
_yyssp$ = -4
_yyvsp$ = -436
_yyerrstatus$ = -412
_yychar1$ = -416
_yyssa$ = -408
_yyvsa$ = -2048
_yyss$ = -428
_yyvs$ = -8
_yystacksize$ = -440
_yyval$ = -448
_yylen$ = -424
_yyvs1$290 = -2056
_yyss1$291 = -2052
_size$292 = -2060
_yyparse PROC NEAR
; Line 171
	push	ebp
	mov	ebp, esp
	sub	esp, 2064				; 00000810H
	push	ebx
	push	esi
	push	edi
; Line 182
	lea	eax, DWORD PTR _yyssa$[ebp]
	mov	DWORD PTR _yyss$[ebp], eax
; Line 183
	lea	eax, DWORD PTR _yyvsa$[ebp]
	mov	DWORD PTR _yyvs$[ebp], eax
; Line 195
	mov	DWORD PTR _yystacksize$[ebp], 200	; 000000c8H
; Line 217
	mov	DWORD PTR _yystate$[ebp], 0
; Line 218
	mov	DWORD PTR _yyerrstatus$[ebp], 0
; Line 219
	mov	DWORD PTR _yynerrs, 0
; Line 220
	mov	DWORD PTR _yychar, -2			; fffffffeH
; Line 226
	mov	eax, DWORD PTR _yyss$[ebp]
	sub	eax, 2
	mov	DWORD PTR _yyssp$[ebp], eax
; Line 227
	mov	eax, DWORD PTR _yyvs$[ebp]
	mov	DWORD PTR _yyvsp$[ebp], eax
; Line 235
$yynewstate$288:
; Line 237
	add	DWORD PTR _yyssp$[ebp], 2
	mov	eax, DWORD PTR _yystate$[ebp]
	mov	ecx, DWORD PTR _yyssp$[ebp]
	mov	WORD PTR [ecx], ax
; Line 239
	mov	eax, DWORD PTR _yystacksize$[ebp]
	add	eax, eax
	add	eax, DWORD PTR _yyss$[ebp]
	sub	eax, 2
	cmp	eax, DWORD PTR _yyssp$[ebp]
	ja	$L289
; Line 243
	mov	eax, DWORD PTR _yyvs$[ebp]
	mov	DWORD PTR _yyvs1$290[ebp], eax
; Line 244
	mov	eax, DWORD PTR _yyss$[ebp]
	mov	DWORD PTR _yyss1$291[ebp], eax
; Line 250
	mov	eax, DWORD PTR _yyssp$[ebp]
	sub	eax, DWORD PTR _yyss$[ebp]
	sar	eax, 1
	inc	eax
	mov	DWORD PTR _size$292[ebp], eax
; Line 269
	cmp	DWORD PTR _yystacksize$[ebp], 10000	; 00002710H
	jl	$L293
; Line 271
	push	OFFSET $SG294
	call	_yyerror
	add	esp, 4
; Line 272
	mov	eax, 2
	jmp	$L274
; Line 274
$L293:
	shl	DWORD PTR _yystacksize$[ebp], 1
; Line 275
	cmp	DWORD PTR _yystacksize$[ebp], 10000	; 00002710H
	jle	$L295
; Line 276
	mov	DWORD PTR _yystacksize$[ebp], 10000	; 00002710H
; Line 277
$L295:
	mov	eax, DWORD PTR _yystacksize$[ebp]
	add	eax, eax
	push	eax
	call	_alloca
	add	esp, 4
	mov	DWORD PTR _yyss$[ebp], eax
; Line 278
	mov	eax, DWORD PTR _size$292[ebp]
	add	eax, eax
	push	eax
	mov	eax, DWORD PTR _yyss$[ebp]
	push	eax
	mov	eax, DWORD PTR _yyss1$291[ebp]
	push	eax
	call	___yy_bcopy
	add	esp, 12					; 0000000cH
; Line 279
	mov	eax, DWORD PTR _yystacksize$[ebp]
	shl	eax, 3
	push	eax
	call	_alloca
	add	esp, 4
	mov	DWORD PTR _yyvs$[ebp], eax
; Line 280
	mov	eax, DWORD PTR _size$292[ebp]
	shl	eax, 3
	push	eax
	mov	eax, DWORD PTR _yyvs$[ebp]
	push	eax
	mov	eax, DWORD PTR _yyvs1$290[ebp]
	push	eax
	call	___yy_bcopy
	add	esp, 12					; 0000000cH
; Line 287
	mov	eax, DWORD PTR _size$292[ebp]
	add	eax, eax
	add	eax, DWORD PTR _yyss$[ebp]
	sub	eax, 2
	mov	DWORD PTR _yyssp$[ebp], eax
; Line 288
	mov	eax, DWORD PTR _size$292[ebp]
	shl	eax, 3
	add	eax, DWORD PTR _yyvs$[ebp]
	sub	eax, 8
	mov	DWORD PTR _yyvsp$[ebp], eax
; Line 298
	mov	eax, DWORD PTR _yystacksize$[ebp]
	add	eax, eax
	add	eax, DWORD PTR _yyss$[ebp]
	sub	eax, 2
	cmp	eax, DWORD PTR _yyssp$[ebp]
	ja	$L297
; Line 299
	mov	eax, 1
	jmp	$L274
; Line 300
$L297:
; Line 307
$L289:
$yybackup$298:
; Line 315
	mov	eax, DWORD PTR _yystate$[ebp]
	movsx	eax, WORD PTR _yypact$S255[eax*2]
	mov	DWORD PTR _yyn$[ebp], eax
; Line 316
	cmp	DWORD PTR _yyn$[ebp], -32768		; ffff8000H
	jne	$L299
; Line 317
	jmp	$yydefault$300
; Line 324
$L299:
	cmp	DWORD PTR _yychar, -2			; fffffffeH
	jne	$L301
; Line 330
	call	_yylex
	mov	DWORD PTR _yychar, eax
; Line 335
$L301:
	cmp	DWORD PTR _yychar, 0
	jg	$L302
; Line 337
	mov	DWORD PTR _yychar1$[ebp], 0
; Line 338
	mov	DWORD PTR _yychar, 0
; Line 345
	jmp	$L303
$L302:
; Line 347
	cmp	DWORD PTR _yychar, 270			; 0000010eH
	jbe	$L544
	mov	DWORD PTR _yychar1$[ebp], 36		; 00000024H
	jmp	$L545
$L544:
	mov	eax, DWORD PTR _yychar
	movsx	eax, BYTE PTR _yytranslate$S248[eax]
	mov	DWORD PTR _yychar1$[ebp], eax
$L545:
; Line 361
$L303:
; Line 363
	mov	eax, DWORD PTR _yychar1$[ebp]
	add	DWORD PTR _yyn$[ebp], eax
; Line 364
	js	$L305
	cmp	DWORD PTR _yyn$[ebp], 181		; 000000b5H
	jg	$L305
	mov	eax, DWORD PTR _yyn$[ebp]
	movsx	eax, WORD PTR _yycheck$S258[eax*2]
	cmp	eax, DWORD PTR _yychar1$[ebp]
	je	$L304
$L305:
; Line 365
	jmp	$yydefault$300
; Line 367
$L304:
	mov	eax, DWORD PTR _yyn$[ebp]
	movsx	eax, WORD PTR _yytable$S257[eax*2]
	mov	DWORD PTR _yyn$[ebp], eax
; Line 376
	cmp	DWORD PTR _yyn$[ebp], 0
	jge	$L306
; Line 378
	cmp	DWORD PTR _yyn$[ebp], -32768		; ffff8000H
	jne	$L307
; Line 379
	jmp	$yyerrlab$308
; Line 380
$L307:
	mov	eax, DWORD PTR _yyn$[ebp]
	neg	eax
	mov	DWORD PTR _yyn$[ebp], eax
; Line 381
	jmp	$yyreduce$309
; Line 383
	jmp	$L310
$L306:
	cmp	DWORD PTR _yyn$[ebp], 0
	jne	$L311
; Line 384
	jmp	$yyerrlab$308
; Line 386
$L311:
$L310:
	cmp	DWORD PTR _yyn$[ebp], 61		; 0000003dH
	jne	$L312
; Line 387
	sub	eax, eax
	jmp	$L274
; Line 397
$L312:
	cmp	DWORD PTR _yychar, 0
	je	$L313
; Line 398
	mov	DWORD PTR _yychar, -2			; fffffffeH
; Line 400
$L313:
	add	DWORD PTR _yyvsp$[ebp], 8
	mov	eax, DWORD PTR _yylval
	mov	ecx, DWORD PTR _yylval+4
	mov	edx, DWORD PTR _yyvsp$[ebp]
	mov	DWORD PTR [edx], eax
	mov	DWORD PTR [edx+4], ecx
; Line 406
	cmp	DWORD PTR _yyerrstatus$[ebp], 0
	je	$L314
	dec	DWORD PTR _yyerrstatus$[ebp]
; Line 408
$L314:
	mov	eax, DWORD PTR _yyn$[ebp]
	mov	DWORD PTR _yystate$[ebp], eax
; Line 409
	jmp	$yynewstate$288
; Line 412
$yydefault$300:
; Line 414
	mov	eax, DWORD PTR _yystate$[ebp]
	movsx	eax, WORD PTR _yydefact$S253[eax*2]
	mov	DWORD PTR _yyn$[ebp], eax
; Line 415
	cmp	DWORD PTR _yyn$[ebp], 0
	jne	$L315
; Line 416
	jmp	$yyerrlab$308
; Line 419
$L315:
$yyreduce$309:
; Line 420
	mov	eax, DWORD PTR _yyn$[ebp]
	movsx	eax, WORD PTR _yyr2$S252[eax*2]
	mov	DWORD PTR _yylen$[ebp], eax
; Line 421
	mov	eax, 1
	sub	eax, DWORD PTR _yylen$[ebp]
	shl	eax, 3
	add	eax, DWORD PTR _yyvsp$[ebp]
	mov	ecx, DWORD PTR [eax]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _yyval$[ebp], ecx
	mov	DWORD PTR _yyval$[ebp+4], eax
; Line 439
	mov	eax, DWORD PTR _yyn$[ebp]
	mov	DWORD PTR -2064+[ebp], eax
	jmp	$L316
; Line 441
$L320:
; File ./cexp.y
; Line 75
	mov	eax, DWORD PTR _yyvsp$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _expression_value, eax
; Line 76
	jmp	$L317
; Line 77
$L321:
; Line 81
	mov	eax, DWORD PTR _yyvsp$[ebp]
	mov	ecx, DWORD PTR [eax]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _yyval$[ebp], ecx
	mov	DWORD PTR _yyval$[ebp+4], eax
; Line 82
	jmp	$L317
; Line 83
$L322:
; Line 86
	mov	eax, DWORD PTR _yyvsp$[ebp]
	mov	eax, DWORD PTR [eax]
	neg	eax
	mov	DWORD PTR _yyval$[ebp], eax
; Line 87
	mov	eax, DWORD PTR _yyvsp$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _yyval$[ebp+4], eax
; Line 88
	jmp	$L317
; Line 89
$L323:
	mov	eax, DWORD PTR _yyvsp$[ebp]
	cmp	DWORD PTR [eax], 1
	sbb	eax, eax
	neg	eax
	mov	DWORD PTR _yyval$[ebp], eax
; Line 90
	mov	DWORD PTR _yyval$[ebp+4], 0
; Line 91
	jmp	$L317
; Line 92
$L324:
	mov	eax, DWORD PTR _yyvsp$[ebp]
	mov	ecx, DWORD PTR [eax]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _yyval$[ebp], ecx
	mov	DWORD PTR _yyval$[ebp+4], eax
; Line 93
	jmp	$L317
; Line 94
$L325:
	mov	eax, DWORD PTR _yyvsp$[ebp]
	mov	eax, DWORD PTR [eax]
	not	eax
	mov	DWORD PTR _yyval$[ebp], eax
; Line 95
	mov	eax, DWORD PTR _yyvsp$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _yyval$[ebp+4], eax
; Line 96
	jmp	$L317
; Line 97
$L326:
	mov	eax, DWORD PTR _yyvsp$[ebp]
	sub	eax, 8
	mov	ecx, DWORD PTR [eax]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _yyval$[ebp], ecx
	mov	DWORD PTR _yyval$[ebp+4], eax
; Line 98
	jmp	$L317
; Line 99
$L327:
; Line 102
	mov	eax, DWORD PTR _yyvsp$[ebp]
	cmp	DWORD PTR [eax-12], 0
	jne	$L548
	mov	eax, DWORD PTR _yyvsp$[ebp]
	cmp	DWORD PTR [eax+4], 0
	je	$L546
$L548:
	mov	DWORD PTR _yyval$[ebp+4], 1
	jmp	$L547
$L546:
	mov	DWORD PTR _yyval$[ebp+4], 0
$L547:
; Line 103
	cmp	DWORD PTR _yyval$[ebp+4], 0
	je	$L328
; Line 104
	mov	eax, DWORD PTR _yyvsp$[ebp]
	mov	eax, DWORD PTR [eax-16]
	mov	ecx, DWORD PTR _yyvsp$[ebp]
	imul	eax, DWORD PTR [ecx]
	mov	DWORD PTR _yyval$[ebp], eax
; Line 105
	jmp	$L329
$L328:
; Line 106
	mov	eax, DWORD PTR _yyvsp$[ebp]
	mov	eax, DWORD PTR [eax-16]
	mov	ecx, DWORD PTR _yyvsp$[ebp]
	imul	eax, DWORD PTR [ecx]
	mov	DWORD PTR _yyval$[ebp], eax
$L329:
; Line 107
	jmp	$L317
; Line 108
$L330:
	mov	eax, DWORD PTR _yyvsp$[ebp]
	cmp	DWORD PTR [eax], 0
	jne	$L331
; Line 110
	push	OFFSET $SG333
	call	_error
	add	esp, 4
; Line 111
	mov	eax, DWORD PTR _yyvsp$[ebp]
	mov	DWORD PTR [eax], 1
; Line 113
$L331:
	mov	eax, DWORD PTR _yyvsp$[ebp]
	cmp	DWORD PTR [eax-12], 0
	jne	$L551
	mov	eax, DWORD PTR _yyvsp$[ebp]
	cmp	DWORD PTR [eax+4], 0
	je	$L549
$L551:
	mov	DWORD PTR _yyval$[ebp+4], 1
	jmp	$L550
$L549:
	mov	DWORD PTR _yyval$[ebp+4], 0
$L550:
; Line 114
	cmp	DWORD PTR _yyval$[ebp+4], 0
	je	$L334
; Line 115
	mov	eax, DWORD PTR _yyvsp$[ebp]
	mov	ecx, DWORD PTR _yyvsp$[ebp]
	mov	eax, DWORD PTR [eax-16]
	sub	edx, edx
	div	DWORD PTR [ecx]
	mov	DWORD PTR _yyval$[ebp], eax
; Line 116
	jmp	$L335
$L334:
; Line 117
	mov	eax, DWORD PTR _yyvsp$[ebp]
	mov	ecx, DWORD PTR _yyvsp$[ebp]
	mov	eax, DWORD PTR [eax-16]
	cdq
	idiv	DWORD PTR [ecx]
	mov	DWORD PTR _yyval$[ebp], eax
$L335:
; Line 118
	jmp	$L317
; Line 119
$L336:
	mov	eax, DWORD PTR _yyvsp$[ebp]
	cmp	DWORD PTR [eax], 0
	jne	$L337
; Line 121
	push	OFFSET $SG338
	call	_error
	add	esp, 4
; Line 122
	mov	eax, DWORD PTR _yyvsp$[ebp]
	mov	DWORD PTR [eax], 1
; Line 124
$L337:
	mov	eax, DWORD PTR _yyvsp$[ebp]
	cmp	DWORD PTR [eax-12], 0
	jne	$L554
	mov	eax, DWORD PTR _yyvsp$[ebp]
	cmp	DWORD PTR [eax+4], 0
	je	$L552
$L554:
	mov	DWORD PTR _yyval$[ebp+4], 1
	jmp	$L553
$L552:
	mov	DWORD PTR _yyval$[ebp+4], 0
$L553:
; Line 125
	cmp	DWORD PTR _yyval$[ebp+4], 0
	je	$L339
; Line 126
	mov	eax, DWORD PTR _yyvsp$[ebp]
	mov	ecx, DWORD PTR _yyvsp$[ebp]
	mov	eax, DWORD PTR [eax-16]
	sub	edx, edx
	div	DWORD PTR [ecx]
	mov	DWORD PTR _yyval$[ebp], edx
; Line 127
	jmp	$L340
$L339:
; Line 128
	mov	eax, DWORD PTR _yyvsp$[ebp]
	mov	ecx, DWORD PTR _yyvsp$[ebp]
	mov	eax, DWORD PTR [eax-16]
	cdq
	idiv	DWORD PTR [ecx]
	mov	DWORD PTR _yyval$[ebp], edx
$L340:
; Line 129
	jmp	$L317
; Line 130
$L341:
	mov	eax, DWORD PTR _yyvsp$[ebp]
	mov	eax, DWORD PTR [eax-16]
	mov	ecx, DWORD PTR _yyvsp$[ebp]
	add	eax, DWORD PTR [ecx]
	mov	DWORD PTR _yyval$[ebp], eax
; Line 131
	mov	eax, DWORD PTR _yyvsp$[ebp]
	cmp	DWORD PTR [eax-12], 0
	jne	$L557
	mov	eax, DWORD PTR _yyvsp$[ebp]
	cmp	DWORD PTR [eax+4], 0
	je	$L555
$L557:
	mov	DWORD PTR _yyval$[ebp+4], 1
	jmp	$L556
$L555:
	mov	DWORD PTR _yyval$[ebp+4], 0
$L556:
; Line 132
	jmp	$L317
; Line 133
$L342:
	mov	eax, DWORD PTR _yyvsp$[ebp]
	mov	eax, DWORD PTR [eax-16]
	mov	ecx, DWORD PTR _yyvsp$[ebp]
	sub	eax, DWORD PTR [ecx]
	mov	DWORD PTR _yyval$[ebp], eax
; Line 134
	mov	eax, DWORD PTR _yyvsp$[ebp]
	cmp	DWORD PTR [eax-12], 0
	jne	$L560
	mov	eax, DWORD PTR _yyvsp$[ebp]
	cmp	DWORD PTR [eax+4], 0
	je	$L558
$L560:
	mov	DWORD PTR _yyval$[ebp+4], 1
	jmp	$L559
$L558:
	mov	DWORD PTR _yyval$[ebp+4], 0
$L559:
; Line 135
	jmp	$L317
; Line 136
$L343:
	mov	eax, DWORD PTR _yyvsp$[ebp]
	mov	eax, DWORD PTR [eax-12]
	mov	DWORD PTR _yyval$[ebp+4], eax
; Line 137
	cmp	DWORD PTR _yyval$[ebp+4], 0
	je	$L344
; Line 138
	mov	eax, DWORD PTR _yyvsp$[ebp]
	mov	eax, DWORD PTR [eax-16]
	mov	ecx, DWORD PTR _yyvsp$[ebp]
	mov	cl, BYTE PTR [ecx]
	shl	eax, cl
	mov	DWORD PTR _yyval$[ebp], eax
; Line 139
	jmp	$L345
$L344:
; Line 140
	mov	eax, DWORD PTR _yyvsp$[ebp]
	mov	eax, DWORD PTR [eax-16]
	mov	ecx, DWORD PTR _yyvsp$[ebp]
	mov	cl, BYTE PTR [ecx]
	shl	eax, cl
	mov	DWORD PTR _yyval$[ebp], eax
$L345:
; Line 141
	jmp	$L317
; Line 142
$L346:
	mov	eax, DWORD PTR _yyvsp$[ebp]
	mov	eax, DWORD PTR [eax-12]
	mov	DWORD PTR _yyval$[ebp+4], eax
; Line 143
	cmp	DWORD PTR _yyval$[ebp+4], 0
	je	$L347
; Line 144
	mov	eax, DWORD PTR _yyvsp$[ebp]
	mov	eax, DWORD PTR [eax-16]
	mov	ecx, DWORD PTR _yyvsp$[ebp]
	mov	cl, BYTE PTR [ecx]
	shr	eax, cl
	mov	DWORD PTR _yyval$[ebp], eax
; Line 145
	jmp	$L348
$L347:
; Line 146
	mov	eax, DWORD PTR _yyvsp$[ebp]
	mov	eax, DWORD PTR [eax-16]
	mov	ecx, DWORD PTR _yyvsp$[ebp]
	mov	cl, BYTE PTR [ecx]
	sar	eax, cl
	mov	DWORD PTR _yyval$[ebp], eax
$L348:
; Line 147
	jmp	$L317
; Line 148
$L349:
	mov	eax, DWORD PTR _yyvsp$[ebp]
	mov	eax, DWORD PTR [eax-16]
	mov	ecx, DWORD PTR _yyvsp$[ebp]
	sub	eax, DWORD PTR [ecx]
	cmp	eax, 1
	sbb	eax, eax
	neg	eax
	mov	DWORD PTR _yyval$[ebp], eax
; Line 149
	mov	DWORD PTR _yyval$[ebp+4], 0
; Line 150
	jmp	$L317
; Line 151
$L350:
	mov	eax, DWORD PTR _yyvsp$[ebp]
	mov	eax, DWORD PTR [eax-16]
	mov	ecx, DWORD PTR _yyvsp$[ebp]
	sub	eax, DWORD PTR [ecx]
	cmp	eax, 1
	sbb	eax, eax
	inc	eax
	mov	DWORD PTR _yyval$[ebp], eax
; Line 152
	mov	DWORD PTR _yyval$[ebp+4], 0
; Line 153
	jmp	$L317
; Line 154
$L351:
	mov	DWORD PTR _yyval$[ebp+4], 0
; Line 155
	mov	eax, DWORD PTR _yyvsp$[ebp]
	cmp	DWORD PTR [eax-12], 0
	jne	$L353
	mov	eax, DWORD PTR _yyvsp$[ebp]
	cmp	DWORD PTR [eax+4], 0
	je	$L352
$L353:
; Line 156
	mov	eax, DWORD PTR _yyvsp$[ebp]
	mov	ecx, DWORD PTR _yyvsp$[ebp]
	mov	ecx, DWORD PTR [ecx]
	cmp	DWORD PTR [eax-16], ecx
	mov	eax, 0
	setbe	al
	mov	DWORD PTR _yyval$[ebp], eax
; Line 157
	jmp	$L354
$L352:
; Line 158
	mov	eax, DWORD PTR _yyvsp$[ebp]
	mov	ecx, DWORD PTR _yyvsp$[ebp]
	mov	ecx, DWORD PTR [ecx]
	cmp	DWORD PTR [eax-16], ecx
	mov	eax, 0
	setle	al
	mov	DWORD PTR _yyval$[ebp], eax
$L354:
; Line 159
	jmp	$L317
; Line 160
$L355:
	mov	DWORD PTR _yyval$[ebp+4], 0
; Line 161
	mov	eax, DWORD PTR _yyvsp$[ebp]
	cmp	DWORD PTR [eax-12], 0
	jne	$L357
	mov	eax, DWORD PTR _yyvsp$[ebp]
	cmp	DWORD PTR [eax+4], 0
	je	$L356
$L357:
; Line 162
	mov	eax, DWORD PTR _yyvsp$[ebp]
	mov	ecx, DWORD PTR _yyvsp$[ebp]
	mov	ecx, DWORD PTR [ecx]
	cmp	DWORD PTR [eax-16], ecx
	mov	eax, 0
	setae	al
	mov	DWORD PTR _yyval$[ebp], eax
; Line 163
	jmp	$L358
$L356:
; Line 164
	mov	eax, DWORD PTR _yyvsp$[ebp]
	mov	ecx, DWORD PTR _yyvsp$[ebp]
	mov	ecx, DWORD PTR [ecx]
	cmp	DWORD PTR [eax-16], ecx
	mov	eax, 0
	setge	al
	mov	DWORD PTR _yyval$[ebp], eax
$L358:
; Line 165
	jmp	$L317
; Line 166
$L359:
	mov	DWORD PTR _yyval$[ebp+4], 0
; Line 167
	mov	eax, DWORD PTR _yyvsp$[ebp]
	cmp	DWORD PTR [eax-12], 0
	jne	$L361
	mov	eax, DWORD PTR _yyvsp$[ebp]
	cmp	DWORD PTR [eax+4], 0
	je	$L360
$L361:
; Line 168
	mov	eax, DWORD PTR _yyvsp$[ebp]
	mov	ecx, DWORD PTR _yyvsp$[ebp]
	mov	ecx, DWORD PTR [ecx]
	cmp	DWORD PTR [eax-16], ecx
	mov	eax, 0
	setb	al
	mov	DWORD PTR _yyval$[ebp], eax
; Line 169
	jmp	$L362
$L360:
; Line 170
	mov	eax, DWORD PTR _yyvsp$[ebp]
	mov	ecx, DWORD PTR _yyvsp$[ebp]
	mov	ecx, DWORD PTR [ecx]
	cmp	DWORD PTR [eax-16], ecx
	mov	eax, 0
	setl	al
	mov	DWORD PTR _yyval$[ebp], eax
$L362:
; Line 171
	jmp	$L317
; Line 172
$L363:
	mov	DWORD PTR _yyval$[ebp+4], 0
; Line 173
	mov	eax, DWORD PTR _yyvsp$[ebp]
	cmp	DWORD PTR [eax-12], 0
	jne	$L365
	mov	eax, DWORD PTR _yyvsp$[ebp]
	cmp	DWORD PTR [eax+4], 0
	je	$L364
$L365:
; Line 174
	mov	eax, DWORD PTR _yyvsp$[ebp]
	mov	ecx, DWORD PTR _yyvsp$[ebp]
	mov	ecx, DWORD PTR [ecx]
	cmp	DWORD PTR [eax-16], ecx
	mov	eax, 0
	seta	al
	mov	DWORD PTR _yyval$[ebp], eax
; Line 175
	jmp	$L366
$L364:
; Line 176
	mov	eax, DWORD PTR _yyvsp$[ebp]
	mov	ecx, DWORD PTR _yyvsp$[ebp]
	mov	ecx, DWORD PTR [ecx]
	cmp	DWORD PTR [eax-16], ecx
	mov	eax, 0
	setg	al
	mov	DWORD PTR _yyval$[ebp], eax
$L366:
; Line 177
	jmp	$L317
; Line 178
$L367:
	mov	eax, DWORD PTR _yyvsp$[ebp]
	mov	eax, DWORD PTR [eax-16]
	mov	ecx, DWORD PTR _yyvsp$[ebp]
	and	eax, DWORD PTR [ecx]
	mov	DWORD PTR _yyval$[ebp], eax
; Line 179
	mov	eax, DWORD PTR _yyvsp$[ebp]
	cmp	DWORD PTR [eax-12], 0
	jne	$L563
	mov	eax, DWORD PTR _yyvsp$[ebp]
	cmp	DWORD PTR [eax+4], 0
	je	$L561
$L563:
	mov	DWORD PTR _yyval$[ebp+4], 1
	jmp	$L562
$L561:
	mov	DWORD PTR _yyval$[ebp+4], 0
$L562:
; Line 180
	jmp	$L317
; Line 181
$L368:
	mov	eax, DWORD PTR _yyvsp$[ebp]
	mov	eax, DWORD PTR [eax-16]
	mov	ecx, DWORD PTR _yyvsp$[ebp]
	xor	eax, DWORD PTR [ecx]
	mov	DWORD PTR _yyval$[ebp], eax
; Line 182
	mov	eax, DWORD PTR _yyvsp$[ebp]
	cmp	DWORD PTR [eax-12], 0
	jne	$L566
	mov	eax, DWORD PTR _yyvsp$[ebp]
	cmp	DWORD PTR [eax+4], 0
	je	$L564
$L566:
	mov	DWORD PTR _yyval$[ebp+4], 1
	jmp	$L565
$L564:
	mov	DWORD PTR _yyval$[ebp+4], 0
$L565:
; Line 183
	jmp	$L317
; Line 184
$L369:
	mov	eax, DWORD PTR _yyvsp$[ebp]
	mov	eax, DWORD PTR [eax-16]
	mov	ecx, DWORD PTR _yyvsp$[ebp]
	or	eax, DWORD PTR [ecx]
	mov	DWORD PTR _yyval$[ebp], eax
; Line 185
	mov	eax, DWORD PTR _yyvsp$[ebp]
	cmp	DWORD PTR [eax-12], 0
	jne	$L569
	mov	eax, DWORD PTR _yyvsp$[ebp]
	cmp	DWORD PTR [eax+4], 0
	je	$L567
$L569:
	mov	DWORD PTR _yyval$[ebp+4], 1
	jmp	$L568
$L567:
	mov	DWORD PTR _yyval$[ebp+4], 0
$L568:
; Line 186
	jmp	$L317
; Line 187
$L370:
	mov	eax, DWORD PTR _yyvsp$[ebp]
	cmp	DWORD PTR [eax-16], 0
	je	$L570
	mov	eax, DWORD PTR _yyvsp$[ebp]
	cmp	DWORD PTR [eax], 0
	je	$L570
	mov	DWORD PTR _yyval$[ebp], 1
	jmp	$L571
$L570:
	mov	DWORD PTR _yyval$[ebp], 0
$L571:
; Line 188
	mov	DWORD PTR _yyval$[ebp+4], 0
; Line 189
	jmp	$L317
; Line 190
$L371:
	mov	eax, DWORD PTR _yyvsp$[ebp]
	cmp	DWORD PTR [eax-16], 0
	jne	$L574
	mov	eax, DWORD PTR _yyvsp$[ebp]
	cmp	DWORD PTR [eax], 0
	je	$L572
$L574:
	mov	DWORD PTR _yyval$[ebp], 1
	jmp	$L573
$L572:
	mov	DWORD PTR _yyval$[ebp], 0
$L573:
; Line 191
	mov	DWORD PTR _yyval$[ebp+4], 0
; Line 192
	jmp	$L317
; Line 193
$L372:
	mov	eax, DWORD PTR _yyvsp$[ebp]
	cmp	DWORD PTR [eax-32], 0
	je	$L575
	mov	eax, DWORD PTR _yyvsp$[ebp]
	mov	eax, DWORD PTR [eax-16]
	mov	DWORD PTR _yyval$[ebp], eax
	jmp	$L576
$L575:
	mov	eax, DWORD PTR _yyvsp$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _yyval$[ebp], eax
$L576:
; Line 194
	mov	eax, DWORD PTR _yyvsp$[ebp]
	cmp	DWORD PTR [eax-12], 0
	jne	$L579
	mov	eax, DWORD PTR _yyvsp$[ebp]
	cmp	DWORD PTR [eax+4], 0
	je	$L577
$L579:
	mov	DWORD PTR _yyval$[ebp+4], 1
	jmp	$L578
$L577:
	mov	DWORD PTR _yyval$[ebp+4], 0
$L578:
; Line 195
	jmp	$L317
; Line 196
$L373:
	mov	eax, DWORD PTR _yylval
	mov	ecx, DWORD PTR _yylval+4
	mov	DWORD PTR _yyval$[ebp], eax
	mov	DWORD PTR _yyval$[ebp+4], ecx
; Line 197
	jmp	$L317
; Line 198
$L374:
	mov	eax, DWORD PTR _yylval
	mov	ecx, DWORD PTR _yylval+4
	mov	DWORD PTR _yyval$[ebp], eax
	mov	DWORD PTR _yyval$[ebp+4], ecx
; Line 199
	jmp	$L317
; Line 200
$L375:
	mov	DWORD PTR _yyval$[ebp], 0
; Line 201
	mov	DWORD PTR _yyval$[ebp+4], 0
; Line 202
	jmp	$L317
; Line 203
	jmp	$L317
$L316:
	dec	DWORD PTR -2064+[ebp]
	cmp	DWORD PTR -2064+[ebp], 29		; 0000001dH
	ja	$L317
	shl	DWORD PTR -2064+[ebp], 2
	mov	eax, DWORD PTR -2064+[ebp]
	jmp	DWORD PTR $L580[eax]
$L580:
	DD	OFFSET $L320
	DD	OFFSET $L317
	DD	OFFSET $L321
	DD	OFFSET $L322
	DD	OFFSET $L323
	DD	OFFSET $L324
	DD	OFFSET $L325
	DD	OFFSET $L326
	DD	OFFSET $L327
	DD	OFFSET $L330
	DD	OFFSET $L336
	DD	OFFSET $L341
	DD	OFFSET $L342
	DD	OFFSET $L343
	DD	OFFSET $L346
	DD	OFFSET $L349
	DD	OFFSET $L350
	DD	OFFSET $L351
	DD	OFFSET $L355
	DD	OFFSET $L359
	DD	OFFSET $L363
	DD	OFFSET $L367
	DD	OFFSET $L368
	DD	OFFSET $L369
	DD	OFFSET $L370
	DD	OFFSET $L371
	DD	OFFSET $L372
	DD	OFFSET $L373
	DD	OFFSET $L374
	DD	OFFSET $L375
$L317:
; File bison.simple
; Line 441
	sub	eax, eax
	mov	ecx, DWORD PTR _yylen$[ebp]
	shl	ecx, 3
	sub	eax, ecx
	neg	eax
	sub	DWORD PTR _yyvsp$[ebp], eax
; Line 442
	sub	eax, eax
	mov	ecx, DWORD PTR _yylen$[ebp]
	add	ecx, ecx
	sub	eax, ecx
	neg	eax
	sub	DWORD PTR _yyssp$[ebp], eax
; Line 458
	add	DWORD PTR _yyvsp$[ebp], 8
	mov	eax, DWORD PTR _yyval$[ebp]
	mov	ecx, DWORD PTR _yyval$[ebp+4]
	mov	edx, DWORD PTR _yyvsp$[ebp]
	mov	DWORD PTR [edx], eax
	mov	DWORD PTR [edx+4], ecx
; Line 482
	mov	eax, DWORD PTR _yyn$[ebp]
	movsx	eax, WORD PTR _yyr1$S251[eax*2]
	mov	DWORD PTR _yyn$[ebp], eax
; Line 484
	mov	eax, DWORD PTR _yyn$[ebp]
	movsx	eax, WORD PTR _yypgoto$S256[eax*2-66]
	mov	ecx, DWORD PTR _yyssp$[ebp]
	movsx	ecx, WORD PTR [ecx]
	add	eax, ecx
	mov	DWORD PTR _yystate$[ebp], eax
; Line 485
	cmp	DWORD PTR _yystate$[ebp], 0
	jl	$L376
	cmp	DWORD PTR _yystate$[ebp], 181		; 000000b5H
	jg	$L376
	mov	eax, DWORD PTR _yystate$[ebp]
	movsx	eax, WORD PTR _yycheck$S258[eax*2]
	mov	ecx, DWORD PTR _yyssp$[ebp]
	movsx	ecx, WORD PTR [ecx]
	cmp	eax, ecx
	jne	$L376
; Line 486
	mov	eax, DWORD PTR _yystate$[ebp]
	movsx	eax, WORD PTR _yytable$S257[eax*2]
	mov	DWORD PTR _yystate$[ebp], eax
; Line 487
	jmp	$L377
$L376:
; Line 488
	mov	eax, DWORD PTR _yyn$[ebp]
	movsx	eax, WORD PTR _yydefgoto$S254[eax*2-66]
	mov	DWORD PTR _yystate$[ebp], eax
$L377:
; Line 490
	jmp	$yynewstate$288
; Line 492
$yyerrlab$308:
; Line 494
	cmp	DWORD PTR _yyerrstatus$[ebp], 0
	jne	$L378
; Line 497
	inc	DWORD PTR _yynerrs
; Line 532
	push	OFFSET $SG379
	call	_yyerror
	add	esp, 4
; Line 535
$L378:
$yyerrlab1$380:
; Line 537
	cmp	DWORD PTR _yyerrstatus$[ebp], 3
	jne	$L381
; Line 542
	cmp	DWORD PTR _yychar, 0
	jne	$L382
; Line 543
	mov	eax, 1
	jmp	$L274
; Line 550
$L382:
	mov	DWORD PTR _yychar, -2			; fffffffeH
; Line 556
$L381:
	mov	DWORD PTR _yyerrstatus$[ebp], 3
; Line 558
	jmp	$yyerrhandle$383
; Line 560
$yyerrdefault$384:
; Line 569
$yyerrpop$385:
; Line 571
	mov	eax, DWORD PTR _yyssp$[ebp]
	cmp	DWORD PTR _yyss$[ebp], eax
	jne	$L386
	mov	eax, 1
	jmp	$L274
; Line 572
$L386:
	sub	DWORD PTR _yyvsp$[ebp], 8
; Line 573
	sub	DWORD PTR _yyssp$[ebp], 2
	mov	eax, DWORD PTR _yyssp$[ebp]
	movsx	eax, WORD PTR [eax]
	mov	DWORD PTR _yystate$[ebp], eax
; Line 589
$yyerrhandle$383:
; Line 591
	mov	eax, DWORD PTR _yystate$[ebp]
	movsx	eax, WORD PTR _yypact$S255[eax*2]
	mov	DWORD PTR _yyn$[ebp], eax
; Line 592
	cmp	DWORD PTR _yyn$[ebp], -32768		; ffff8000H
	jne	$L387
; Line 593
	jmp	$yyerrdefault$384
; Line 595
$L387:
	inc	DWORD PTR _yyn$[ebp]
; Line 596
	js	$L389
	cmp	DWORD PTR _yyn$[ebp], 181		; 000000b5H
	jg	$L389
	mov	eax, DWORD PTR _yyn$[ebp]
	movsx	eax, WORD PTR _yycheck$S258[eax*2]
	cmp	eax, 1
	je	$L388
$L389:
; Line 597
	jmp	$yyerrdefault$384
; Line 599
$L388:
	mov	eax, DWORD PTR _yyn$[ebp]
	movsx	eax, WORD PTR _yytable$S257[eax*2]
	mov	DWORD PTR _yyn$[ebp], eax
; Line 600
	cmp	DWORD PTR _yyn$[ebp], 0
	jge	$L390
; Line 602
	cmp	DWORD PTR _yyn$[ebp], -32768		; ffff8000H
	jne	$L391
; Line 603
	jmp	$yyerrpop$385
; Line 604
$L391:
	mov	eax, DWORD PTR _yyn$[ebp]
	neg	eax
	mov	DWORD PTR _yyn$[ebp], eax
; Line 605
	jmp	$yyreduce$309
; Line 607
	jmp	$L392
$L390:
	cmp	DWORD PTR _yyn$[ebp], 0
	jne	$L393
; Line 608
	jmp	$yyerrpop$385
; Line 610
$L393:
$L392:
	cmp	DWORD PTR _yyn$[ebp], 61		; 0000003dH
	jne	$L394
; Line 611
	sub	eax, eax
	jmp	$L274
; Line 618
$L394:
	add	DWORD PTR _yyvsp$[ebp], 8
	mov	eax, DWORD PTR _yylval
	mov	ecx, DWORD PTR _yylval+4
	mov	edx, DWORD PTR _yyvsp$[ebp]
	mov	DWORD PTR [edx], eax
	mov	DWORD PTR [edx+4], ecx
; Line 623
	mov	eax, DWORD PTR _yyn$[ebp]
	mov	DWORD PTR _yystate$[ebp], eax
; Line 624
	jmp	$yynewstate$288
; Line 625
$L274:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_yyparse ENDP
_TEXT	ENDS
PUBLIC	_parse_number
EXTRN	_strncmp:NEAR
_BSS	SEGMENT
_lexptr$S395 DD	01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
$SG408	DB	'floating point numbers not allowed in #if expressions', 00H
	ORG $+2
$SG412	DB	'0x', 00H
	ORG $+1
$SG413	DB	'0X', 00H
	ORG $+1
$SG435	DB	'Invalid number in #if expression', 00H
_DATA	ENDS
_TEXT	SEGMENT
; File ./cexp.y
_olen$ = 8
_p$ = -12
_n$ = -20
_c$ = -4
_base$ = -16
_len$ = -8
_parse_number PROC NEAR
; Line 219
	push	ebp
	mov	ebp, esp
	sub	esp, 20					; 00000014H
	push	ebx
	push	esi
	push	edi
; Line 220
	mov	eax, DWORD PTR _lexptr$S395
	mov	DWORD PTR _p$[ebp], eax
; Line 221
	mov	DWORD PTR _n$[ebp], 0
; Line 223
	mov	DWORD PTR _base$[ebp], 10		; 0000000aH
; Line 224
	mov	eax, DWORD PTR _olen$[ebp]
	mov	DWORD PTR _len$[ebp], eax
; Line 226
	mov	DWORD PTR _c$[ebp], 0
	jmp	$L404
$L405:
	inc	DWORD PTR _c$[ebp]
$L404:
	mov	eax, DWORD PTR _c$[ebp]
	cmp	DWORD PTR _len$[ebp], eax
	jle	$L406
; Line 227
	mov	eax, DWORD PTR _c$[ebp]
	mov	ecx, DWORD PTR _p$[ebp]
	movsx	eax, BYTE PTR [eax+ecx]
	cmp	eax, 46					; 0000002eH
	jne	$L407
; Line 229
	push	OFFSET $SG408
	call	_yyerror
	add	esp, 4
; Line 230
	mov	eax, 261				; 00000105H
	jmp	$L398
; Line 233
$L407:
	jmp	$L405
$L406:
	mov	DWORD PTR _yylval+4, 0
; Line 235
	cmp	DWORD PTR _len$[ebp], 3
	jl	$L410
	push	2
	push	OFFSET $SG412
	mov	eax, DWORD PTR _p$[ebp]
	push	eax
	call	_strncmp
	add	esp, 12					; 0000000cH
	or	eax, eax
	je	$L411
	push	2
	push	OFFSET $SG413
	mov	eax, DWORD PTR _p$[ebp]
	push	eax
	call	_strncmp
	add	esp, 12					; 0000000cH
	or	eax, eax
	jne	$L410
$L411:
; Line 236
	add	DWORD PTR _p$[ebp], 2
; Line 237
	mov	DWORD PTR _base$[ebp], 16		; 00000010H
; Line 238
	sub	DWORD PTR _len$[ebp], 2
; Line 240
	jmp	$L414
$L410:
	mov	eax, DWORD PTR _p$[ebp]
	movsx	eax, BYTE PTR [eax]
	cmp	eax, 48					; 00000030H
	jne	$L415
; Line 241
	mov	DWORD PTR _base$[ebp], 8
; Line 243
$L415:
$L414:
$L417:
	cmp	DWORD PTR _len$[ebp], 0
	jle	$L418
; Line 244
	mov	eax, DWORD PTR _p$[ebp]
	movsx	eax, BYTE PTR [eax]
	mov	DWORD PTR _c$[ebp], eax
	inc	DWORD PTR _p$[ebp]
; Line 245
	dec	DWORD PTR _len$[ebp]
; Line 246
	cmp	DWORD PTR _c$[ebp], 65			; 00000041H
	jl	$L419
	cmp	DWORD PTR _c$[ebp], 90			; 0000005aH
	jg	$L419
	add	DWORD PTR _c$[ebp], 32			; 00000020H
; Line 248
$L419:
	cmp	DWORD PTR _c$[ebp], 48			; 00000030H
	jl	$L420
	cmp	DWORD PTR _c$[ebp], 57			; 00000039H
	jg	$L420
; Line 249
	mov	eax, DWORD PTR _base$[ebp]
	imul	eax, DWORD PTR _n$[ebp]
	mov	DWORD PTR _n$[ebp], eax
; Line 250
	mov	eax, DWORD PTR _c$[ebp]
	sub	eax, 48					; 00000030H
	add	DWORD PTR _n$[ebp], eax
; Line 251
	jmp	$L421
$L420:
	cmp	DWORD PTR _base$[ebp], 16		; 00000010H
	jne	$L422
	cmp	DWORD PTR _c$[ebp], 97			; 00000061H
	jl	$L422
	cmp	DWORD PTR _c$[ebp], 102			; 00000066H
	jg	$L422
; Line 252
	mov	eax, DWORD PTR _base$[ebp]
	imul	eax, DWORD PTR _n$[ebp]
	mov	DWORD PTR _n$[ebp], eax
; Line 253
	mov	eax, DWORD PTR _c$[ebp]
	sub	eax, 87					; 00000057H
	add	DWORD PTR _n$[ebp], eax
; Line 254
	jmp	$L423
$L422:
; Line 256
$L425:
; Line 257
	cmp	DWORD PTR _c$[ebp], 108			; 0000006cH
	je	$L428
	cmp	DWORD PTR _c$[ebp], 76			; 0000004cH
	jne	$L427
$L428:
; Line 259
	jmp	$L429
$L427:
	cmp	DWORD PTR _c$[ebp], 117			; 00000075H
	je	$L431
	cmp	DWORD PTR _c$[ebp], 85			; 00000055H
	jne	$L430
$L431:
; Line 260
	mov	DWORD PTR _yylval+4, 1
; Line 261
	jmp	$L432
$L430:
; Line 262
	jmp	$L426
$L432:
$L429:
; Line 264
	cmp	DWORD PTR _len$[ebp], 0
	jne	$L433
; Line 265
	jmp	$L426
; Line 266
$L433:
	mov	eax, DWORD PTR _p$[ebp]
	movsx	eax, BYTE PTR [eax]
	mov	DWORD PTR _c$[ebp], eax
	inc	DWORD PTR _p$[ebp]
; Line 267
	dec	DWORD PTR _len$[ebp]
; Line 268
	jmp	$L425
$L426:
; Line 270
	jmp	$L418
; Line 271
$L423:
$L421:
; Line 272
	jmp	$L417
$L418:
; Line 274
	cmp	DWORD PTR _len$[ebp], 0
	je	$L434
; Line 275
	push	OFFSET $SG435
	call	_yyerror
	add	esp, 4
; Line 276
	mov	eax, 261				; 00000105H
	jmp	$L398
; Line 280
$L434:
	cmp	DWORD PTR _n$[ebp], 0
	jge	$L436
; Line 281
	mov	DWORD PTR _yylval+4, 1
; Line 283
$L436:
	mov	eax, DWORD PTR _p$[ebp]
	mov	DWORD PTR _lexptr$S395, eax
; Line 284
	mov	eax, DWORD PTR _n$[ebp]
	mov	DWORD PTR _yylval, eax
; Line 285
	mov	eax, 258				; 00000102H
	jmp	$L398
; Line 286
$L398:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_parse_number ENDP
_TEXT	ENDS
PUBLIC	_parse_escape
EXTRN	_is_idstart:BYTE
EXTRN	_is_idchar:BYTE
EXTRN	_lookup:NEAR
_DATA	SEGMENT
	ORG $+3
$SG469	DB	'__CHAR_UNSIGNED__', 00H
	ORG $+2
$SG472	DB	'Invalid character constant in #if', 00H
	ORG $+2
$SG475	DB	'double quoted strings not allowed in #if expressions', 00H
	ORG $+3
$SG481	DB	'Invalid token in expression', 00H
_DATA	ENDS
_TEXT	SEGMENT
_c$ = -12
_namelen$ = -8
_tokstart$ = -4
_toktab$ = -16
_yylex	PROC NEAR
; Line 313
	push	ebp
	mov	ebp, esp
	sub	esp, 24					; 00000018H
	push	ebx
	push	esi
	push	edi
; Line 319
$retry$452:
; Line 321
	mov	eax, DWORD PTR _lexptr$S395
	mov	DWORD PTR _tokstart$[ebp], eax
; Line 322
	mov	eax, DWORD PTR _tokstart$[ebp]
	movsx	eax, BYTE PTR [eax]
	mov	DWORD PTR _c$[ebp], eax
; Line 324
	mov	DWORD PTR _toktab$[ebp], OFFSET _tokentab2$S438
	jmp	$L453
$L454:
	add	DWORD PTR _toktab$[ebp], 8
$L453:
	mov	eax, DWORD PTR _toktab$[ebp]
	cmp	DWORD PTR [eax], 0
	je	$L455
; Line 325
	mov	eax, DWORD PTR _toktab$[ebp]
	mov	eax, DWORD PTR [eax]
	movsx	eax, BYTE PTR [eax]
	cmp	eax, DWORD PTR _c$[ebp]
	jne	$L456
	mov	eax, DWORD PTR _toktab$[ebp]
	mov	eax, DWORD PTR [eax]
	movsx	eax, BYTE PTR [eax+1]
	mov	ecx, DWORD PTR _tokstart$[ebp]
	movsx	ecx, BYTE PTR [ecx+1]
	cmp	eax, ecx
	jne	$L456
; Line 326
	add	DWORD PTR _lexptr$S395, 2
; Line 327
	mov	eax, DWORD PTR _toktab$[ebp]
	mov	eax, DWORD PTR [eax+4]
	jmp	$L447
; Line 330
$L456:
	jmp	$L454
$L455:
	mov	eax, DWORD PTR _c$[ebp]
	mov	DWORD PTR -24+[ebp], eax
	jmp	$L457
; Line 331
$L461:
; Line 332
	sub	eax, eax
	jmp	$L447
; Line 334
$L462:
; Line 338
	inc	DWORD PTR _lexptr$S395
; Line 339
	jmp	$retry$452
; Line 341
$L463:
; Line 342
	inc	DWORD PTR _lexptr$S395
; Line 343
	mov	eax, DWORD PTR _lexptr$S395
	movsx	eax, BYTE PTR [eax]
	mov	DWORD PTR _c$[ebp], eax
	inc	DWORD PTR _lexptr$S395
; Line 344
	cmp	DWORD PTR _c$[ebp], 92			; 0000005cH
	jne	$L464
; Line 345
	push	OFFSET _lexptr$S395
	call	_parse_escape
	add	esp, 4
	mov	DWORD PTR _c$[ebp], eax
; Line 348
$L464:
; Line 350
	push	-1
	push	17					; 00000011H
	push	OFFSET $SG469
	call	_lookup
	add	esp, 12					; 0000000cH
	or	eax, eax
	jne	$L468
	mov	eax, DWORD PTR _c$[ebp]
	shr	eax, 7
	test	al, 1
	jne	$L467
$L468:
; Line 351
	mov	eax, DWORD PTR _c$[ebp]
	and	eax, 255				; 000000ffH
	mov	DWORD PTR _yylval, eax
; Line 352
	jmp	$L470
$L467:
; Line 353
	mov	eax, DWORD PTR _c$[ebp]
	or	eax, -256				; ffffff00H
	mov	DWORD PTR _yylval, eax
$L470:
; Line 356
	mov	DWORD PTR _yylval+4, 0
; Line 357
	mov	eax, DWORD PTR _lexptr$S395
	movsx	eax, BYTE PTR [eax]
	mov	DWORD PTR _c$[ebp], eax
	inc	DWORD PTR _lexptr$S395
; Line 358
	cmp	DWORD PTR _c$[ebp], 39			; 00000027H
	je	$L471
; Line 359
	push	OFFSET $SG472
	call	_yyerror
	add	esp, 4
; Line 360
	mov	eax, 261				; 00000105H
	jmp	$L447
; Line 363
$L471:
	mov	eax, 259				; 00000103H
	jmp	$L447
; Line 367
$L473:
; Line 391
	inc	DWORD PTR _lexptr$S395
; Line 392
	mov	eax, DWORD PTR _c$[ebp]
	jmp	$L447
; Line 394
$L474:
; Line 395
	push	OFFSET $SG475
	call	_yyerror
	add	esp, 4
; Line 396
	mov	eax, 261				; 00000105H
	jmp	$L447
; Line 397
	jmp	$L458
$L457:
	cmp	DWORD PTR -24+[ebp], 39			; 00000027H
	jg	$L584
	je	$L463
	cmp	DWORD PTR -24+[ebp], 32			; 00000020H
	jg	$L585
	je	$L462
	cmp	DWORD PTR -24+[ebp], 0
	je	$L461
	cmp	DWORD PTR -24+[ebp], 9
	jl	$L458
	cmp	DWORD PTR -24+[ebp], 10			; 0000000aH
	jle	$L462
	cmp	DWORD PTR -24+[ebp], 13			; 0000000dH
	je	$L462
	jmp	$L458
$L585:
	cmp	DWORD PTR -24+[ebp], 33			; 00000021H
	je	$L473
	cmp	DWORD PTR -24+[ebp], 34			; 00000022H
	je	$L474
	cmp	DWORD PTR -24+[ebp], 37			; 00000025H
	jl	$L458
	cmp	DWORD PTR -24+[ebp], 38			; 00000026H
	jle	$L473
	jmp	$L458
$L584:
	cmp	DWORD PTR -24+[ebp], 91			; 0000005bH
	jg	$L586
	je	$L473
	cmp	DWORD PTR -24+[ebp], 40			; 00000028H
	jl	$L458
	cmp	DWORD PTR -24+[ebp], 47			; 0000002fH
	jle	$L473
	cmp	DWORD PTR -24+[ebp], 58			; 0000003aH
	je	$L473
	cmp	DWORD PTR -24+[ebp], 60			; 0000003cH
	jl	$L458
	cmp	DWORD PTR -24+[ebp], 64			; 00000040H
	jle	$L473
	jmp	$L458
$L586:
	cmp	DWORD PTR -24+[ebp], 93			; 0000005dH
	jl	$L458
	cmp	DWORD PTR -24+[ebp], 94			; 0000005eH
	jle	$L473
	cmp	DWORD PTR -24+[ebp], 123		; 0000007bH
	jl	$L458
	cmp	DWORD PTR -24+[ebp], 126		; 0000007eH
	jle	$L473
	jmp	$L458
$L458:
; Line 398
	cmp	DWORD PTR _c$[ebp], 48			; 00000030H
	jl	$L476
	cmp	DWORD PTR _c$[ebp], 57			; 00000039H
	jg	$L476
; Line 402
	mov	DWORD PTR _namelen$[ebp], 0
	jmp	$L477
$L478:
	inc	DWORD PTR _namelen$[ebp]
$L477:
	mov	eax, DWORD PTR _namelen$[ebp]
	mov	ecx, DWORD PTR _tokstart$[ebp]
	movsx	eax, BYTE PTR [eax+ecx]
	mov	DWORD PTR _c$[ebp], eax
	mov	eax, DWORD PTR _c$[ebp]
	mov	al, BYTE PTR _is_idchar[eax]
	and	eax, 255				; 000000ffH
	or	eax, eax
	jne	$L583
	cmp	DWORD PTR _c$[ebp], 46			; 0000002eH
	jne	$L581
$L583:
	mov	DWORD PTR -20+[ebp], 1
	jmp	$L582
$L581:
	mov	DWORD PTR -20+[ebp], 0
$L582:
	cmp	DWORD PTR -20+[ebp], 0
	je	$L479
; Line 403
	jmp	$L478
$L479:
; Line 404
	mov	eax, DWORD PTR _namelen$[ebp]
	push	eax
	call	_parse_number
	add	esp, 4
	jmp	$L447
; Line 407
$L476:
	mov	eax, DWORD PTR _c$[ebp]
	mov	al, BYTE PTR _is_idstart[eax]
	and	eax, 255				; 000000ffH
	or	eax, eax
	jne	$L480
; Line 408
	push	OFFSET $SG481
	call	_yyerror
	add	esp, 4
; Line 409
	mov	eax, 261				; 00000105H
	jmp	$L447
; Line 414
$L480:
	mov	DWORD PTR _namelen$[ebp], 0
	jmp	$L482
$L483:
	inc	DWORD PTR _namelen$[ebp]
$L482:
	mov	eax, DWORD PTR _namelen$[ebp]
	mov	ecx, DWORD PTR _tokstart$[ebp]
	movsx	eax, BYTE PTR [eax+ecx]
	mov	al, BYTE PTR _is_idchar[eax]
	and	eax, 255				; 000000ffH
	or	eax, eax
	je	$L484
; Line 415
	jmp	$L483
$L484:
; Line 417
	mov	eax, DWORD PTR _namelen$[ebp]
	add	DWORD PTR _lexptr$S395, eax
; Line 418
	mov	eax, 260				; 00000104H
	jmp	$L447
; Line 419
$L447:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_yylex	ENDP
_TEXT	ENDS
EXTRN	_warning:NEAR
_DATA	SEGMENT
$SG515	DB	'octal character constant does not fit in a byte', 00H
$SG529	DB	'hex character constant does not fit in a byte', 00H
_DATA	ENDS
_TEXT	SEGMENT
_i$517 = -16
_count$518 = -20
_string_ptr$ = 8
_c$ = -4
_i$506 = -8
_count$507 = -12
_parse_escape PROC NEAR
; Line 439
	push	ebp
	mov	ebp, esp
	sub	esp, 24					; 00000018H
	push	ebx
	push	esi
	push	edi
; Line 440
	mov	eax, DWORD PTR _string_ptr$[ebp]
	mov	eax, DWORD PTR [eax]
	movsx	eax, BYTE PTR [eax]
	mov	DWORD PTR _c$[ebp], eax
	mov	eax, DWORD PTR _string_ptr$[ebp]
	inc	DWORD PTR [eax]
; Line 441
	mov	eax, DWORD PTR _c$[ebp]
	mov	DWORD PTR -24+[ebp], eax
	jmp	$L488
; Line 443
$L492:
; Line 444
	mov	eax, 7
	jmp	$L486
; Line 445
$L493:
; Line 446
	mov	eax, 8
	jmp	$L486
; Line 447
$L494:
; Line 448
	mov	eax, 27					; 0000001bH
	jmp	$L486
; Line 449
$L495:
; Line 450
	mov	eax, 12					; 0000000cH
	jmp	$L486
; Line 451
$L496:
; Line 452
	mov	eax, 10					; 0000000aH
	jmp	$L486
; Line 453
$L497:
; Line 454
	mov	eax, 13					; 0000000dH
	jmp	$L486
; Line 455
$L498:
; Line 456
	mov	eax, 9
	jmp	$L486
; Line 457
$L499:
; Line 458
	mov	eax, 11					; 0000000bH
	jmp	$L486
; Line 459
$L500:
; Line 460
	mov	eax, -2					; fffffffeH
	jmp	$L486
; Line 461
$L501:
; Line 462
	mov	eax, DWORD PTR _string_ptr$[ebp]
	dec	DWORD PTR [eax]
; Line 463
	sub	eax, eax
	jmp	$L486
; Line 464
$L502:
; Line 465
	mov	eax, DWORD PTR _string_ptr$[ebp]
	mov	eax, DWORD PTR [eax]
	movsx	eax, BYTE PTR [eax]
	mov	DWORD PTR _c$[ebp], eax
	mov	eax, DWORD PTR _string_ptr$[ebp]
	inc	DWORD PTR [eax]
; Line 466
	cmp	DWORD PTR _c$[ebp], 92			; 0000005cH
	jne	$L503
; Line 467
	mov	eax, DWORD PTR _string_ptr$[ebp]
	push	eax
	call	_parse_escape
	add	esp, 4
	mov	DWORD PTR _c$[ebp], eax
; Line 468
$L503:
	cmp	DWORD PTR _c$[ebp], 63			; 0000003fH
	jne	$L504
; Line 469
	mov	eax, 127				; 0000007fH
	jmp	$L486
; Line 470
$L504:
	mov	eax, DWORD PTR _c$[ebp]
	and	eax, 128				; 00000080H
	mov	ecx, DWORD PTR _c$[ebp]
	and	ecx, 31					; 0000001fH
	or	eax, ecx
	jmp	$L486
; Line 472
$L505:
; Line 481
	mov	eax, DWORD PTR _c$[ebp]
	sub	eax, 48					; 00000030H
	mov	DWORD PTR _i$506[ebp], eax
; Line 482
	mov	DWORD PTR _count$507[ebp], 0
; Line 483
$L509:
	inc	DWORD PTR _count$507[ebp]
	cmp	DWORD PTR _count$507[ebp], 3
	jge	$L510
; Line 485
	mov	eax, DWORD PTR _string_ptr$[ebp]
	mov	eax, DWORD PTR [eax]
	movsx	eax, BYTE PTR [eax]
	mov	DWORD PTR _c$[ebp], eax
	mov	eax, DWORD PTR _string_ptr$[ebp]
	inc	DWORD PTR [eax]
; Line 486
	cmp	DWORD PTR _c$[ebp], 48			; 00000030H
	jl	$L511
	cmp	DWORD PTR _c$[ebp], 55			; 00000037H
	jg	$L511
; Line 487
	mov	eax, DWORD PTR _i$506[ebp]
	shl	eax, 3
	add	eax, DWORD PTR _c$[ebp]
	sub	eax, 48					; 00000030H
	mov	DWORD PTR _i$506[ebp], eax
; Line 488
	jmp	$L512
$L511:
; Line 490
	mov	eax, DWORD PTR _string_ptr$[ebp]
	dec	DWORD PTR [eax]
; Line 491
	jmp	$L510
; Line 492
$L512:
; Line 493
	jmp	$L509
$L510:
; Line 494
	test	DWORD PTR _i$506[ebp], -256		; ffffff00H
	je	$L513
; Line 496
	and	DWORD PTR _i$506[ebp], 255		; 000000ffH
; Line 497
	push	OFFSET $SG515
	call	_warning
	add	esp, 4
; Line 499
$L513:
	mov	eax, DWORD PTR _i$506[ebp]
	jmp	$L486
; Line 501
$L516:
; Line 503
	mov	DWORD PTR _i$517[ebp], 0
; Line 504
	mov	DWORD PTR _count$518[ebp], 0
; Line 505
$L520:
; Line 507
	mov	eax, DWORD PTR _string_ptr$[ebp]
	mov	eax, DWORD PTR [eax]
	movsx	eax, BYTE PTR [eax]
	mov	DWORD PTR _c$[ebp], eax
	mov	eax, DWORD PTR _string_ptr$[ebp]
	inc	DWORD PTR [eax]
; Line 508
	cmp	DWORD PTR _c$[ebp], 48			; 00000030H
	jl	$L522
	cmp	DWORD PTR _c$[ebp], 57			; 00000039H
	jg	$L522
; Line 509
	mov	eax, DWORD PTR _i$517[ebp]
	shl	eax, 4
	add	eax, DWORD PTR _c$[ebp]
	sub	eax, 48					; 00000030H
	mov	DWORD PTR _i$517[ebp], eax
; Line 510
	jmp	$L523
$L522:
	cmp	DWORD PTR _c$[ebp], 97			; 00000061H
	jl	$L524
	cmp	DWORD PTR _c$[ebp], 102			; 00000066H
	jg	$L524
; Line 511
	mov	eax, DWORD PTR _i$517[ebp]
	shl	eax, 4
	add	eax, DWORD PTR _c$[ebp]
	sub	eax, 87					; 00000057H
	mov	DWORD PTR _i$517[ebp], eax
; Line 512
	jmp	$L525
$L524:
	cmp	DWORD PTR _c$[ebp], 65			; 00000041H
	jl	$L526
	cmp	DWORD PTR _c$[ebp], 70			; 00000046H
	jg	$L526
; Line 513
	mov	eax, DWORD PTR _i$517[ebp]
	shl	eax, 4
	add	eax, DWORD PTR _c$[ebp]
	sub	eax, 55					; 00000037H
	mov	DWORD PTR _i$517[ebp], eax
; Line 514
	jmp	$L527
$L526:
; Line 516
	mov	eax, DWORD PTR _string_ptr$[ebp]
	dec	DWORD PTR [eax]
; Line 517
	jmp	$L521
; Line 518
$L527:
$L525:
$L523:
; Line 519
	jmp	$L520
$L521:
; Line 520
	test	DWORD PTR _i$517[ebp], -256		; ffffff00H
	je	$L528
; Line 522
	and	DWORD PTR _i$517[ebp], 255		; 000000ffH
; Line 523
	push	OFFSET $SG529
	call	_warning
	add	esp, 4
; Line 525
$L528:
	mov	eax, DWORD PTR _i$517[ebp]
	jmp	$L486
; Line 527
$L530:
; Line 528
	mov	eax, DWORD PTR _c$[ebp]
	jmp	$L486
; Line 529
	jmp	$L489
$L488:
	cmp	DWORD PTR -24+[ebp], 101		; 00000065H
	jg	$L587
	je	$L494
	cmp	DWORD PTR -24+[ebp], 94			; 0000005eH
	jg	$L588
	je	$L502
	cmp	DWORD PTR -24+[ebp], 0
	je	$L501
	cmp	DWORD PTR -24+[ebp], 10			; 0000000aH
	je	$L500
	cmp	DWORD PTR -24+[ebp], 48			; 00000030H
	jl	$L530
	cmp	DWORD PTR -24+[ebp], 55			; 00000037H
	jle	$L505
	jmp	$L530
$L588:
	cmp	DWORD PTR -24+[ebp], 97			; 00000061H
	je	$L492
	cmp	DWORD PTR -24+[ebp], 98			; 00000062H
	je	$L493
	jmp	$L530
$L587:
	sub	DWORD PTR -24+[ebp], 102		; 00000066H
	cmp	DWORD PTR -24+[ebp], 18			; 00000012H
	ja	$L530
	shl	DWORD PTR -24+[ebp], 2
	mov	eax, DWORD PTR -24+[ebp]
	jmp	DWORD PTR $L589[eax]
$L589:
	DD	OFFSET $L495
	DD	OFFSET $L530
	DD	OFFSET $L530
	DD	OFFSET $L530
	DD	OFFSET $L530
	DD	OFFSET $L530
	DD	OFFSET $L530
	DD	OFFSET $L530
	DD	OFFSET $L496
	DD	OFFSET $L530
	DD	OFFSET $L530
	DD	OFFSET $L530
	DD	OFFSET $L497
	DD	OFFSET $L530
	DD	OFFSET $L498
	DD	OFFSET $L530
	DD	OFFSET $L499
	DD	OFFSET $L530
	DD	OFFSET $L516
$L489:
; Line 530
$L486:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_parse_escape ENDP
_TEXT	ENDS
EXTRN	_longjmp:NEAR
_BSS	SEGMENT
_parse_return_error$S128 DD 010H DUP (?)
_BSS	ENDS
_TEXT	SEGMENT
_s$ = 8
_yyerror PROC NEAR
; Line 535
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 536
	mov	eax, DWORD PTR _s$[ebp]
	push	eax
	call	_error
	add	esp, 4
; Line 537
	push	1
	push	OFFSET _parse_return_error$S128
	call	_longjmp
	add	esp, 8
; Line 538
$L532:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_yyerror ENDP
_TEXT	ENDS
PUBLIC	_parse_c_expression
EXTRN	__setjmp:NEAR
_DATA	SEGMENT
	ORG $+2
$SG538	DB	'empty #if expression', 00H
	ORG $+3
$SG542	DB	'Junk after end of expression.', 00H
_DATA	ENDS
_TEXT	SEGMENT
_string$ = 8
_parse_c_expression PROC NEAR
; Line 550
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 551
	mov	eax, DWORD PTR _string$[ebp]
	mov	DWORD PTR _lexptr$S395, eax
; Line 553
	cmp	DWORD PTR _lexptr$S395, 0
	je	$L537
	mov	eax, DWORD PTR _lexptr$S395
	movsx	eax, BYTE PTR [eax]
	or	eax, eax
	jne	$L536
$L537:
; Line 554
	push	OFFSET $SG538
	call	_error
	add	esp, 4
; Line 555
	sub	eax, eax
	jmp	$L535
; Line 561
$L536:
	push	OFFSET _parse_return_error$S128
	call	__setjmp
	add	esp, 4
	or	eax, eax
	je	$L539
; Line 562
	sub	eax, eax
	jmp	$L535
; Line 564
$L539:
	call	_yyparse
	or	eax, eax
	je	$L540
; Line 565
	sub	eax, eax
	jmp	$L535
; Line 567
$L540:
	mov	eax, DWORD PTR _lexptr$S395
	movsx	eax, BYTE PTR [eax]
	or	eax, eax
	je	$L541
; Line 568
	push	OFFSET $SG542
	call	_error
	add	esp, 4
; Line 570
$L541:
	mov	eax, DWORD PTR _expression_value
	jmp	$L535
; Line 571
$L535:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_parse_c_expression ENDP
_TEXT	ENDS
END
