	TITLE	insn-rcg.c
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
COMM	_recog_operand:DWORD:07H
COMM	_recog_operand_loc:DWORD:07H
COMM	_recog_dup_loc:DWORD:02H
COMM	_recog_dup_num:BYTE:02H
_DATA	ENDS
PUBLIC	_recog_1
EXTRN	_pc_rtx:DWORD
EXTRN	_cc0_rtx:DWORD
EXTRN	_const0_rtx:DWORD
_TEXT	SEGMENT
; File insn-rcg.c
_x0$ = 8
_x1$ = -44
_x2$ = -20
_x3$ = -40
_recog_1 PROC NEAR
; Line 37
	push	ebp
	mov	ebp, esp
	sub	esp, 52					; 00000034H
	push	ebx
	push	esi
	push	edi
; Line 41
$L539$382:
; Line 42
	mov	eax, DWORD PTR _x0$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _x1$[ebp], eax
; Line 43
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _x2$[ebp], eax
; Line 44
	mov	eax, DWORD PTR _x2$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	sar	eax, 16					; 00000010H
	mov	DWORD PTR -52+[ebp], eax
	jmp	$L383
; Line 46
$L387:
; Line 48
	jmp	$L540$389
; Line 49
$L388:
	jmp	$L384
; Line 50
$L390:
; Line 52
	jmp	$L549$392
; Line 53
$L391:
	jmp	$L384
; Line 54
$L393:
; Line 56
	jmp	$L558$395
; Line 57
$L394:
	jmp	$L384
; Line 58
$L396:
; Line 60
	jmp	$L567$398
; Line 61
$L397:
	jmp	$L384
; Line 62
$L399:
; Line 64
	jmp	$L576$401
; Line 65
$L400:
	jmp	$L384
; Line 66
$L402:
; Line 68
	jmp	$L585$404
; Line 69
$L403:
	jmp	$L384
; Line 70
$L405:
; Line 72
	jmp	$L594$407
; Line 73
$L406:
	jmp	$L384
; Line 74
$L408:
; Line 76
	jmp	$L603$410
; Line 77
$L409:
	jmp	$L384
; Line 78
$L411:
; Line 80
	jmp	$L612$413
; Line 81
$L412:
	jmp	$L384
; Line 82
$L414:
; Line 84
	jmp	$L621$416
; Line 85
$L415:
	jmp	$L384
; Line 86
	jmp	$L384
$L383:
	sub	DWORD PTR -52+[ebp], 67			; 00000043H
	cmp	DWORD PTR -52+[ebp], 9
	ja	$L384
	shl	DWORD PTR -52+[ebp], 2
	mov	eax, DWORD PTR -52+[ebp]
	jmp	DWORD PTR $L1457[eax]
$L1457:
	DD	OFFSET $L390
	DD	OFFSET $L387
	DD	OFFSET $L405
	DD	OFFSET $L393
	DD	OFFSET $L411
	DD	OFFSET $L399
	DD	OFFSET $L408
	DD	OFFSET $L396
	DD	OFFSET $L414
	DD	OFFSET $L402
$L384:
; Line 87
	jmp	$ret0$417
; Line 88
$L540$389:
; Line 89
	mov	eax, DWORD PTR _x2$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _x3$[ebp], eax
; Line 90
	mov	eax, DWORD PTR _cc0_rtx
	cmp	DWORD PTR _x3$[ebp], eax
	jne	$L418
; Line 91
	jmp	$L541$419
; Line 92
$L418:
	jmp	$ret0$417
; Line 93
$L541$419:
; Line 94
	mov	eax, DWORD PTR _x2$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _x3$[ebp], eax
; Line 95
	mov	eax, DWORD PTR _const0_rtx
	cmp	DWORD PTR _x3$[ebp], eax
	jne	$L420
; Line 96
	jmp	$L542$421
; Line 97
$L420:
	jmp	$ret0$417
; Line 98
$L542$421:
; Line 99
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _x2$[ebp], eax
; Line 100
	mov	eax, DWORD PTR _x2$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2490368				; 00260000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L422
; Line 101
	jmp	$L543$423
; Line 102
$L422:
	mov	eax, DWORD PTR _pc_rtx
	cmp	DWORD PTR _x2$[ebp], eax
	jne	$L424
; Line 103
	jmp	$L633$425
; Line 104
$L424:
	jmp	$ret0$417
; Line 105
$L543$423:
; Line 106
	mov	eax, DWORD PTR _x2$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _x3$[ebp], eax
; Line 108
	mov	eax, DWORD PTR _x3$[ebp]
	mov	DWORD PTR _recog_operand, eax
	jmp	$L544$427
; Line 109
$L426:
	jmp	$ret0$417
; Line 110
$L544$427:
; Line 111
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	DWORD PTR _x2$[ebp], eax
; Line 112
	mov	eax, DWORD PTR _pc_rtx
	cmp	DWORD PTR _x2$[ebp], eax
	jne	$L428
; Line 113
	mov	eax, 115				; 00000073H
	jmp	$L369
; Line 114
$L428:
	jmp	$ret0$417
; Line 115
$L633$425:
; Line 116
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	DWORD PTR _x2$[ebp], eax
; Line 117
	mov	eax, DWORD PTR _x2$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2490368				; 00260000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L429
; Line 118
	jmp	$L634$430
; Line 119
$L429:
	jmp	$ret0$417
; Line 120
$L634$430:
; Line 121
	mov	eax, DWORD PTR _x2$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _x3$[ebp], eax
; Line 123
	mov	eax, DWORD PTR _x3$[ebp]
	mov	DWORD PTR _recog_operand, eax
	mov	eax, 127				; 0000007fH
	jmp	$L369
; Line 124
$L431:
	jmp	$ret0$417
; Line 125
$L549$392:
; Line 126
	mov	eax, DWORD PTR _x2$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _x3$[ebp], eax
; Line 127
	mov	eax, DWORD PTR _cc0_rtx
	cmp	DWORD PTR _x3$[ebp], eax
	jne	$L432
; Line 128
	jmp	$L550$433
; Line 129
$L432:
	jmp	$ret0$417
; Line 130
$L550$433:
; Line 131
	mov	eax, DWORD PTR _x2$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _x3$[ebp], eax
; Line 132
	mov	eax, DWORD PTR _const0_rtx
	cmp	DWORD PTR _x3$[ebp], eax
	jne	$L434
; Line 133
	jmp	$L551$435
; Line 134
$L434:
	jmp	$ret0$417
; Line 135
$L551$435:
; Line 136
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _x2$[ebp], eax
; Line 137
	mov	eax, DWORD PTR _x2$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2490368				; 00260000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L436
; Line 138
	jmp	$L552$437
; Line 139
$L436:
	mov	eax, DWORD PTR _pc_rtx
	cmp	DWORD PTR _x2$[ebp], eax
	jne	$L438
; Line 140
	jmp	$L642$439
; Line 141
$L438:
	jmp	$ret0$417
; Line 142
$L552$437:
; Line 143
	mov	eax, DWORD PTR _x2$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _x3$[ebp], eax
; Line 145
	mov	eax, DWORD PTR _x3$[ebp]
	mov	DWORD PTR _recog_operand, eax
	jmp	$L553$441
; Line 146
$L440:
	jmp	$ret0$417
; Line 147
$L553$441:
; Line 148
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	DWORD PTR _x2$[ebp], eax
; Line 149
	mov	eax, DWORD PTR _pc_rtx
	cmp	DWORD PTR _x2$[ebp], eax
	jne	$L442
; Line 150
	mov	eax, 116				; 00000074H
	jmp	$L369
; Line 151
$L442:
	jmp	$ret0$417
; Line 152
$L642$439:
; Line 153
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	DWORD PTR _x2$[ebp], eax
; Line 154
	mov	eax, DWORD PTR _x2$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2490368				; 00260000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L443
; Line 155
	jmp	$L643$444
; Line 156
$L443:
	jmp	$ret0$417
; Line 157
$L643$444:
; Line 158
	mov	eax, DWORD PTR _x2$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _x3$[ebp], eax
; Line 160
	mov	eax, DWORD PTR _x3$[ebp]
	mov	DWORD PTR _recog_operand, eax
	mov	eax, 128				; 00000080H
	jmp	$L369
; Line 161
$L445:
	jmp	$ret0$417
; Line 162
$L558$395:
; Line 163
	mov	eax, DWORD PTR _x2$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _x3$[ebp], eax
; Line 164
	mov	eax, DWORD PTR _cc0_rtx
	cmp	DWORD PTR _x3$[ebp], eax
	jne	$L446
; Line 165
	jmp	$L559$447
; Line 166
$L446:
	jmp	$ret0$417
; Line 167
$L559$447:
; Line 168
	mov	eax, DWORD PTR _x2$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _x3$[ebp], eax
; Line 169
	mov	eax, DWORD PTR _const0_rtx
	cmp	DWORD PTR _x3$[ebp], eax
	jne	$L448
; Line 170
	jmp	$L560$449
; Line 171
$L448:
	jmp	$ret0$417
; Line 172
$L560$449:
; Line 173
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _x2$[ebp], eax
; Line 174
	mov	eax, DWORD PTR _x2$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2490368				; 00260000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L450
; Line 175
	jmp	$L561$451
; Line 176
$L450:
	mov	eax, DWORD PTR _pc_rtx
	cmp	DWORD PTR _x2$[ebp], eax
	jne	$L452
; Line 177
	jmp	$L651$453
; Line 178
$L452:
	jmp	$ret0$417
; Line 179
$L561$451:
; Line 180
	mov	eax, DWORD PTR _x2$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _x3$[ebp], eax
; Line 182
	mov	eax, DWORD PTR _x3$[ebp]
	mov	DWORD PTR _recog_operand, eax
	jmp	$L562$455
; Line 183
$L454:
	jmp	$ret0$417
; Line 184
$L562$455:
; Line 185
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	DWORD PTR _x2$[ebp], eax
; Line 186
	mov	eax, DWORD PTR _pc_rtx
	cmp	DWORD PTR _x2$[ebp], eax
	jne	$L456
; Line 187
	mov	eax, 117				; 00000075H
	jmp	$L369
; Line 188
$L456:
	jmp	$ret0$417
; Line 189
$L651$453:
; Line 190
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	DWORD PTR _x2$[ebp], eax
; Line 191
	mov	eax, DWORD PTR _x2$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2490368				; 00260000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L457
; Line 192
	jmp	$L652$458
; Line 193
$L457:
	jmp	$ret0$417
; Line 194
$L652$458:
; Line 195
	mov	eax, DWORD PTR _x2$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _x3$[ebp], eax
; Line 197
	mov	eax, DWORD PTR _x3$[ebp]
	mov	DWORD PTR _recog_operand, eax
	mov	eax, 129				; 00000081H
	jmp	$L369
; Line 198
$L459:
	jmp	$ret0$417
; Line 199
$L567$398:
; Line 200
	mov	eax, DWORD PTR _x2$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _x3$[ebp], eax
; Line 201
	mov	eax, DWORD PTR _cc0_rtx
	cmp	DWORD PTR _x3$[ebp], eax
	jne	$L460
; Line 202
	jmp	$L568$461
; Line 203
$L460:
	jmp	$ret0$417
; Line 204
$L568$461:
; Line 205
	mov	eax, DWORD PTR _x2$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _x3$[ebp], eax
; Line 206
	mov	eax, DWORD PTR _const0_rtx
	cmp	DWORD PTR _x3$[ebp], eax
	jne	$L462
; Line 207
	jmp	$L569$463
; Line 208
$L462:
	jmp	$ret0$417
; Line 209
$L569$463:
; Line 210
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _x2$[ebp], eax
; Line 211
	mov	eax, DWORD PTR _x2$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2490368				; 00260000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L464
; Line 212
	jmp	$L570$465
; Line 213
$L464:
	mov	eax, DWORD PTR _pc_rtx
	cmp	DWORD PTR _x2$[ebp], eax
	jne	$L466
; Line 214
	jmp	$L660$467
; Line 215
$L466:
	jmp	$ret0$417
; Line 216
$L570$465:
; Line 217
	mov	eax, DWORD PTR _x2$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _x3$[ebp], eax
; Line 219
	mov	eax, DWORD PTR _x3$[ebp]
	mov	DWORD PTR _recog_operand, eax
	jmp	$L571$469
; Line 220
$L468:
	jmp	$ret0$417
; Line 221
$L571$469:
; Line 222
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	DWORD PTR _x2$[ebp], eax
; Line 223
	mov	eax, DWORD PTR _pc_rtx
	cmp	DWORD PTR _x2$[ebp], eax
	jne	$L470
; Line 224
	mov	eax, 118				; 00000076H
	jmp	$L369
; Line 225
$L470:
	jmp	$ret0$417
; Line 226
$L660$467:
; Line 227
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	DWORD PTR _x2$[ebp], eax
; Line 228
	mov	eax, DWORD PTR _x2$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2490368				; 00260000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L471
; Line 229
	jmp	$L661$472
; Line 230
$L471:
	jmp	$ret0$417
; Line 231
$L661$472:
; Line 232
	mov	eax, DWORD PTR _x2$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _x3$[ebp], eax
; Line 234
	mov	eax, DWORD PTR _x3$[ebp]
	mov	DWORD PTR _recog_operand, eax
	mov	eax, 130				; 00000082H
	jmp	$L369
; Line 235
$L473:
	jmp	$ret0$417
; Line 236
$L576$401:
; Line 237
	mov	eax, DWORD PTR _x2$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _x3$[ebp], eax
; Line 238
	mov	eax, DWORD PTR _cc0_rtx
	cmp	DWORD PTR _x3$[ebp], eax
	jne	$L474
; Line 239
	jmp	$L577$475
; Line 240
$L474:
	jmp	$ret0$417
; Line 241
$L577$475:
; Line 242
	mov	eax, DWORD PTR _x2$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _x3$[ebp], eax
; Line 243
	mov	eax, DWORD PTR _const0_rtx
	cmp	DWORD PTR _x3$[ebp], eax
	jne	$L476
; Line 244
	jmp	$L578$477
; Line 245
$L476:
	jmp	$ret0$417
; Line 246
$L578$477:
; Line 247
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _x2$[ebp], eax
; Line 248
	mov	eax, DWORD PTR _x2$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2490368				; 00260000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L478
; Line 249
	jmp	$L579$479
; Line 250
$L478:
	mov	eax, DWORD PTR _pc_rtx
	cmp	DWORD PTR _x2$[ebp], eax
	jne	$L480
; Line 251
	jmp	$L669$481
; Line 252
$L480:
	jmp	$ret0$417
; Line 253
$L579$479:
; Line 254
	mov	eax, DWORD PTR _x2$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _x3$[ebp], eax
; Line 256
	mov	eax, DWORD PTR _x3$[ebp]
	mov	DWORD PTR _recog_operand, eax
	jmp	$L580$483
; Line 257
$L482:
	jmp	$ret0$417
; Line 258
$L580$483:
; Line 259
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	DWORD PTR _x2$[ebp], eax
; Line 260
	mov	eax, DWORD PTR _pc_rtx
	cmp	DWORD PTR _x2$[ebp], eax
	jne	$L484
; Line 261
	mov	eax, 120				; 00000078H
	jmp	$L369
; Line 262
$L484:
	jmp	$ret0$417
; Line 263
$L669$481:
; Line 264
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	DWORD PTR _x2$[ebp], eax
; Line 265
	mov	eax, DWORD PTR _x2$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2490368				; 00260000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L485
; Line 266
	jmp	$L670$486
; Line 267
$L485:
	jmp	$ret0$417
; Line 268
$L670$486:
; Line 269
	mov	eax, DWORD PTR _x2$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _x3$[ebp], eax
; Line 271
	mov	eax, DWORD PTR _x3$[ebp]
	mov	DWORD PTR _recog_operand, eax
	mov	eax, 131				; 00000083H
	jmp	$L369
; Line 272
$L487:
	jmp	$ret0$417
; Line 273
$L585$404:
; Line 274
	mov	eax, DWORD PTR _x2$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _x3$[ebp], eax
; Line 275
	mov	eax, DWORD PTR _cc0_rtx
	cmp	DWORD PTR _x3$[ebp], eax
	jne	$L488
; Line 276
	jmp	$L586$489
; Line 277
$L488:
	jmp	$ret0$417
; Line 278
$L586$489:
; Line 279
	mov	eax, DWORD PTR _x2$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _x3$[ebp], eax
; Line 280
	mov	eax, DWORD PTR _const0_rtx
	cmp	DWORD PTR _x3$[ebp], eax
	jne	$L490
; Line 281
	jmp	$L587$491
; Line 282
$L490:
	jmp	$ret0$417
; Line 283
$L587$491:
; Line 284
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _x2$[ebp], eax
; Line 285
	mov	eax, DWORD PTR _x2$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2490368				; 00260000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L492
; Line 286
	jmp	$L588$493
; Line 287
$L492:
	mov	eax, DWORD PTR _pc_rtx
	cmp	DWORD PTR _x2$[ebp], eax
	jne	$L494
; Line 288
	jmp	$L678$495
; Line 289
$L494:
	jmp	$ret0$417
; Line 290
$L588$493:
; Line 291
	mov	eax, DWORD PTR _x2$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _x3$[ebp], eax
; Line 293
	mov	eax, DWORD PTR _x3$[ebp]
	mov	DWORD PTR _recog_operand, eax
	jmp	$L589$497
; Line 294
$L496:
	jmp	$ret0$417
; Line 295
$L589$497:
; Line 296
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	DWORD PTR _x2$[ebp], eax
; Line 297
	mov	eax, DWORD PTR _pc_rtx
	cmp	DWORD PTR _x2$[ebp], eax
	jne	$L498
; Line 298
	mov	eax, 121				; 00000079H
	jmp	$L369
; Line 299
$L498:
	jmp	$ret0$417
; Line 300
$L678$495:
; Line 301
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	DWORD PTR _x2$[ebp], eax
; Line 302
	mov	eax, DWORD PTR _x2$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2490368				; 00260000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L499
; Line 303
	jmp	$L679$500
; Line 304
$L499:
	jmp	$ret0$417
; Line 305
$L679$500:
; Line 306
	mov	eax, DWORD PTR _x2$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _x3$[ebp], eax
; Line 308
	mov	eax, DWORD PTR _x3$[ebp]
	mov	DWORD PTR _recog_operand, eax
	mov	eax, 132				; 00000084H
	jmp	$L369
; Line 309
$L501:
	jmp	$ret0$417
; Line 310
$L594$407:
; Line 311
	mov	eax, DWORD PTR _x2$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _x3$[ebp], eax
; Line 312
	mov	eax, DWORD PTR _cc0_rtx
	cmp	DWORD PTR _x3$[ebp], eax
	jne	$L502
; Line 313
	jmp	$L595$503
; Line 314
$L502:
	jmp	$ret0$417
; Line 315
$L595$503:
; Line 316
	mov	eax, DWORD PTR _x2$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _x3$[ebp], eax
; Line 317
	mov	eax, DWORD PTR _const0_rtx
	cmp	DWORD PTR _x3$[ebp], eax
	jne	$L504
; Line 318
	jmp	$L596$505
; Line 319
$L504:
	jmp	$ret0$417
; Line 320
$L596$505:
; Line 321
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _x2$[ebp], eax
; Line 322
	mov	eax, DWORD PTR _x2$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2490368				; 00260000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L506
; Line 323
	jmp	$L597$507
; Line 324
$L506:
	mov	eax, DWORD PTR _pc_rtx
	cmp	DWORD PTR _x2$[ebp], eax
	jne	$L508
; Line 325
	jmp	$L687$509
; Line 326
$L508:
	jmp	$ret0$417
; Line 327
$L597$507:
; Line 328
	mov	eax, DWORD PTR _x2$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _x3$[ebp], eax
; Line 330
	mov	eax, DWORD PTR _x3$[ebp]
	mov	DWORD PTR _recog_operand, eax
	jmp	$L598$511
; Line 331
$L510:
	jmp	$ret0$417
; Line 332
$L598$511:
; Line 333
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	DWORD PTR _x2$[ebp], eax
; Line 334
	mov	eax, DWORD PTR _pc_rtx
	cmp	DWORD PTR _x2$[ebp], eax
	jne	$L512
; Line 335
	mov	eax, 122				; 0000007aH
	jmp	$L369
; Line 336
$L512:
	jmp	$ret0$417
; Line 337
$L687$509:
; Line 338
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	DWORD PTR _x2$[ebp], eax
; Line 339
	mov	eax, DWORD PTR _x2$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2490368				; 00260000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L513
; Line 340
	jmp	$L688$514
; Line 341
$L513:
	jmp	$ret0$417
; Line 342
$L688$514:
; Line 343
	mov	eax, DWORD PTR _x2$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _x3$[ebp], eax
; Line 345
	mov	eax, DWORD PTR _x3$[ebp]
	mov	DWORD PTR _recog_operand, eax
	mov	eax, 133				; 00000085H
	jmp	$L369
; Line 346
$L515:
	jmp	$ret0$417
; Line 347
$L603$410:
; Line 348
	mov	eax, DWORD PTR _x2$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _x3$[ebp], eax
; Line 349
	mov	eax, DWORD PTR _cc0_rtx
	cmp	DWORD PTR _x3$[ebp], eax
	jne	$L516
; Line 350
	jmp	$L604$517
; Line 351
$L516:
	jmp	$ret0$417
; Line 352
$L604$517:
; Line 353
	mov	eax, DWORD PTR _x2$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _x3$[ebp], eax
; Line 354
	mov	eax, DWORD PTR _const0_rtx
	cmp	DWORD PTR _x3$[ebp], eax
	jne	$L518
; Line 355
	jmp	$L605$519
; Line 356
$L518:
	jmp	$ret0$417
; Line 357
$L605$519:
; Line 358
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _x2$[ebp], eax
; Line 359
	mov	eax, DWORD PTR _x2$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2490368				; 00260000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L520
; Line 360
	jmp	$L606$521
; Line 361
$L520:
	mov	eax, DWORD PTR _pc_rtx
	cmp	DWORD PTR _x2$[ebp], eax
	jne	$L522
; Line 362
	jmp	$L696$523
; Line 363
$L522:
	jmp	$ret0$417
; Line 364
$L606$521:
; Line 365
	mov	eax, DWORD PTR _x2$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _x3$[ebp], eax
; Line 367
	mov	eax, DWORD PTR _x3$[ebp]
	mov	DWORD PTR _recog_operand, eax
	jmp	$L607$525
; Line 368
$L524:
	jmp	$ret0$417
; Line 369
$L607$525:
; Line 370
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	DWORD PTR _x2$[ebp], eax
; Line 371
	mov	eax, DWORD PTR _pc_rtx
	cmp	DWORD PTR _x2$[ebp], eax
	jne	$L526
; Line 372
	mov	eax, 123				; 0000007bH
	jmp	$L369
; Line 373
$L526:
	jmp	$ret0$417
; Line 374
$L696$523:
; Line 375
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	DWORD PTR _x2$[ebp], eax
; Line 376
	mov	eax, DWORD PTR _x2$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2490368				; 00260000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L527
; Line 377
	jmp	$L697$528
; Line 378
$L527:
	jmp	$ret0$417
; Line 379
$L697$528:
; Line 380
	mov	eax, DWORD PTR _x2$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _x3$[ebp], eax
; Line 382
	mov	eax, DWORD PTR _x3$[ebp]
	mov	DWORD PTR _recog_operand, eax
	mov	eax, 134				; 00000086H
	jmp	$L369
; Line 383
$L529:
	jmp	$ret0$417
; Line 384
$L612$413:
; Line 385
	mov	eax, DWORD PTR _x2$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _x3$[ebp], eax
; Line 386
	mov	eax, DWORD PTR _cc0_rtx
	cmp	DWORD PTR _x3$[ebp], eax
	jne	$L530
; Line 387
	jmp	$L613$531
; Line 388
$L530:
	jmp	$ret0$417
; Line 389
$L613$531:
; Line 390
	mov	eax, DWORD PTR _x2$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _x3$[ebp], eax
; Line 391
	mov	eax, DWORD PTR _const0_rtx
	cmp	DWORD PTR _x3$[ebp], eax
	jne	$L532
; Line 392
	jmp	$L614$533
; Line 393
$L532:
	jmp	$ret0$417
; Line 394
$L614$533:
; Line 395
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _x2$[ebp], eax
; Line 396
	mov	eax, DWORD PTR _x2$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2490368				; 00260000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L534
; Line 397
	jmp	$L615$535
; Line 398
$L534:
	mov	eax, DWORD PTR _pc_rtx
	cmp	DWORD PTR _x2$[ebp], eax
	jne	$L536
; Line 399
	jmp	$L705$537
; Line 400
$L536:
	jmp	$ret0$417
; Line 401
$L615$535:
; Line 402
	mov	eax, DWORD PTR _x2$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _x3$[ebp], eax
; Line 404
	mov	eax, DWORD PTR _x3$[ebp]
	mov	DWORD PTR _recog_operand, eax
	jmp	$L616$539
; Line 405
$L538:
	jmp	$ret0$417
; Line 406
$L616$539:
; Line 407
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	DWORD PTR _x2$[ebp], eax
; Line 408
	mov	eax, DWORD PTR _pc_rtx
	cmp	DWORD PTR _x2$[ebp], eax
	jne	$L540
; Line 409
	mov	eax, 125				; 0000007dH
	jmp	$L369
; Line 410
$L540:
	jmp	$ret0$417
; Line 411
$L705$537:
; Line 412
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	DWORD PTR _x2$[ebp], eax
; Line 413
	mov	eax, DWORD PTR _x2$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2490368				; 00260000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L541
; Line 414
	jmp	$L706$542
; Line 415
$L541:
	jmp	$ret0$417
; Line 416
$L706$542:
; Line 417
	mov	eax, DWORD PTR _x2$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _x3$[ebp], eax
; Line 419
	mov	eax, DWORD PTR _x3$[ebp]
	mov	DWORD PTR _recog_operand, eax
	mov	eax, 135				; 00000087H
	jmp	$L369
; Line 420
$L543:
	jmp	$ret0$417
; Line 421
$L621$416:
; Line 422
	mov	eax, DWORD PTR _x2$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _x3$[ebp], eax
; Line 423
	mov	eax, DWORD PTR _cc0_rtx
	cmp	DWORD PTR _x3$[ebp], eax
	jne	$L544
; Line 424
	jmp	$L622$545
; Line 425
$L544:
	jmp	$ret0$417
; Line 426
$L622$545:
; Line 427
	mov	eax, DWORD PTR _x2$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _x3$[ebp], eax
; Line 428
	mov	eax, DWORD PTR _const0_rtx
	cmp	DWORD PTR _x3$[ebp], eax
	jne	$L546
; Line 429
	jmp	$L623$547
; Line 430
$L546:
	jmp	$ret0$417
; Line 431
$L623$547:
; Line 432
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _x2$[ebp], eax
; Line 433
	mov	eax, DWORD PTR _x2$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2490368				; 00260000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L548
; Line 434
	jmp	$L624$549
; Line 435
$L548:
	mov	eax, DWORD PTR _pc_rtx
	cmp	DWORD PTR _x2$[ebp], eax
	jne	$L550
; Line 436
	jmp	$L714$551
; Line 437
$L550:
	jmp	$ret0$417
; Line 438
$L624$549:
; Line 439
	mov	eax, DWORD PTR _x2$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _x3$[ebp], eax
; Line 441
	mov	eax, DWORD PTR _x3$[ebp]
	mov	DWORD PTR _recog_operand, eax
	jmp	$L625$553
; Line 442
$L552:
	jmp	$ret0$417
; Line 443
$L625$553:
; Line 444
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	DWORD PTR _x2$[ebp], eax
; Line 445
	mov	eax, DWORD PTR _pc_rtx
	cmp	DWORD PTR _x2$[ebp], eax
	jne	$L554
; Line 446
	mov	eax, 126				; 0000007eH
	jmp	$L369
; Line 447
$L554:
	jmp	$ret0$417
; Line 448
$L714$551:
; Line 449
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	DWORD PTR _x2$[ebp], eax
; Line 450
	mov	eax, DWORD PTR _x2$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2490368				; 00260000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L555
; Line 451
	jmp	$L715$556
; Line 452
$L555:
	jmp	$ret0$417
; Line 453
$L715$556:
; Line 454
	mov	eax, DWORD PTR _x2$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _x3$[ebp], eax
; Line 456
	mov	eax, DWORD PTR _x3$[ebp]
	mov	DWORD PTR _recog_operand, eax
	mov	eax, 136				; 00000088H
	jmp	$L369
; Line 457
$L557:
	jmp	$ret0$417
; Line 458
$ret0$417:
	mov	eax, -1
	jmp	$L369
; Line 459
$L369:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_recog_1 ENDP
_TEXT	ENDS
PUBLIC	_recog_2
EXTRN	_const1_rtx:DWORD
EXTRN	_general_operand:NEAR
_TEXT	SEGMENT
_x0$ = 8
_x1$ = -44
_x2$ = -20
_recog_2 PROC NEAR
; Line 465
	push	ebp
	mov	ebp, esp
	sub	esp, 52					; 00000034H
	push	ebx
	push	esi
	push	edi
; Line 469
$L84$574:
; Line 470
	mov	eax, DWORD PTR _x0$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _x1$[ebp], eax
; Line 471
	push	1
	mov	eax, DWORD PTR _x1$[ebp]
	push	eax
	call	_general_operand
	add	esp, 8
	or	eax, eax
	je	$L576
; Line 472
	mov	eax, DWORD PTR _x1$[ebp]
	mov	DWORD PTR _recog_operand+4, eax
	mov	eax, 18					; 00000012H
	jmp	$L561
; Line 473
$L576:
$L123$577:
; Line 474
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	sar	eax, 16					; 00000010H
	mov	DWORD PTR -52+[ebp], eax
	jmp	$L578
; Line 476
$L582:
; Line 477
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	mov	ecx, 16777216				; 01000000H
	and	ecx, -16777216				; ff000000H
	cmp	eax, ecx
	jne	$L583
; Line 478
	jmp	$L124$584
; Line 479
$L583:
	jmp	$L579
; Line 480
$L585:
; Line 481
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	mov	ecx, 16777216				; 01000000H
	and	ecx, -16777216				; ff000000H
	cmp	eax, ecx
	jne	$L586
; Line 482
	jmp	$L191$587
; Line 483
$L586:
	jmp	$L579
; Line 484
$L588:
; Line 485
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	mov	ecx, 16777216				; 01000000H
	and	ecx, -16777216				; ff000000H
	cmp	eax, ecx
	jne	$L589
; Line 486
	jmp	$L226$590
; Line 487
$L589:
	jmp	$L579
; Line 488
$L591:
; Line 489
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	mov	ecx, 16777216				; 01000000H
	and	ecx, -16777216				; ff000000H
	cmp	eax, ecx
	jne	$L592
; Line 490
	jmp	$L324$593
; Line 491
$L592:
	jmp	$L579
; Line 492
$L594:
; Line 493
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	mov	ecx, 16777216				; 01000000H
	and	ecx, -16777216				; ff000000H
	cmp	eax, ecx
	jne	$L595
; Line 494
	jmp	$L339$596
; Line 495
$L595:
	jmp	$L579
; Line 496
$L597:
; Line 497
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	mov	ecx, 16777216				; 01000000H
	and	ecx, -16777216				; ff000000H
	cmp	eax, ecx
	jne	$L598
; Line 498
	jmp	$L354$599
; Line 499
$L598:
	jmp	$L579
; Line 500
$L600:
; Line 501
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	mov	ecx, 16777216				; 01000000H
	and	ecx, -16777216				; ff000000H
	cmp	eax, ecx
	jne	$L601
; Line 502
	jmp	$L367$602
; Line 503
$L601:
	jmp	$L579
; Line 504
$L603:
; Line 505
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	mov	ecx, 16777216				; 01000000H
	and	ecx, -16777216				; ff000000H
	cmp	eax, ecx
	jne	$L604
; Line 506
	jmp	$L395$605
; Line 507
$L604:
	jmp	$L579
; Line 508
$L606:
; Line 509
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	mov	ecx, 16777216				; 01000000H
	and	ecx, -16777216				; ff000000H
	cmp	eax, ecx
	jne	$L607
; Line 510
	jmp	$L409$608
; Line 511
$L607:
	jmp	$L579
; Line 512
$L609:
; Line 513
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	mov	ecx, 16777216				; 01000000H
	and	ecx, -16777216				; ff000000H
	cmp	eax, ecx
	jne	$L610
; Line 514
	jmp	$L424$611
; Line 515
$L610:
	jmp	$L579
; Line 516
$L612:
; Line 517
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	mov	ecx, 16777216				; 01000000H
	and	ecx, -16777216				; ff000000H
	cmp	eax, ecx
	jne	$L613
; Line 518
	jmp	$L439$614
; Line 519
$L613:
	jmp	$L579
; Line 520
$L615:
; Line 521
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	mov	ecx, 16777216				; 01000000H
	and	ecx, -16777216				; ff000000H
	cmp	eax, ecx
	jne	$L616
; Line 522
	jmp	$L454$617
; Line 523
$L616:
	jmp	$L579
; Line 524
$L618:
; Line 525
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	mov	ecx, 16777216				; 01000000H
	and	ecx, -16777216				; ff000000H
	cmp	eax, ecx
	jne	$L619
; Line 526
	jmp	$L469$620
; Line 527
$L619:
	jmp	$L579
; Line 528
$L621:
; Line 529
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	mov	ecx, 16777216				; 01000000H
	and	ecx, -16777216				; ff000000H
	cmp	eax, ecx
	jne	$L622
; Line 530
	jmp	$L484$623
; Line 531
$L622:
	jmp	$L579
; Line 532
$L624:
; Line 534
	jmp	$L489$626
; Line 535
$L625:
	jmp	$L579
; Line 536
$L627:
; Line 538
	jmp	$L494$629
; Line 539
$L628:
	jmp	$L579
; Line 540
$L630:
; Line 542
	jmp	$L499$632
; Line 543
$L631:
	jmp	$L579
; Line 544
$L633:
; Line 546
	jmp	$L504$635
; Line 547
$L634:
	jmp	$L579
; Line 548
$L636:
; Line 550
	jmp	$L509$638
; Line 551
$L637:
	jmp	$L579
; Line 552
$L639:
; Line 554
	jmp	$L514$641
; Line 555
$L640:
	jmp	$L579
; Line 556
$L642:
; Line 558
	jmp	$L519$644
; Line 559
$L643:
	jmp	$L579
; Line 560
$L645:
; Line 562
	jmp	$L524$647
; Line 563
$L646:
	jmp	$L579
; Line 564
$L648:
; Line 566
	jmp	$L529$650
; Line 567
$L649:
	jmp	$L579
; Line 568
$L651:
; Line 570
	jmp	$L534$653
; Line 571
$L652:
	jmp	$L579
; Line 572
	jmp	$L579
$L578:
	sub	DWORD PTR -52+[ebp], 44			; 0000002cH
	cmp	DWORD PTR -52+[ebp], 35			; 00000023H
	ja	$L579
	shl	DWORD PTR -52+[ebp], 2
	mov	eax, DWORD PTR -52+[ebp]
	jmp	DWORD PTR $L1458[eax]
$L1458:
	DD	OFFSET $L585
	DD	OFFSET $L588
	DD	OFFSET $L600
	DD	OFFSET $L579
	DD	OFFSET $L579
	DD	OFFSET $L579
	DD	OFFSET $L579
	DD	OFFSET $L579
	DD	OFFSET $L579
	DD	OFFSET $L591
	DD	OFFSET $L594
	DD	OFFSET $L597
	DD	OFFSET $L603
	DD	OFFSET $L612
	DD	OFFSET $L606
	DD	OFFSET $L618
	DD	OFFSET $L609
	DD	OFFSET $L615
	DD	OFFSET $L621
	DD	OFFSET $L579
	DD	OFFSET $L579
	DD	OFFSET $L579
	DD	OFFSET $L579
	DD	OFFSET $L627
	DD	OFFSET $L624
	DD	OFFSET $L642
	DD	OFFSET $L630
	DD	OFFSET $L648
	DD	OFFSET $L636
	DD	OFFSET $L645
	DD	OFFSET $L633
	DD	OFFSET $L651
	DD	OFFSET $L639
	DD	OFFSET $L579
	DD	OFFSET $L579
	DD	OFFSET $L582
$L579:
; Line 573
	jmp	$ret0$654
; Line 574
$L124$584:
; Line 575
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _x2$[ebp], eax
; Line 576
	push	4
	mov	eax, DWORD PTR _x2$[ebp]
	push	eax
	call	_general_operand
	add	esp, 8
	or	eax, eax
	je	$L655
; Line 577
	mov	eax, DWORD PTR _x2$[ebp]
	mov	DWORD PTR _recog_operand+4, eax
	mov	eax, 29					; 0000001dH
	jmp	$L561
; Line 578
$L655:
$L128$656:
; Line 579
	push	2
	mov	eax, DWORD PTR _x2$[ebp]
	push	eax
	call	_general_operand
	add	esp, 8
	or	eax, eax
	je	$L657
; Line 580
	mov	eax, DWORD PTR _x2$[ebp]
	mov	DWORD PTR _recog_operand+4, eax
	mov	eax, 30					; 0000001eH
	jmp	$L561
; Line 581
$L657:
	jmp	$ret0$654
; Line 582
$L191$587:
; Line 583
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _x2$[ebp], eax
; Line 584
	push	1
	mov	eax, DWORD PTR _x2$[ebp]
	push	eax
	call	_general_operand
	add	esp, 8
	or	eax, eax
	je	$L658
; Line 585
	mov	eax, DWORD PTR _x2$[ebp]
	mov	DWORD PTR _recog_operand+4, eax
	jmp	$L192$659
; Line 586
$L658:
	jmp	$ret0$654
; Line 587
$L192$659:
; Line 588
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _x2$[ebp], eax
; Line 589
	mov	eax, DWORD PTR _x2$[ebp]
	cmp	DWORD PTR _const1_rtx, eax
	jne	$L660
; Line 590
	mov	eax, 45					; 0000002dH
	jmp	$L561
; Line 591
$L660:
$L197$661:
; Line 592
	push	1
	mov	eax, DWORD PTR _x2$[ebp]
	push	eax
	call	_general_operand
	add	esp, 8
	or	eax, eax
	je	$L662
; Line 593
	mov	eax, DWORD PTR _x2$[ebp]
	mov	DWORD PTR _recog_operand+8, eax
	mov	eax, 46					; 0000002eH
	jmp	$L561
; Line 594
$L662:
	jmp	$ret0$654
; Line 595
$L226$590:
; Line 596
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _x2$[ebp], eax
; Line 597
	push	1
	mov	eax, DWORD PTR _x2$[ebp]
	push	eax
	call	_general_operand
	add	esp, 8
	or	eax, eax
	je	$L663
; Line 598
	mov	eax, DWORD PTR _x2$[ebp]
	mov	DWORD PTR _recog_operand+4, eax
	jmp	$L227$664
; Line 599
$L663:
	jmp	$ret0$654
; Line 600
$L227$664:
; Line 601
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _x2$[ebp], eax
; Line 602
	mov	eax, DWORD PTR _x2$[ebp]
	cmp	DWORD PTR _const1_rtx, eax
	jne	$L665
; Line 603
	mov	eax, 52					; 00000034H
	jmp	$L561
; Line 604
$L665:
$L232$666:
; Line 605
	push	1
	mov	eax, DWORD PTR _x2$[ebp]
	push	eax
	call	_general_operand
	add	esp, 8
	or	eax, eax
	je	$L667
; Line 606
	mov	eax, DWORD PTR _x2$[ebp]
	mov	DWORD PTR _recog_operand+8, eax
	mov	eax, 53					; 00000035H
	jmp	$L561
; Line 607
$L667:
	jmp	$ret0$654
; Line 608
$L324$593:
; Line 609
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _x2$[ebp], eax
; Line 610
	push	1
	mov	eax, DWORD PTR _x2$[ebp]
	push	eax
	call	_general_operand
	add	esp, 8
	or	eax, eax
	je	$L668
; Line 611
	mov	eax, DWORD PTR _x2$[ebp]
	mov	DWORD PTR _recog_operand+4, eax
	jmp	$L325$669
; Line 612
$L668:
	jmp	$ret0$654
; Line 613
$L325$669:
; Line 614
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _x2$[ebp], eax
; Line 615
	push	1
	mov	eax, DWORD PTR _x2$[ebp]
	push	eax
	call	_general_operand
	add	esp, 8
	or	eax, eax
	je	$L670
; Line 616
	mov	eax, DWORD PTR _x2$[ebp]
	mov	DWORD PTR _recog_operand+8, eax
	mov	eax, 70					; 00000046H
	jmp	$L561
; Line 617
$L670:
	jmp	$ret0$654
; Line 618
$L339$596:
; Line 619
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _x2$[ebp], eax
; Line 620
	push	1
	mov	eax, DWORD PTR _x2$[ebp]
	push	eax
	call	_general_operand
	add	esp, 8
	or	eax, eax
	je	$L671
; Line 621
	mov	eax, DWORD PTR _x2$[ebp]
	mov	DWORD PTR _recog_operand+4, eax
	jmp	$L340$672
; Line 622
$L671:
	jmp	$ret0$654
; Line 623
$L340$672:
; Line 624
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _x2$[ebp], eax
; Line 625
	push	1
	mov	eax, DWORD PTR _x2$[ebp]
	push	eax
	call	_general_operand
	add	esp, 8
	or	eax, eax
	je	$L673
; Line 626
	mov	eax, DWORD PTR _x2$[ebp]
	mov	DWORD PTR _recog_operand+8, eax
	mov	eax, 73					; 00000049H
	jmp	$L561
; Line 627
$L673:
	jmp	$ret0$654
; Line 628
$L354$599:
; Line 629
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _x2$[ebp], eax
; Line 630
	push	1
	mov	eax, DWORD PTR _x2$[ebp]
	push	eax
	call	_general_operand
	add	esp, 8
	or	eax, eax
	je	$L674
; Line 631
	mov	eax, DWORD PTR _x2$[ebp]
	mov	DWORD PTR _recog_operand+4, eax
	jmp	$L355$675
; Line 632
$L674:
	jmp	$ret0$654
; Line 633
$L355$675:
; Line 634
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _x2$[ebp], eax
; Line 635
	push	1
	mov	eax, DWORD PTR _x2$[ebp]
	push	eax
	call	_general_operand
	add	esp, 8
	or	eax, eax
	je	$L676
; Line 636
	mov	eax, DWORD PTR _x2$[ebp]
	mov	DWORD PTR _recog_operand+8, eax
	mov	eax, 76					; 0000004cH
	jmp	$L561
; Line 637
$L676:
	jmp	$ret0$654
; Line 638
$L367$602:
; Line 639
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _x2$[ebp], eax
; Line 640
	push	1
	mov	eax, DWORD PTR _x2$[ebp]
	push	eax
	call	_general_operand
	add	esp, 8
	or	eax, eax
	je	$L677
; Line 641
	mov	eax, DWORD PTR _x2$[ebp]
	mov	DWORD PTR _recog_operand+4, eax
	mov	eax, 79					; 0000004fH
	jmp	$L561
; Line 642
$L677:
	jmp	$ret0$654
; Line 643
$L395$605:
; Line 644
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _x2$[ebp], eax
; Line 645
	push	1
	mov	eax, DWORD PTR _x2$[ebp]
	push	eax
	call	_general_operand
	add	esp, 8
	or	eax, eax
	je	$L678
; Line 646
	mov	eax, DWORD PTR _x2$[ebp]
	mov	DWORD PTR _recog_operand+4, eax
	mov	eax, 86					; 00000056H
	jmp	$L561
; Line 647
$L678:
	jmp	$ret0$654
; Line 648
$L409$608:
; Line 649
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _x2$[ebp], eax
; Line 650
	push	1
	mov	eax, DWORD PTR _x2$[ebp]
	push	eax
	call	_general_operand
	add	esp, 8
	or	eax, eax
	je	$L679
; Line 651
	mov	eax, DWORD PTR _x2$[ebp]
	mov	DWORD PTR _recog_operand+4, eax
	jmp	$L410$680
; Line 652
$L679:
	jmp	$ret0$654
; Line 653
$L410$680:
; Line 654
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _x2$[ebp], eax
; Line 655
	push	1
	mov	eax, DWORD PTR _x2$[ebp]
	push	eax
	call	_general_operand
	add	esp, 8
	or	eax, eax
	je	$L681
; Line 656
	mov	eax, DWORD PTR _x2$[ebp]
	mov	DWORD PTR _recog_operand+8, eax
	mov	eax, 89					; 00000059H
	jmp	$L561
; Line 657
$L681:
	jmp	$ret0$654
; Line 658
$L424$611:
; Line 659
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _x2$[ebp], eax
; Line 660
	push	1
	mov	eax, DWORD PTR _x2$[ebp]
	push	eax
	call	_general_operand
	add	esp, 8
	or	eax, eax
	je	$L682
; Line 661
	mov	eax, DWORD PTR _x2$[ebp]
	mov	DWORD PTR _recog_operand+4, eax
	jmp	$L425$683
; Line 662
$L682:
	jmp	$ret0$654
; Line 663
$L425$683:
; Line 664
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _x2$[ebp], eax
; Line 665
	push	1
	mov	eax, DWORD PTR _x2$[ebp]
	push	eax
	call	_general_operand
	add	esp, 8
	or	eax, eax
	je	$L684
; Line 666
	mov	eax, DWORD PTR _x2$[ebp]
	mov	DWORD PTR _recog_operand+8, eax
	mov	eax, 92					; 0000005cH
	jmp	$L561
; Line 667
$L684:
	jmp	$ret0$654
; Line 668
$L439$614:
; Line 669
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _x2$[ebp], eax
; Line 670
	push	1
	mov	eax, DWORD PTR _x2$[ebp]
	push	eax
	call	_general_operand
	add	esp, 8
	or	eax, eax
	je	$L685
; Line 671
	mov	eax, DWORD PTR _x2$[ebp]
	mov	DWORD PTR _recog_operand+4, eax
	jmp	$L440$686
; Line 672
$L685:
	jmp	$ret0$654
; Line 673
$L440$686:
; Line 674
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _x2$[ebp], eax
; Line 675
	push	1
	mov	eax, DWORD PTR _x2$[ebp]
	push	eax
	call	_general_operand
	add	esp, 8
	or	eax, eax
	je	$L687
; Line 676
	mov	eax, DWORD PTR _x2$[ebp]
	mov	DWORD PTR _recog_operand+8, eax
	mov	eax, 95					; 0000005fH
	jmp	$L561
; Line 677
$L687:
	jmp	$ret0$654
; Line 678
$L454$617:
; Line 679
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _x2$[ebp], eax
; Line 680
	push	1
	mov	eax, DWORD PTR _x2$[ebp]
	push	eax
	call	_general_operand
	add	esp, 8
	or	eax, eax
	je	$L688
; Line 681
	mov	eax, DWORD PTR _x2$[ebp]
	mov	DWORD PTR _recog_operand+4, eax
	jmp	$L455$689
; Line 682
$L688:
	jmp	$ret0$654
; Line 683
$L455$689:
; Line 684
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _x2$[ebp], eax
; Line 685
	push	1
	mov	eax, DWORD PTR _x2$[ebp]
	push	eax
	call	_general_operand
	add	esp, 8
	or	eax, eax
	je	$L690
; Line 686
	mov	eax, DWORD PTR _x2$[ebp]
	mov	DWORD PTR _recog_operand+8, eax
	mov	eax, 98					; 00000062H
	jmp	$L561
; Line 687
$L690:
	jmp	$ret0$654
; Line 688
$L469$620:
; Line 689
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _x2$[ebp], eax
; Line 690
	push	1
	mov	eax, DWORD PTR _x2$[ebp]
	push	eax
	call	_general_operand
	add	esp, 8
	or	eax, eax
	je	$L691
; Line 691
	mov	eax, DWORD PTR _x2$[ebp]
	mov	DWORD PTR _recog_operand+4, eax
	jmp	$L470$692
; Line 692
$L691:
	jmp	$ret0$654
; Line 693
$L470$692:
; Line 694
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _x2$[ebp], eax
; Line 695
	push	1
	mov	eax, DWORD PTR _x2$[ebp]
	push	eax
	call	_general_operand
	add	esp, 8
	or	eax, eax
	je	$L693
; Line 696
	mov	eax, DWORD PTR _x2$[ebp]
	mov	DWORD PTR _recog_operand+8, eax
	mov	eax, 101				; 00000065H
	jmp	$L561
; Line 697
$L693:
	jmp	$ret0$654
; Line 698
$L484$623:
; Line 699
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _x2$[ebp], eax
; Line 700
	push	1
	mov	eax, DWORD PTR _x2$[ebp]
	push	eax
	call	_general_operand
	add	esp, 8
	or	eax, eax
	je	$L694
; Line 701
	mov	eax, DWORD PTR _x2$[ebp]
	mov	DWORD PTR _recog_operand+4, eax
	jmp	$L485$695
; Line 702
$L694:
	jmp	$ret0$654
; Line 703
$L485$695:
; Line 704
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _x2$[ebp], eax
; Line 705
	push	1
	mov	eax, DWORD PTR _x2$[ebp]
	push	eax
	call	_general_operand
	add	esp, 8
	or	eax, eax
	je	$L696
; Line 706
	mov	eax, DWORD PTR _x2$[ebp]
	mov	DWORD PTR _recog_operand+8, eax
	mov	eax, 104				; 00000068H
	jmp	$L561
; Line 707
$L696:
	jmp	$ret0$654
; Line 708
$L489$626:
; Line 709
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _x2$[ebp], eax
; Line 710
	mov	eax, DWORD PTR _x2$[ebp]
	cmp	DWORD PTR _cc0_rtx, eax
	jne	$L697
; Line 711
	jmp	$L490$698
; Line 712
$L697:
	jmp	$ret0$654
; Line 713
$L490$698:
; Line 714
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _x2$[ebp], eax
; Line 715
	mov	eax, DWORD PTR _x2$[ebp]
	cmp	DWORD PTR _const0_rtx, eax
	jne	$L699
; Line 716
	mov	eax, 105				; 00000069H
	jmp	$L561
; Line 717
$L699:
	jmp	$ret0$654
; Line 718
$L494$629:
; Line 719
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _x2$[ebp], eax
; Line 720
	mov	eax, DWORD PTR _x2$[ebp]
	cmp	DWORD PTR _cc0_rtx, eax
	jne	$L700
; Line 721
	jmp	$L495$701
; Line 722
$L700:
	jmp	$ret0$654
; Line 723
$L495$701:
; Line 724
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _x2$[ebp], eax
; Line 725
	mov	eax, DWORD PTR _x2$[ebp]
	cmp	DWORD PTR _const0_rtx, eax
	jne	$L702
; Line 726
	mov	eax, 106				; 0000006aH
	jmp	$L561
; Line 727
$L702:
	jmp	$ret0$654
; Line 728
$L499$632:
; Line 729
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _x2$[ebp], eax
; Line 730
	mov	eax, DWORD PTR _x2$[ebp]
	cmp	DWORD PTR _cc0_rtx, eax
	jne	$L703
; Line 731
	jmp	$L500$704
; Line 732
$L703:
	jmp	$ret0$654
; Line 733
$L500$704:
; Line 734
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _x2$[ebp], eax
; Line 735
	mov	eax, DWORD PTR _x2$[ebp]
	cmp	DWORD PTR _const0_rtx, eax
	jne	$L705
; Line 736
	mov	eax, 107				; 0000006bH
	jmp	$L561
; Line 737
$L705:
	jmp	$ret0$654
; Line 738
$L504$635:
; Line 739
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _x2$[ebp], eax
; Line 740
	mov	eax, DWORD PTR _x2$[ebp]
	cmp	DWORD PTR _cc0_rtx, eax
	jne	$L706
; Line 741
	jmp	$L505$707
; Line 742
$L706:
	jmp	$ret0$654
; Line 743
$L505$707:
; Line 744
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _x2$[ebp], eax
; Line 745
	mov	eax, DWORD PTR _x2$[ebp]
	cmp	DWORD PTR _const0_rtx, eax
	jne	$L708
; Line 746
	mov	eax, 108				; 0000006cH
	jmp	$L561
; Line 747
$L708:
	jmp	$ret0$654
; Line 748
$L509$638:
; Line 749
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _x2$[ebp], eax
; Line 750
	mov	eax, DWORD PTR _x2$[ebp]
	cmp	DWORD PTR _cc0_rtx, eax
	jne	$L709
; Line 751
	jmp	$L510$710
; Line 752
$L709:
	jmp	$ret0$654
; Line 753
$L510$710:
; Line 754
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _x2$[ebp], eax
; Line 755
	mov	eax, DWORD PTR _x2$[ebp]
	cmp	DWORD PTR _const0_rtx, eax
	jne	$L711
; Line 756
	mov	eax, 109				; 0000006dH
	jmp	$L561
; Line 757
$L711:
	jmp	$ret0$654
; Line 758
$L514$641:
; Line 759
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _x2$[ebp], eax
; Line 760
	mov	eax, DWORD PTR _x2$[ebp]
	cmp	DWORD PTR _cc0_rtx, eax
	jne	$L712
; Line 761
	jmp	$L515$713
; Line 762
$L712:
	jmp	$ret0$654
; Line 763
$L515$713:
; Line 764
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _x2$[ebp], eax
; Line 765
	mov	eax, DWORD PTR _x2$[ebp]
	cmp	DWORD PTR _const0_rtx, eax
	jne	$L714
; Line 766
	mov	eax, 110				; 0000006eH
	jmp	$L561
; Line 767
$L714:
	jmp	$ret0$654
; Line 768
$L519$644:
; Line 769
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _x2$[ebp], eax
; Line 770
	mov	eax, DWORD PTR _x2$[ebp]
	cmp	DWORD PTR _cc0_rtx, eax
	jne	$L715
; Line 771
	jmp	$L520$716
; Line 772
$L715:
	jmp	$ret0$654
; Line 773
$L520$716:
; Line 774
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _x2$[ebp], eax
; Line 775
	mov	eax, DWORD PTR _x2$[ebp]
	cmp	DWORD PTR _const0_rtx, eax
	jne	$L717
; Line 776
	mov	eax, 111				; 0000006fH
	jmp	$L561
; Line 777
$L717:
	jmp	$ret0$654
; Line 778
$L524$647:
; Line 779
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _x2$[ebp], eax
; Line 780
	mov	eax, DWORD PTR _x2$[ebp]
	cmp	DWORD PTR _cc0_rtx, eax
	jne	$L718
; Line 781
	jmp	$L525$719
; Line 782
$L718:
	jmp	$ret0$654
; Line 783
$L525$719:
; Line 784
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _x2$[ebp], eax
; Line 785
	mov	eax, DWORD PTR _x2$[ebp]
	cmp	DWORD PTR _const0_rtx, eax
	jne	$L720
; Line 786
	mov	eax, 112				; 00000070H
	jmp	$L561
; Line 787
$L720:
	jmp	$ret0$654
; Line 788
$L529$650:
; Line 789
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _x2$[ebp], eax
; Line 790
	mov	eax, DWORD PTR _x2$[ebp]
	cmp	DWORD PTR _cc0_rtx, eax
	jne	$L721
; Line 791
	jmp	$L530$722
; Line 792
$L721:
	jmp	$ret0$654
; Line 793
$L530$722:
; Line 794
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _x2$[ebp], eax
; Line 795
	mov	eax, DWORD PTR _x2$[ebp]
	cmp	DWORD PTR _const0_rtx, eax
	jne	$L723
; Line 796
	mov	eax, 113				; 00000071H
	jmp	$L561
; Line 797
$L723:
	jmp	$ret0$654
; Line 798
$L534$653:
; Line 799
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _x2$[ebp], eax
; Line 800
	mov	eax, DWORD PTR _x2$[ebp]
	cmp	DWORD PTR _cc0_rtx, eax
	jne	$L724
; Line 801
	jmp	$L535$725
; Line 802
$L724:
	jmp	$ret0$654
; Line 803
$L535$725:
; Line 804
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _x2$[ebp], eax
; Line 805
	mov	eax, DWORD PTR _x2$[ebp]
	cmp	DWORD PTR _const0_rtx, eax
	jne	$L726
; Line 806
	mov	eax, 114				; 00000072H
	jmp	$L561
; Line 807
$L726:
	jmp	$ret0$654
; Line 808
$ret0$654:
	mov	eax, -1
	jmp	$L561
; Line 809
$L561:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_recog_2 ENDP
_TEXT	ENDS
PUBLIC	_recog_3
EXTRN	_register_operand:NEAR
EXTRN	_address_operand:NEAR
EXTRN	_indirect_operand:NEAR
EXTRN	_target_flags:DWORD
EXTRN	_push_operand:NEAR
_TEXT	SEGMENT
_x0$ = 8
_insn$ = 12
_x1$ = -44
_x2$ = -20
_tem$ = -24
_recog_3 PROC NEAR
; Line 815
	push	ebp
	mov	ebp, esp
	sub	esp, 68					; 00000044H
	push	ebx
	push	esi
	push	edi
; Line 819
$L1$743:
; Line 820
	mov	eax, DWORD PTR _x0$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _x1$[ebp], eax
; Line 821
	mov	eax, DWORD PTR _cc0_rtx
	cmp	DWORD PTR _x1$[ebp], eax
	jne	$L744
; Line 822
	jmp	$L2$745
; Line 823
$L744:
	mov	eax, DWORD PTR _pc_rtx
	cmp	DWORD PTR _x1$[ebp], eax
	jne	$L746
; Line 824
	jmp	$L538$747
; Line 825
$L746:
$L731$748:
; Line 827
	mov	eax, DWORD PTR _x1$[ebp]
	mov	DWORD PTR _recog_operand, eax
	jmp	$L732$750
; Line 828
$L749:
$L80$751:
; Line 829
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	mov	DWORD PTR -52+[ebp], eax
	jmp	$L752
; Line 831
$L756:
; Line 832
	push	1
	mov	eax, DWORD PTR _x1$[ebp]
	push	eax
	call	_push_operand
	add	esp, 8
	or	eax, eax
	je	$L758
; Line 833
	mov	eax, DWORD PTR _x1$[ebp]
	mov	DWORD PTR _recog_operand, eax
	jmp	$L81$759
; Line 834
$L758:
$L83$760:
; Line 835
	push	1
	mov	eax, DWORD PTR _x1$[ebp]
	push	eax
	call	_general_operand
	add	esp, 8
	or	eax, eax
	je	$L761
; Line 836
	mov	eax, DWORD PTR _x1$[ebp]
	mov	DWORD PTR _recog_operand, eax
	jmp	$L84$762
; Line 837
$L761:
	jmp	$L753
; Line 838
$L763:
; Line 839
	push	2
	mov	eax, DWORD PTR _x1$[ebp]
	push	eax
	call	_push_operand
	add	esp, 8
	or	eax, eax
	je	$L764
; Line 840
	mov	eax, DWORD PTR _x1$[ebp]
	mov	DWORD PTR _recog_operand, eax
	jmp	$L75$765
; Line 841
$L764:
$L77$766:
; Line 842
	push	2
	mov	eax, DWORD PTR _x1$[ebp]
	push	eax
	call	_general_operand
	add	esp, 8
	or	eax, eax
	je	$L767
; Line 843
	mov	eax, DWORD PTR _x1$[ebp]
	mov	DWORD PTR _recog_operand, eax
	jmp	$L78$768
; Line 844
$L767:
	jmp	$L753
; Line 845
$L769:
; Line 846
	push	4
	mov	eax, DWORD PTR _x1$[ebp]
	push	eax
	call	_push_operand
	add	esp, 8
	or	eax, eax
	je	$L770
; Line 847
	mov	eax, DWORD PTR _x1$[ebp]
	mov	DWORD PTR _recog_operand, eax
	jmp	$L69$771
; Line 848
$L770:
$L71$772:
; Line 849
	push	4
	mov	eax, DWORD PTR _x1$[ebp]
	push	eax
	call	_general_operand
	add	esp, 8
	or	eax, eax
	je	$L773
; Line 850
	mov	eax, DWORD PTR _x1$[ebp]
	mov	DWORD PTR _recog_operand, eax
	jmp	$L72$774
; Line 851
$L773:
$L119$775:
; Line 852
	push	4
	mov	eax, DWORD PTR _x1$[ebp]
	push	eax
	call	_register_operand
	add	esp, 8
	or	eax, eax
	je	$L777
; Line 853
	mov	eax, DWORD PTR _x1$[ebp]
	mov	DWORD PTR _recog_operand, eax
	jmp	$L120$778
; Line 854
$L777:
$L134$779:
; Line 855
	push	4
	mov	eax, DWORD PTR _x1$[ebp]
	push	eax
	call	_general_operand
	add	esp, 8
	or	eax, eax
	je	$L780
; Line 856
	mov	eax, DWORD PTR _x1$[ebp]
	mov	DWORD PTR _recog_operand, eax
	jmp	$L135$781
; Line 857
$L780:
	jmp	$L753
; Line 858
$L782:
; Line 859
	push	6
	mov	eax, DWORD PTR _x1$[ebp]
	push	eax
	call	_push_operand
	add	esp, 8
	or	eax, eax
	je	$L783
; Line 860
	mov	eax, DWORD PTR _x1$[ebp]
	mov	DWORD PTR _recog_operand, eax
	jmp	$L99$784
; Line 861
$L783:
$L101$785:
; Line 862
	push	6
	mov	eax, DWORD PTR _x1$[ebp]
	push	eax
	call	_general_operand
	add	esp, 8
	or	eax, eax
	je	$L786
; Line 863
	mov	eax, DWORD PTR _x1$[ebp]
	mov	DWORD PTR _recog_operand, eax
	jmp	$L102$787
; Line 864
$L786:
	jmp	$L753
; Line 865
$L788:
; Line 866
	push	10					; 0000000aH
	mov	eax, DWORD PTR _x1$[ebp]
	push	eax
	call	_push_operand
	add	esp, 8
	or	eax, eax
	je	$L789
; Line 867
	mov	eax, DWORD PTR _x1$[ebp]
	mov	DWORD PTR _recog_operand, eax
	jmp	$L87$790
; Line 868
$L789:
$L89$791:
; Line 869
	push	10					; 0000000aH
	mov	eax, DWORD PTR _x1$[ebp]
	push	eax
	call	_general_operand
	add	esp, 8
	or	eax, eax
	je	$L792
; Line 870
	mov	eax, DWORD PTR _x1$[ebp]
	mov	DWORD PTR _recog_operand, eax
	jmp	$L90$793
; Line 871
$L792:
	jmp	$L753
; Line 872
$L794:
; Line 873
	push	11					; 0000000bH
	mov	eax, DWORD PTR _x1$[ebp]
	push	eax
	call	_push_operand
	add	esp, 8
	or	eax, eax
	je	$L795
; Line 874
	mov	eax, DWORD PTR _x1$[ebp]
	mov	DWORD PTR _recog_operand, eax
	jmp	$L93$796
; Line 875
$L795:
$L95$797:
; Line 876
	push	11					; 0000000bH
	mov	eax, DWORD PTR _x1$[ebp]
	push	eax
	call	_general_operand
	add	esp, 8
	or	eax, eax
	je	$L798
; Line 877
	mov	eax, DWORD PTR _x1$[ebp]
	mov	DWORD PTR _recog_operand, eax
	jmp	$L96$799
; Line 878
$L798:
	jmp	$L753
; Line 879
	jmp	$L753
$L752:
	dec	DWORD PTR -52+[ebp]
	cmp	DWORD PTR -52+[ebp], 10			; 0000000aH
	ja	$L753
	shl	DWORD PTR -52+[ebp], 2
	mov	eax, DWORD PTR -52+[ebp]
	jmp	DWORD PTR $L1461[eax]
$L1461:
	DD	OFFSET $L756
	DD	OFFSET $L763
	DD	OFFSET $L753
	DD	OFFSET $L769
	DD	OFFSET $L753
	DD	OFFSET $L782
	DD	OFFSET $L753
	DD	OFFSET $L753
	DD	OFFSET $L753
	DD	OFFSET $L788
	DD	OFFSET $L794
$L753:
; Line 880
	jmp	$ret0$800
; Line 881
$L2$745:
; Line 882
	mov	eax, DWORD PTR _x0$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _x1$[ebp], eax
; Line 883
	push	4
	mov	eax, DWORD PTR _x1$[ebp]
	push	eax
	call	_general_operand
	add	esp, 8
	or	eax, eax
	je	$L801
; Line 884
	mov	eax, DWORD PTR _x1$[ebp]
	mov	DWORD PTR _recog_operand, eax
	sub	eax, eax
	jmp	$L730
; Line 885
$L801:
$L5$802:
; Line 886
	push	2
	mov	eax, DWORD PTR _x1$[ebp]
	push	eax
	call	_general_operand
	add	esp, 8
	or	eax, eax
	je	$L803
; Line 887
	mov	eax, DWORD PTR _x1$[ebp]
	mov	DWORD PTR _recog_operand, eax
	mov	eax, 1
	jmp	$L730
; Line 888
$L803:
$L8$804:
; Line 889
	push	1
	mov	eax, DWORD PTR _x1$[ebp]
	push	eax
	call	_general_operand
	add	esp, 8
	or	eax, eax
	je	$L805
; Line 890
	mov	eax, DWORD PTR _x1$[ebp]
	mov	DWORD PTR _recog_operand, eax
	mov	eax, 2
	jmp	$L730
; Line 891
$L805:
$L23$806:
; Line 892
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2818048				; 002b0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L807
; Line 893
	jmp	$L24$808
; Line 894
$L807:
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 3473408				; 00350000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L809
; Line 895
	mov	eax, DWORD PTR _x0$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _x1$[ebp], eax
; Line 896
	jmp	$L731$748
; Line 897
$L809:
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	mov	ecx, 67108864				; 04000000H
	and	ecx, -16777216				; ff000000H
	cmp	eax, ecx
	jne	$L810
; Line 898
	jmp	$L55$811
; Line 899
$L810:
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	mov	ecx, 33554432				; 02000000H
	and	ecx, -16777216				; ff000000H
	cmp	eax, ecx
	jne	$L812
; Line 900
	jmp	$L60$813
; Line 901
$L812:
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	mov	ecx, 16777216				; 01000000H
	and	ecx, -16777216				; ff000000H
	cmp	eax, ecx
	jne	$L814
; Line 902
	jmp	$L65$815
; Line 903
$L814:
	mov	eax, DWORD PTR _x0$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _x1$[ebp], eax
; Line 904
	jmp	$L731$748
; Line 905
$L24$808:
; Line 906
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _x2$[ebp], eax
; Line 907
	push	4
	mov	eax, DWORD PTR _x2$[ebp]
	push	eax
	call	_general_operand
	add	esp, 8
	or	eax, eax
	je	$L816
; Line 908
	mov	eax, DWORD PTR _x2$[ebp]
	mov	DWORD PTR _recog_operand, eax
	jmp	$L25$817
; Line 909
$L816:
$L29$818:
; Line 910
	push	2
	mov	eax, DWORD PTR _x2$[ebp]
	push	eax
	call	_general_operand
	add	esp, 8
	or	eax, eax
	je	$L819
; Line 911
	mov	eax, DWORD PTR _x2$[ebp]
	mov	DWORD PTR _recog_operand, eax
	jmp	$L30$820
; Line 912
$L819:
$L34$821:
; Line 913
	push	1
	mov	eax, DWORD PTR _x2$[ebp]
	push	eax
	call	_general_operand
	add	esp, 8
	or	eax, eax
	je	$L822
; Line 914
	mov	eax, DWORD PTR _x2$[ebp]
	mov	DWORD PTR _recog_operand, eax
	jmp	$L35$823
; Line 915
$L822:
	mov	eax, DWORD PTR _x0$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _x1$[ebp], eax
; Line 916
	jmp	$L731$748
; Line 917
$L25$817:
; Line 918
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _x2$[ebp], eax
; Line 919
	push	4
	mov	eax, DWORD PTR _x2$[ebp]
	push	eax
	call	_general_operand
	add	esp, 8
	or	eax, eax
	je	$L824
; Line 920
	mov	eax, DWORD PTR _x2$[ebp]
	mov	DWORD PTR _recog_operand+4, eax
	mov	eax, 5
	jmp	$L730
; Line 921
$L824:
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _x2$[ebp], eax
; Line 922
	jmp	$L29$818
; Line 923
$L30$820:
; Line 924
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _x2$[ebp], eax
; Line 925
	push	2
	mov	eax, DWORD PTR _x2$[ebp]
	push	eax
	call	_general_operand
	add	esp, 8
	or	eax, eax
	je	$L825
; Line 926
	mov	eax, DWORD PTR _x2$[ebp]
	mov	DWORD PTR _recog_operand+4, eax
	mov	eax, 6
	jmp	$L730
; Line 927
$L825:
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _x2$[ebp], eax
; Line 928
	jmp	$L34$821
; Line 929
$L35$823:
; Line 930
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _x2$[ebp], eax
; Line 931
	push	1
	mov	eax, DWORD PTR _x2$[ebp]
	push	eax
	call	_general_operand
	add	esp, 8
	or	eax, eax
	je	$L826
; Line 932
	mov	eax, DWORD PTR _x2$[ebp]
	mov	DWORD PTR _recog_operand+4, eax
	mov	eax, 7
	jmp	$L730
; Line 933
$L826:
	mov	eax, DWORD PTR _x0$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _x1$[ebp], eax
; Line 934
	jmp	$L731$748
; Line 935
$L55$811:
; Line 936
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _x2$[ebp], eax
; Line 937
	push	4
	mov	eax, DWORD PTR _x2$[ebp]
	push	eax
	call	_general_operand
	add	esp, 8
	or	eax, eax
	je	$L827
; Line 938
	mov	eax, DWORD PTR _x2$[ebp]
	mov	DWORD PTR _recog_operand, eax
	jmp	$L56$828
; Line 939
$L827:
	mov	eax, DWORD PTR _x0$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _x1$[ebp], eax
; Line 940
	jmp	$L731$748
; Line 941
$L56$828:
; Line 942
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _x2$[ebp], eax
; Line 943
	push	4
	mov	eax, DWORD PTR _x2$[ebp]
	push	eax
	call	_general_operand
	add	esp, 8
	or	eax, eax
	je	$L829
; Line 944
	mov	eax, DWORD PTR _x2$[ebp]
	mov	DWORD PTR _recog_operand+4, eax
	mov	eax, 10					; 0000000aH
	jmp	$L730
; Line 945
$L829:
	mov	eax, DWORD PTR _x0$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _x1$[ebp], eax
; Line 946
	jmp	$L731$748
; Line 947
$L60$813:
; Line 948
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _x2$[ebp], eax
; Line 949
	push	2
	mov	eax, DWORD PTR _x2$[ebp]
	push	eax
	call	_general_operand
	add	esp, 8
	or	eax, eax
	je	$L830
; Line 950
	mov	eax, DWORD PTR _x2$[ebp]
	mov	DWORD PTR _recog_operand, eax
	jmp	$L61$831
; Line 951
$L830:
	mov	eax, DWORD PTR _x0$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _x1$[ebp], eax
; Line 952
	jmp	$L731$748
; Line 953
$L61$831:
; Line 954
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _x2$[ebp], eax
; Line 955
	push	2
	mov	eax, DWORD PTR _x2$[ebp]
	push	eax
	call	_general_operand
	add	esp, 8
	or	eax, eax
	je	$L832
; Line 956
	mov	eax, DWORD PTR _x2$[ebp]
	mov	DWORD PTR _recog_operand+4, eax
	mov	eax, 11					; 0000000bH
	jmp	$L730
; Line 957
$L832:
	mov	eax, DWORD PTR _x0$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _x1$[ebp], eax
; Line 958
	jmp	$L731$748
; Line 959
$L65$815:
; Line 960
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _x2$[ebp], eax
; Line 961
	push	1
	mov	eax, DWORD PTR _x2$[ebp]
	push	eax
	call	_general_operand
	add	esp, 8
	or	eax, eax
	je	$L833
; Line 962
	mov	eax, DWORD PTR _x2$[ebp]
	mov	DWORD PTR _recog_operand, eax
	jmp	$L66$834
; Line 963
$L833:
	mov	eax, DWORD PTR _x0$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _x1$[ebp], eax
; Line 964
	jmp	$L731$748
; Line 965
$L66$834:
; Line 966
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _x2$[ebp], eax
; Line 967
	push	1
	mov	eax, DWORD PTR _x2$[ebp]
	push	eax
	call	_general_operand
	add	esp, 8
	or	eax, eax
	je	$L835
; Line 968
	mov	eax, DWORD PTR _x2$[ebp]
	mov	DWORD PTR _recog_operand+4, eax
	mov	eax, 12					; 0000000cH
	jmp	$L730
; Line 969
$L835:
	mov	eax, DWORD PTR _x0$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _x1$[ebp], eax
; Line 970
	jmp	$L731$748
; Line 971
$L538$747:
; Line 972
	mov	eax, DWORD PTR _x0$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _x1$[ebp], eax
; Line 973
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2752512				; 002a0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L836
; Line 974
	jmp	$L539$837
; Line 975
$L836:
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2490368				; 00260000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L838
; Line 976
	jmp	$L719$839
; Line 977
$L838:
	mov	eax, DWORD PTR _x0$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _x1$[ebp], eax
; Line 978
	jmp	$L731$748
; Line 979
$L539$837:
; Line 980
	mov	eax, DWORD PTR _insn$[ebp]
	push	eax
	mov	eax, DWORD PTR _x0$[ebp]
	push	eax
	call	_recog_1
	add	esp, 8
	mov	DWORD PTR _tem$[ebp], eax
; Line 981
	cmp	DWORD PTR _tem$[ebp], 0
	jl	$L840
	mov	eax, DWORD PTR _tem$[ebp]
	jmp	$L730
; Line 982
$L840:
	mov	eax, DWORD PTR _x0$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _x1$[ebp], eax
; Line 983
	jmp	$L731$748
; Line 984
$L719$839:
; Line 985
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _x2$[ebp], eax
; Line 987
	mov	eax, DWORD PTR _x2$[ebp]
	mov	DWORD PTR _recog_operand, eax
	mov	eax, 137				; 00000089H
	jmp	$L730
; Line 988
$L841:
	mov	eax, DWORD PTR _x0$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _x1$[ebp], eax
; Line 989
	jmp	$L731$748
; Line 990
$L732$750:
; Line 991
	mov	eax, DWORD PTR _x0$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _x1$[ebp], eax
; Line 992
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1835008				; 001c0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L842
; Line 993
	jmp	$L733$843
; Line 994
$L842:
	mov	eax, DWORD PTR _x0$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _x1$[ebp], eax
; Line 995
	jmp	$L80$751
; Line 996
$L733$843:
; Line 997
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _x2$[ebp], eax
; Line 998
	push	1
	mov	eax, DWORD PTR _x2$[ebp]
	push	eax
	call	_indirect_operand
	add	esp, 8
	or	eax, eax
	je	$L845
; Line 999
	mov	eax, DWORD PTR _x2$[ebp]
	mov	DWORD PTR _recog_operand+4, eax
	jmp	$L734$846
; Line 1000
$L845:
	mov	eax, DWORD PTR _x0$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _x1$[ebp], eax
; Line 1001
	jmp	$L80$751
; Line 1002
$L734$846:
; Line 1003
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _x2$[ebp], eax
; Line 1004
	push	4
	mov	eax, DWORD PTR _x2$[ebp]
	push	eax
	call	_general_operand
	add	esp, 8
	or	eax, eax
	je	$L847
; Line 1005
	mov	eax, DWORD PTR _x2$[ebp]
	mov	DWORD PTR _recog_operand+8, eax
	mov	eax, 140				; 0000008cH
	jmp	$L730
; Line 1006
$L847:
	mov	eax, DWORD PTR _x0$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _x1$[ebp], eax
; Line 1007
	jmp	$L80$751
; Line 1008
$L81$759:
; Line 1009
	mov	eax, DWORD PTR _x0$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _x1$[ebp], eax
; Line 1010
	push	1
	mov	eax, DWORD PTR _x1$[ebp]
	push	eax
	call	_general_operand
	add	esp, 8
	or	eax, eax
	je	$L848
; Line 1011
	mov	eax, DWORD PTR _x1$[ebp]
	mov	DWORD PTR _recog_operand+4, eax
	mov	eax, 17					; 00000011H
	jmp	$L730
; Line 1012
$L848:
	mov	eax, DWORD PTR _x0$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _x1$[ebp], eax
; Line 1013
	jmp	$L83$760
; Line 1014
$L84$762:
; Line 1015
	mov	eax, DWORD PTR _insn$[ebp]
	push	eax
	mov	eax, DWORD PTR _x0$[ebp]
	push	eax
	call	_recog_2
	add	esp, 8
	jmp	$L730
; Line 1016
$L75$765:
; Line 1017
	mov	eax, DWORD PTR _x0$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _x1$[ebp], eax
; Line 1018
	push	2
	mov	eax, DWORD PTR _x1$[ebp]
	push	eax
	call	_general_operand
	add	esp, 8
	or	eax, eax
	je	$L849
; Line 1019
	mov	eax, DWORD PTR _x1$[ebp]
	mov	DWORD PTR _recog_operand+4, eax
	mov	eax, 15					; 0000000fH
	jmp	$L730
; Line 1020
$L849:
	mov	eax, DWORD PTR _x0$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _x1$[ebp], eax
; Line 1021
	jmp	$L77$766
; Line 1022
$L78$768:
; Line 1023
	mov	eax, DWORD PTR _x0$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _x1$[ebp], eax
; Line 1024
	push	2
	mov	eax, DWORD PTR _x1$[ebp]
	push	eax
	call	_general_operand
	add	esp, 8
	or	eax, eax
	je	$L850
; Line 1025
	mov	eax, DWORD PTR _x1$[ebp]
	mov	DWORD PTR _recog_operand+4, eax
	mov	eax, 16					; 00000010H
	jmp	$L730
; Line 1026
$L850:
$L131$851:
; Line 1027
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	sar	eax, 16					; 00000010H
	mov	DWORD PTR -56+[ebp], eax
	jmp	$L852
; Line 1029
$L856:
; Line 1030
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	mov	ecx, 33554432				; 02000000H
	and	ecx, -16777216				; ff000000H
	cmp	eax, ecx
	jne	$L857
; Line 1031
	jmp	$L132$858
; Line 1032
$L857:
	jmp	$L853
; Line 1033
$L859:
; Line 1034
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	mov	ecx, 33554432				; 02000000H
	and	ecx, -16777216				; ff000000H
	cmp	eax, ecx
	jne	$L860
; Line 1035
	jmp	$L140$861
; Line 1036
$L860:
	jmp	$L853
; Line 1037
$L862:
; Line 1038
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	mov	ecx, 33554432				; 02000000H
	and	ecx, -16777216				; ff000000H
	cmp	eax, ecx
	jne	$L863
; Line 1039
	jmp	$L152$864
; Line 1040
$L863:
	jmp	$L853
; Line 1041
$L865:
; Line 1042
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	mov	ecx, 33554432				; 02000000H
	and	ecx, -16777216				; ff000000H
	cmp	eax, ecx
	jne	$L866
; Line 1043
	jmp	$L181$867
; Line 1044
$L866:
	jmp	$L853
; Line 1045
$L868:
; Line 1046
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	mov	ecx, 33554432				; 02000000H
	and	ecx, -16777216				; ff000000H
	cmp	eax, ecx
	jne	$L869
; Line 1047
	jmp	$L216$870
; Line 1048
$L869:
	jmp	$L853
; Line 1049
$L871:
; Line 1050
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	mov	ecx, 67108864				; 04000000H
	and	ecx, -16777216				; ff000000H
	cmp	eax, ecx
	jne	$L872
; Line 1051
	jmp	$L246$873
; Line 1052
$L872:
	jmp	$L853
; Line 1053
$L874:
; Line 1054
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	mov	ecx, 33554432				; 02000000H
	and	ecx, -16777216				; ff000000H
	cmp	eax, ecx
	jne	$L875
; Line 1055
	jmp	$L319$876
; Line 1056
$L875:
	jmp	$L853
; Line 1057
$L877:
; Line 1058
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	mov	ecx, 33554432				; 02000000H
	and	ecx, -16777216				; ff000000H
	cmp	eax, ecx
	jne	$L878
; Line 1059
	jmp	$L334$879
; Line 1060
$L878:
	jmp	$L853
; Line 1061
$L880:
; Line 1062
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	mov	ecx, 33554432				; 02000000H
	and	ecx, -16777216				; ff000000H
	cmp	eax, ecx
	jne	$L881
; Line 1063
	jmp	$L349$882
; Line 1064
$L881:
	jmp	$L853
; Line 1065
$L883:
; Line 1066
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	mov	ecx, 33554432				; 02000000H
	and	ecx, -16777216				; ff000000H
	cmp	eax, ecx
	jne	$L884
; Line 1067
	jmp	$L363$885
; Line 1068
$L884:
	jmp	$L853
; Line 1069
$L886:
; Line 1070
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	mov	ecx, 33554432				; 02000000H
	and	ecx, -16777216				; ff000000H
	cmp	eax, ecx
	jne	$L887
; Line 1071
	jmp	$L391$888
; Line 1072
$L887:
	jmp	$L853
; Line 1073
$L889:
; Line 1074
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	mov	ecx, 33554432				; 02000000H
	and	ecx, -16777216				; ff000000H
	cmp	eax, ecx
	jne	$L890
; Line 1075
	jmp	$L404$891
; Line 1076
$L890:
	jmp	$L853
; Line 1077
$L892:
; Line 1078
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	mov	ecx, 33554432				; 02000000H
	and	ecx, -16777216				; ff000000H
	cmp	eax, ecx
	jne	$L893
; Line 1079
	jmp	$L419$894
; Line 1080
$L893:
	jmp	$L853
; Line 1081
$L895:
; Line 1082
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	mov	ecx, 33554432				; 02000000H
	and	ecx, -16777216				; ff000000H
	cmp	eax, ecx
	jne	$L896
; Line 1083
	jmp	$L434$897
; Line 1084
$L896:
	jmp	$L853
; Line 1085
$L898:
; Line 1086
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	mov	ecx, 33554432				; 02000000H
	and	ecx, -16777216				; ff000000H
	cmp	eax, ecx
	jne	$L899
; Line 1087
	jmp	$L449$900
; Line 1088
$L899:
	jmp	$L853
; Line 1089
$L901:
; Line 1090
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	mov	ecx, 33554432				; 02000000H
	and	ecx, -16777216				; ff000000H
	cmp	eax, ecx
	jne	$L902
; Line 1091
	jmp	$L464$903
; Line 1092
$L902:
	jmp	$L853
; Line 1093
$L904:
; Line 1094
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	mov	ecx, 33554432				; 02000000H
	and	ecx, -16777216				; ff000000H
	cmp	eax, ecx
	jne	$L905
; Line 1095
	jmp	$L479$906
; Line 1096
$L905:
	jmp	$L853
; Line 1097
	jmp	$L853
$L852:
	sub	DWORD PTR -56+[ebp], 44			; 0000002cH
	cmp	DWORD PTR -56+[ebp], 35			; 00000023H
	ja	$L853
	shl	DWORD PTR -56+[ebp], 2
	mov	eax, DWORD PTR -56+[ebp]
	jmp	DWORD PTR $L1462[eax]
$L1462:
	DD	OFFSET $L865
	DD	OFFSET $L868
	DD	OFFSET $L883
	DD	OFFSET $L871
	DD	OFFSET $L853
	DD	OFFSET $L853
	DD	OFFSET $L853
	DD	OFFSET $L853
	DD	OFFSET $L853
	DD	OFFSET $L874
	DD	OFFSET $L877
	DD	OFFSET $L880
	DD	OFFSET $L886
	DD	OFFSET $L895
	DD	OFFSET $L889
	DD	OFFSET $L901
	DD	OFFSET $L892
	DD	OFFSET $L898
	DD	OFFSET $L904
	DD	OFFSET $L853
	DD	OFFSET $L853
	DD	OFFSET $L853
	DD	OFFSET $L853
	DD	OFFSET $L853
	DD	OFFSET $L853
	DD	OFFSET $L853
	DD	OFFSET $L853
	DD	OFFSET $L853
	DD	OFFSET $L853
	DD	OFFSET $L853
	DD	OFFSET $L853
	DD	OFFSET $L853
	DD	OFFSET $L853
	DD	OFFSET $L862
	DD	OFFSET $L859
	DD	OFFSET $L856
$L853:
; Line 1098
	jmp	$ret0$800
; Line 1099
$L132$858:
; Line 1100
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _x2$[ebp], eax
; Line 1101
	push	4
	mov	eax, DWORD PTR _x2$[ebp]
	push	eax
	call	_general_operand
	add	esp, 8
	or	eax, eax
	je	$L907
; Line 1102
	mov	eax, DWORD PTR _x2$[ebp]
	mov	DWORD PTR _recog_operand+4, eax
	mov	eax, 31					; 0000001fH
	jmp	$L730
; Line 1103
$L907:
	jmp	$ret0$800
; Line 1104
$L140$861:
; Line 1105
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _x2$[ebp], eax
; Line 1106
	push	1
	mov	eax, DWORD PTR _x2$[ebp]
	push	eax
	call	_general_operand
	add	esp, 8
	or	eax, eax
	je	$L908
; Line 1107
	mov	eax, DWORD PTR _x2$[ebp]
	mov	DWORD PTR _recog_operand+4, eax
	mov	eax, 33					; 00000021H
	jmp	$L730
; Line 1108
$L908:
	jmp	$ret0$800
; Line 1109
$L152$864:
; Line 1110
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _x2$[ebp], eax
; Line 1111
	push	1
	mov	eax, DWORD PTR _x2$[ebp]
	push	eax
	call	_general_operand
	add	esp, 8
	or	eax, eax
	je	$L909
; Line 1112
	mov	eax, DWORD PTR _x2$[ebp]
	mov	DWORD PTR _recog_operand+4, eax
	mov	eax, 36					; 00000024H
	jmp	$L730
; Line 1113
$L909:
	jmp	$ret0$800
; Line 1114
$L181$867:
; Line 1115
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _x2$[ebp], eax
; Line 1116
	push	2
	mov	eax, DWORD PTR _x2$[ebp]
	push	eax
	call	_general_operand
	add	esp, 8
	or	eax, eax
	je	$L910
; Line 1117
	mov	eax, DWORD PTR _x2$[ebp]
	mov	DWORD PTR _recog_operand+4, eax
	jmp	$L182$911
; Line 1118
$L910:
	jmp	$ret0$800
; Line 1119
$L182$911:
; Line 1120
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _x2$[ebp], eax
; Line 1121
	mov	eax, DWORD PTR _const1_rtx
	cmp	DWORD PTR _x2$[ebp], eax
	jne	$L912
; Line 1122
	mov	eax, 43					; 0000002bH
	jmp	$L730
; Line 1123
$L912:
$L187$913:
; Line 1124
	push	2
	mov	eax, DWORD PTR _x2$[ebp]
	push	eax
	call	_general_operand
	add	esp, 8
	or	eax, eax
	je	$L914
; Line 1125
	mov	eax, DWORD PTR _x2$[ebp]
	mov	DWORD PTR _recog_operand+8, eax
	mov	eax, 44					; 0000002cH
	jmp	$L730
; Line 1126
$L914:
	jmp	$ret0$800
; Line 1127
$L216$870:
; Line 1128
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _x2$[ebp], eax
; Line 1129
	push	2
	mov	eax, DWORD PTR _x2$[ebp]
	push	eax
	call	_general_operand
	add	esp, 8
	or	eax, eax
	je	$L915
; Line 1130
	mov	eax, DWORD PTR _x2$[ebp]
	mov	DWORD PTR _recog_operand+4, eax
	jmp	$L217$916
; Line 1131
$L915:
	jmp	$ret0$800
; Line 1132
$L217$916:
; Line 1133
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _x2$[ebp], eax
; Line 1134
	mov	eax, DWORD PTR _const1_rtx
	cmp	DWORD PTR _x2$[ebp], eax
	jne	$L917
; Line 1135
	mov	eax, 50					; 00000032H
	jmp	$L730
; Line 1136
$L917:
$L222$918:
; Line 1137
	push	2
	mov	eax, DWORD PTR _x2$[ebp]
	push	eax
	call	_general_operand
	add	esp, 8
	or	eax, eax
	je	$L919
; Line 1138
	mov	eax, DWORD PTR _x2$[ebp]
	mov	DWORD PTR _recog_operand+8, eax
	mov	eax, 51					; 00000033H
	jmp	$L730
; Line 1139
$L919:
	jmp	$ret0$800
; Line 1140
$L246$873:
; Line 1141
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _x2$[ebp], eax
; Line 1142
	push	2
	mov	eax, DWORD PTR _x2$[ebp]
	push	eax
	call	_general_operand
	add	esp, 8
	or	eax, eax
	je	$L920
; Line 1143
	mov	eax, DWORD PTR _x2$[ebp]
	mov	DWORD PTR _recog_operand+4, eax
	jmp	$L247$921
; Line 1144
$L920:
	jmp	$ret0$800
; Line 1145
$L247$921:
; Line 1146
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _x2$[ebp], eax
; Line 1147
	push	2
	mov	eax, DWORD PTR _x2$[ebp]
	push	eax
	call	_general_operand
	add	esp, 8
	or	eax, eax
	je	$L922
; Line 1148
	mov	eax, DWORD PTR _x2$[ebp]
	mov	DWORD PTR _recog_operand+8, eax
	mov	eax, 56					; 00000038H
	jmp	$L730
; Line 1149
$L922:
	jmp	$ret0$800
; Line 1150
$L319$876:
; Line 1151
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _x2$[ebp], eax
; Line 1152
	push	2
	mov	eax, DWORD PTR _x2$[ebp]
	push	eax
	call	_general_operand
	add	esp, 8
	or	eax, eax
	je	$L923
; Line 1153
	mov	eax, DWORD PTR _x2$[ebp]
	mov	DWORD PTR _recog_operand+4, eax
	jmp	$L320$924
; Line 1154
$L923:
	jmp	$ret0$800
; Line 1155
$L320$924:
; Line 1156
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _x2$[ebp], eax
; Line 1157
	push	2
	mov	eax, DWORD PTR _x2$[ebp]
	push	eax
	call	_general_operand
	add	esp, 8
	or	eax, eax
	je	$L925
; Line 1158
	mov	eax, DWORD PTR _x2$[ebp]
	mov	DWORD PTR _recog_operand+8, eax
	mov	eax, 69					; 00000045H
	jmp	$L730
; Line 1159
$L925:
	jmp	$ret0$800
; Line 1160
$L334$879:
; Line 1161
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _x2$[ebp], eax
; Line 1162
	push	2
	mov	eax, DWORD PTR _x2$[ebp]
	push	eax
	call	_general_operand
	add	esp, 8
	or	eax, eax
	je	$L926
; Line 1163
	mov	eax, DWORD PTR _x2$[ebp]
	mov	DWORD PTR _recog_operand+4, eax
	jmp	$L335$927
; Line 1164
$L926:
	jmp	$ret0$800
; Line 1165
$L335$927:
; Line 1166
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _x2$[ebp], eax
; Line 1167
	push	2
	mov	eax, DWORD PTR _x2$[ebp]
	push	eax
	call	_general_operand
	add	esp, 8
	or	eax, eax
	je	$L928
; Line 1168
	mov	eax, DWORD PTR _x2$[ebp]
	mov	DWORD PTR _recog_operand+8, eax
	mov	eax, 72					; 00000048H
	jmp	$L730
; Line 1169
$L928:
	jmp	$ret0$800
; Line 1170
$L349$882:
; Line 1171
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _x2$[ebp], eax
; Line 1172
	push	2
	mov	eax, DWORD PTR _x2$[ebp]
	push	eax
	call	_general_operand
	add	esp, 8
	or	eax, eax
	je	$L929
; Line 1173
	mov	eax, DWORD PTR _x2$[ebp]
	mov	DWORD PTR _recog_operand+4, eax
	jmp	$L350$930
; Line 1174
$L929:
	jmp	$ret0$800
; Line 1175
$L350$930:
; Line 1176
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _x2$[ebp], eax
; Line 1177
	push	2
	mov	eax, DWORD PTR _x2$[ebp]
	push	eax
	call	_general_operand
	add	esp, 8
	or	eax, eax
	je	$L931
; Line 1178
	mov	eax, DWORD PTR _x2$[ebp]
	mov	DWORD PTR _recog_operand+8, eax
	mov	eax, 75					; 0000004bH
	jmp	$L730
; Line 1179
$L931:
	jmp	$ret0$800
; Line 1180
$L363$885:
; Line 1181
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _x2$[ebp], eax
; Line 1182
	push	2
	mov	eax, DWORD PTR _x2$[ebp]
	push	eax
	call	_general_operand
	add	esp, 8
	or	eax, eax
	je	$L932
; Line 1183
	mov	eax, DWORD PTR _x2$[ebp]
	mov	DWORD PTR _recog_operand+4, eax
	mov	eax, 78					; 0000004eH
	jmp	$L730
; Line 1184
$L932:
	jmp	$ret0$800
; Line 1185
$L391$888:
; Line 1186
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _x2$[ebp], eax
; Line 1187
	push	2
	mov	eax, DWORD PTR _x2$[ebp]
	push	eax
	call	_general_operand
	add	esp, 8
	or	eax, eax
	je	$L933
; Line 1188
	mov	eax, DWORD PTR _x2$[ebp]
	mov	DWORD PTR _recog_operand+4, eax
	mov	eax, 85					; 00000055H
	jmp	$L730
; Line 1189
$L933:
	jmp	$ret0$800
; Line 1190
$L404$891:
; Line 1191
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _x2$[ebp], eax
; Line 1192
	push	2
	mov	eax, DWORD PTR _x2$[ebp]
	push	eax
	call	_general_operand
	add	esp, 8
	or	eax, eax
	je	$L934
; Line 1193
	mov	eax, DWORD PTR _x2$[ebp]
	mov	DWORD PTR _recog_operand+4, eax
	jmp	$L405$935
; Line 1194
$L934:
	jmp	$ret0$800
; Line 1195
$L405$935:
; Line 1196
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _x2$[ebp], eax
; Line 1197
	push	2
	mov	eax, DWORD PTR _x2$[ebp]
	push	eax
	call	_general_operand
	add	esp, 8
	or	eax, eax
	je	$L936
; Line 1198
	mov	eax, DWORD PTR _x2$[ebp]
	mov	DWORD PTR _recog_operand+8, eax
	mov	eax, 88					; 00000058H
	jmp	$L730
; Line 1199
$L936:
	jmp	$ret0$800
; Line 1200
$L419$894:
; Line 1201
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _x2$[ebp], eax
; Line 1202
	push	2
	mov	eax, DWORD PTR _x2$[ebp]
	push	eax
	call	_general_operand
	add	esp, 8
	or	eax, eax
	je	$L937
; Line 1203
	mov	eax, DWORD PTR _x2$[ebp]
	mov	DWORD PTR _recog_operand+4, eax
	jmp	$L420$938
; Line 1204
$L937:
	jmp	$ret0$800
; Line 1205
$L420$938:
; Line 1206
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _x2$[ebp], eax
; Line 1207
	push	2
	mov	eax, DWORD PTR _x2$[ebp]
	push	eax
	call	_general_operand
	add	esp, 8
	or	eax, eax
	je	$L939
; Line 1208
	mov	eax, DWORD PTR _x2$[ebp]
	mov	DWORD PTR _recog_operand+8, eax
	mov	eax, 91					; 0000005bH
	jmp	$L730
; Line 1209
$L939:
	jmp	$ret0$800
; Line 1210
$L434$897:
; Line 1211
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _x2$[ebp], eax
; Line 1212
	push	2
	mov	eax, DWORD PTR _x2$[ebp]
	push	eax
	call	_general_operand
	add	esp, 8
	or	eax, eax
	je	$L940
; Line 1213
	mov	eax, DWORD PTR _x2$[ebp]
	mov	DWORD PTR _recog_operand+4, eax
	jmp	$L435$941
; Line 1214
$L940:
	jmp	$ret0$800
; Line 1215
$L435$941:
; Line 1216
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _x2$[ebp], eax
; Line 1217
	push	2
	mov	eax, DWORD PTR _x2$[ebp]
	push	eax
	call	_general_operand
	add	esp, 8
	or	eax, eax
	je	$L942
; Line 1218
	mov	eax, DWORD PTR _x2$[ebp]
	mov	DWORD PTR _recog_operand+8, eax
	mov	eax, 94					; 0000005eH
	jmp	$L730
; Line 1219
$L942:
	jmp	$ret0$800
; Line 1220
$L449$900:
; Line 1221
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _x2$[ebp], eax
; Line 1222
	push	2
	mov	eax, DWORD PTR _x2$[ebp]
	push	eax
	call	_general_operand
	add	esp, 8
	or	eax, eax
	je	$L943
; Line 1223
	mov	eax, DWORD PTR _x2$[ebp]
	mov	DWORD PTR _recog_operand+4, eax
	jmp	$L450$944
; Line 1224
$L943:
	jmp	$ret0$800
; Line 1225
$L450$944:
; Line 1226
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _x2$[ebp], eax
; Line 1227
	push	2
	mov	eax, DWORD PTR _x2$[ebp]
	push	eax
	call	_general_operand
	add	esp, 8
	or	eax, eax
	je	$L945
; Line 1228
	mov	eax, DWORD PTR _x2$[ebp]
	mov	DWORD PTR _recog_operand+8, eax
	mov	eax, 97					; 00000061H
	jmp	$L730
; Line 1229
$L945:
	jmp	$ret0$800
; Line 1230
$L464$903:
; Line 1231
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _x2$[ebp], eax
; Line 1232
	push	2
	mov	eax, DWORD PTR _x2$[ebp]
	push	eax
	call	_general_operand
	add	esp, 8
	or	eax, eax
	je	$L946
; Line 1233
	mov	eax, DWORD PTR _x2$[ebp]
	mov	DWORD PTR _recog_operand+4, eax
	jmp	$L465$947
; Line 1234
$L946:
	jmp	$ret0$800
; Line 1235
$L465$947:
; Line 1236
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _x2$[ebp], eax
; Line 1237
	push	2
	mov	eax, DWORD PTR _x2$[ebp]
	push	eax
	call	_general_operand
	add	esp, 8
	or	eax, eax
	je	$L948
; Line 1238
	mov	eax, DWORD PTR _x2$[ebp]
	mov	DWORD PTR _recog_operand+8, eax
	mov	eax, 100				; 00000064H
	jmp	$L730
; Line 1239
$L948:
	jmp	$ret0$800
; Line 1240
$L479$906:
; Line 1241
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _x2$[ebp], eax
; Line 1242
	push	2
	mov	eax, DWORD PTR _x2$[ebp]
	push	eax
	call	_general_operand
	add	esp, 8
	or	eax, eax
	je	$L949
; Line 1243
	mov	eax, DWORD PTR _x2$[ebp]
	mov	DWORD PTR _recog_operand+4, eax
	jmp	$L480$950
; Line 1244
$L949:
	jmp	$ret0$800
; Line 1245
$L480$950:
; Line 1246
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _x2$[ebp], eax
; Line 1247
	push	2
	mov	eax, DWORD PTR _x2$[ebp]
	push	eax
	call	_general_operand
	add	esp, 8
	or	eax, eax
	je	$L951
; Line 1248
	mov	eax, DWORD PTR _x2$[ebp]
	mov	DWORD PTR _recog_operand+8, eax
	mov	eax, 103				; 00000067H
	jmp	$L730
; Line 1249
$L951:
	jmp	$ret0$800
; Line 1250
$L69$771:
; Line 1251
	mov	eax, DWORD PTR _x0$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _x1$[ebp], eax
; Line 1252
	push	4
	mov	eax, DWORD PTR _x1$[ebp]
	push	eax
	call	_general_operand
	add	esp, 8
	or	eax, eax
	je	$L952
; Line 1253
	mov	eax, DWORD PTR _x1$[ebp]
	mov	DWORD PTR _recog_operand+4, eax
	mov	eax, 13					; 0000000dH
	jmp	$L730
; Line 1254
$L952:
	mov	eax, DWORD PTR _x0$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _x1$[ebp], eax
; Line 1255
	jmp	$L71$772
; Line 1256
$L72$774:
; Line 1257
	mov	eax, DWORD PTR _x0$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _x1$[ebp], eax
; Line 1258
	push	4
	mov	eax, DWORD PTR _x1$[ebp]
	push	eax
	call	_general_operand
	add	esp, 8
	or	eax, eax
	je	$L953
; Line 1259
	mov	eax, DWORD PTR _x1$[ebp]
	mov	DWORD PTR _recog_operand+4, eax
	mov	eax, 14					; 0000000eH
	jmp	$L730
; Line 1260
$L953:
$L105$954:
; Line 1261
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	mov	ecx, 67108864				; 04000000H
	and	ecx, -16777216				; ff000000H
	cmp	eax, ecx
	je	$L955
; Line 1263
	mov	eax, DWORD PTR _x0$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _x1$[ebp], eax
; Line 1264
	jmp	$L119$775
; Line 1266
$L955:
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2883584				; 002c0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L956
; Line 1267
	jmp	$L106$957
; Line 1268
$L956:
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2949120				; 002d0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L958
; Line 1269
	jmp	$L116$959
; Line 1270
$L958:
	mov	eax, DWORD PTR _x0$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _x1$[ebp], eax
; Line 1271
	jmp	$L119$775
; Line 1272
$L106$957:
; Line 1273
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _x2$[ebp], eax
; Line 1274
	push	4
	mov	eax, DWORD PTR _x2$[ebp]
	push	eax
	call	_general_operand
	add	esp, 8
	or	eax, eax
	je	$L960
; Line 1275
	mov	eax, DWORD PTR _x2$[ebp]
	mov	DWORD PTR _recog_operand+4, eax
	jmp	$L107$961
; Line 1276
$L960:
	mov	eax, DWORD PTR _x0$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _x1$[ebp], eax
; Line 1277
	jmp	$L119$775
; Line 1278
$L107$961:
; Line 1279
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _x2$[ebp], eax
; Line 1280
	mov	eax, DWORD PTR _x2$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L962
; Line 1281
	mov	eax, DWORD PTR _x0$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _x1$[ebp], eax
; Line 1282
	jmp	$L119$775
; Line 1283
$L962:
	mov	eax, DWORD PTR _const1_rtx
	cmp	DWORD PTR _x2$[ebp], eax
	jne	$L963
; Line 1284
	mov	eax, 25					; 00000019H
	jmp	$L730
; Line 1285
$L963:
$L112$964:
; Line 1286
	mov	eax, DWORD PTR _x2$[ebp]
	cmp	DWORD PTR [eax+4], -1
	jne	$L965
; Line 1287
	mov	eax, 26					; 0000001aH
	jmp	$L730
; Line 1288
$L965:
	mov	eax, DWORD PTR _x0$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _x1$[ebp], eax
; Line 1289
	jmp	$L119$775
; Line 1290
$L116$959:
; Line 1291
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _x2$[ebp], eax
; Line 1292
	push	4
	mov	eax, DWORD PTR _x2$[ebp]
	push	eax
	call	_general_operand
	add	esp, 8
	or	eax, eax
	je	$L966
; Line 1293
	mov	eax, DWORD PTR _x2$[ebp]
	mov	DWORD PTR _recog_operand+4, eax
	jmp	$L117$967
; Line 1294
$L966:
	mov	eax, DWORD PTR _x0$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _x1$[ebp], eax
; Line 1295
	jmp	$L119$775
; Line 1296
$L117$967:
; Line 1297
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _x2$[ebp], eax
; Line 1298
	mov	eax, DWORD PTR _const1_rtx
	cmp	DWORD PTR _x2$[ebp], eax
	jne	$L968
; Line 1299
	mov	eax, 27					; 0000001bH
	jmp	$L730
; Line 1300
$L968:
	mov	eax, DWORD PTR _x0$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _x1$[ebp], eax
; Line 1301
	jmp	$L119$775
; Line 1302
$L120$778:
; Line 1303
	mov	eax, DWORD PTR _x0$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _x1$[ebp], eax
; Line 1304
	push	1
	mov	eax, DWORD PTR _x1$[ebp]
	push	eax
	call	_address_operand
	add	esp, 8
	or	eax, eax
	je	$L970
; Line 1305
	mov	eax, DWORD PTR _x1$[ebp]
	mov	DWORD PTR _recog_operand+4, eax
	mov	eax, 28					; 0000001cH
	jmp	$L730
; Line 1306
$L970:
	mov	eax, DWORD PTR _x0$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _x1$[ebp], eax
; Line 1307
	jmp	$L134$779
; Line 1308
$L135$781:
; Line 1309
	mov	eax, DWORD PTR _x0$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _x1$[ebp], eax
; Line 1310
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	mov	ecx, 67108864				; 04000000H
	and	ecx, -16777216				; ff000000H
	cmp	eax, ecx
	je	$L971
; Line 1311
	jmp	$ret0$800
; Line 1312
$L971:
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	sar	eax, 16					; 00000010H
	mov	DWORD PTR -60+[ebp], eax
	jmp	$L972
; Line 1314
$L976:
; Line 1316
	jmp	$L136$978
; Line 1317
$L977:
	jmp	$L973
; Line 1318
$L979:
; Line 1320
	jmp	$L148$981
; Line 1321
$L980:
	jmp	$L973
; Line 1322
$L982:
; Line 1324
	jmp	$L176$984
; Line 1325
$L983:
	jmp	$L973
; Line 1326
$L985:
; Line 1328
	jmp	$L211$987
; Line 1329
$L986:
	jmp	$L973
; Line 1330
$L988:
; Line 1332
	jmp	$L251$990
; Line 1333
$L989:
	jmp	$L973
; Line 1334
$L991:
; Line 1336
	jmp	$L314$993
; Line 1337
$L992:
	jmp	$L973
; Line 1338
$L994:
; Line 1340
	jmp	$L329$996
; Line 1341
$L995:
	jmp	$L973
; Line 1342
$L997:
; Line 1344
	jmp	$L344$999
; Line 1345
$L998:
	jmp	$L973
; Line 1346
$L1000:
; Line 1348
	jmp	$L359$1002
; Line 1349
$L1001:
	jmp	$L973
; Line 1350
$L1003:
; Line 1352
	jmp	$L387$1005
; Line 1353
$L1004:
	jmp	$L973
; Line 1354
$L1006:
; Line 1356
	jmp	$L399$1008
; Line 1357
$L1007:
	jmp	$L973
; Line 1358
$L1009:
; Line 1360
	jmp	$L414$1011
; Line 1361
$L1010:
	jmp	$L973
; Line 1362
$L1012:
; Line 1364
	jmp	$L429$1014
; Line 1365
$L1013:
	jmp	$L973
; Line 1366
$L1015:
; Line 1368
	jmp	$L444$1017
; Line 1369
$L1016:
	jmp	$L973
; Line 1370
$L1018:
; Line 1372
	jmp	$L459$1020
; Line 1373
$L1019:
	jmp	$L973
; Line 1374
$L1021:
; Line 1376
	jmp	$L474$1023
; Line 1377
$L1022:
	jmp	$L973
; Line 1378
	jmp	$L973
$L972:
	sub	DWORD PTR -60+[ebp], 44			; 0000002cH
	cmp	DWORD PTR -60+[ebp], 34			; 00000022H
	ja	$L973
	shl	DWORD PTR -60+[ebp], 2
	mov	eax, DWORD PTR -60+[ebp]
	jmp	DWORD PTR $L1463[eax]
$L1463:
	DD	OFFSET $L982
	DD	OFFSET $L985
	DD	OFFSET $L1000
	DD	OFFSET $L988
	DD	OFFSET $L973
	DD	OFFSET $L973
	DD	OFFSET $L973
	DD	OFFSET $L973
	DD	OFFSET $L973
	DD	OFFSET $L991
	DD	OFFSET $L994
	DD	OFFSET $L997
	DD	OFFSET $L1003
	DD	OFFSET $L1012
	DD	OFFSET $L1006
	DD	OFFSET $L1018
	DD	OFFSET $L1009
	DD	OFFSET $L1015
	DD	OFFSET $L1021
	DD	OFFSET $L973
	DD	OFFSET $L973
	DD	OFFSET $L973
	DD	OFFSET $L973
	DD	OFFSET $L973
	DD	OFFSET $L973
	DD	OFFSET $L973
	DD	OFFSET $L973
	DD	OFFSET $L973
	DD	OFFSET $L973
	DD	OFFSET $L973
	DD	OFFSET $L973
	DD	OFFSET $L973
	DD	OFFSET $L973
	DD	OFFSET $L979
	DD	OFFSET $L976
$L973:
; Line 1379
	jmp	$ret0$800
; Line 1380
$L136$978:
; Line 1381
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _x2$[ebp], eax
; Line 1382
	push	2
	mov	eax, DWORD PTR _x2$[ebp]
	push	eax
	call	_general_operand
	add	esp, 8
	or	eax, eax
	je	$L1024
; Line 1383
	mov	eax, DWORD PTR _x2$[ebp]
	mov	DWORD PTR _recog_operand+4, eax
	mov	eax, 32					; 00000020H
	jmp	$L730
; Line 1384
$L1024:
$L144$1025:
; Line 1385
	push	1
	mov	eax, DWORD PTR _x2$[ebp]
	push	eax
	call	_general_operand
	add	esp, 8
	or	eax, eax
	je	$L1026
; Line 1386
	mov	eax, DWORD PTR _x2$[ebp]
	mov	DWORD PTR _recog_operand+4, eax
	mov	eax, 34					; 00000022H
	jmp	$L730
; Line 1387
$L1026:
	jmp	$ret0$800
; Line 1388
$L148$981:
; Line 1389
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _x2$[ebp], eax
; Line 1390
	push	2
	mov	eax, DWORD PTR _x2$[ebp]
	push	eax
	call	_general_operand
	add	esp, 8
	or	eax, eax
	je	$L1027
; Line 1391
	mov	eax, DWORD PTR _x2$[ebp]
	mov	DWORD PTR _recog_operand+4, eax
	mov	eax, 35					; 00000023H
	jmp	$L730
; Line 1392
$L1027:
$L156$1028:
; Line 1393
	push	1
	mov	eax, DWORD PTR _x2$[ebp]
	push	eax
	call	_general_operand
	add	esp, 8
	or	eax, eax
	je	$L1029
; Line 1394
	mov	eax, DWORD PTR _x2$[ebp]
	mov	DWORD PTR _recog_operand+4, eax
	mov	eax, 37					; 00000025H
	jmp	$L730
; Line 1395
$L1029:
	jmp	$ret0$800
; Line 1396
$L176$984:
; Line 1397
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _x2$[ebp], eax
; Line 1398
	push	4
	mov	eax, DWORD PTR _x2$[ebp]
	push	eax
	call	_general_operand
	add	esp, 8
	or	eax, eax
	je	$L1030
; Line 1399
	mov	eax, DWORD PTR _x2$[ebp]
	mov	DWORD PTR _recog_operand+4, eax
	jmp	$L177$1031
; Line 1400
$L1030:
	jmp	$ret0$800
; Line 1401
$L177$1031:
; Line 1402
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _x2$[ebp], eax
; Line 1403
	push	4
	mov	eax, DWORD PTR _x2$[ebp]
	push	eax
	call	_general_operand
	add	esp, 8
	or	eax, eax
	je	$L1032
; Line 1404
	mov	eax, DWORD PTR _x2$[ebp]
	mov	DWORD PTR _recog_operand+8, eax
	mov	eax, 42					; 0000002aH
	jmp	$L730
; Line 1405
$L1032:
	jmp	$ret0$800
; Line 1406
$L211$987:
; Line 1407
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _x2$[ebp], eax
; Line 1408
	push	4
	mov	eax, DWORD PTR _x2$[ebp]
	push	eax
	call	_general_operand
	add	esp, 8
	or	eax, eax
	je	$L1033
; Line 1409
	mov	eax, DWORD PTR _x2$[ebp]
	mov	DWORD PTR _recog_operand+4, eax
	jmp	$L212$1034
; Line 1410
$L1033:
	jmp	$ret0$800
; Line 1411
$L212$1034:
; Line 1412
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _x2$[ebp], eax
; Line 1413
	push	4
	mov	eax, DWORD PTR _x2$[ebp]
	push	eax
	call	_general_operand
	add	esp, 8
	or	eax, eax
	je	$L1035
; Line 1414
	mov	eax, DWORD PTR _x2$[ebp]
	mov	DWORD PTR _recog_operand+8, eax
	mov	eax, 49					; 00000031H
	jmp	$L730
; Line 1415
$L1035:
	jmp	$ret0$800
; Line 1416
$L251$990:
; Line 1417
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _x2$[ebp], eax
; Line 1418
	push	4
	mov	eax, DWORD PTR _x2$[ebp]
	push	eax
	call	_general_operand
	add	esp, 8
	or	eax, eax
	je	$L1036
; Line 1419
	mov	eax, DWORD PTR _x2$[ebp]
	mov	DWORD PTR _recog_operand+4, eax
	jmp	$L252$1037
; Line 1420
$L1036:
	jmp	$ret0$800
; Line 1421
$L252$1037:
; Line 1422
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _x2$[ebp], eax
; Line 1423
	push	4
	mov	eax, DWORD PTR _x2$[ebp]
	push	eax
	call	_general_operand
	add	esp, 8
	or	eax, eax
	je	$L1038
; Line 1424
	mov	eax, DWORD PTR _x2$[ebp]
	mov	DWORD PTR _recog_operand+8, eax
	mov	eax, 57					; 00000039H
	jmp	$L730
; Line 1425
$L1038:
	jmp	$ret0$800
; Line 1426
$L314$993:
; Line 1427
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _x2$[ebp], eax
; Line 1428
	push	4
	mov	eax, DWORD PTR _x2$[ebp]
	push	eax
	call	_general_operand
	add	esp, 8
	or	eax, eax
	je	$L1039
; Line 1429
	mov	eax, DWORD PTR _x2$[ebp]
	mov	DWORD PTR _recog_operand+4, eax
	jmp	$L315$1040
; Line 1430
$L1039:
	jmp	$ret0$800
; Line 1431
$L315$1040:
; Line 1432
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _x2$[ebp], eax
; Line 1433
	push	4
	mov	eax, DWORD PTR _x2$[ebp]
	push	eax
	call	_general_operand
	add	esp, 8
	or	eax, eax
	je	$L1041
; Line 1434
	mov	eax, DWORD PTR _x2$[ebp]
	mov	DWORD PTR _recog_operand+8, eax
	mov	eax, 68					; 00000044H
	jmp	$L730
; Line 1435
$L1041:
	jmp	$ret0$800
; Line 1436
$L329$996:
; Line 1437
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _x2$[ebp], eax
; Line 1438
	push	4
	mov	eax, DWORD PTR _x2$[ebp]
	push	eax
	call	_general_operand
	add	esp, 8
	or	eax, eax
	je	$L1042
; Line 1439
	mov	eax, DWORD PTR _x2$[ebp]
	mov	DWORD PTR _recog_operand+4, eax
	jmp	$L330$1043
; Line 1440
$L1042:
	jmp	$ret0$800
; Line 1441
$L330$1043:
; Line 1442
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _x2$[ebp], eax
; Line 1443
	push	4
	mov	eax, DWORD PTR _x2$[ebp]
	push	eax
	call	_general_operand
	add	esp, 8
	or	eax, eax
	je	$L1044
; Line 1444
	mov	eax, DWORD PTR _x2$[ebp]
	mov	DWORD PTR _recog_operand+8, eax
	mov	eax, 71					; 00000047H
	jmp	$L730
; Line 1445
$L1044:
	jmp	$ret0$800
; Line 1446
$L344$999:
; Line 1447
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _x2$[ebp], eax
; Line 1448
	push	4
	mov	eax, DWORD PTR _x2$[ebp]
	push	eax
	call	_general_operand
	add	esp, 8
	or	eax, eax
	je	$L1045
; Line 1449
	mov	eax, DWORD PTR _x2$[ebp]
	mov	DWORD PTR _recog_operand+4, eax
	jmp	$L345$1046
; Line 1450
$L1045:
	jmp	$ret0$800
; Line 1451
$L345$1046:
; Line 1452
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _x2$[ebp], eax
; Line 1453
	push	4
	mov	eax, DWORD PTR _x2$[ebp]
	push	eax
	call	_general_operand
	add	esp, 8
	or	eax, eax
	je	$L1047
; Line 1454
	mov	eax, DWORD PTR _x2$[ebp]
	mov	DWORD PTR _recog_operand+8, eax
	mov	eax, 74					; 0000004aH
	jmp	$L730
; Line 1455
$L1047:
	jmp	$ret0$800
; Line 1456
$L359$1002:
; Line 1457
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _x2$[ebp], eax
; Line 1458
	push	4
	mov	eax, DWORD PTR _x2$[ebp]
	push	eax
	call	_general_operand
	add	esp, 8
	or	eax, eax
	je	$L1048
; Line 1459
	mov	eax, DWORD PTR _x2$[ebp]
	mov	DWORD PTR _recog_operand+4, eax
	mov	eax, 77					; 0000004dH
	jmp	$L730
; Line 1460
$L1048:
	jmp	$ret0$800
; Line 1461
$L387$1005:
; Line 1462
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _x2$[ebp], eax
; Line 1463
	push	4
	mov	eax, DWORD PTR _x2$[ebp]
	push	eax
	call	_general_operand
	add	esp, 8
	or	eax, eax
	je	$L1049
; Line 1464
	mov	eax, DWORD PTR _x2$[ebp]
	mov	DWORD PTR _recog_operand+4, eax
	mov	eax, 84					; 00000054H
	jmp	$L730
; Line 1465
$L1049:
	jmp	$ret0$800
; Line 1466
$L399$1008:
; Line 1467
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _x2$[ebp], eax
; Line 1468
	push	4
	mov	eax, DWORD PTR _x2$[ebp]
	push	eax
	call	_general_operand
	add	esp, 8
	or	eax, eax
	je	$L1050
; Line 1469
	mov	eax, DWORD PTR _x2$[ebp]
	mov	DWORD PTR _recog_operand+4, eax
	jmp	$L400$1051
; Line 1470
$L1050:
	jmp	$ret0$800
; Line 1471
$L400$1051:
; Line 1472
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _x2$[ebp], eax
; Line 1473
	push	4
	mov	eax, DWORD PTR _x2$[ebp]
	push	eax
	call	_general_operand
	add	esp, 8
	or	eax, eax
	je	$L1052
; Line 1474
	mov	eax, DWORD PTR _x2$[ebp]
	mov	DWORD PTR _recog_operand+8, eax
	mov	eax, 87					; 00000057H
	jmp	$L730
; Line 1475
$L1052:
	jmp	$ret0$800
; Line 1476
$L414$1011:
; Line 1477
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _x2$[ebp], eax
; Line 1478
	push	4
	mov	eax, DWORD PTR _x2$[ebp]
	push	eax
	call	_general_operand
	add	esp, 8
	or	eax, eax
	je	$L1053
; Line 1479
	mov	eax, DWORD PTR _x2$[ebp]
	mov	DWORD PTR _recog_operand+4, eax
	jmp	$L415$1054
; Line 1480
$L1053:
	jmp	$ret0$800
; Line 1481
$L415$1054:
; Line 1482
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _x2$[ebp], eax
; Line 1483
	push	4
	mov	eax, DWORD PTR _x2$[ebp]
	push	eax
	call	_general_operand
	add	esp, 8
	or	eax, eax
	je	$L1055
; Line 1484
	mov	eax, DWORD PTR _x2$[ebp]
	mov	DWORD PTR _recog_operand+8, eax
	mov	eax, 90					; 0000005aH
	jmp	$L730
; Line 1485
$L1055:
	jmp	$ret0$800
; Line 1486
$L429$1014:
; Line 1487
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _x2$[ebp], eax
; Line 1488
	push	4
	mov	eax, DWORD PTR _x2$[ebp]
	push	eax
	call	_general_operand
	add	esp, 8
	or	eax, eax
	je	$L1056
; Line 1489
	mov	eax, DWORD PTR _x2$[ebp]
	mov	DWORD PTR _recog_operand+4, eax
	jmp	$L430$1057
; Line 1490
$L1056:
	jmp	$ret0$800
; Line 1491
$L430$1057:
; Line 1492
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _x2$[ebp], eax
; Line 1493
	push	4
	mov	eax, DWORD PTR _x2$[ebp]
	push	eax
	call	_general_operand
	add	esp, 8
	or	eax, eax
	je	$L1058
; Line 1494
	mov	eax, DWORD PTR _x2$[ebp]
	mov	DWORD PTR _recog_operand+8, eax
	mov	eax, 93					; 0000005dH
	jmp	$L730
; Line 1495
$L1058:
	jmp	$ret0$800
; Line 1496
$L444$1017:
; Line 1497
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _x2$[ebp], eax
; Line 1498
	push	4
	mov	eax, DWORD PTR _x2$[ebp]
	push	eax
	call	_general_operand
	add	esp, 8
	or	eax, eax
	je	$L1059
; Line 1499
	mov	eax, DWORD PTR _x2$[ebp]
	mov	DWORD PTR _recog_operand+4, eax
	jmp	$L445$1060
; Line 1500
$L1059:
	jmp	$ret0$800
; Line 1501
$L445$1060:
; Line 1502
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _x2$[ebp], eax
; Line 1503
	push	4
	mov	eax, DWORD PTR _x2$[ebp]
	push	eax
	call	_general_operand
	add	esp, 8
	or	eax, eax
	je	$L1061
; Line 1504
	mov	eax, DWORD PTR _x2$[ebp]
	mov	DWORD PTR _recog_operand+8, eax
	mov	eax, 96					; 00000060H
	jmp	$L730
; Line 1505
$L1061:
	jmp	$ret0$800
; Line 1506
$L459$1020:
; Line 1507
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _x2$[ebp], eax
; Line 1508
	push	4
	mov	eax, DWORD PTR _x2$[ebp]
	push	eax
	call	_general_operand
	add	esp, 8
	or	eax, eax
	je	$L1062
; Line 1509
	mov	eax, DWORD PTR _x2$[ebp]
	mov	DWORD PTR _recog_operand+4, eax
	jmp	$L460$1063
; Line 1510
$L1062:
	jmp	$ret0$800
; Line 1511
$L460$1063:
; Line 1512
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _x2$[ebp], eax
; Line 1513
	push	4
	mov	eax, DWORD PTR _x2$[ebp]
	push	eax
	call	_general_operand
	add	esp, 8
	or	eax, eax
	je	$L1064
; Line 1514
	mov	eax, DWORD PTR _x2$[ebp]
	mov	DWORD PTR _recog_operand+8, eax
	mov	eax, 99					; 00000063H
	jmp	$L730
; Line 1515
$L1064:
	jmp	$ret0$800
; Line 1516
$L474$1023:
; Line 1517
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _x2$[ebp], eax
; Line 1518
	push	4
	mov	eax, DWORD PTR _x2$[ebp]
	push	eax
	call	_general_operand
	add	esp, 8
	or	eax, eax
	je	$L1065
; Line 1519
	mov	eax, DWORD PTR _x2$[ebp]
	mov	DWORD PTR _recog_operand+4, eax
	jmp	$L475$1066
; Line 1520
$L1065:
	jmp	$ret0$800
; Line 1521
$L475$1066:
; Line 1522
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _x2$[ebp], eax
; Line 1523
	push	4
	mov	eax, DWORD PTR _x2$[ebp]
	push	eax
	call	_general_operand
	add	esp, 8
	or	eax, eax
	je	$L1067
; Line 1524
	mov	eax, DWORD PTR _x2$[ebp]
	mov	DWORD PTR _recog_operand+8, eax
	mov	eax, 102				; 00000066H
	jmp	$L730
; Line 1525
$L1067:
	jmp	$ret0$800
; Line 1526
$L99$784:
; Line 1527
	mov	eax, DWORD PTR _x0$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _x1$[ebp], eax
; Line 1528
	push	6
	mov	eax, DWORD PTR _x1$[ebp]
	push	eax
	call	_general_operand
	add	esp, 8
	or	eax, eax
	je	$L1068
; Line 1529
	mov	eax, DWORD PTR _x1$[ebp]
	mov	DWORD PTR _recog_operand+4, eax
	mov	eax, 23					; 00000017H
	jmp	$L730
; Line 1530
$L1068:
	mov	eax, DWORD PTR _x0$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _x1$[ebp], eax
; Line 1531
	jmp	$L101$785
; Line 1532
$L102$787:
; Line 1533
	mov	eax, DWORD PTR _x0$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _x1$[ebp], eax
; Line 1534
	push	6
	mov	eax, DWORD PTR _x1$[ebp]
	push	eax
	call	_general_operand
	add	esp, 8
	or	eax, eax
	je	$L1069
; Line 1535
	mov	eax, DWORD PTR _x1$[ebp]
	mov	DWORD PTR _recog_operand+4, eax
	mov	eax, 24					; 00000018H
	jmp	$L730
; Line 1536
$L1069:
	jmp	$ret0$800
; Line 1537
$L87$790:
; Line 1538
	mov	eax, DWORD PTR _x0$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _x1$[ebp], eax
; Line 1539
	push	10					; 0000000aH
	mov	eax, DWORD PTR _x1$[ebp]
	push	eax
	call	_general_operand
	add	esp, 8
	or	eax, eax
	je	$L1070
; Line 1540
	mov	eax, DWORD PTR _x1$[ebp]
	mov	DWORD PTR _recog_operand+4, eax
	mov	eax, 19					; 00000013H
	jmp	$L730
; Line 1541
$L1070:
	mov	eax, DWORD PTR _x0$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _x1$[ebp], eax
; Line 1542
	jmp	$L89$791
; Line 1543
$L90$793:
; Line 1544
	mov	eax, DWORD PTR _x0$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _x1$[ebp], eax
; Line 1545
	push	10					; 0000000aH
	mov	eax, DWORD PTR _x1$[ebp]
	push	eax
	call	_general_operand
	add	esp, 8
	or	eax, eax
	je	$L1071
; Line 1546
	mov	eax, DWORD PTR _x1$[ebp]
	mov	DWORD PTR _recog_operand+4, eax
	mov	eax, 20					; 00000014H
	jmp	$L730
; Line 1547
$L1071:
$L163$1072:
; Line 1548
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	mov	ecx, 167772160				; 0a000000H
	and	ecx, -16777216				; ff000000H
	cmp	eax, ecx
	je	$L1073
; Line 1549
	jmp	$ret0$800
; Line 1550
$L1073:
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	sar	eax, 16					; 00000010H
	mov	DWORD PTR -64+[ebp], eax
	jmp	$L1074
; Line 1552
$L1078:
; Line 1554
	jmp	$L164$1080
; Line 1555
$L1079:
	jmp	$L1075
; Line 1556
$L1081:
; Line 1558
	jmp	$L168$1083
; Line 1559
$L1082:
	jmp	$L1075
; Line 1560
$L1084:
; Line 1562
	jmp	$L206$1086
; Line 1563
$L1085:
	jmp	$L1075
; Line 1564
$L1087:
; Line 1566
	jmp	$L241$1089
; Line 1567
$L1088:
	jmp	$L1075
; Line 1568
$L1090:
; Line 1570
	jmp	$L277$1092
; Line 1571
$L1091:
	jmp	$L1075
; Line 1572
$L1093:
; Line 1574
	jmp	$L287$1095
; Line 1575
$L1094:
	jmp	$L1075
; Line 1576
$L1096:
; Line 1578
	jmp	$L371$1098
; Line 1579
$L1097:
	jmp	$L1075
; Line 1580
$L1099:
; Line 1582
	jmp	$L379$1101
; Line 1583
$L1100:
	jmp	$L1075
; Line 1584
	jmp	$L1075
$L1074:
	cmp	DWORD PTR -64+[ebp], 48			; 00000030H
	jg	$L1459
	je	$L287$1095
	cmp	DWORD PTR -64+[ebp], 44			; 0000002cH
	je	$L206$1086
	cmp	DWORD PTR -64+[ebp], 45			; 0000002dH
	je	$L241$1089
	cmp	DWORD PTR -64+[ebp], 46			; 0000002eH
	je	$L371$1098
	cmp	DWORD PTR -64+[ebp], 47			; 0000002fH
	je	$L277$1092
	jmp	$L1075
$L1459:
	cmp	DWORD PTR -64+[ebp], 81			; 00000051H
	je	$L164$1080
	cmp	DWORD PTR -64+[ebp], 82			; 00000052H
	je	$L168$1083
	cmp	DWORD PTR -64+[ebp], 86			; 00000056H
	je	$L379$1101
	jmp	$L1075
$L1075:
; Line 1585
	jmp	$ret0$800
; Line 1586
$L164$1080:
; Line 1587
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _x2$[ebp], eax
; Line 1588
	push	11					; 0000000bH
	mov	eax, DWORD PTR _x2$[ebp]
	push	eax
	call	_general_operand
	add	esp, 8
	or	eax, eax
	je	$L1102
; Line 1589
	mov	eax, DWORD PTR _x2$[ebp]
	mov	DWORD PTR _recog_operand+4, eax
	test	BYTE PTR _target_flags, 1
	je	$L1103
	mov	eax, 39					; 00000027H
	jmp	$L730
$L1103:
; Line 1590
$L1102:
	jmp	$ret0$800
; Line 1591
$L168$1083:
; Line 1592
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _x2$[ebp], eax
; Line 1593
	push	4
	mov	eax, DWORD PTR _x2$[ebp]
	push	eax
	call	_general_operand
	add	esp, 8
	or	eax, eax
	je	$L1104
; Line 1594
	mov	eax, DWORD PTR _x2$[ebp]
	mov	DWORD PTR _recog_operand+4, eax
	test	BYTE PTR _target_flags, 1
	je	$L1105
	mov	eax, 40					; 00000028H
	jmp	$L730
$L1105:
; Line 1595
$L1104:
	jmp	$ret0$800
; Line 1596
$L206$1086:
; Line 1597
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _x2$[ebp], eax
; Line 1598
	push	10					; 0000000aH
	mov	eax, DWORD PTR _x2$[ebp]
	push	eax
	call	_general_operand
	add	esp, 8
	or	eax, eax
	je	$L1106
; Line 1599
	mov	eax, DWORD PTR _x2$[ebp]
	mov	DWORD PTR _recog_operand+4, eax
	jmp	$L207$1107
; Line 1600
$L1106:
	jmp	$ret0$800
; Line 1601
$L207$1107:
; Line 1602
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _x2$[ebp], eax
; Line 1603
	push	10					; 0000000aH
	mov	eax, DWORD PTR _x2$[ebp]
	push	eax
	call	_general_operand
	add	esp, 8
	or	eax, eax
	je	$L1108
; Line 1604
	mov	eax, DWORD PTR _x2$[ebp]
	mov	DWORD PTR _recog_operand+8, eax
	test	BYTE PTR _target_flags, 1
	je	$L1109
	mov	eax, 48					; 00000030H
	jmp	$L730
$L1109:
; Line 1605
$L1108:
	jmp	$ret0$800
; Line 1606
$L241$1089:
; Line 1607
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _x2$[ebp], eax
; Line 1608
	push	10					; 0000000aH
	mov	eax, DWORD PTR _x2$[ebp]
	push	eax
	call	_general_operand
	add	esp, 8
	or	eax, eax
	je	$L1110
; Line 1609
	mov	eax, DWORD PTR _x2$[ebp]
	mov	DWORD PTR _recog_operand+4, eax
	jmp	$L242$1111
; Line 1610
$L1110:
	jmp	$ret0$800
; Line 1611
$L242$1111:
; Line 1612
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _x2$[ebp], eax
; Line 1613
	push	10					; 0000000aH
	mov	eax, DWORD PTR _x2$[ebp]
	push	eax
	call	_general_operand
	add	esp, 8
	or	eax, eax
	je	$L1112
; Line 1614
	mov	eax, DWORD PTR _x2$[ebp]
	mov	DWORD PTR _recog_operand+8, eax
	test	BYTE PTR _target_flags, 1
	je	$L1113
	mov	eax, 55					; 00000037H
	jmp	$L730
$L1113:
; Line 1615
$L1112:
	jmp	$ret0$800
; Line 1616
$L277$1092:
; Line 1617
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _x2$[ebp], eax
; Line 1618
	push	10					; 0000000aH
	mov	eax, DWORD PTR _x2$[ebp]
	push	eax
	call	_general_operand
	add	esp, 8
	or	eax, eax
	je	$L1114
; Line 1619
	mov	eax, DWORD PTR _x2$[ebp]
	mov	DWORD PTR _recog_operand+4, eax
	jmp	$L278$1115
; Line 1620
$L1114:
	jmp	$ret0$800
; Line 1621
$L278$1115:
; Line 1622
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _x2$[ebp], eax
; Line 1623
	push	10					; 0000000aH
	mov	eax, DWORD PTR _x2$[ebp]
	push	eax
	call	_general_operand
	add	esp, 8
	or	eax, eax
	je	$L1116
; Line 1624
	mov	eax, DWORD PTR _x2$[ebp]
	mov	DWORD PTR _recog_operand+8, eax
	test	BYTE PTR _target_flags, 1
	je	$L1117
	mov	eax, 61					; 0000003dH
	jmp	$L730
$L1117:
; Line 1625
$L1116:
	jmp	$ret0$800
; Line 1626
$L287$1095:
; Line 1627
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _x2$[ebp], eax
; Line 1628
	push	10					; 0000000aH
	mov	eax, DWORD PTR _x2$[ebp]
	push	eax
	call	_general_operand
	add	esp, 8
	or	eax, eax
	je	$L1118
; Line 1629
	mov	eax, DWORD PTR _x2$[ebp]
	mov	DWORD PTR _recog_operand+4, eax
	jmp	$L288$1119
; Line 1630
$L1118:
	jmp	$ret0$800
; Line 1631
$L288$1119:
; Line 1632
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _x2$[ebp], eax
; Line 1633
	push	10					; 0000000aH
	mov	eax, DWORD PTR _x2$[ebp]
	push	eax
	call	_general_operand
	add	esp, 8
	or	eax, eax
	je	$L1120
; Line 1634
	mov	eax, DWORD PTR _x2$[ebp]
	mov	DWORD PTR _recog_operand+8, eax
	test	BYTE PTR _target_flags, 1
	je	$L1121
	mov	eax, 63					; 0000003fH
	jmp	$L730
$L1121:
; Line 1635
$L1120:
	jmp	$ret0$800
; Line 1636
$L371$1098:
; Line 1637
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _x2$[ebp], eax
; Line 1638
	push	10					; 0000000aH
	mov	eax, DWORD PTR _x2$[ebp]
	push	eax
	call	_general_operand
	add	esp, 8
	or	eax, eax
	je	$L1122
; Line 1639
	mov	eax, DWORD PTR _x2$[ebp]
	mov	DWORD PTR _recog_operand+4, eax
	test	BYTE PTR _target_flags, 1
	je	$L1123
	mov	eax, 80					; 00000050H
	jmp	$L730
$L1123:
; Line 1640
$L1122:
	jmp	$ret0$800
; Line 1641
$L379$1101:
; Line 1642
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _x2$[ebp], eax
; Line 1643
	push	10					; 0000000aH
	mov	eax, DWORD PTR _x2$[ebp]
	push	eax
	call	_general_operand
	add	esp, 8
	or	eax, eax
	je	$L1124
; Line 1644
	mov	eax, DWORD PTR _x2$[ebp]
	mov	DWORD PTR _recog_operand+4, eax
	test	BYTE PTR _target_flags, 1
	je	$L1125
	mov	eax, 82					; 00000052H
	jmp	$L730
$L1125:
; Line 1645
$L1124:
	jmp	$ret0$800
; Line 1646
$L93$796:
; Line 1647
	mov	eax, DWORD PTR _x0$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _x1$[ebp], eax
; Line 1648
	push	11					; 0000000bH
	mov	eax, DWORD PTR _x1$[ebp]
	push	eax
	call	_general_operand
	add	esp, 8
	or	eax, eax
	je	$L1126
; Line 1649
	mov	eax, DWORD PTR _x1$[ebp]
	mov	DWORD PTR _recog_operand+4, eax
	mov	eax, 21					; 00000015H
	jmp	$L730
; Line 1650
$L1126:
	mov	eax, DWORD PTR _x0$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _x1$[ebp], eax
; Line 1651
	jmp	$L95$797
; Line 1652
$L96$799:
; Line 1653
	mov	eax, DWORD PTR _x0$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _x1$[ebp], eax
; Line 1654
	push	11					; 0000000bH
	mov	eax, DWORD PTR _x1$[ebp]
	push	eax
	call	_general_operand
	add	esp, 8
	or	eax, eax
	je	$L1127
; Line 1655
	mov	eax, DWORD PTR _x1$[ebp]
	mov	DWORD PTR _recog_operand+4, eax
	mov	eax, 22					; 00000016H
	jmp	$L730
; Line 1656
$L1127:
$L159$1128:
; Line 1657
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	mov	ecx, 184549376				; 0b000000H
	and	ecx, -16777216				; ff000000H
	cmp	eax, ecx
	je	$L1129
; Line 1658
	jmp	$ret0$800
; Line 1659
$L1129:
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	sar	eax, 16					; 00000010H
	mov	DWORD PTR -68+[ebp], eax
	jmp	$L1130
; Line 1661
$L1134:
; Line 1663
	jmp	$L160$1136
; Line 1664
$L1135:
	jmp	$L1131
; Line 1665
$L1137:
; Line 1667
	jmp	$L172$1139
; Line 1668
$L1138:
	jmp	$L1131
; Line 1669
$L1140:
; Line 1671
	jmp	$L201$1142
; Line 1672
$L1141:
	jmp	$L1131
; Line 1673
$L1143:
; Line 1675
	jmp	$L236$1145
; Line 1676
$L1144:
	jmp	$L1131
; Line 1677
$L1146:
; Line 1679
	jmp	$L272$1148
; Line 1680
$L1147:
	jmp	$L1131
; Line 1681
$L1149:
; Line 1683
	jmp	$L282$1151
; Line 1684
$L1150:
	jmp	$L1131
; Line 1685
$L1152:
; Line 1687
	jmp	$L375$1154
; Line 1688
$L1153:
	jmp	$L1131
; Line 1689
$L1155:
; Line 1691
	jmp	$L383$1157
; Line 1692
$L1156:
	jmp	$L1131
; Line 1693
	jmp	$L1131
$L1130:
	cmp	DWORD PTR -68+[ebp], 48			; 00000030H
	jg	$L1460
	je	$L282$1151
	cmp	DWORD PTR -68+[ebp], 44			; 0000002cH
	je	$L201$1142
	cmp	DWORD PTR -68+[ebp], 45			; 0000002dH
	je	$L236$1145
	cmp	DWORD PTR -68+[ebp], 46			; 0000002eH
	je	$L375$1154
	cmp	DWORD PTR -68+[ebp], 47			; 0000002fH
	je	$L272$1148
	jmp	$L1131
$L1460:
	cmp	DWORD PTR -68+[ebp], 80			; 00000050H
	je	$L160$1136
	cmp	DWORD PTR -68+[ebp], 82			; 00000052H
	je	$L172$1139
	cmp	DWORD PTR -68+[ebp], 86			; 00000056H
	je	$L383$1157
	jmp	$L1131
$L1131:
; Line 1694
	jmp	$ret0$800
; Line 1695
$L160$1136:
; Line 1696
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _x2$[ebp], eax
; Line 1697
	push	10					; 0000000aH
	mov	eax, DWORD PTR _x2$[ebp]
	push	eax
	call	_general_operand
	add	esp, 8
	or	eax, eax
	je	$L1158
; Line 1698
	mov	eax, DWORD PTR _x2$[ebp]
	mov	DWORD PTR _recog_operand+4, eax
	test	BYTE PTR _target_flags, 1
	je	$L1159
	mov	eax, 38					; 00000026H
	jmp	$L730
$L1159:
; Line 1699
$L1158:
	jmp	$ret0$800
; Line 1700
$L172$1139:
; Line 1701
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _x2$[ebp], eax
; Line 1702
	push	4
	mov	eax, DWORD PTR _x2$[ebp]
	push	eax
	call	_general_operand
	add	esp, 8
	or	eax, eax
	je	$L1160
; Line 1703
	mov	eax, DWORD PTR _x2$[ebp]
	mov	DWORD PTR _recog_operand+4, eax
	test	BYTE PTR _target_flags, 1
	je	$L1161
	mov	eax, 41					; 00000029H
	jmp	$L730
$L1161:
; Line 1704
$L1160:
	jmp	$ret0$800
; Line 1705
$L201$1142:
; Line 1706
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _x2$[ebp], eax
; Line 1707
	push	11					; 0000000bH
	mov	eax, DWORD PTR _x2$[ebp]
	push	eax
	call	_general_operand
	add	esp, 8
	or	eax, eax
	je	$L1162
; Line 1708
	mov	eax, DWORD PTR _x2$[ebp]
	mov	DWORD PTR _recog_operand+4, eax
	jmp	$L202$1163
; Line 1709
$L1162:
	jmp	$ret0$800
; Line 1710
$L202$1163:
; Line 1711
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _x2$[ebp], eax
; Line 1712
	push	11					; 0000000bH
	mov	eax, DWORD PTR _x2$[ebp]
	push	eax
	call	_general_operand
	add	esp, 8
	or	eax, eax
	je	$L1164
; Line 1713
	mov	eax, DWORD PTR _x2$[ebp]
	mov	DWORD PTR _recog_operand+8, eax
	test	BYTE PTR _target_flags, 1
	je	$L1165
	mov	eax, 47					; 0000002fH
	jmp	$L730
$L1165:
; Line 1714
$L1164:
	jmp	$ret0$800
; Line 1715
$L236$1145:
; Line 1716
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _x2$[ebp], eax
; Line 1717
	push	11					; 0000000bH
	mov	eax, DWORD PTR _x2$[ebp]
	push	eax
	call	_general_operand
	add	esp, 8
	or	eax, eax
	je	$L1166
; Line 1718
	mov	eax, DWORD PTR _x2$[ebp]
	mov	DWORD PTR _recog_operand+4, eax
	jmp	$L237$1167
; Line 1719
$L1166:
	jmp	$ret0$800
; Line 1720
$L237$1167:
; Line 1721
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _x2$[ebp], eax
; Line 1722
	push	11					; 0000000bH
	mov	eax, DWORD PTR _x2$[ebp]
	push	eax
	call	_general_operand
	add	esp, 8
	or	eax, eax
	je	$L1168
; Line 1723
	mov	eax, DWORD PTR _x2$[ebp]
	mov	DWORD PTR _recog_operand+8, eax
	test	BYTE PTR _target_flags, 1
	je	$L1169
	mov	eax, 54					; 00000036H
	jmp	$L730
$L1169:
; Line 1724
$L1168:
	jmp	$ret0$800
; Line 1725
$L272$1148:
; Line 1726
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _x2$[ebp], eax
; Line 1727
	push	11					; 0000000bH
	mov	eax, DWORD PTR _x2$[ebp]
	push	eax
	call	_general_operand
	add	esp, 8
	or	eax, eax
	je	$L1170
; Line 1728
	mov	eax, DWORD PTR _x2$[ebp]
	mov	DWORD PTR _recog_operand+4, eax
	jmp	$L273$1171
; Line 1729
$L1170:
	jmp	$ret0$800
; Line 1730
$L273$1171:
; Line 1731
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _x2$[ebp], eax
; Line 1732
	push	11					; 0000000bH
	mov	eax, DWORD PTR _x2$[ebp]
	push	eax
	call	_general_operand
	add	esp, 8
	or	eax, eax
	je	$L1172
; Line 1733
	mov	eax, DWORD PTR _x2$[ebp]
	mov	DWORD PTR _recog_operand+8, eax
	test	BYTE PTR _target_flags, 1
	je	$L1173
	mov	eax, 60					; 0000003cH
	jmp	$L730
$L1173:
; Line 1734
$L1172:
	jmp	$ret0$800
; Line 1735
$L282$1151:
; Line 1736
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _x2$[ebp], eax
; Line 1737
	push	11					; 0000000bH
	mov	eax, DWORD PTR _x2$[ebp]
	push	eax
	call	_general_operand
	add	esp, 8
	or	eax, eax
	je	$L1174
; Line 1738
	mov	eax, DWORD PTR _x2$[ebp]
	mov	DWORD PTR _recog_operand+4, eax
	jmp	$L283$1175
; Line 1739
$L1174:
	jmp	$ret0$800
; Line 1740
$L283$1175:
; Line 1741
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _x2$[ebp], eax
; Line 1742
	push	11					; 0000000bH
	mov	eax, DWORD PTR _x2$[ebp]
	push	eax
	call	_general_operand
	add	esp, 8
	or	eax, eax
	je	$L1176
; Line 1743
	mov	eax, DWORD PTR _x2$[ebp]
	mov	DWORD PTR _recog_operand+8, eax
	test	BYTE PTR _target_flags, 1
	je	$L1177
	mov	eax, 62					; 0000003eH
	jmp	$L730
$L1177:
; Line 1744
$L1176:
	jmp	$ret0$800
; Line 1745
$L375$1154:
; Line 1746
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _x2$[ebp], eax
; Line 1747
	push	11					; 0000000bH
	mov	eax, DWORD PTR _x2$[ebp]
	push	eax
	call	_general_operand
	add	esp, 8
	or	eax, eax
	je	$L1178
; Line 1748
	mov	eax, DWORD PTR _x2$[ebp]
	mov	DWORD PTR _recog_operand+4, eax
	test	BYTE PTR _target_flags, 1
	je	$L1179
	mov	eax, 81					; 00000051H
	jmp	$L730
$L1179:
; Line 1749
$L1178:
	jmp	$ret0$800
; Line 1750
$L383$1157:
; Line 1751
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _x2$[ebp], eax
; Line 1752
	push	11					; 0000000bH
	mov	eax, DWORD PTR _x2$[ebp]
	push	eax
	call	_general_operand
	add	esp, 8
	or	eax, eax
	je	$L1180
; Line 1753
	mov	eax, DWORD PTR _x2$[ebp]
	mov	DWORD PTR _recog_operand+4, eax
	test	BYTE PTR _target_flags, 1
	je	$L1181
	mov	eax, 83					; 00000053H
	jmp	$L730
$L1181:
; Line 1754
$L1180:
	jmp	$ret0$800
; Line 1755
$ret0$800:
	mov	eax, -1
	jmp	$L730
; Line 1756
$L730:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_recog_3 ENDP
_TEXT	ENDS
PUBLIC	_recog_4
EXTRN	_rtx_equal_p:NEAR
_TEXT	SEGMENT
_x0$ = 8
_insn$ = 12
_x1$ = -44
_x2$ = -20
_x3$ = -40
_recog_4 PROC NEAR
; Line 1762
	push	ebp
	mov	ebp, esp
	sub	esp, 52					; 00000034H
	push	ebx
	push	esi
	push	edi
; Line 1766
$L0$1198:
; Line 1767
	mov	eax, DWORD PTR _x0$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	sar	eax, 16					; 00000010H
	mov	DWORD PTR -52+[ebp], eax
	jmp	$L1199
; Line 1769
$L1203:
; Line 1771
	jmp	$L1$1205
; Line 1772
$L1204:
	jmp	$L1200
; Line 1773
$L1206:
; Line 1774
	mov	eax, DWORD PTR _x0$[ebp]
	mov	eax, DWORD PTR [eax+4]
	cmp	DWORD PTR [eax], 2
	jne	$L1207
; Line 1775
	jmp	$L10$1208
; Line 1776
$L1207:
	jmp	$L1200
; Line 1777
$L1209:
; Line 1779
	jmp	$L728$1211
; Line 1780
$L1210:
	jmp	$L1200
; Line 1781
$L1212:
; Line 1782
	mov	eax, DWORD PTR _x0$[ebp]
	cmp	DWORD PTR _const0_rtx, eax
	jne	$L1213
; Line 1783
	mov	eax, 141				; 0000008dH
	jmp	$L1185
; Line 1784
$L1213:
	jmp	$L1200
; Line 1785
	jmp	$L1200
$L1199:
	cmp	DWORD PTR -52+[ebp], 20			; 00000014H
	je	$L1206
	cmp	DWORD PTR -52+[ebp], 25			; 00000019H
	je	$L1$1205
	cmp	DWORD PTR -52+[ebp], 28			; 0000001cH
	je	$L728$1211
	cmp	DWORD PTR -52+[ebp], 30			; 0000001eH
	je	$L1212
	jmp	$L1200
$L1200:
; Line 1786
	jmp	$ret0$1214
; Line 1787
$L1$1205:
; Line 1788
	mov	eax, DWORD PTR _insn$[ebp]
	push	eax
	mov	eax, DWORD PTR _x0$[ebp]
	push	eax
	call	_recog_3
	add	esp, 8
	jmp	$L1185
; Line 1789
$L10$1208:
; Line 1790
	mov	eax, DWORD PTR _x0$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _x1$[ebp], eax
; Line 1791
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1638400				; 00190000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1215
; Line 1792
	jmp	$L11$1216
; Line 1793
$L1215:
	jmp	$ret0$1214
; Line 1794
$L11$1216:
; Line 1795
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _x2$[ebp], eax
; Line 1796
	mov	eax, DWORD PTR _x2$[ebp]
	cmp	DWORD PTR _cc0_rtx, eax
	jne	$L1217
; Line 1797
	jmp	$L12$1218
; Line 1798
$L1217:
	mov	eax, DWORD PTR _x2$[ebp]
	cmp	DWORD PTR _pc_rtx, eax
	jne	$L1219
; Line 1799
	jmp	$L723$1220
; Line 1800
$L1219:
$L255$1221:
; Line 1801
	push	2
	mov	eax, DWORD PTR _x2$[ebp]
	push	eax
	call	_general_operand
	add	esp, 8
	or	eax, eax
	je	$L1222
; Line 1802
	mov	eax, DWORD PTR _x2$[ebp]
	mov	DWORD PTR _recog_operand, eax
	jmp	$L256$1223
; Line 1803
$L1222:
$L263$1224:
; Line 1804
	push	4
	mov	eax, DWORD PTR _x2$[ebp]
	push	eax
	call	_general_operand
	add	esp, 8
	or	eax, eax
	je	$L1225
; Line 1805
	mov	eax, DWORD PTR _x2$[ebp]
	mov	DWORD PTR _recog_operand, eax
	jmp	$L264$1226
; Line 1806
$L1225:
	jmp	$ret0$1214
; Line 1807
$L12$1218:
; Line 1808
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _x2$[ebp], eax
; Line 1809
	push	10					; 0000000aH
	mov	eax, DWORD PTR _x2$[ebp]
	push	eax
	call	_general_operand
	add	esp, 8
	or	eax, eax
	je	$L1227
; Line 1810
	mov	eax, DWORD PTR _x2$[ebp]
	mov	DWORD PTR _recog_operand, eax
	jmp	$L13$1228
; Line 1811
$L1227:
$L18$1229:
; Line 1812
	push	11					; 0000000bH
	mov	eax, DWORD PTR _x2$[ebp]
	push	eax
	call	_general_operand
	add	esp, 8
	or	eax, eax
	je	$L1230
; Line 1813
	mov	eax, DWORD PTR _x2$[ebp]
	mov	DWORD PTR _recog_operand, eax
	jmp	$L19$1231
; Line 1814
$L1230:
$L39$1232:
; Line 1815
	mov	eax, DWORD PTR _x2$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2818048				; 002b0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1233
; Line 1816
	jmp	$L40$1234
; Line 1817
$L1233:
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _x2$[ebp], eax
; Line 1818
	jmp	$L255$1221
; Line 1819
$L13$1228:
; Line 1820
	mov	eax, DWORD PTR _x0$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _x1$[ebp], eax
; Line 1821
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1769472				; 001b0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1235
; Line 1822
	jmp	$L14$1236
; Line 1823
$L1235:
	mov	eax, DWORD PTR _x0$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _x1$[ebp], eax
; Line 1824
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _x2$[ebp], eax
; Line 1825
	jmp	$L18$1229
; Line 1826
$L14$1236:
; Line 1827
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _x2$[ebp], eax
; Line 1828
	mov	eax, DWORD PTR _x2$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1237
	mov	eax, DWORD PTR _x2$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	mov	ecx, 67108864				; 04000000H
	and	ecx, -16777216				; ff000000H
	cmp	eax, ecx
	jne	$L1237
	mov	eax, DWORD PTR _x2$[ebp]
	cmp	DWORD PTR [eax+4], 0
	jne	$L1237
; Line 1829
	test	BYTE PTR _target_flags, 1
	je	$L1238
	mov	eax, 3
	jmp	$L1185
; Line 1830
$L1238:
$L1237:
	mov	eax, DWORD PTR _x0$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _x1$[ebp], eax
; Line 1831
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _x2$[ebp], eax
; Line 1832
	jmp	$L18$1229
; Line 1833
$L19$1231:
; Line 1834
	mov	eax, DWORD PTR _x0$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _x1$[ebp], eax
; Line 1835
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1769472				; 001b0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1239
; Line 1836
	jmp	$L20$1240
; Line 1837
$L1239:
	mov	eax, DWORD PTR _x0$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _x1$[ebp], eax
; Line 1838
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _x2$[ebp], eax
; Line 1839
	jmp	$L39$1232
; Line 1840
$L20$1240:
; Line 1841
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _x2$[ebp], eax
; Line 1842
	mov	eax, DWORD PTR _x2$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1241
	mov	eax, DWORD PTR _x2$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	mov	ecx, 67108864				; 04000000H
	and	ecx, -16777216				; ff000000H
	cmp	eax, ecx
	jne	$L1241
	mov	eax, DWORD PTR _x2$[ebp]
	cmp	DWORD PTR [eax+4], 0
	jne	$L1241
; Line 1843
	test	BYTE PTR _target_flags, 1
	je	$L1242
	mov	eax, 4
	jmp	$L1185
; Line 1844
$L1242:
$L1241:
	mov	eax, DWORD PTR _x0$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _x1$[ebp], eax
; Line 1845
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _x2$[ebp], eax
; Line 1846
	jmp	$L39$1232
; Line 1847
$L40$1234:
; Line 1848
	mov	eax, DWORD PTR _x2$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _x3$[ebp], eax
; Line 1849
	push	11					; 0000000bH
	mov	eax, DWORD PTR _x3$[ebp]
	push	eax
	call	_general_operand
	add	esp, 8
	or	eax, eax
	je	$L1243
; Line 1850
	mov	eax, DWORD PTR _x3$[ebp]
	mov	DWORD PTR _recog_operand, eax
	jmp	$L41$1244
; Line 1851
$L1243:
$L48$1245:
; Line 1852
	push	10					; 0000000aH
	mov	eax, DWORD PTR _x3$[ebp]
	push	eax
	call	_general_operand
	add	esp, 8
	or	eax, eax
	je	$L1246
; Line 1853
	mov	eax, DWORD PTR _x3$[ebp]
	mov	DWORD PTR _recog_operand, eax
	jmp	$L49$1247
; Line 1854
$L1246:
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _x2$[ebp], eax
; Line 1855
	jmp	$L255$1221
; Line 1856
$L41$1244:
; Line 1857
	mov	eax, DWORD PTR _x2$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _x3$[ebp], eax
; Line 1858
	push	11					; 0000000bH
	mov	eax, DWORD PTR _x3$[ebp]
	push	eax
	call	_general_operand
	add	esp, 8
	or	eax, eax
	je	$L1248
; Line 1859
	mov	eax, DWORD PTR _x3$[ebp]
	mov	DWORD PTR _recog_operand+4, eax
	jmp	$L42$1249
; Line 1860
$L1248:
	mov	eax, DWORD PTR _x2$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _x3$[ebp], eax
; Line 1861
	jmp	$L48$1245
; Line 1862
$L42$1249:
; Line 1863
	mov	eax, DWORD PTR _x0$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _x1$[ebp], eax
; Line 1864
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1769472				; 001b0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1250
; Line 1865
	jmp	$L43$1251
; Line 1866
$L1250:
	mov	eax, DWORD PTR _x0$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _x1$[ebp], eax
; Line 1867
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _x2$[ebp], eax
; Line 1868
	mov	eax, DWORD PTR _x2$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _x3$[ebp], eax
; Line 1869
	jmp	$L48$1245
; Line 1870
$L43$1251:
; Line 1871
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _x2$[ebp], eax
; Line 1872
	mov	eax, DWORD PTR _x2$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1252
	mov	eax, DWORD PTR _x2$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	mov	ecx, 67108864				; 04000000H
	and	ecx, -16777216				; ff000000H
	cmp	eax, ecx
	jne	$L1252
	mov	eax, DWORD PTR _x2$[ebp]
	cmp	DWORD PTR [eax+4], 0
	jne	$L1252
; Line 1873
	test	BYTE PTR _target_flags, 1
	je	$L1253
	mov	eax, 8
	jmp	$L1185
; Line 1874
$L1253:
$L1252:
	mov	eax, DWORD PTR _x0$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _x1$[ebp], eax
; Line 1875
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _x2$[ebp], eax
; Line 1876
	mov	eax, DWORD PTR _x2$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _x3$[ebp], eax
; Line 1877
	jmp	$L48$1245
; Line 1878
$L49$1247:
; Line 1879
	mov	eax, DWORD PTR _x2$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _x3$[ebp], eax
; Line 1880
	push	10					; 0000000aH
	mov	eax, DWORD PTR _x3$[ebp]
	push	eax
	call	_general_operand
	add	esp, 8
	or	eax, eax
	je	$L1254
; Line 1881
	mov	eax, DWORD PTR _x3$[ebp]
	mov	DWORD PTR _recog_operand+4, eax
	jmp	$L50$1255
; Line 1882
$L1254:
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _x2$[ebp], eax
; Line 1883
	jmp	$L255$1221
; Line 1884
$L50$1255:
; Line 1885
	mov	eax, DWORD PTR _x0$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _x1$[ebp], eax
; Line 1886
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1769472				; 001b0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1256
; Line 1887
	jmp	$L51$1257
; Line 1888
$L1256:
	mov	eax, DWORD PTR _x0$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _x1$[ebp], eax
; Line 1889
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _x2$[ebp], eax
; Line 1890
	jmp	$L255$1221
; Line 1891
$L51$1257:
; Line 1892
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _x2$[ebp], eax
; Line 1893
	mov	eax, DWORD PTR _x2$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1258
	mov	eax, DWORD PTR _x2$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	mov	ecx, 67108864				; 04000000H
	and	ecx, -16777216				; ff000000H
	cmp	eax, ecx
	jne	$L1258
	mov	eax, DWORD PTR _x2$[ebp]
	cmp	DWORD PTR [eax+4], 0
	jne	$L1258
; Line 1894
	test	BYTE PTR _target_flags, 1
	je	$L1259
	mov	eax, 9
	jmp	$L1185
; Line 1895
$L1259:
$L1258:
	mov	eax, DWORD PTR _x0$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _x1$[ebp], eax
; Line 1896
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _x2$[ebp], eax
; Line 1897
	jmp	$L255$1221
; Line 1898
$L723$1220:
; Line 1899
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _x2$[ebp], eax
; Line 1900
	push	4
	mov	eax, DWORD PTR _x2$[ebp]
	push	eax
	call	_general_operand
	add	esp, 8
	or	eax, eax
	je	$L1260
; Line 1901
	mov	eax, DWORD PTR _x2$[ebp]
	mov	DWORD PTR _recog_operand, eax
	jmp	$L724$1261
; Line 1902
$L1260:
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _x2$[ebp], eax
; Line 1903
	jmp	$L255$1221
; Line 1904
$L724$1261:
; Line 1905
	mov	eax, DWORD PTR _x0$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _x1$[ebp], eax
; Line 1906
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1703936				; 001a0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1262
; Line 1907
	jmp	$L725$1263
; Line 1908
$L1262:
	mov	eax, DWORD PTR _x0$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _x1$[ebp], eax
; Line 1909
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _x2$[ebp], eax
; Line 1910
	jmp	$L255$1221
; Line 1911
$L725$1263:
; Line 1912
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _x2$[ebp], eax
; Line 1913
	mov	eax, DWORD PTR _x2$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2490368				; 00260000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1264
; Line 1914
	jmp	$L726$1265
; Line 1915
$L1264:
	mov	eax, DWORD PTR _x0$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _x1$[ebp], eax
; Line 1916
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _x2$[ebp], eax
; Line 1917
	jmp	$L255$1221
; Line 1918
$L726$1265:
; Line 1919
	mov	eax, DWORD PTR _x2$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _x3$[ebp], eax
; Line 1921
	mov	eax, DWORD PTR _x3$[ebp]
	mov	DWORD PTR _recog_operand+4, eax
	mov	eax, 138				; 0000008aH
	jmp	$L1185
; Line 1922
$L1266:
	mov	eax, DWORD PTR _x0$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _x1$[ebp], eax
; Line 1923
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _x2$[ebp], eax
; Line 1924
	jmp	$L255$1221
; Line 1925
$L256$1223:
; Line 1926
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _x2$[ebp], eax
; Line 1927
	mov	eax, DWORD PTR _x2$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 3276800				; 00320000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1267
	mov	eax, DWORD PTR _x2$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	mov	ecx, 67108864				; 04000000H
	and	ecx, -16777216				; ff000000H
	cmp	eax, ecx
	jne	$L1267
; Line 1928
	jmp	$L257$1268
; Line 1929
$L1267:
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _x2$[ebp], eax
; Line 1930
	jmp	$L263$1224
; Line 1931
$L257$1268:
; Line 1932
	mov	eax, DWORD PTR _x2$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _x3$[ebp], eax
; Line 1933
	push	2
	mov	eax, DWORD PTR _x3$[ebp]
	push	eax
	call	_general_operand
	add	esp, 8
	or	eax, eax
	je	$L1269
; Line 1934
	mov	eax, DWORD PTR _x3$[ebp]
	mov	DWORD PTR _recog_operand+4, eax
	jmp	$L258$1270
; Line 1935
$L1269:
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _x2$[ebp], eax
; Line 1936
	jmp	$L263$1224
; Line 1937
$L258$1270:
; Line 1938
	mov	eax, DWORD PTR _x2$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _x3$[ebp], eax
; Line 1939
	push	2
	mov	eax, DWORD PTR _x3$[ebp]
	push	eax
	call	_general_operand
	add	esp, 8
	or	eax, eax
	je	$L1271
; Line 1940
	mov	eax, DWORD PTR _x3$[ebp]
	mov	DWORD PTR _recog_operand+8, eax
	jmp	$L259$1272
; Line 1941
$L1271:
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _x2$[ebp], eax
; Line 1942
	jmp	$L263$1224
; Line 1943
$L259$1272:
; Line 1944
	mov	eax, DWORD PTR _x0$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _x1$[ebp], eax
; Line 1945
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1769472				; 001b0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1273
; Line 1946
	jmp	$L260$1274
; Line 1947
$L1273:
	mov	eax, DWORD PTR _x0$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _x1$[ebp], eax
; Line 1948
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _x2$[ebp], eax
; Line 1949
	jmp	$L263$1224
; Line 1950
$L260$1274:
; Line 1951
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _x2$[ebp], eax
; Line 1952
	mov	eax, DWORD PTR _x2$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1275
	mov	eax, DWORD PTR _x2$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	mov	ecx, 33554432				; 02000000H
	and	ecx, -16777216				; ff000000H
	cmp	eax, ecx
	jne	$L1275
	mov	eax, DWORD PTR _x2$[ebp]
	cmp	DWORD PTR [eax+4], 1
	jne	$L1275
; Line 1953
	mov	eax, 58					; 0000003aH
	jmp	$L1185
; Line 1954
$L1275:
	mov	eax, DWORD PTR _x0$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _x1$[ebp], eax
; Line 1955
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _x2$[ebp], eax
; Line 1956
	jmp	$L263$1224
; Line 1957
$L264$1226:
; Line 1958
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _x2$[ebp], eax
; Line 1959
	mov	eax, DWORD PTR _x2$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	mov	ecx, 67108864				; 04000000H
	and	ecx, -16777216				; ff000000H
	cmp	eax, ecx
	je	$L1276
; Line 1960
	jmp	$ret0$1214
; Line 1961
$L1276:
	mov	eax, DWORD PTR _x2$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 3276800				; 00320000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1277
; Line 1962
	jmp	$L265$1278
; Line 1963
$L1277:
	mov	eax, DWORD PTR _x2$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 3145728				; 00300000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1279
; Line 1964
	jmp	$L293$1280
; Line 1965
$L1279:
	mov	eax, DWORD PTR _x2$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 3342336				; 00330000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1281
; Line 1966
	jmp	$L304$1282
; Line 1967
$L1281:
	jmp	$ret0$1214
; Line 1968
$L265$1278:
; Line 1969
	mov	eax, DWORD PTR _x2$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _x3$[ebp], eax
; Line 1970
	push	4
	mov	eax, DWORD PTR _x3$[ebp]
	push	eax
	call	_general_operand
	add	esp, 8
	or	eax, eax
	je	$L1283
; Line 1971
	mov	eax, DWORD PTR _x3$[ebp]
	mov	DWORD PTR _recog_operand+4, eax
	jmp	$L266$1284
; Line 1972
$L1283:
	jmp	$ret0$1214
; Line 1973
$L266$1284:
; Line 1974
	mov	eax, DWORD PTR _x2$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _x3$[ebp], eax
; Line 1975
	push	4
	mov	eax, DWORD PTR _x3$[ebp]
	push	eax
	call	_general_operand
	add	esp, 8
	or	eax, eax
	je	$L1285
; Line 1976
	mov	eax, DWORD PTR _x3$[ebp]
	mov	DWORD PTR _recog_operand+8, eax
	jmp	$L267$1286
; Line 1977
$L1285:
	jmp	$ret0$1214
; Line 1978
$L267$1286:
; Line 1979
	mov	eax, DWORD PTR _x0$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _x1$[ebp], eax
; Line 1980
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1769472				; 001b0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1287
; Line 1981
	jmp	$L268$1288
; Line 1982
$L1287:
	jmp	$ret0$1214
; Line 1983
$L268$1288:
; Line 1984
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _x2$[ebp], eax
; Line 1985
	mov	eax, DWORD PTR _x2$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1289
	mov	eax, DWORD PTR _x2$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	mov	ecx, 67108864				; 04000000H
	and	ecx, -16777216				; ff000000H
	cmp	eax, ecx
	jne	$L1289
	mov	eax, DWORD PTR _x2$[ebp]
	cmp	DWORD PTR [eax+4], 1
	jne	$L1289
; Line 1986
	mov	eax, 59					; 0000003bH
	jmp	$L1185
; Line 1987
$L1289:
	jmp	$ret0$1214
; Line 1988
$L293$1280:
; Line 1989
	mov	eax, DWORD PTR _x2$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _x3$[ebp], eax
; Line 1990
	push	4
	mov	eax, DWORD PTR _x3$[ebp]
	push	eax
	call	_general_operand
	add	esp, 8
	or	eax, eax
	je	$L1290
; Line 1991
	mov	eax, DWORD PTR _x3$[ebp]
	mov	DWORD PTR _recog_operand+4, eax
	jmp	$L294$1291
; Line 1992
$L1290:
	jmp	$ret0$1214
; Line 1993
$L294$1291:
; Line 1994
	mov	eax, DWORD PTR _x2$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _x3$[ebp], eax
; Line 1995
	push	4
	mov	eax, DWORD PTR _x3$[ebp]
	push	eax
	call	_general_operand
	add	esp, 8
	or	eax, eax
	je	$L1292
; Line 1996
	mov	eax, DWORD PTR _x3$[ebp]
	mov	DWORD PTR _recog_operand+8, eax
	jmp	$L295$1293
; Line 1997
$L1292:
	jmp	$ret0$1214
; Line 1998
$L295$1293:
; Line 1999
	mov	eax, DWORD PTR _x0$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _x1$[ebp], eax
; Line 2000
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1638400				; 00190000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1294
; Line 2001
	jmp	$L296$1295
; Line 2002
$L1294:
	jmp	$ret0$1214
; Line 2003
$L296$1295:
; Line 2004
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _x2$[ebp], eax
; Line 2005
	push	4
	mov	eax, DWORD PTR _x2$[ebp]
	push	eax
	call	_general_operand
	add	esp, 8
	or	eax, eax
	je	$L1296
; Line 2006
	mov	eax, DWORD PTR _x2$[ebp]
	mov	DWORD PTR _recog_operand+12, eax
	jmp	$L297$1297
; Line 2007
$L1296:
	jmp	$ret0$1214
; Line 2008
$L297$1297:
; Line 2009
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _x2$[ebp], eax
; Line 2010
	mov	eax, DWORD PTR _x2$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 3211264				; 00310000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1298
	mov	eax, DWORD PTR _x2$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	mov	ecx, 67108864				; 04000000H
	and	ecx, -16777216				; ff000000H
	cmp	eax, ecx
	jne	$L1298
; Line 2011
	jmp	$L298$1299
; Line 2012
$L1298:
	jmp	$ret0$1214
; Line 2013
$L298$1299:
; Line 2014
	mov	eax, DWORD PTR _x2$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _x3$[ebp], eax
; Line 2015
	mov	eax, DWORD PTR _recog_operand+4
	push	eax
	mov	eax, DWORD PTR _x3$[ebp]
	push	eax
	call	_rtx_equal_p
	add	esp, 8
	or	eax, eax
	je	$L1301
; Line 2016
	jmp	$L299$1302
; Line 2017
$L1301:
	jmp	$ret0$1214
; Line 2018
$L299$1302:
; Line 2019
	mov	eax, DWORD PTR _x2$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _x3$[ebp], eax
; Line 2020
	mov	eax, DWORD PTR _recog_operand+8
	push	eax
	mov	eax, DWORD PTR _x3$[ebp]
	push	eax
	call	_rtx_equal_p
	add	esp, 8
	or	eax, eax
	je	$L1303
; Line 2021
	mov	eax, 66					; 00000042H
	jmp	$L1185
; Line 2022
$L1303:
	jmp	$ret0$1214
; Line 2023
$L304$1282:
; Line 2024
	mov	eax, DWORD PTR _x2$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _x3$[ebp], eax
; Line 2025
	push	4
	mov	eax, DWORD PTR _x3$[ebp]
	push	eax
	call	_general_operand
	add	esp, 8
	or	eax, eax
	je	$L1304
; Line 2026
	mov	eax, DWORD PTR _x3$[ebp]
	mov	DWORD PTR _recog_operand+4, eax
	jmp	$L305$1305
; Line 2027
$L1304:
	jmp	$ret0$1214
; Line 2028
$L305$1305:
; Line 2029
	mov	eax, DWORD PTR _x2$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _x3$[ebp], eax
; Line 2030
	push	4
	mov	eax, DWORD PTR _x3$[ebp]
	push	eax
	call	_general_operand
	add	esp, 8
	or	eax, eax
	je	$L1306
; Line 2031
	mov	eax, DWORD PTR _x3$[ebp]
	mov	DWORD PTR _recog_operand+8, eax
	jmp	$L306$1307
; Line 2032
$L1306:
	jmp	$ret0$1214
; Line 2033
$L306$1307:
; Line 2034
	mov	eax, DWORD PTR _x0$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _x1$[ebp], eax
; Line 2035
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1638400				; 00190000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1308
; Line 2036
	jmp	$L307$1309
; Line 2037
$L1308:
	jmp	$ret0$1214
; Line 2038
$L307$1309:
; Line 2039
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _x2$[ebp], eax
; Line 2040
	push	4
	mov	eax, DWORD PTR _x2$[ebp]
	push	eax
	call	_general_operand
	add	esp, 8
	or	eax, eax
	je	$L1310
; Line 2041
	mov	eax, DWORD PTR _x2$[ebp]
	mov	DWORD PTR _recog_operand+12, eax
	jmp	$L308$1311
; Line 2042
$L1310:
	jmp	$ret0$1214
; Line 2043
$L308$1311:
; Line 2044
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _x2$[ebp], eax
; Line 2045
	mov	eax, DWORD PTR _x2$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 3407872				; 00340000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1312
	mov	eax, DWORD PTR _x2$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	mov	ecx, 67108864				; 04000000H
	and	ecx, -16777216				; ff000000H
	cmp	eax, ecx
	jne	$L1312
; Line 2046
	jmp	$L309$1313
; Line 2047
$L1312:
	jmp	$ret0$1214
; Line 2048
$L309$1313:
; Line 2049
	mov	eax, DWORD PTR _x2$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _x3$[ebp], eax
; Line 2050
	mov	eax, DWORD PTR _recog_operand+4
	push	eax
	mov	eax, DWORD PTR _x3$[ebp]
	push	eax
	call	_rtx_equal_p
	add	esp, 8
	or	eax, eax
	je	$L1314
; Line 2051
	jmp	$L310$1315
; Line 2052
$L1314:
	jmp	$ret0$1214
; Line 2053
$L310$1315:
; Line 2054
	mov	eax, DWORD PTR _x2$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _x3$[ebp], eax
; Line 2055
	mov	eax, DWORD PTR _recog_operand+8
	push	eax
	mov	eax, DWORD PTR _x3$[ebp]
	push	eax
	call	_rtx_equal_p
	add	esp, 8
	or	eax, eax
	je	$L1316
; Line 2056
	mov	eax, 67					; 00000043H
	jmp	$L1185
; Line 2057
$L1316:
	jmp	$ret0$1214
; Line 2058
$L728$1211:
; Line 2059
	mov	eax, DWORD PTR _x0$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _x1$[ebp], eax
; Line 2060
	push	1
	mov	eax, DWORD PTR _x1$[ebp]
	push	eax
	call	_indirect_operand
	add	esp, 8
	or	eax, eax
	je	$L1317
; Line 2061
	mov	eax, DWORD PTR _x1$[ebp]
	mov	DWORD PTR _recog_operand, eax
	jmp	$L729$1318
; Line 2062
$L1317:
	jmp	$ret0$1214
; Line 2063
$L729$1318:
; Line 2064
	mov	eax, DWORD PTR _x0$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _x1$[ebp], eax
; Line 2065
	push	4
	mov	eax, DWORD PTR _x1$[ebp]
	push	eax
	call	_general_operand
	add	esp, 8
	or	eax, eax
	je	$L1319
; Line 2066
	mov	eax, DWORD PTR _x1$[ebp]
	mov	DWORD PTR _recog_operand+4, eax
	mov	eax, 139				; 0000008bH
	jmp	$L1185
; Line 2067
$L1319:
	jmp	$ret0$1214
; Line 2068
$ret0$1214:
	mov	eax, -1
	jmp	$L1185
; Line 2069
$L1185:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_recog_4 ENDP
_TEXT	ENDS
PUBLIC	_recog
_TEXT	SEGMENT
_x0$ = 8
_insn$ = 12
_x1$ = -44
_x2$ = -20
_x3$ = -40
_recog	PROC NEAR
; Line 2075
	push	ebp
	mov	ebp, esp
	sub	esp, 52					; 00000034H
	push	ebx
	push	esi
	push	edi
; Line 2079
$L0$1336:
; Line 2080
	mov	eax, DWORD PTR _x0$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	sar	eax, 16					; 00000010H
	mov	DWORD PTR -52+[ebp], eax
	jmp	$L1337
; Line 2082
$L1341:
; Line 2084
	jmp	$L1$1343
; Line 2085
$L1342:
	jmp	$L1338
; Line 2086
$L1344:
; Line 2087
	mov	eax, DWORD PTR _x0$[ebp]
	mov	eax, DWORD PTR [eax+4]
	cmp	DWORD PTR [eax], 2
	jne	$L1345
; Line 2088
	jmp	$L10$1346
; Line 2089
$L1345:
	jmp	$L1338
; Line 2090
$L1347:
; Line 2092
	jmp	$L728$1349
; Line 2093
$L1348:
	jmp	$L1338
; Line 2094
$L1350:
; Line 2095
	mov	eax, DWORD PTR _x0$[ebp]
	cmp	DWORD PTR _const0_rtx, eax
	jne	$L1351
; Line 2096
	mov	eax, 141				; 0000008dH
	jmp	$L1323
; Line 2097
$L1351:
	jmp	$L1338
; Line 2098
	jmp	$L1338
$L1337:
	cmp	DWORD PTR -52+[ebp], 20			; 00000014H
	je	$L1344
	cmp	DWORD PTR -52+[ebp], 25			; 00000019H
	je	$L1$1343
	cmp	DWORD PTR -52+[ebp], 28			; 0000001cH
	je	$L728$1349
	cmp	DWORD PTR -52+[ebp], 30			; 0000001eH
	je	$L1350
	jmp	$L1338
$L1338:
; Line 2099
	jmp	$ret0$1352
; Line 2100
$L1$1343:
; Line 2101
	mov	eax, DWORD PTR _insn$[ebp]
	push	eax
	mov	eax, DWORD PTR _x0$[ebp]
	push	eax
	call	_recog_3
	add	esp, 8
	jmp	$L1323
; Line 2102
$L10$1346:
; Line 2103
	mov	eax, DWORD PTR _x0$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _x1$[ebp], eax
; Line 2104
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1638400				; 00190000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1353
; Line 2105
	jmp	$L11$1354
; Line 2106
$L1353:
	jmp	$ret0$1352
; Line 2107
$L11$1354:
; Line 2108
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _x2$[ebp], eax
; Line 2109
	mov	eax, DWORD PTR _x2$[ebp]
	cmp	DWORD PTR _cc0_rtx, eax
	jne	$L1355
; Line 2110
	jmp	$L12$1356
; Line 2111
$L1355:
	mov	eax, DWORD PTR _x2$[ebp]
	cmp	DWORD PTR _pc_rtx, eax
	jne	$L1357
; Line 2112
	jmp	$L723$1358
; Line 2113
$L1357:
$L255$1359:
; Line 2114
	push	2
	mov	eax, DWORD PTR _x2$[ebp]
	push	eax
	call	_general_operand
	add	esp, 8
	or	eax, eax
	je	$L1360
; Line 2115
	mov	eax, DWORD PTR _x2$[ebp]
	mov	DWORD PTR _recog_operand, eax
	jmp	$L256$1361
; Line 2116
$L1360:
$L263$1362:
; Line 2117
	push	4
	mov	eax, DWORD PTR _x2$[ebp]
	push	eax
	call	_general_operand
	add	esp, 8
	or	eax, eax
	je	$L1363
; Line 2118
	mov	eax, DWORD PTR _x2$[ebp]
	mov	DWORD PTR _recog_operand, eax
	jmp	$L264$1364
; Line 2119
$L1363:
	jmp	$ret0$1352
; Line 2120
$L12$1356:
; Line 2121
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _x2$[ebp], eax
; Line 2122
	push	10					; 0000000aH
	mov	eax, DWORD PTR _x2$[ebp]
	push	eax
	call	_general_operand
	add	esp, 8
	or	eax, eax
	je	$L1365
; Line 2123
	mov	eax, DWORD PTR _x2$[ebp]
	mov	DWORD PTR _recog_operand, eax
	jmp	$L13$1366
; Line 2124
$L1365:
$L18$1367:
; Line 2125
	push	11					; 0000000bH
	mov	eax, DWORD PTR _x2$[ebp]
	push	eax
	call	_general_operand
	add	esp, 8
	or	eax, eax
	je	$L1368
; Line 2126
	mov	eax, DWORD PTR _x2$[ebp]
	mov	DWORD PTR _recog_operand, eax
	jmp	$L19$1369
; Line 2127
$L1368:
$L39$1370:
; Line 2128
	mov	eax, DWORD PTR _x2$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2818048				; 002b0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1371
; Line 2129
	jmp	$L40$1372
; Line 2130
$L1371:
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _x2$[ebp], eax
; Line 2131
	jmp	$L255$1359
; Line 2132
$L13$1366:
; Line 2133
	mov	eax, DWORD PTR _x0$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _x1$[ebp], eax
; Line 2134
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1769472				; 001b0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1373
; Line 2135
	jmp	$L14$1374
; Line 2136
$L1373:
	mov	eax, DWORD PTR _x0$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _x1$[ebp], eax
; Line 2137
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _x2$[ebp], eax
; Line 2138
	jmp	$L18$1367
; Line 2139
$L14$1374:
; Line 2140
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _x2$[ebp], eax
; Line 2141
	mov	eax, DWORD PTR _x2$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1375
	mov	eax, DWORD PTR _x2$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	mov	ecx, 67108864				; 04000000H
	and	ecx, -16777216				; ff000000H
	cmp	eax, ecx
	jne	$L1375
	mov	eax, DWORD PTR _x2$[ebp]
	cmp	DWORD PTR [eax+4], 0
	jne	$L1375
; Line 2142
	test	BYTE PTR _target_flags, 1
	je	$L1376
	mov	eax, 3
	jmp	$L1323
; Line 2143
$L1376:
$L1375:
	mov	eax, DWORD PTR _x0$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _x1$[ebp], eax
; Line 2144
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _x2$[ebp], eax
; Line 2145
	jmp	$L18$1367
; Line 2146
$L19$1369:
; Line 2147
	mov	eax, DWORD PTR _x0$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _x1$[ebp], eax
; Line 2148
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1769472				; 001b0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1377
; Line 2149
	jmp	$L20$1378
; Line 2150
$L1377:
	mov	eax, DWORD PTR _x0$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _x1$[ebp], eax
; Line 2151
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _x2$[ebp], eax
; Line 2152
	jmp	$L39$1370
; Line 2153
$L20$1378:
; Line 2154
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _x2$[ebp], eax
; Line 2155
	mov	eax, DWORD PTR _x2$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1379
	mov	eax, DWORD PTR _x2$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	mov	ecx, 67108864				; 04000000H
	and	ecx, -16777216				; ff000000H
	cmp	eax, ecx
	jne	$L1379
	mov	eax, DWORD PTR _x2$[ebp]
	cmp	DWORD PTR [eax+4], 0
	jne	$L1379
; Line 2156
	test	BYTE PTR _target_flags, 1
	je	$L1380
	mov	eax, 4
	jmp	$L1323
; Line 2157
$L1380:
$L1379:
	mov	eax, DWORD PTR _x0$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _x1$[ebp], eax
; Line 2158
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _x2$[ebp], eax
; Line 2159
	jmp	$L39$1370
; Line 2160
$L40$1372:
; Line 2161
	mov	eax, DWORD PTR _x2$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _x3$[ebp], eax
; Line 2162
	push	11					; 0000000bH
	mov	eax, DWORD PTR _x3$[ebp]
	push	eax
	call	_general_operand
	add	esp, 8
	or	eax, eax
	je	$L1381
; Line 2163
	mov	eax, DWORD PTR _x3$[ebp]
	mov	DWORD PTR _recog_operand, eax
	jmp	$L41$1382
; Line 2164
$L1381:
$L48$1383:
; Line 2165
	push	10					; 0000000aH
	mov	eax, DWORD PTR _x3$[ebp]
	push	eax
	call	_general_operand
	add	esp, 8
	or	eax, eax
	je	$L1384
; Line 2166
	mov	eax, DWORD PTR _x3$[ebp]
	mov	DWORD PTR _recog_operand, eax
	jmp	$L49$1385
; Line 2167
$L1384:
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _x2$[ebp], eax
; Line 2168
	jmp	$L255$1359
; Line 2169
$L41$1382:
; Line 2170
	mov	eax, DWORD PTR _x2$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _x3$[ebp], eax
; Line 2171
	push	11					; 0000000bH
	mov	eax, DWORD PTR _x3$[ebp]
	push	eax
	call	_general_operand
	add	esp, 8
	or	eax, eax
	je	$L1386
; Line 2172
	mov	eax, DWORD PTR _x3$[ebp]
	mov	DWORD PTR _recog_operand+4, eax
	jmp	$L42$1387
; Line 2173
$L1386:
	mov	eax, DWORD PTR _x2$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _x3$[ebp], eax
; Line 2174
	jmp	$L48$1383
; Line 2175
$L42$1387:
; Line 2176
	mov	eax, DWORD PTR _x0$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _x1$[ebp], eax
; Line 2177
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1769472				; 001b0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1388
; Line 2178
	jmp	$L43$1389
; Line 2179
$L1388:
	mov	eax, DWORD PTR _x0$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _x1$[ebp], eax
; Line 2180
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _x2$[ebp], eax
; Line 2181
	mov	eax, DWORD PTR _x2$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _x3$[ebp], eax
; Line 2182
	jmp	$L48$1383
; Line 2183
$L43$1389:
; Line 2184
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _x2$[ebp], eax
; Line 2185
	mov	eax, DWORD PTR _x2$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1390
	mov	eax, DWORD PTR _x2$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	mov	ecx, 67108864				; 04000000H
	and	ecx, -16777216				; ff000000H
	cmp	eax, ecx
	jne	$L1390
	mov	eax, DWORD PTR _x2$[ebp]
	cmp	DWORD PTR [eax+4], 0
	jne	$L1390
; Line 2186
	test	BYTE PTR _target_flags, 1
	je	$L1391
	mov	eax, 8
	jmp	$L1323
; Line 2187
$L1391:
$L1390:
	mov	eax, DWORD PTR _x0$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _x1$[ebp], eax
; Line 2188
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _x2$[ebp], eax
; Line 2189
	mov	eax, DWORD PTR _x2$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _x3$[ebp], eax
; Line 2190
	jmp	$L48$1383
; Line 2191
$L49$1385:
; Line 2192
	mov	eax, DWORD PTR _x2$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _x3$[ebp], eax
; Line 2193
	push	10					; 0000000aH
	mov	eax, DWORD PTR _x3$[ebp]
	push	eax
	call	_general_operand
	add	esp, 8
	or	eax, eax
	je	$L1392
; Line 2194
	mov	eax, DWORD PTR _x3$[ebp]
	mov	DWORD PTR _recog_operand+4, eax
	jmp	$L50$1393
; Line 2195
$L1392:
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _x2$[ebp], eax
; Line 2196
	jmp	$L255$1359
; Line 2197
$L50$1393:
; Line 2198
	mov	eax, DWORD PTR _x0$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _x1$[ebp], eax
; Line 2199
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1769472				; 001b0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1394
; Line 2200
	jmp	$L51$1395
; Line 2201
$L1394:
	mov	eax, DWORD PTR _x0$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _x1$[ebp], eax
; Line 2202
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _x2$[ebp], eax
; Line 2203
	jmp	$L255$1359
; Line 2204
$L51$1395:
; Line 2205
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _x2$[ebp], eax
; Line 2206
	mov	eax, DWORD PTR _x2$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1396
	mov	eax, DWORD PTR _x2$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	mov	ecx, 67108864				; 04000000H
	and	ecx, -16777216				; ff000000H
	cmp	eax, ecx
	jne	$L1396
	mov	eax, DWORD PTR _x2$[ebp]
	cmp	DWORD PTR [eax+4], 0
	jne	$L1396
; Line 2207
	test	BYTE PTR _target_flags, 1
	je	$L1397
	mov	eax, 9
	jmp	$L1323
; Line 2208
$L1397:
$L1396:
	mov	eax, DWORD PTR _x0$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _x1$[ebp], eax
; Line 2209
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _x2$[ebp], eax
; Line 2210
	jmp	$L255$1359
; Line 2211
$L723$1358:
; Line 2212
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _x2$[ebp], eax
; Line 2213
	push	4
	mov	eax, DWORD PTR _x2$[ebp]
	push	eax
	call	_general_operand
	add	esp, 8
	or	eax, eax
	je	$L1398
; Line 2214
	mov	eax, DWORD PTR _x2$[ebp]
	mov	DWORD PTR _recog_operand, eax
	jmp	$L724$1399
; Line 2215
$L1398:
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _x2$[ebp], eax
; Line 2216
	jmp	$L255$1359
; Line 2217
$L724$1399:
; Line 2218
	mov	eax, DWORD PTR _x0$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _x1$[ebp], eax
; Line 2219
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1703936				; 001a0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1400
; Line 2220
	jmp	$L725$1401
; Line 2221
$L1400:
	mov	eax, DWORD PTR _x0$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _x1$[ebp], eax
; Line 2222
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _x2$[ebp], eax
; Line 2223
	jmp	$L255$1359
; Line 2224
$L725$1401:
; Line 2225
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _x2$[ebp], eax
; Line 2226
	mov	eax, DWORD PTR _x2$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2490368				; 00260000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1402
; Line 2227
	jmp	$L726$1403
; Line 2228
$L1402:
	mov	eax, DWORD PTR _x0$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _x1$[ebp], eax
; Line 2229
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _x2$[ebp], eax
; Line 2230
	jmp	$L255$1359
; Line 2231
$L726$1403:
; Line 2232
	mov	eax, DWORD PTR _x2$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _x3$[ebp], eax
; Line 2234
	mov	eax, DWORD PTR _x3$[ebp]
	mov	DWORD PTR _recog_operand+4, eax
	mov	eax, 138				; 0000008aH
	jmp	$L1323
; Line 2235
$L1404:
	mov	eax, DWORD PTR _x0$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _x1$[ebp], eax
; Line 2236
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _x2$[ebp], eax
; Line 2237
	jmp	$L255$1359
; Line 2238
$L256$1361:
; Line 2239
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _x2$[ebp], eax
; Line 2240
	mov	eax, DWORD PTR _x2$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 3276800				; 00320000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1405
	mov	eax, DWORD PTR _x2$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	mov	ecx, 67108864				; 04000000H
	and	ecx, -16777216				; ff000000H
	cmp	eax, ecx
	jne	$L1405
; Line 2241
	jmp	$L257$1406
; Line 2242
$L1405:
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _x2$[ebp], eax
; Line 2243
	jmp	$L263$1362
; Line 2244
$L257$1406:
; Line 2245
	mov	eax, DWORD PTR _x2$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _x3$[ebp], eax
; Line 2246
	push	2
	mov	eax, DWORD PTR _x3$[ebp]
	push	eax
	call	_general_operand
	add	esp, 8
	or	eax, eax
	je	$L1407
; Line 2247
	mov	eax, DWORD PTR _x3$[ebp]
	mov	DWORD PTR _recog_operand+4, eax
	jmp	$L258$1408
; Line 2248
$L1407:
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _x2$[ebp], eax
; Line 2249
	jmp	$L263$1362
; Line 2250
$L258$1408:
; Line 2251
	mov	eax, DWORD PTR _x2$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _x3$[ebp], eax
; Line 2252
	push	2
	mov	eax, DWORD PTR _x3$[ebp]
	push	eax
	call	_general_operand
	add	esp, 8
	or	eax, eax
	je	$L1409
; Line 2253
	mov	eax, DWORD PTR _x3$[ebp]
	mov	DWORD PTR _recog_operand+8, eax
	jmp	$L259$1410
; Line 2254
$L1409:
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _x2$[ebp], eax
; Line 2255
	jmp	$L263$1362
; Line 2256
$L259$1410:
; Line 2257
	mov	eax, DWORD PTR _x0$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _x1$[ebp], eax
; Line 2258
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1769472				; 001b0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1411
; Line 2259
	jmp	$L260$1412
; Line 2260
$L1411:
	mov	eax, DWORD PTR _x0$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _x1$[ebp], eax
; Line 2261
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _x2$[ebp], eax
; Line 2262
	jmp	$L263$1362
; Line 2263
$L260$1412:
; Line 2264
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _x2$[ebp], eax
; Line 2265
	mov	eax, DWORD PTR _x2$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1413
	mov	eax, DWORD PTR _x2$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	mov	ecx, 33554432				; 02000000H
	and	ecx, -16777216				; ff000000H
	cmp	eax, ecx
	jne	$L1413
	mov	eax, DWORD PTR _x2$[ebp]
	cmp	DWORD PTR [eax+4], 1
	jne	$L1413
; Line 2266
	mov	eax, 58					; 0000003aH
	jmp	$L1323
; Line 2267
$L1413:
	mov	eax, DWORD PTR _x0$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _x1$[ebp], eax
; Line 2268
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _x2$[ebp], eax
; Line 2269
	jmp	$L263$1362
; Line 2270
$L264$1364:
; Line 2271
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _x2$[ebp], eax
; Line 2272
	mov	eax, DWORD PTR _x2$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 3276800				; 00320000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1414
; Line 2273
	jmp	$L265$1415
; Line 2274
$L1414:
	mov	eax, DWORD PTR _x2$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 3145728				; 00300000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1416
; Line 2275
	jmp	$L293$1417
; Line 2276
$L1416:
	mov	eax, DWORD PTR _x2$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 3342336				; 00330000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1418
; Line 2277
	jmp	$L304$1419
; Line 2278
$L1418:
	jmp	$ret0$1352
; Line 2279
$L265$1415:
; Line 2280
	mov	eax, DWORD PTR _x2$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _x3$[ebp], eax
; Line 2281
	push	4
	mov	eax, DWORD PTR _x3$[ebp]
	push	eax
	call	_general_operand
	add	esp, 8
	or	eax, eax
	je	$L1420
; Line 2282
	mov	eax, DWORD PTR _x3$[ebp]
	mov	DWORD PTR _recog_operand+4, eax
	jmp	$L266$1421
; Line 2283
$L1420:
	jmp	$ret0$1352
; Line 2284
$L266$1421:
; Line 2285
	mov	eax, DWORD PTR _x2$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _x3$[ebp], eax
; Line 2286
	push	4
	mov	eax, DWORD PTR _x3$[ebp]
	push	eax
	call	_general_operand
	add	esp, 8
	or	eax, eax
	je	$L1422
; Line 2287
	mov	eax, DWORD PTR _x3$[ebp]
	mov	DWORD PTR _recog_operand+8, eax
	jmp	$L267$1423
; Line 2288
$L1422:
	jmp	$ret0$1352
; Line 2289
$L267$1423:
; Line 2290
	mov	eax, DWORD PTR _x0$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _x1$[ebp], eax
; Line 2291
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1769472				; 001b0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1424
; Line 2292
	jmp	$L268$1425
; Line 2293
$L1424:
	jmp	$ret0$1352
; Line 2294
$L268$1425:
; Line 2295
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _x2$[ebp], eax
; Line 2296
	mov	eax, DWORD PTR _x2$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1426
	mov	eax, DWORD PTR _x2$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	mov	ecx, 67108864				; 04000000H
	and	ecx, -16777216				; ff000000H
	cmp	eax, ecx
	jne	$L1426
	mov	eax, DWORD PTR _x2$[ebp]
	cmp	DWORD PTR [eax+4], 1
	jne	$L1426
; Line 2297
	mov	eax, 59					; 0000003bH
	jmp	$L1323
; Line 2298
$L1426:
	jmp	$ret0$1352
; Line 2299
$L293$1417:
; Line 2300
	mov	eax, DWORD PTR _x2$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _x3$[ebp], eax
; Line 2301
	push	4
	mov	eax, DWORD PTR _x3$[ebp]
	push	eax
	call	_general_operand
	add	esp, 8
	or	eax, eax
	je	$L1427
; Line 2302
	mov	eax, DWORD PTR _x3$[ebp]
	mov	DWORD PTR _recog_operand+4, eax
	jmp	$L294$1428
; Line 2303
$L1427:
	jmp	$ret0$1352
; Line 2304
$L294$1428:
; Line 2305
	mov	eax, DWORD PTR _x2$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _x3$[ebp], eax
; Line 2306
	push	4
	mov	eax, DWORD PTR _x3$[ebp]
	push	eax
	call	_general_operand
	add	esp, 8
	or	eax, eax
	je	$L1429
; Line 2307
	mov	eax, DWORD PTR _x3$[ebp]
	mov	DWORD PTR _recog_operand+8, eax
	jmp	$L295$1430
; Line 2308
$L1429:
	jmp	$ret0$1352
; Line 2309
$L295$1430:
; Line 2310
	mov	eax, DWORD PTR _x0$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _x1$[ebp], eax
; Line 2311
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1638400				; 00190000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1431
; Line 2312
	jmp	$L296$1432
; Line 2313
$L1431:
	jmp	$ret0$1352
; Line 2314
$L296$1432:
; Line 2315
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _x2$[ebp], eax
; Line 2316
	push	4
	mov	eax, DWORD PTR _x2$[ebp]
	push	eax
	call	_general_operand
	add	esp, 8
	or	eax, eax
	je	$L1433
; Line 2317
	mov	eax, DWORD PTR _x2$[ebp]
	mov	DWORD PTR _recog_operand+12, eax
	jmp	$L297$1434
; Line 2318
$L1433:
	jmp	$ret0$1352
; Line 2319
$L297$1434:
; Line 2320
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _x2$[ebp], eax
; Line 2321
	mov	eax, DWORD PTR _x2$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 3211264				; 00310000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1435
	mov	eax, DWORD PTR _x2$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	mov	ecx, 67108864				; 04000000H
	and	ecx, -16777216				; ff000000H
	cmp	eax, ecx
	jne	$L1435
; Line 2322
	jmp	$L298$1436
; Line 2323
$L1435:
	jmp	$ret0$1352
; Line 2324
$L298$1436:
; Line 2325
	mov	eax, DWORD PTR _x2$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _x3$[ebp], eax
; Line 2326
	mov	eax, DWORD PTR _recog_operand+4
	push	eax
	mov	eax, DWORD PTR _x3$[ebp]
	push	eax
	call	_rtx_equal_p
	add	esp, 8
	or	eax, eax
	je	$L1437
; Line 2327
	jmp	$L299$1438
; Line 2328
$L1437:
	jmp	$ret0$1352
; Line 2329
$L299$1438:
; Line 2330
	mov	eax, DWORD PTR _x2$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _x3$[ebp], eax
; Line 2331
	mov	eax, DWORD PTR _recog_operand+8
	push	eax
	mov	eax, DWORD PTR _x3$[ebp]
	push	eax
	call	_rtx_equal_p
	add	esp, 8
	or	eax, eax
	je	$L1439
; Line 2332
	mov	eax, 66					; 00000042H
	jmp	$L1323
; Line 2333
$L1439:
	jmp	$ret0$1352
; Line 2334
$L304$1419:
; Line 2335
	mov	eax, DWORD PTR _x2$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _x3$[ebp], eax
; Line 2336
	push	4
	mov	eax, DWORD PTR _x3$[ebp]
	push	eax
	call	_general_operand
	add	esp, 8
	or	eax, eax
	je	$L1440
; Line 2337
	mov	eax, DWORD PTR _x3$[ebp]
	mov	DWORD PTR _recog_operand+4, eax
	jmp	$L305$1441
; Line 2338
$L1440:
	jmp	$ret0$1352
; Line 2339
$L305$1441:
; Line 2340
	mov	eax, DWORD PTR _x2$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _x3$[ebp], eax
; Line 2341
	push	4
	mov	eax, DWORD PTR _x3$[ebp]
	push	eax
	call	_general_operand
	add	esp, 8
	or	eax, eax
	je	$L1442
; Line 2342
	mov	eax, DWORD PTR _x3$[ebp]
	mov	DWORD PTR _recog_operand+8, eax
	jmp	$L306$1443
; Line 2343
$L1442:
	jmp	$ret0$1352
; Line 2344
$L306$1443:
; Line 2345
	mov	eax, DWORD PTR _x0$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _x1$[ebp], eax
; Line 2346
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1638400				; 00190000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1444
; Line 2347
	jmp	$L307$1445
; Line 2348
$L1444:
	jmp	$ret0$1352
; Line 2349
$L307$1445:
; Line 2350
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _x2$[ebp], eax
; Line 2351
	push	4
	mov	eax, DWORD PTR _x2$[ebp]
	push	eax
	call	_general_operand
	add	esp, 8
	or	eax, eax
	je	$L1446
; Line 2352
	mov	eax, DWORD PTR _x2$[ebp]
	mov	DWORD PTR _recog_operand+12, eax
	jmp	$L308$1447
; Line 2353
$L1446:
	jmp	$ret0$1352
; Line 2354
$L308$1447:
; Line 2355
	mov	eax, DWORD PTR _x1$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _x2$[ebp], eax
; Line 2356
	mov	eax, DWORD PTR _x2$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 3407872				; 00340000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1448
	mov	eax, DWORD PTR _x2$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	mov	ecx, 67108864				; 04000000H
	and	ecx, -16777216				; ff000000H
	cmp	eax, ecx
	jne	$L1448
; Line 2357
	jmp	$L309$1449
; Line 2358
$L1448:
	jmp	$ret0$1352
; Line 2359
$L309$1449:
; Line 2360
	mov	eax, DWORD PTR _x2$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _x3$[ebp], eax
; Line 2361
	mov	eax, DWORD PTR _recog_operand+4
	push	eax
	mov	eax, DWORD PTR _x3$[ebp]
	push	eax
	call	_rtx_equal_p
	add	esp, 8
	or	eax, eax
	je	$L1450
; Line 2362
	jmp	$L310$1451
; Line 2363
$L1450:
	jmp	$ret0$1352
; Line 2364
$L310$1451:
; Line 2365
	mov	eax, DWORD PTR _x2$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _x3$[ebp], eax
; Line 2366
	mov	eax, DWORD PTR _recog_operand+8
	push	eax
	mov	eax, DWORD PTR _x3$[ebp]
	push	eax
	call	_rtx_equal_p
	add	esp, 8
	or	eax, eax
	je	$L1452
; Line 2367
	mov	eax, 67					; 00000043H
	jmp	$L1323
; Line 2368
$L1452:
	jmp	$ret0$1352
; Line 2369
$L728$1349:
; Line 2370
	mov	eax, DWORD PTR _x0$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _x1$[ebp], eax
; Line 2371
	push	1
	mov	eax, DWORD PTR _x1$[ebp]
	push	eax
	call	_indirect_operand
	add	esp, 8
	or	eax, eax
	je	$L1453
; Line 2372
	mov	eax, DWORD PTR _x1$[ebp]
	mov	DWORD PTR _recog_operand, eax
	jmp	$L729$1454
; Line 2373
$L1453:
	jmp	$ret0$1352
; Line 2374
$L729$1454:
; Line 2375
	mov	eax, DWORD PTR _x0$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _x1$[ebp], eax
; Line 2376
	push	4
	mov	eax, DWORD PTR _x1$[ebp]
	push	eax
	call	_general_operand
	add	esp, 8
	or	eax, eax
	je	$L1455
; Line 2377
	mov	eax, DWORD PTR _x1$[ebp]
	mov	DWORD PTR _recog_operand+4, eax
	mov	eax, 139				; 0000008bH
	jmp	$L1323
; Line 2378
$L1455:
	jmp	$ret0$1352
; Line 2379
$ret0$1352:
	mov	eax, -1
	jmp	$L1323
; Line 2380
$L1323:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_recog	ENDP
_TEXT	ENDS
END
