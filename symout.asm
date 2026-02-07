	TITLE	symout.c
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
PUBLIC	_symout_init
EXTRN	_fopen:NEAR
EXTRN	_fprintf:NEAR
EXTRN	_fputs:NEAR
EXTRN	_fwrite:NEAR
EXTRN	_assemble_name:NEAR
EXTRN	_pfatal_with_name:NEAR
EXTRN	_malloc:NEAR
EXTRN	_strlen:NEAR
EXTRN	_strcpy:NEAR
EXTRN	_memset:NEAR
_BSS	SEGMENT
_symfile$S832 DD 01H DUP (?)
_symfile_name$S833 DD 01H DUP (?)
_asmfile$S834 DD 01H DUP (?)
_next_address$S835 DD 01H DUP (?)
_typevec$S837 DD 01H DUP (?)
_total_types$S838 DD 01H DUP (?)
_temporary_fwd_refs$S839 DD 01H DUP (?)
_permanent_fwd_refs$S840 DD 01H DUP (?)
_blockvec$S842 DD 01H DUP (?)
_total_blocks$S843 DD 01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
$SG859	DB	'.text 0', 0aH, '.gdbbeg 0', 0aH, '.gdbbeg 1', 0aH, 00H
	ORG $+3
$SG860	DB	'Ltext:', 09H, '.stabs "%s",%d,0,0,Ltext', 0aH, 00H
	ORG $+3
$SG861	DB	'.data 0', 0aH, 'Ldata:', 0aH, 00H
$SG863	DB	'.lcomm ', 00H
$SG864	DB	'Lbss', 00H
	ORG $+3
$SG865	DB	',%u', 0aH, 00H
	ORG $+3
$SG866	DB	'.gdbsym Ldata,%d', 0aH, 00H
	ORG $+2
$SG867	DB	'.gdbsym Lbss,%d', 0aH, 00H
	ORG $+3
$SG868	DB	'w', 00H
_DATA	ENDS
_TEXT	SEGMENT
; File symout.c
_filename$ = 8
_asm_file$ = 12
_sourcename$ = 16
_buffer$ = -64
_symout_init PROC NEAR
; Line 123
	push	ebp
	mov	ebp, esp
	sub	esp, 64					; 00000040H
	push	ebx
	push	esi
	push	edi
; Line 130
	mov	eax, DWORD PTR _asm_file$[ebp]
	mov	DWORD PTR _asmfile$S834, eax
; Line 131
	push	OFFSET $SG859
	mov	eax, DWORD PTR _asmfile$S834
	push	eax
	call	_fprintf
	add	esp, 8
; Line 134
	push	100					; 00000064H
	mov	eax, DWORD PTR _sourcename$[ebp]
	push	eax
	push	OFFSET $SG860
	mov	eax, DWORD PTR _asmfile$S834
	push	eax
	call	_fprintf
	add	esp, 16					; 00000010H
; Line 135
	push	OFFSET $SG861
	mov	eax, DWORD PTR _asmfile$S834
	push	eax
	call	_fprintf
	add	esp, 8
; Line 136
	mov	eax, DWORD PTR _asmfile$S834
	push	eax
	push	OFFSET $SG863
	call	_fputs
	add	esp, 8
	push	OFFSET $SG864
	mov	eax, DWORD PTR _asmfile$S834
	push	eax
	call	_assemble_name
	add	esp, 8
	push	0
	push	OFFSET $SG865
	mov	eax, DWORD PTR _asmfile$S834
	push	eax
	call	_fprintf
	add	esp, 12					; 0000000cH
; Line 138
	lea	eax, DWORD PTR _buffer$[ebp+52]
	lea	ecx, DWORD PTR _buffer$[ebp]
	sub	eax, ecx
	push	eax
	push	OFFSET $SG866
	mov	eax, DWORD PTR _asmfile$S834
	push	eax
	call	_fprintf
	add	esp, 12					; 0000000cH
; Line 140
	lea	eax, DWORD PTR _buffer$[ebp+56]
	lea	ecx, DWORD PTR _buffer$[ebp]
	sub	eax, ecx
	push	eax
	push	OFFSET $SG867
	mov	eax, DWORD PTR _asmfile$S834
	push	eax
	call	_fprintf
	add	esp, 12					; 0000000cH
; Line 142
	push	OFFSET $SG868
	mov	eax, DWORD PTR _filename$[ebp]
	push	eax
	call	_fopen
	add	esp, 8
	mov	DWORD PTR _symfile$S832, eax
; Line 143
	cmp	DWORD PTR _symfile$S832, 0
	jne	$L869
; Line 144
	mov	eax, DWORD PTR _filename$[ebp]
	push	eax
	call	_pfatal_with_name
	add	esp, 4
; Line 145
$L869:
	mov	eax, DWORD PTR _filename$[ebp]
	push	eax
	call	_strlen
	add	esp, 4
	inc	eax
	push	eax
	call	_malloc
	add	esp, 4
	mov	DWORD PTR _symfile_name$S833, eax
; Line 146
	mov	eax, DWORD PTR _filename$[ebp]
	push	eax
	mov	eax, DWORD PTR _symfile_name$S833
	push	eax
	call	_strcpy
	add	esp, 8
; Line 148
	mov	DWORD PTR _typevec$S837, 0
; Line 149
	mov	DWORD PTR _blockvec$S842, 0
; Line 150
	mov	DWORD PTR _total_types$S838, 0
; Line 151
	mov	DWORD PTR _total_blocks$S843, 0
; Line 153
	mov	DWORD PTR _permanent_fwd_refs$S840, 0
; Line 154
	mov	DWORD PTR _temporary_fwd_refs$S839, 0
; Line 156
	push	64					; 00000040H
	push	0
	lea	eax, DWORD PTR _buffer$[ebp]
	push	eax
	call	_memset
	add	esp, 12					; 0000000cH
; Line 157
	mov	eax, DWORD PTR _symfile$S832
	push	eax
	push	1
	push	64					; 00000040H
	lea	eax, DWORD PTR _buffer$[ebp]
	push	eax
	call	_fwrite
	add	esp, 16					; 00000010H
; Line 159
	mov	DWORD PTR _next_address$S835, 64	; 00000040H
; Line 160
$L857:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_symout_init ENDP
_p1$ = 8
_s1$ = 12
_p2$ = 16
_s2$ = 20
_symout_strings PROC NEAR
; Line 176
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 177
	mov	eax, DWORD PTR _s2$[ebp]
	push	eax
	mov	eax, DWORD PTR _p2$[ebp]
	push	eax
	mov	eax, DWORD PTR _s1$[ebp]
	push	eax
	mov	eax, DWORD PTR _p1$[ebp]
	push	eax
	call	_symout_strings_print
	add	esp, 16					; 00000010H
; Line 178
	mov	eax, DWORD PTR _s2$[ebp]
	push	eax
	mov	eax, DWORD PTR _p2$[ebp]
	push	eax
	mov	eax, DWORD PTR _s1$[ebp]
	push	eax
	mov	eax, DWORD PTR _p1$[ebp]
	push	eax
	call	_symout_strings_skip
	add	esp, 16					; 00000010H
; Line 179
$L880:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_symout_strings ENDP
_TEXT	ENDS
EXTRN	__flsbuf:NEAR
_TEXT	SEGMENT
_p1$ = 8
_s1$ = 12
_p2$ = 16
_s2$ = 20
_total$ = -4
_symout_strings_print PROC NEAR
; Line 189
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 192
	cmp	DWORD PTR _p1$[ebp], 0
	je	$L887
	cmp	DWORD PTR _s1$[ebp], 0
	jne	$L887
; Line 193
	mov	eax, DWORD PTR _p1$[ebp]
	push	eax
	call	_strlen
	add	esp, 4
	mov	DWORD PTR _s1$[ebp], eax
; Line 194
$L887:
	cmp	DWORD PTR _p2$[ebp], 0
	je	$L888
	cmp	DWORD PTR _s2$[ebp], 0
	jne	$L888
; Line 195
	mov	eax, DWORD PTR _p2$[ebp]
	push	eax
	call	_strlen
	add	esp, 4
	mov	DWORD PTR _s2$[ebp], eax
; Line 197
$L888:
	cmp	DWORD PTR _p1$[ebp], 0
	je	$L889
; Line 198
	mov	eax, DWORD PTR _symfile$S832
	push	eax
	push	1
	mov	eax, DWORD PTR _s1$[ebp]
	push	eax
	mov	eax, DWORD PTR _p1$[ebp]
	push	eax
	call	_fwrite
	add	esp, 16					; 00000010H
; Line 199
$L889:
	cmp	DWORD PTR _p2$[ebp], 0
	je	$L890
; Line 200
	mov	eax, DWORD PTR _symfile$S832
	push	eax
	push	1
	mov	eax, DWORD PTR _s2$[ebp]
	push	eax
	mov	eax, DWORD PTR _p2$[ebp]
	push	eax
	call	_fwrite
	add	esp, 16					; 00000010H
; Line 201
$L890:
	mov	eax, DWORD PTR _symfile$S832
	dec	DWORD PTR [eax+4]
	mov	eax, DWORD PTR _symfile$S832
	cmp	DWORD PTR [eax+4], 0
	jl	$L1242
	mov	eax, DWORD PTR _symfile$S832
	mov	eax, DWORD PTR [eax]
	mov	BYTE PTR [eax], 0
	mov	eax, DWORD PTR _symfile$S832
	inc	DWORD PTR [eax]
	jmp	$L1243
$L1242:
	mov	eax, DWORD PTR _symfile$S832
	push	eax
	push	0
	call	__flsbuf
	add	esp, 8
$L1243:
; Line 203
	mov	eax, DWORD PTR _s2$[ebp]
	add	eax, DWORD PTR _s1$[ebp]
	inc	eax
	mov	DWORD PTR _total$[ebp], eax
; Line 204
$L892:
	test	BYTE PTR _total$[ebp], 3
	je	$L893
; Line 206
	mov	eax, DWORD PTR _symfile$S832
	dec	DWORD PTR [eax+4]
	mov	eax, DWORD PTR _symfile$S832
	cmp	DWORD PTR [eax+4], 0
	jl	$L1244
	mov	eax, DWORD PTR _symfile$S832
	mov	eax, DWORD PTR [eax]
	mov	BYTE PTR [eax], 0
	mov	eax, DWORD PTR _symfile$S832
	inc	DWORD PTR [eax]
	jmp	$L1245
$L1244:
	mov	eax, DWORD PTR _symfile$S832
	push	eax
	push	0
	call	__flsbuf
	add	esp, 8
$L1245:
; Line 207
	inc	DWORD PTR _total$[ebp]
; Line 208
	jmp	$L892
$L893:
; Line 209
$L885:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_symout_strings_print ENDP
_p2$ = 16
_s2$ = 20
_total$ = -4
_p1$ = 8
_s1$ = 12
_symout_strings_skip PROC NEAR
; Line 219
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 222
	cmp	DWORD PTR _p1$[ebp], 0
	je	$L900
	cmp	DWORD PTR _s1$[ebp], 0
	jne	$L900
; Line 223
	mov	eax, DWORD PTR _p1$[ebp]
	push	eax
	call	_strlen
	add	esp, 4
	mov	DWORD PTR _s1$[ebp], eax
; Line 224
$L900:
	cmp	DWORD PTR _p2$[ebp], 0
	je	$L901
	cmp	DWORD PTR _s2$[ebp], 0
	jne	$L901
; Line 225
	mov	eax, DWORD PTR _p2$[ebp]
	push	eax
	call	_strlen
	add	esp, 4
	mov	DWORD PTR _s2$[ebp], eax
; Line 227
$L901:
	mov	eax, DWORD PTR _s2$[ebp]
	add	eax, DWORD PTR _s1$[ebp]
	inc	eax
	mov	DWORD PTR _total$[ebp], eax
; Line 228
$L903:
	test	BYTE PTR _total$[ebp], 3
	je	$L904
; Line 229
	inc	DWORD PTR _total$[ebp]
	jmp	$L903
$L904:
; Line 231
	mov	eax, DWORD PTR _total$[ebp]
	add	DWORD PTR _next_address$S835, eax
; Line 232
$L898:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_symout_strings_skip ENDP
_TEXT	ENDS
PUBLIC	_symout_types
EXTRN	_list_length:NEAR
EXTRN	_integer_zerop:NEAR
EXTRN	_fflush:NEAR
EXTRN	_abort:NEAR
EXTRN	_fseek:NEAR
EXTRN	_ftell:NEAR
EXTRN	_alloca:NEAR
EXTRN	_xmalloc:NEAR
EXTRN	_tree_cons:NEAR
EXTRN	_perm_tree_cons:NEAR
_DATA	SEGMENT
	ORG $+2
$SG931	DB	'struct ', 00H
$SG933	DB	'union ', 00H
	ORG $+1
$SG935	DB	'enum ', 00H
_DATA	ENDS
_TEXT	SEGMENT
_types$ = 8
_n_types$ = -36
_i$ = -44
_records$ = -52
_next$ = -40
_buffer$ = -32
_this_run_address$ = -48
_velt$922 = -56
_pos$939 = -60
_myaddr$940 = -64
_symout_types PROC NEAR
; Line 250
	push	ebp
	mov	ebp, esp
	sub	esp, 84					; 00000054H
	push	ebx
	push	esi
	push	edi
; Line 266
	mov	eax, DWORD PTR _next_address$S835
	mov	DWORD PTR _this_run_address$[ebp], eax
; Line 272
	mov	eax, DWORD PTR _types$[ebp]
	mov	DWORD PTR _next$[ebp], eax
	mov	DWORD PTR _n_types$[ebp], 0
	jmp	$L915
$L916:
	mov	eax, DWORD PTR _next$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _next$[ebp], eax
	inc	DWORD PTR _n_types$[ebp]
$L915:
	cmp	DWORD PTR _next$[ebp], 0
	je	$L917
	jmp	$L916
$L917:
; Line 274
	mov	eax, DWORD PTR _n_types$[ebp]
	mov	ecx, eax
	shl	eax, 3
	sub	eax, ecx
	shl	eax, 2
	push	eax
	call	_alloca
	add	esp, 4
	mov	DWORD PTR _records$[ebp], eax
; Line 281
	mov	eax, DWORD PTR _types$[ebp]
	mov	DWORD PTR _next$[ebp], eax
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L919
$L920:
	mov	eax, DWORD PTR _next$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _next$[ebp], eax
	inc	DWORD PTR _i$[ebp]
$L919:
	cmp	DWORD PTR _next$[ebp], 0
	je	$L921
; Line 284
	push	8
	call	_xmalloc
	add	esp, 4
	mov	DWORD PTR _velt$922[ebp], eax
; Line 285
	mov	eax, DWORD PTR _typevec$S837
	mov	ecx, DWORD PTR _velt$922[ebp]
	mov	DWORD PTR [ecx+4], eax
; Line 286
	mov	eax, DWORD PTR _velt$922[ebp]
	mov	DWORD PTR _typevec$S837, eax
; Line 288
	inc	DWORD PTR _total_types$S838
; Line 290
	mov	eax, DWORD PTR _next$[ebp]
	cmp	DWORD PTR [eax+56], 0
	je	$L924
; Line 292
	mov	eax, DWORD PTR _next_address$S835
	mov	ecx, DWORD PTR _i$[ebp]
	mov	edx, ecx
	shl	ecx, 3
	sub	ecx, edx
	mov	edx, DWORD PTR _records$[ebp]
	mov	DWORD PTR [edx+ecx*4+16], eax
; Line 294
	mov	eax, DWORD PTR _next$[ebp]
	mov	eax, DWORD PTR [eax+56]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 1
	jne	$L925
; Line 296
	mov	eax, DWORD PTR _next$[ebp]
	mov	eax, DWORD PTR [eax+56]
	mov	eax, DWORD PTR [eax+24]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	edx, ecx
	shl	ecx, 3
	sub	ecx, edx
	mov	edx, DWORD PTR _records$[ebp]
	mov	DWORD PTR [edx+ecx*4+20], eax
; Line 297
	mov	eax, DWORD PTR _next$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	mov	DWORD PTR -68+[ebp], eax
	jmp	$L926
; Line 299
$L930:
; Line 300
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, eax
	shl	eax, 3
	sub	eax, ecx
	mov	ecx, DWORD PTR _records$[ebp]
	mov	DWORD PTR [ecx+eax*4+24], OFFSET $SG931
; Line 301
	jmp	$L927
; Line 303
$L932:
; Line 304
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, eax
	shl	eax, 3
	sub	eax, ecx
	mov	ecx, DWORD PTR _records$[ebp]
	mov	DWORD PTR [ecx+eax*4+24], OFFSET $SG933
; Line 305
	jmp	$L927
; Line 307
$L934:
; Line 308
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, eax
	shl	eax, 3
	sub	eax, ecx
	mov	ecx, DWORD PTR _records$[ebp]
	mov	DWORD PTR [ecx+eax*4+24], OFFSET $SG935
; Line 309
	jmp	$L927
; Line 310
	jmp	$L927
$L926:
	cmp	DWORD PTR -68+[ebp], 8
	je	$L934
	cmp	DWORD PTR -68+[ebp], 19			; 00000013H
	je	$L930
	cmp	DWORD PTR -68+[ebp], 20			; 00000014H
	je	$L932
	jmp	$L927
$L927:
; Line 312
	jmp	$L936
$L925:
; Line 314
	mov	eax, DWORD PTR _next$[ebp]
	mov	eax, DWORD PTR [eax+56]
	mov	eax, DWORD PTR [eax+40]
	mov	eax, DWORD PTR [eax+24]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	edx, ecx
	shl	ecx, 3
	sub	ecx, edx
	mov	edx, DWORD PTR _records$[ebp]
	mov	DWORD PTR [edx+ecx*4+20], eax
; Line 315
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, eax
	shl	eax, 3
	sub	eax, ecx
	mov	ecx, DWORD PTR _records$[ebp]
	mov	DWORD PTR [ecx+eax*4+24], 0
; Line 316
$L936:
; Line 318
	push	0
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, eax
	shl	eax, 3
	sub	eax, ecx
	mov	ecx, DWORD PTR _records$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+20]
	push	eax
	push	0
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, eax
	shl	eax, 3
	sub	eax, ecx
	mov	ecx, DWORD PTR _records$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+24]
	push	eax
	call	_symout_strings_skip
	add	esp, 16					; 00000010H
; Line 321
	jmp	$L937
$L924:
; Line 323
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, eax
	shl	eax, 3
	sub	eax, ecx
	mov	ecx, DWORD PTR _records$[ebp]
	mov	DWORD PTR [ecx+eax*4+20], 0
; Line 324
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, eax
	shl	eax, 3
	sub	eax, ecx
	mov	ecx, DWORD PTR _records$[ebp]
	mov	DWORD PTR [ecx+eax*4+16], 0
; Line 325
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, eax
	shl	eax, 3
	sub	eax, ecx
	mov	ecx, DWORD PTR _records$[ebp]
	mov	DWORD PTR [ecx+eax*4+24], 0
; Line 326
$L937:
; Line 332
	mov	eax, DWORD PTR _next$[ebp]
	cmp	DWORD PTR [eax+40], 0
	je	$L938
	mov	eax, DWORD PTR _next$[ebp]
	mov	eax, DWORD PTR [eax+40]
	cmp	DWORD PTR [eax+52], 0
	je	$L938
	mov	eax, DWORD PTR _next$[ebp]
	mov	eax, DWORD PTR [eax+40]
	mov	ecx, DWORD PTR _this_run_address$[ebp]
	cmp	DWORD PTR [eax+52], ecx
	jge	$L938
; Line 334
	mov	eax, DWORD PTR _symfile$S832
	push	eax
	call	_ftell
	add	esp, 4
	mov	DWORD PTR _pos$939[ebp], eax
; Line 335
	mov	eax, DWORD PTR _next_address$S835
	mov	DWORD PTR _myaddr$940[ebp], eax
; Line 336
	mov	eax, DWORD PTR _symfile$S832
	push	eax
	call	_fflush
	add	esp, 4
; Line 340
	push	0
	mov	eax, DWORD PTR _next$[ebp]
	mov	eax, DWORD PTR [eax+40]
	mov	eax, DWORD PTR [eax+52]
	add	eax, 12					; 0000000cH
	push	eax
	mov	eax, DWORD PTR _symfile$S832
	push	eax
	call	_fseek
	add	esp, 12					; 0000000cH
; Line 341
	mov	eax, DWORD PTR _symfile$S832
	push	eax
	push	1
	push	4
	lea	eax, DWORD PTR _myaddr$940[ebp]
	push	eax
	call	_fwrite
	add	esp, 16					; 00000010H
; Line 342
	mov	eax, DWORD PTR _symfile$S832
	push	eax
	call	_fflush
	add	esp, 4
; Line 343
	push	0
	mov	eax, DWORD PTR _pos$939[ebp]
	push	eax
	mov	eax, DWORD PTR _symfile$S832
	push	eax
	call	_fseek
	add	esp, 12					; 0000000cH
; Line 346
$L938:
	mov	eax, DWORD PTR _next_address$S835
	mov	ecx, DWORD PTR _i$[ebp]
	mov	edx, ecx
	shl	ecx, 3
	sub	ecx, edx
	mov	edx, DWORD PTR _records$[ebp]
	mov	DWORD PTR [edx+ecx*4+4], eax
; Line 347
	mov	eax, DWORD PTR _next_address$S835
	mov	ecx, DWORD PTR _next$[ebp]
	mov	DWORD PTR [ecx+52], eax
; Line 348
	mov	eax, DWORD PTR _next_address$S835
	mov	ecx, DWORD PTR _velt$922[ebp]
	mov	DWORD PTR [ecx], eax
; Line 349
	mov	eax, DWORD PTR _next_address$S835
	add	eax, 32					; 00000020H
	mov	DWORD PTR _next_address$S835, eax
; Line 350
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, eax
	shl	eax, 3
	sub	eax, ecx
	mov	ecx, DWORD PTR _records$[ebp]
	mov	DWORD PTR [ecx+eax*4+8], 0
; Line 351
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, eax
	shl	eax, 3
	sub	eax, ecx
	mov	ecx, DWORD PTR _records$[ebp]
	mov	DWORD PTR [ecx+eax*4+12], 0
; Line 352
	mov	eax, DWORD PTR _next$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	mov	DWORD PTR -72+[ebp], eax
	jmp	$L941
; Line 354
$L945:
; Line 358
	mov	eax, DWORD PTR _next$[ebp]
	cmp	DWORD PTR [eax+20], 0
	je	$L1246
	mov	eax, DWORD PTR _next$[ebp]
	mov	eax, DWORD PTR [eax+20]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	call	_integer_zerop
	add	esp, 4
	cmp	eax, 1
	sbb	eax, eax
	neg	eax
	mov	ecx, DWORD PTR _i$[ebp]
	mov	edx, ecx
	shl	ecx, 3
	sub	ecx, edx
	mov	edx, DWORD PTR _records$[ebp]
	mov	DWORD PTR [edx+ecx*4+8], eax
	jmp	$L1247
$L1246:
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, eax
	shl	eax, 3
	sub	eax, ecx
	mov	ecx, DWORD PTR _records$[ebp]
	mov	DWORD PTR [ecx+eax*4+8], 0
$L1247:
; Line 359
	jmp	$L942
; Line 361
$L946:
; Line 362
	mov	eax, DWORD PTR _next$[ebp]
	push	eax
	call	_subrange_p
	add	esp, 4
	or	eax, eax
	je	$L947
; Line 363
	mov	WORD PTR _buffer$[ebp+26], 2
; Line 364
$L947:
	jmp	$L942
; Line 366
$L948:
; Line 369
	mov	eax, DWORD PTR _next$[ebp]
	mov	eax, DWORD PTR [eax+20]
	push	eax
	call	_list_length
	add	esp, 4
	mov	ecx, DWORD PTR _i$[ebp]
	mov	edx, ecx
	shl	ecx, 3
	sub	ecx, edx
	mov	edx, DWORD PTR _records$[ebp]
	mov	DWORD PTR [edx+ecx*4+8], eax
; Line 370
	jmp	$L942
$L941:
	cmp	DWORD PTR -72+[ebp], 5
	je	$L946
	cmp	DWORD PTR -72+[ebp], 8
	je	$L948
	cmp	DWORD PTR -72+[ebp], 16			; 00000010H
	je	$L945
	cmp	DWORD PTR -72+[ebp], 19			; 00000013H
	jl	$L942
	cmp	DWORD PTR -72+[ebp], 20			; 00000014H
	jle	$L948
	jmp	$L942
$L942:
; Line 371
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, eax
	shl	eax, 3
	sub	eax, ecx
	mov	ecx, DWORD PTR _records$[ebp]
	cmp	DWORD PTR [ecx+eax*4+8], 0
	je	$L949
; Line 372
	mov	eax, DWORD PTR _next_address$S835
	mov	ecx, DWORD PTR _i$[ebp]
	mov	edx, ecx
	shl	ecx, 3
	sub	ecx, edx
	mov	edx, DWORD PTR _records$[ebp]
	mov	DWORD PTR [edx+ecx*4+12], eax
; Line 373
$L949:
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, eax
	shl	eax, 3
	sub	eax, ecx
	mov	ecx, DWORD PTR _records$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+8]
	shl	eax, 4
	add	eax, DWORD PTR _next_address$S835
	mov	DWORD PTR _next_address$S835, eax
; Line 374
	jmp	$L920
$L921:
; Line 381
	mov	eax, DWORD PTR _types$[ebp]
	mov	DWORD PTR _next$[ebp], eax
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L950
$L951:
	mov	eax, DWORD PTR _next$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _next$[ebp], eax
	inc	DWORD PTR _i$[ebp]
$L950:
	cmp	DWORD PTR _next$[ebp], 0
	je	$L952
; Line 383
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, eax
	shl	eax, 3
	sub	eax, ecx
	mov	ecx, DWORD PTR _records$[ebp]
	cmp	DWORD PTR [ecx+eax*4+20], 0
	je	$L953
; Line 385
	push	0
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, eax
	shl	eax, 3
	sub	eax, ecx
	mov	ecx, DWORD PTR _records$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+20]
	push	eax
	push	0
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, eax
	shl	eax, 3
	sub	eax, ecx
	mov	ecx, DWORD PTR _records$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+24]
	push	eax
	call	_symout_strings_print
	add	esp, 16					; 00000010H
; Line 387
$L953:
	mov	eax, DWORD PTR _next$[ebp]
	cmp	DWORD PTR [eax+8], 0
	je	$L954
	mov	eax, DWORD PTR _next$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+68]
	cmp	DWORD PTR [eax+52], 0
	jne	$L954
; Line 391
	mov	eax, DWORD PTR _next$[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 8
	test	al, 1
	je	$L955
; Line 393
	mov	eax, DWORD PTR _permanent_fwd_refs$S840
	push	eax
	push	0
	mov	eax, DWORD PTR _next$[ebp]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	call	_perm_tree_cons
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _permanent_fwd_refs$S840, eax
; Line 394
	jmp	$L956
$L955:
; Line 396
	mov	eax, DWORD PTR _temporary_fwd_refs$S839
	push	eax
	push	0
	mov	eax, DWORD PTR _next$[ebp]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	call	_tree_cons
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _temporary_fwd_refs$S839, eax
$L956:
; Line 399
$L954:
	mov	eax, DWORD PTR _next$[ebp]
	cmp	DWORD PTR [eax+28], 0
	jne	$L957
; Line 400
	mov	DWORD PTR _buffer$[ebp+8], 0
; Line 401
	jmp	$L958
$L957:
; Line 404
	mov	eax, DWORD PTR _next$[ebp]
	mov	al, BYTE PTR [eax+36]
	and	eax, 255				; 000000ffH
	mov	ecx, DWORD PTR _next$[ebp]
	mov	ecx, DWORD PTR [ecx+28]
	imul	eax, DWORD PTR [ecx+20]
	cdq
	and	edx, 7
	add	eax, edx
	sar	eax, 3
	mov	DWORD PTR _buffer$[ebp+8], eax
$L958:
; Line 406
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, eax
	shl	eax, 3
	sub	eax, ecx
	mov	ecx, DWORD PTR _records$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+16]
	mov	DWORD PTR _buffer$[ebp+4], eax
; Line 407
	mov	eax, DWORD PTR _next$[ebp]
	cmp	DWORD PTR [eax+8], 0
	je	$L1248
	mov	eax, DWORD PTR _next$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+68]
	mov	eax, DWORD PTR [eax+52]
	mov	DWORD PTR _buffer$[ebp+12], eax
	jmp	$L1249
$L1248:
	mov	DWORD PTR _buffer$[ebp+12], 0
$L1249:
; Line 409
	mov	DWORD PTR _buffer$[ebp+16], 0
; Line 410
	mov	DWORD PTR _buffer$[ebp+20], 0
; Line 414
	mov	eax, DWORD PTR _next$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 5
	je	$L1252
	mov	eax, DWORD PTR _next$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 8
	jne	$L1250
$L1252:
	mov	eax, DWORD PTR _next$[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 12					; 0000000cH
	test	al, 1
	je	$L1250
	mov	WORD PTR _buffer$[ebp+24], 1
	jmp	$L1251
$L1250:
	mov	WORD PTR _buffer$[ebp+24], 0
$L1251:
; Line 415
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, eax
	shl	eax, 3
	sub	eax, ecx
	mov	ecx, DWORD PTR _records$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+8]
	mov	WORD PTR _buffer$[ebp+26], ax
; Line 416
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, eax
	shl	eax, 3
	sub	eax, ecx
	mov	ecx, DWORD PTR _records$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+12]
	mov	DWORD PTR _buffer$[ebp+28], eax
; Line 418
	mov	eax, DWORD PTR _next$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	mov	DWORD PTR -76+[ebp], eax
	jmp	$L959
; Line 420
$L963:
; Line 421
	mov	DWORD PTR _buffer$[ebp], 7
; Line 422
	movsx	eax, WORD PTR _buffer$[ebp+26]
	or	eax, eax
	je	$L964
; Line 423
	mov	DWORD PTR _buffer$[ebp], 11		; 0000000bH
; Line 424
$L964:
	jmp	$L960
; Line 426
$L965:
; Line 427
	mov	DWORD PTR _buffer$[ebp], 8
; Line 428
	jmp	$L960
; Line 430
$L966:
; Line 431
	mov	DWORD PTR _buffer$[ebp], 9
; Line 432
	jmp	$L960
; Line 434
$L967:
; Line 435
	mov	DWORD PTR _buffer$[ebp], 1
; Line 436
	jmp	$L960
; Line 438
$L968:
; Line 439
	movsx	eax, WORD PTR _buffer$[ebp+26]
	or	eax, eax
	jne	$L969
; Line 440
	mov	DWORD PTR _buffer$[ebp], 2
; Line 441
	jmp	$L970
$L969:
; Line 442
	mov	DWORD PTR _buffer$[ebp], 12		; 0000000cH
$L970:
; Line 443
	jmp	$L960
; Line 445
$L971:
; Line 446
	mov	DWORD PTR _buffer$[ebp], 3
; Line 447
	jmp	$L960
; Line 449
$L972:
; Line 450
	mov	DWORD PTR _buffer$[ebp], 4
; Line 451
	jmp	$L960
; Line 453
$L973:
; Line 454
	mov	DWORD PTR _buffer$[ebp], 6
; Line 455
	jmp	$L960
; Line 457
$L974:
; Line 458
	mov	DWORD PTR _buffer$[ebp], 5
; Line 459
	jmp	$L960
; Line 461
$L975:
; Line 462
	call	_abort
; Line 463
	jmp	$L960
$L959:
	sub	DWORD PTR -76+[ebp], 4
	cmp	DWORD PTR -76+[ebp], 17			; 00000011H
	ja	$L975
	shl	DWORD PTR -76+[ebp], 2
	mov	eax, DWORD PTR -76+[ebp]
	jmp	DWORD PTR $L1253[eax]
$L1253:
	DD	OFFSET $L966
	DD	OFFSET $L963
	DD	OFFSET $L965
	DD	OFFSET $L975
	DD	OFFSET $L974
	DD	OFFSET $L975
	DD	OFFSET $L975
	DD	OFFSET $L967
	DD	OFFSET $L975
	DD	OFFSET $L975
	DD	OFFSET $L975
	DD	OFFSET $L975
	DD	OFFSET $L968
	DD	OFFSET $L975
	DD	OFFSET $L975
	DD	OFFSET $L971
	DD	OFFSET $L972
	DD	OFFSET $L973
$L960:
; Line 465
	mov	eax, DWORD PTR _symfile$S832
	push	eax
	push	1
	push	32					; 00000020H
	lea	eax, DWORD PTR _buffer$[ebp]
	push	eax
	call	_fwrite
	add	esp, 16					; 00000010H
; Line 471
	mov	eax, DWORD PTR _next$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	mov	DWORD PTR -80+[ebp], eax
	jmp	$L977
; Line 473
$L981:
; Line 474
	movsx	eax, WORD PTR _buffer$[ebp+26]
	or	eax, eax
	je	$L982
; Line 475
	mov	eax, DWORD PTR _next$[ebp]
	push	eax
	call	_symout_array_domain
	add	esp, 4
; Line 476
$L982:
	jmp	$L978
; Line 478
$L983:
; Line 480
	mov	eax, DWORD PTR _next$[ebp]
	push	eax
	call	_symout_record_fields
	add	esp, 4
; Line 481
	jmp	$L978
; Line 483
$L984:
; Line 484
	mov	eax, DWORD PTR _next$[ebp]
	push	eax
	call	_symout_enum_values
	add	esp, 4
; Line 485
	jmp	$L978
; Line 487
$L985:
; Line 488
	movsx	eax, WORD PTR _buffer$[ebp+26]
	or	eax, eax
	je	$L986
; Line 489
	mov	eax, DWORD PTR _next$[ebp]
	push	eax
	call	_symout_range_bounds
	add	esp, 4
; Line 490
$L986:
	jmp	$L978
$L977:
	cmp	DWORD PTR -80+[ebp], 5
	je	$L985
	cmp	DWORD PTR -80+[ebp], 8
	je	$L984
	cmp	DWORD PTR -80+[ebp], 16			; 00000010H
	je	$L981
	cmp	DWORD PTR -80+[ebp], 19			; 00000013H
	jl	$L978
	cmp	DWORD PTR -80+[ebp], 20			; 00000014H
	jle	$L983
	jmp	$L978
$L978:
; Line 491
	jmp	$L951
$L952:
; Line 498
	mov	eax, DWORD PTR _types$[ebp]
	mov	DWORD PTR _next$[ebp], eax
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L987
$L988:
	mov	eax, DWORD PTR _next$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _next$[ebp], eax
	inc	DWORD PTR _i$[ebp]
$L987:
	cmp	DWORD PTR _next$[ebp], 0
	je	$L989
; Line 500
	mov	eax, DWORD PTR _next$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	mov	DWORD PTR -84+[ebp], eax
	jmp	$L990
; Line 502
$L994:
; Line 504
	mov	eax, DWORD PTR _next$[ebp]
	push	eax
	call	_symout_record_field_names
	add	esp, 4
; Line 505
	jmp	$L991
; Line 507
$L995:
; Line 508
	mov	eax, DWORD PTR _next$[ebp]
	push	eax
	call	_symout_enum_value_names
	add	esp, 4
; Line 509
	jmp	$L991
; Line 510
	jmp	$L991
$L990:
	cmp	DWORD PTR -84+[ebp], 8
	je	$L995
	cmp	DWORD PTR -84+[ebp], 19			; 00000013H
	jl	$L991
	cmp	DWORD PTR -84+[ebp], 20			; 00000014H
	jle	$L994
	jmp	$L991
$L991:
; Line 511
	jmp	$L988
$L989:
; Line 512
$L907:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_symout_types ENDP
_types$ = 8
_new$ = -4
_next$ = -8
_filter_undefined_types PROC NEAR
; Line 520
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	push	ebx
	push	esi
	push	edi
; Line 521
	mov	DWORD PTR _new$[ebp], 0
; Line 524
	mov	eax, DWORD PTR _types$[ebp]
	mov	DWORD PTR _next$[ebp], eax
	jmp	$L1001
$L1002:
	mov	eax, DWORD PTR _next$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _next$[ebp], eax
$L1001:
	cmp	DWORD PTR _next$[ebp], 0
	je	$L1003
; Line 525
	mov	eax, DWORD PTR _next$[ebp]
	mov	eax, DWORD PTR [eax+20]
	cmp	DWORD PTR [eax+52], 0
	jne	$L1004
; Line 527
	mov	eax, DWORD PTR _new$[ebp]
	mov	ecx, DWORD PTR _next$[ebp]
	mov	ecx, DWORD PTR [ecx+20]
	mov	DWORD PTR [ecx+4], eax
; Line 528
	mov	eax, DWORD PTR _next$[ebp]
	mov	eax, DWORD PTR [eax+20]
	mov	DWORD PTR _new$[ebp], eax
; Line 531
$L1004:
	jmp	$L1002
$L1003:
	mov	eax, DWORD PTR _new$[ebp]
	jmp	$L998
; Line 532
$L998:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_filter_undefined_types ENDP
_type$ = 8
_uns$ = -4
_mask$1011 = -8
_subrange_p PROC NEAR
; Line 541
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	push	ebx
	push	esi
	push	edi
; Line 542
	mov	eax, DWORD PTR _type$[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 12					; 0000000cH
	and	eax, 1
	mov	DWORD PTR _uns$[ebp], eax
; Line 544
	mov	eax, DWORD PTR _type$[ebp]
	mov	al, BYTE PTR [eax+38]
	and	eax, 255				; 000000ffH
	cmp	eax, 32					; 00000020H
	jl	$L1008
; Line 546
	cmp	DWORD PTR _uns$[ebp], 0
	je	$L1009
; Line 550
	mov	eax, DWORD PTR _type$[ebp]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	call	_integer_zerop
	add	esp, 4
	or	eax, eax
	je	$L1254
	mov	eax, DWORD PTR _type$[ebp]
	mov	eax, DWORD PTR [eax+60]
	cmp	DWORD PTR [eax+20], 0
	jne	$L1254
	mov	eax, 1
	mov	edx, DWORD PTR _type$[ebp]
	mov	dl, BYTE PTR [edx+38]
	and	edx, 255				; 000000ffH
	sub	edx, 32					; 00000020H
	mov	cl, dl
	shl	eax, cl
	dec	eax
	mov	ecx, DWORD PTR _type$[ebp]
	mov	ecx, DWORD PTR [ecx+60]
	cmp	eax, DWORD PTR [ecx+24]
	jne	$L1254
	mov	eax, 1
	jmp	$L1255
$L1254:
	sub	eax, eax
$L1255:
	jmp	$L1006
; Line 551
$L1009:
; Line 556
	mov	eax, DWORD PTR _type$[ebp]
	mov	eax, DWORD PTR [eax+24]
	cmp	DWORD PTR [eax+20], 0
	jne	$L1256
	mov	eax, DWORD PTR _type$[ebp]
	mov	eax, DWORD PTR [eax+60]
	cmp	DWORD PTR [eax+20], 0
	jne	$L1256
	mov	eax, -1
	mov	ecx, DWORD PTR _type$[ebp]
	mov	cl, BYTE PTR [ecx+38]
	and	ecx, 255				; 000000ffH
	sub	ecx, 33					; 00000021H
	shl	eax, cl
	mov	ecx, DWORD PTR _type$[ebp]
	mov	ecx, DWORD PTR [ecx+24]
	cmp	eax, DWORD PTR [ecx+24]
	jne	$L1256
	mov	eax, 1
	mov	ecx, DWORD PTR _type$[ebp]
	mov	cl, BYTE PTR [ecx+38]
	and	ecx, 255				; 000000ffH
	sub	ecx, 33					; 00000021H
	shl	eax, cl
	dec	eax
	mov	ecx, DWORD PTR _type$[ebp]
	mov	ecx, DWORD PTR [ecx+60]
	cmp	eax, DWORD PTR [ecx+24]
	jne	$L1256
	mov	eax, 1
	jmp	$L1257
$L1256:
	sub	eax, eax
$L1257:
	jmp	$L1006
; Line 559
$L1008:
	cmp	DWORD PTR _uns$[ebp], 0
	je	$L1010
; Line 563
	mov	eax, DWORD PTR _type$[ebp]
	mov	al, BYTE PTR [eax+38]
	and	eax, 255				; 000000ffH
	cmp	eax, 32					; 00000020H
	jne	$L1012
; Line 565
	mov	DWORD PTR _mask$1011[ebp], -1
; Line 566
	jmp	$L1013
$L1012:
; Line 567
	mov	eax, 1
	mov	ecx, DWORD PTR _type$[ebp]
	mov	cl, BYTE PTR [ecx+38]
	shl	eax, cl
	dec	eax
	mov	DWORD PTR _mask$1011[ebp], eax
$L1013:
; Line 570
	mov	eax, DWORD PTR _type$[ebp]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	call	_integer_zerop
	add	esp, 4
	or	eax, eax
	je	$L1258
	mov	eax, DWORD PTR _type$[ebp]
	mov	eax, DWORD PTR [eax+60]
	mov	ecx, DWORD PTR _mask$1011[ebp]
	cmp	DWORD PTR [eax+20], ecx
	jne	$L1258
	mov	eax, 1
	jmp	$L1259
$L1258:
	sub	eax, eax
$L1259:
	jmp	$L1006
; Line 572
	jmp	$L1014
$L1010:
; Line 576
	mov	eax, -1
	mov	ecx, DWORD PTR _type$[ebp]
	mov	cl, BYTE PTR [ecx+38]
	and	ecx, 255				; 000000ffH
	dec	ecx
	shl	eax, cl
	mov	ecx, DWORD PTR _type$[ebp]
	mov	ecx, DWORD PTR [ecx+24]
	cmp	eax, DWORD PTR [ecx+20]
	jne	$L1260
	mov	eax, 1
	mov	ecx, DWORD PTR _type$[ebp]
	mov	cl, BYTE PTR [ecx+38]
	and	ecx, 255				; 000000ffH
	dec	ecx
	shl	eax, cl
	dec	eax
	mov	ecx, DWORD PTR _type$[ebp]
	mov	ecx, DWORD PTR [ecx+60]
	cmp	eax, DWORD PTR [ecx+20]
	jne	$L1260
	mov	eax, 1
	jmp	$L1261
$L1260:
	sub	eax, eax
$L1261:
	jmp	$L1006
$L1014:
; Line 577
$L1006:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_subrange_p ENDP
_type$ = 8
_buffer$ = -16
_symout_array_domain PROC NEAR
; Line 588
	push	ebp
	mov	ebp, esp
	sub	esp, 16					; 00000010H
	push	ebx
	push	esi
	push	edi
; Line 591
	mov	DWORD PTR _buffer$[ebp], 0
; Line 592
	mov	DWORD PTR _buffer$[ebp+4], 0
; Line 593
	mov	eax, DWORD PTR _type$[ebp]
	mov	eax, DWORD PTR [eax+20]
	mov	eax, DWORD PTR [eax+68]
	mov	eax, DWORD PTR [eax+52]
	mov	DWORD PTR _buffer$[ebp+8], eax
; Line 594
	mov	DWORD PTR _buffer$[ebp+12], 0
; Line 595
	mov	eax, DWORD PTR _symfile$S832
	push	eax
	push	1
	push	16					; 00000010H
	lea	eax, DWORD PTR _buffer$[ebp]
	push	eax
	call	_fwrite
	add	esp, 16					; 00000010H
; Line 596
$L1016:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_symout_array_domain ENDP
_type$ = 8
_buffer$ = -16
_symout_range_bounds PROC NEAR
; Line 601
	push	ebp
	mov	ebp, esp
	sub	esp, 16					; 00000010H
	push	ebx
	push	esi
	push	edi
; Line 604
	mov	eax, DWORD PTR _type$[ebp]
	mov	eax, DWORD PTR [eax+24]
	mov	eax, DWORD PTR [eax+20]
	mov	DWORD PTR _buffer$[ebp], eax
; Line 605
	mov	DWORD PTR _buffer$[ebp+4], 0
; Line 606
	mov	eax, DWORD PTR _type$[ebp]
	mov	eax, DWORD PTR [eax+68]
	mov	eax, DWORD PTR [eax+52]
	mov	DWORD PTR _buffer$[ebp+8], eax
; Line 607
	mov	DWORD PTR _buffer$[ebp+12], 0
; Line 608
	mov	eax, DWORD PTR _symfile$S832
	push	eax
	push	1
	push	16					; 00000010H
	lea	eax, DWORD PTR _buffer$[ebp]
	push	eax
	call	_fwrite
	add	esp, 16					; 00000010H
; Line 610
	mov	eax, DWORD PTR _type$[ebp]
	mov	eax, DWORD PTR [eax+60]
	mov	eax, DWORD PTR [eax+20]
	mov	DWORD PTR _buffer$[ebp], eax
; Line 611
	mov	DWORD PTR _buffer$[ebp+4], 0
; Line 612
	mov	eax, DWORD PTR _type$[ebp]
	mov	eax, DWORD PTR [eax+68]
	mov	eax, DWORD PTR [eax+52]
	mov	DWORD PTR _buffer$[ebp+8], eax
; Line 613
	mov	DWORD PTR _buffer$[ebp+12], 0
; Line 614
	mov	eax, DWORD PTR _symfile$S832
	push	eax
	push	1
	push	16					; 00000010H
	lea	eax, DWORD PTR _buffer$[ebp]
	push	eax
	call	_fwrite
	add	esp, 16					; 00000010H
; Line 615
$L1019:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_symout_range_bounds ENDP
_field$ = -4
_type$ = 8
_buffer$ = -20
_symout_record_fields PROC NEAR
; Line 620
	push	ebp
	mov	ebp, esp
	sub	esp, 20					; 00000014H
	push	ebx
	push	esi
	push	edi
; Line 624
	mov	eax, DWORD PTR _type$[ebp]
	mov	eax, DWORD PTR [eax+20]
	mov	DWORD PTR _field$[ebp], eax
	jmp	$L1025
$L1026:
	mov	eax, DWORD PTR _field$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _field$[ebp], eax
$L1025:
	cmp	DWORD PTR _field$[ebp], 0
	je	$L1027
; Line 626
	mov	eax, DWORD PTR _field$[ebp]
	mov	eax, DWORD PTR [eax+48]
	mov	DWORD PTR _buffer$[ebp], eax
; Line 630
	mov	eax, DWORD PTR _field$[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 4
	test	al, 1
	je	$L1262
	mov	eax, DWORD PTR _field$[ebp]
	mov	al, BYTE PTR [eax+36]
	and	eax, 255				; 000000ffH
	mov	ecx, DWORD PTR _field$[ebp]
	mov	ecx, DWORD PTR [ecx+28]
	imul	eax, DWORD PTR [ecx+20]
	mov	DWORD PTR _buffer$[ebp+4], eax
	jmp	$L1263
$L1262:
	mov	DWORD PTR _buffer$[ebp+4], 0
$L1263:
; Line 631
	mov	eax, DWORD PTR _field$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+68]
	mov	eax, DWORD PTR [eax+52]
	mov	DWORD PTR _buffer$[ebp+8], eax
; Line 632
	mov	eax, DWORD PTR _field$[ebp]
	cmp	DWORD PTR [eax+40], 0
	je	$L1028
; Line 634
	mov	eax, DWORD PTR _next_address$S835
	mov	DWORD PTR _buffer$[ebp+12], eax
; Line 635
	push	0
	push	0
	mov	eax, DWORD PTR _field$[ebp]
	mov	eax, DWORD PTR [eax+40]
	mov	eax, DWORD PTR [eax+20]
	push	eax
	push	0
	call	_symout_strings_skip
	add	esp, 16					; 00000010H
; Line 637
	jmp	$L1029
$L1028:
; Line 638
	mov	DWORD PTR _buffer$[ebp+12], 0
$L1029:
; Line 639
	mov	eax, DWORD PTR _symfile$S832
	push	eax
	push	1
	push	16					; 00000010H
	lea	eax, DWORD PTR _buffer$[ebp]
	push	eax
	call	_fwrite
	add	esp, 16					; 00000010H
; Line 640
	jmp	$L1026
$L1027:
; Line 641
$L1022:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_symout_record_fields ENDP
_type$ = 8
_buffer$ = -16
_link$ = -24
_value$ = -20
_symout_enum_values PROC NEAR
; Line 646
	push	ebp
	mov	ebp, esp
	sub	esp, 24					; 00000018H
	push	ebx
	push	esi
	push	edi
; Line 650
	mov	eax, DWORD PTR _type$[ebp]
	mov	eax, DWORD PTR [eax+20]
	mov	DWORD PTR _link$[ebp], eax
	jmp	$L1035
$L1036:
	mov	eax, DWORD PTR _link$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _link$[ebp], eax
$L1035:
	cmp	DWORD PTR _link$[ebp], 0
	je	$L1037
; Line 652
	mov	eax, DWORD PTR _link$[ebp]
	mov	eax, DWORD PTR [eax+24]
	mov	DWORD PTR _value$[ebp], eax
; Line 653
	mov	eax, DWORD PTR _value$[ebp]
	mov	eax, DWORD PTR [eax+20]
	mov	DWORD PTR _buffer$[ebp], eax
; Line 654
	mov	DWORD PTR _buffer$[ebp+4], 0
; Line 655
	mov	eax, DWORD PTR _type$[ebp]
	mov	eax, DWORD PTR [eax+68]
	mov	eax, DWORD PTR [eax+52]
	mov	DWORD PTR _buffer$[ebp+8], eax
; Line 656
	mov	eax, DWORD PTR _next_address$S835
	mov	DWORD PTR _buffer$[ebp+12], eax
; Line 657
	push	0
	push	0
	mov	eax, DWORD PTR _link$[ebp]
	mov	eax, DWORD PTR [eax+20]
	mov	eax, DWORD PTR [eax+20]
	push	eax
	push	0
	call	_symout_strings_skip
	add	esp, 16					; 00000010H
; Line 658
	mov	eax, DWORD PTR _symfile$S832
	push	eax
	push	1
	push	16					; 00000010H
	lea	eax, DWORD PTR _buffer$[ebp]
	push	eax
	call	_fwrite
	add	esp, 16					; 00000010H
; Line 659
	jmp	$L1036
$L1037:
; Line 660
$L1031:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_symout_enum_values ENDP
_type$ = 8
_field$ = -4
_symout_record_field_names PROC NEAR
; Line 671
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 674
	mov	eax, DWORD PTR _type$[ebp]
	mov	eax, DWORD PTR [eax+20]
	mov	DWORD PTR _field$[ebp], eax
	jmp	$L1041
$L1042:
	mov	eax, DWORD PTR _field$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _field$[ebp], eax
$L1041:
	cmp	DWORD PTR _field$[ebp], 0
	je	$L1043
; Line 675
	mov	eax, DWORD PTR _field$[ebp]
	cmp	DWORD PTR [eax+40], 0
	je	$L1044
; Line 678
	push	0
	push	0
	mov	eax, DWORD PTR _field$[ebp]
	mov	eax, DWORD PTR [eax+40]
	mov	eax, DWORD PTR [eax+20]
	push	eax
	mov	eax, DWORD PTR _field$[ebp]
	mov	eax, DWORD PTR [eax+40]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	call	_symout_strings_print
	add	esp, 16					; 00000010H
; Line 679
$L1044:
	jmp	$L1042
$L1043:
$L1039:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_symout_record_field_names ENDP
_type$ = 8
_value$ = -4
_symout_enum_value_names PROC NEAR
; Line 684
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 687
	mov	eax, DWORD PTR _type$[ebp]
	mov	eax, DWORD PTR [eax+20]
	mov	DWORD PTR _value$[ebp], eax
	jmp	$L1048
$L1049:
	mov	eax, DWORD PTR _value$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _value$[ebp], eax
$L1048:
	cmp	DWORD PTR _value$[ebp], 0
	je	$L1050
; Line 690
	push	0
	push	0
	mov	eax, DWORD PTR _value$[ebp]
	mov	eax, DWORD PTR [eax+20]
	mov	eax, DWORD PTR [eax+20]
	push	eax
	mov	eax, DWORD PTR _value$[ebp]
	mov	eax, DWORD PTR [eax+20]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	call	_symout_strings_print
	add	esp, 16					; 00000010H
	jmp	$L1049
$L1050:
; Line 691
$L1046:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_symout_enum_value_names ENDP
_TEXT	ENDS
EXTRN	_error_mark_node:DWORD
_DATA	SEGMENT
	ORG $+2
$SG1078	DB	09H, '.gdbsym ', 00H
	ORG $+2
$SG1079	DB	'_%s', 00H
$SG1080	DB	',%d', 0aH, 00H
_DATA	ENDS
_TEXT	SEGMENT
_ptype$1088 = -40
_addr$1094 = -44
_addr$1100 = -48
_decls$ = 8
_addr_buffer$ = 12
_filter$ = 16
_decl$ = -28
_buffer$ = -20
_i$ = -24
_name_address$1062 = -32
_str$1077 = -36
_symout_block_symbols PROC NEAR
; Line 706
	push	ebp
	mov	ebp, esp
	sub	esp, 52					; 00000034H
	push	ebx
	push	esi
	push	edi
; Line 711
	mov	eax, DWORD PTR _decls$[ebp]
	mov	DWORD PTR _decl$[ebp], eax
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L1059
$L1060:
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _decl$[ebp], eax
$L1059:
	cmp	DWORD PTR _decl$[ebp], 0
	je	$L1061
; Line 713
	mov	eax, DWORD PTR _next_address$S835
	mov	DWORD PTR _name_address$1062[ebp], eax
; Line 715
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 1
	and	eax, 1
	cmp	eax, 1
	sbb	eax, eax
	and	eax, 1
	inc	eax
	cmp	eax, DWORD PTR _filter$[ebp]
	jne	$L1063
; Line 716
	jmp	$L1060
; Line 722
$L1063:
; Line 723
	mov	eax, DWORD PTR _decl$[ebp]
	test	BYTE PTR [eax+16], 1
	je	$L1064
	cmp	DWORD PTR _filter$[ebp], 0
	jne	$L1065
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 21					; 00000015H
	jne	$L1064
$L1065:
; Line 724
	jmp	$L1060
; Line 726
$L1064:
	mov	eax, DWORD PTR _decl$[ebp]
	mov	ecx, DWORD PTR _error_mark_node
	cmp	DWORD PTR [eax+8], ecx
	jne	$L1066
; Line 727
	jmp	$L1060
; Line 729
$L1066:
; Line 731
	push	0
	push	0
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+40]
	mov	eax, DWORD PTR [eax+20]
	push	eax
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+40]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	call	_symout_strings
	add	esp, 16					; 00000010H
; Line 732
	mov	eax, DWORD PTR _next_address$S835
	mov	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _addr_buffer$[ebp]
	mov	DWORD PTR [edx+ecx*4], eax
; Line 733
	mov	eax, DWORD PTR _name_address$1062[ebp]
	mov	DWORD PTR _buffer$[ebp], eax
; Line 734
	mov	DWORD PTR _buffer$[ebp+4], 1
; Line 735
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+68]
	mov	eax, DWORD PTR [eax+52]
	mov	DWORD PTR _buffer$[ebp+12], eax
; Line 736
	mov	eax, DWORD PTR _decl$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	mov	DWORD PTR -52+[ebp], eax
	jmp	$L1067
; Line 738
$L1071:
; Line 739
	mov	DWORD PTR _buffer$[ebp+8], 4
; Line 740
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+48]
	cdq
	and	edx, 7
	add	eax, edx
	sar	eax, 3
	mov	DWORD PTR _buffer$[ebp+16], eax
; Line 741
	jmp	$L1068
; Line 743
$L1072:
; Line 745
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 2
	test	al, 1
	jne	$L1074
	mov	eax, DWORD PTR _decl$[ebp]
	test	BYTE PTR [eax+16], 1
	je	$L1073
$L1074:
; Line 747
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 1
	test	al, 1
	je	$L1076
	mov	eax, DWORD PTR _decl$[ebp]
	cmp	DWORD PTR [eax+64], 0
	je	$L1075
$L1076:
; Line 749
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+76]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _str$1077[ebp], eax
; Line 750
	push	OFFSET $SG1078
	mov	eax, DWORD PTR _asmfile$S834
	push	eax
	call	_fprintf
	add	esp, 8
; Line 751
	mov	eax, DWORD PTR _str$1077[ebp]
	push	eax
	push	OFFSET $SG1079
	mov	eax, DWORD PTR _asmfile$S834
	push	eax
	call	_fprintf
	add	esp, 12					; 0000000cH
; Line 753
	mov	eax, DWORD PTR _next_address$S835
	lea	eax, DWORD PTR _buffer$[ebp+eax+16]
	lea	ecx, DWORD PTR _buffer$[ebp]
	sub	eax, ecx
	push	eax
	push	OFFSET $SG1080
	mov	eax, DWORD PTR _asmfile$S834
	push	eax
	call	_fprintf
	add	esp, 12					; 0000000cH
; Line 754
	mov	DWORD PTR _buffer$[ebp+8], 2
; Line 756
	jmp	$L1081
$L1075:
; Line 760
	mov	DWORD PTR _buffer$[ebp+8], 9
$L1081:
; Line 762
	jmp	$L1082
$L1073:
; Line 764
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+76]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1083
; Line 766
	mov	DWORD PTR _buffer$[ebp+8], 3
; Line 767
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+76]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _buffer$[ebp+16], eax
; Line 769
	cmp	DWORD PTR _buffer$[ebp+16], -1
	jne	$L1084
; Line 770
	mov	DWORD PTR _buffer$[ebp+8], 1
; Line 771
$L1084:
; Line 772
	jmp	$L1085
$L1083:
; Line 775
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+76]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2424832				; 00250000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1086
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+76]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2424832				; 00250000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1087
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+76]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1086
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+76]
	mov	eax, DWORD PTR [eax+4]
	cmp	DWORD PTR [eax+4], 6
	je	$L1086
$L1087:
; Line 785
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+40]
	mov	DWORD PTR _ptype$1088[ebp], eax
; Line 787
	cmp	DWORD PTR _ptype$1088[ebp], 0
	je	$L1090
	mov	eax, DWORD PTR _ptype$1088[ebp]
	mov	eax, DWORD PTR [eax+68]
	cmp	DWORD PTR [eax+52], 0
	jne	$L1089
$L1090:
; Line 788
	jmp	$L1060
; Line 790
$L1089:
	mov	eax, DWORD PTR _ptype$1088[ebp]
	mov	eax, DWORD PTR [eax+68]
	mov	eax, DWORD PTR [eax+52]
	mov	DWORD PTR _buffer$[ebp+12], eax
; Line 793
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+76]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1091
; Line 795
	mov	DWORD PTR _buffer$[ebp+8], 3
; Line 796
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+76]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _buffer$[ebp+16], eax
; Line 798
	cmp	DWORD PTR _buffer$[ebp+16], -1
	jne	$L1092
; Line 799
	mov	DWORD PTR _buffer$[ebp+8], 1
; Line 800
$L1092:
; Line 801
	jmp	$L1093
$L1091:
; Line 803
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+76]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _addr$1094[ebp], eax
; Line 804
	mov	eax, DWORD PTR _addr$1094[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2883584				; 002c0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1095
	mov	eax, DWORD PTR _addr$1094[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2949120				; 002d0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1095
; Line 805
	call	_abort
; Line 806
$L1095:
	mov	eax, DWORD PTR _addr$1094[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1096
; Line 807
	call	_abort
; Line 808
$L1096:
	mov	DWORD PTR _buffer$[ebp+8], 5
; Line 809
	mov	eax, DWORD PTR _addr$1094[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _buffer$[ebp+16], eax
; Line 810
	mov	eax, DWORD PTR _addr$1094[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2949120				; 002d0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1097
; Line 811
	mov	eax, DWORD PTR _buffer$[ebp+16]
	neg	eax
	mov	DWORD PTR _buffer$[ebp+16], eax
; Line 812
$L1097:
$L1093:
; Line 817
	jmp	$L1098
$L1086:
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+76]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2424832				; 00250000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1099
; Line 819
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+76]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _addr$1100[ebp], eax
; Line 820
	mov	eax, DWORD PTR _addr$1100[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2883584				; 002c0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1101
	mov	eax, DWORD PTR _addr$1100[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2949120				; 002d0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1101
; Line 821
	call	_abort
; Line 822
$L1101:
	mov	eax, DWORD PTR _addr$1100[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1102
; Line 823
	call	_abort
; Line 824
$L1102:
	mov	DWORD PTR _buffer$[ebp+8], 5
; Line 825
	mov	eax, DWORD PTR _addr$1100[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _buffer$[ebp+16], eax
; Line 826
	mov	eax, DWORD PTR _addr$1100[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2949120				; 002d0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1103
; Line 827
	mov	eax, DWORD PTR _buffer$[ebp+16]
	neg	eax
	mov	DWORD PTR _buffer$[ebp+16], eax
; Line 828
$L1103:
; Line 829
	jmp	$L1104
$L1099:
; Line 830
	call	_abort
$L1104:
$L1098:
$L1085:
; Line 831
$L1082:
; Line 832
	jmp	$L1068
; Line 834
$L1105:
; Line 835
	mov	DWORD PTR _buffer$[ebp+8], 6
; Line 836
	mov	DWORD PTR _buffer$[ebp+16], 0
; Line 837
	jmp	$L1068
; Line 839
$L1106:
; Line 840
	mov	DWORD PTR _buffer$[ebp+8], 1
; Line 841
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+64]
	mov	eax, DWORD PTR [eax+20]
	mov	DWORD PTR _buffer$[ebp+16], eax
; Line 842
	jmp	$L1068
; Line 844
$L1107:
; Line 845
	mov	eax, DWORD PTR _decl$[ebp]
	cmp	DWORD PTR [eax+64], 0
	je	$L1108
; Line 847
	mov	DWORD PTR _buffer$[ebp+8], 8
; Line 848
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+88]
	mov	DWORD PTR _buffer$[ebp+16], eax
; Line 850
	jmp	$L1109
$L1108:
; Line 851
	mov	DWORD PTR _buffer$[ebp+8], 9
$L1109:
; Line 852
	jmp	$L1068
$L1067:
	sub	DWORD PTR -52+[ebp], 39			; 00000027H
	cmp	DWORD PTR -52+[ebp], 6
	ja	$L1068
	shl	DWORD PTR -52+[ebp], 2
	mov	eax, DWORD PTR -52+[ebp]
	jmp	DWORD PTR $L1264[eax]
$L1264:
	DD	OFFSET $L1107
	DD	OFFSET $L1068
	DD	OFFSET $L1106
	DD	OFFSET $L1105
	DD	OFFSET $L1072
	DD	OFFSET $L1071
	DD	OFFSET $L1072
$L1068:
; Line 854
	mov	eax, DWORD PTR _symfile$S832
	push	eax
	push	1
	push	20					; 00000014H
	lea	eax, DWORD PTR _buffer$[ebp]
	push	eax
	call	_fwrite
	add	esp, 16					; 00000010H
; Line 855
	mov	eax, DWORD PTR _next_address$S835
	add	eax, 20					; 00000014H
	mov	DWORD PTR _next_address$S835, eax
; Line 856
	inc	DWORD PTR _i$[ebp]
; Line 857
	jmp	$L1060
$L1061:
; Line 858
$L1055:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_symout_block_symbols ENDP
_tags$ = 8
_addr_buffer$ = 12
_tag$ = -28
_buffer$ = -20
_i$ = -24
_symout_block_tags PROC NEAR
; Line 868
	push	ebp
	mov	ebp, esp
	sub	esp, 28					; 0000001cH
	push	ebx
	push	esi
	push	edi
; Line 873
	mov	eax, DWORD PTR _tags$[ebp]
	mov	DWORD PTR _tag$[ebp], eax
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L1117
$L1118:
	mov	eax, DWORD PTR _tag$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _tag$[ebp], eax
	inc	DWORD PTR _i$[ebp]
$L1117:
	cmp	DWORD PTR _tag$[ebp], 0
	je	$L1119
; Line 875
	mov	eax, DWORD PTR _next_address$S835
	mov	DWORD PTR _buffer$[ebp], eax
; Line 879
	push	0
	push	0
	mov	eax, DWORD PTR _tag$[ebp]
	mov	eax, DWORD PTR [eax+20]
	mov	eax, DWORD PTR [eax+20]
	push	eax
	mov	eax, DWORD PTR _tag$[ebp]
	mov	eax, DWORD PTR [eax+20]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	call	_symout_strings
	add	esp, 16					; 00000010H
; Line 880
	mov	eax, DWORD PTR _next_address$S835
	mov	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _addr_buffer$[ebp]
	mov	DWORD PTR [edx+ecx*4], eax
; Line 881
	mov	DWORD PTR _buffer$[ebp+4], 2
; Line 882
	mov	eax, DWORD PTR _tag$[ebp]
	mov	eax, DWORD PTR [eax+24]
	mov	eax, DWORD PTR [eax+68]
	mov	eax, DWORD PTR [eax+52]
	mov	DWORD PTR _buffer$[ebp+12], eax
; Line 883
	mov	DWORD PTR _buffer$[ebp+8], 6
; Line 884
	mov	DWORD PTR _buffer$[ebp+16], 0
; Line 886
	mov	eax, DWORD PTR _symfile$S832
	push	eax
	push	1
	push	20					; 00000014H
	lea	eax, DWORD PTR _buffer$[ebp]
	push	eax
	call	_fwrite
	add	esp, 16					; 00000010H
; Line 887
	mov	eax, DWORD PTR _next_address$S835
	add	eax, 20					; 00000014H
	mov	DWORD PTR _next_address$S835, eax
; Line 888
	jmp	$L1118
$L1119:
; Line 889
$L1113:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_symout_block_tags ENDP
_TEXT	ENDS
PUBLIC	_symout_block
_DATA	SEGMENT
	ORG $+3
$SG1147	DB	09H, '.gdbblock %d,%d', 0aH, 00H
_DATA	ENDS
_TEXT	SEGMENT
_decls$ = 8
_tags$ = 12
_args$ = 16
_superblock_address$ = 20
_decl$ = -60
_i$ = -44
_addr_buffer$ = -52
_buffer$ = -28
_n_decls$ = -48
_n_tags$ = -36
_n_args$ = -32
_total$ = -40
_velt$ = -56
_block_address$ = -4
_symout_block PROC NEAR
; Line 904
	push	ebp
	mov	ebp, esp
	sub	esp, 60					; 0000003cH
	push	ebx
	push	esi
	push	edi
; Line 913
	mov	eax, DWORD PTR _decls$[ebp]
	mov	DWORD PTR _decl$[ebp], eax
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L1136
$L1137:
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _decl$[ebp], eax
$L1136:
	cmp	DWORD PTR _decl$[ebp], 0
	je	$L1138
; Line 915
	mov	eax, DWORD PTR _decl$[ebp]
	test	BYTE PTR [eax+16], 1
	je	$L1140
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	cmp	eax, 21					; 00000015H
	je	$L1139
$L1140:
; Line 916
	inc	DWORD PTR _i$[ebp]
; Line 918
$L1139:
	jmp	$L1137
$L1138:
	mov	eax, DWORD PTR _i$[ebp]
	mov	DWORD PTR _n_decls$[ebp], eax
; Line 920
	mov	eax, DWORD PTR _args$[ebp]
	mov	DWORD PTR _decl$[ebp], eax
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L1141
$L1142:
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _decl$[ebp], eax
	inc	DWORD PTR _i$[ebp]
$L1141:
	cmp	DWORD PTR _decl$[ebp], 0
	je	$L1143
	jmp	$L1142
$L1143:
; Line 921
	mov	eax, DWORD PTR _i$[ebp]
	mov	DWORD PTR _n_args$[ebp], eax
; Line 923
	mov	eax, DWORD PTR _tags$[ebp]
	mov	DWORD PTR _decl$[ebp], eax
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L1144
$L1145:
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _decl$[ebp], eax
	inc	DWORD PTR _i$[ebp]
$L1144:
	cmp	DWORD PTR _decl$[ebp], 0
	je	$L1146
	jmp	$L1145
$L1146:
; Line 924
	mov	eax, DWORD PTR _i$[ebp]
	mov	DWORD PTR _n_tags$[ebp], eax
; Line 926
	mov	eax, DWORD PTR _n_args$[ebp]
	add	eax, DWORD PTR _n_tags$[ebp]
	add	eax, DWORD PTR _n_decls$[ebp]
	mov	DWORD PTR _total$[ebp], eax
; Line 928
	mov	eax, DWORD PTR _total$[ebp]
	shl	eax, 2
	push	eax
	call	_alloca
	add	esp, 4
	mov	DWORD PTR _addr_buffer$[ebp], eax
; Line 930
	push	0
	mov	eax, DWORD PTR _addr_buffer$[ebp]
	push	eax
	mov	eax, DWORD PTR _args$[ebp]
	push	eax
	call	_symout_block_symbols
	add	esp, 12					; 0000000cH
; Line 931
	push	0
	mov	eax, DWORD PTR _n_args$[ebp]
	shl	eax, 2
	add	eax, DWORD PTR _addr_buffer$[ebp]
	push	eax
	mov	eax, DWORD PTR _decls$[ebp]
	push	eax
	call	_symout_block_symbols
	add	esp, 12					; 0000000cH
; Line 932
	mov	eax, DWORD PTR _n_args$[ebp]
	mov	ecx, DWORD PTR _n_decls$[ebp]
	shl	ecx, 2
	lea	eax, DWORD PTR [ecx+eax*4]
	add	eax, DWORD PTR _addr_buffer$[ebp]
	push	eax
	mov	eax, DWORD PTR _tags$[ebp]
	push	eax
	call	_symout_block_tags
	add	esp, 8
; Line 934
	push	8
	call	_xmalloc
	add	esp, 4
	mov	DWORD PTR _velt$[ebp], eax
; Line 935
	mov	eax, DWORD PTR _blockvec$S842
	mov	ecx, DWORD PTR _velt$[ebp]
	mov	DWORD PTR [ecx+4], eax
; Line 936
	mov	eax, DWORD PTR _next_address$S835
	mov	ecx, DWORD PTR _velt$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 937
	mov	eax, DWORD PTR _velt$[ebp]
	mov	DWORD PTR _blockvec$S842, eax
; Line 939
	mov	DWORD PTR _buffer$[ebp], 0
; Line 940
	mov	DWORD PTR _buffer$[ebp+4], 0
; Line 941
	mov	eax, DWORD PTR _superblock_address$[ebp]
	mov	DWORD PTR _buffer$[ebp+12], eax
; Line 942
	mov	DWORD PTR _buffer$[ebp+8], 0
; Line 943
	mov	eax, DWORD PTR _total$[ebp]
	mov	DWORD PTR _buffer$[ebp+16], eax
; Line 945
	mov	eax, DWORD PTR _next_address$S835
	mov	DWORD PTR _block_address$[ebp], eax
; Line 946
	mov	eax, DWORD PTR _symfile$S832
	push	eax
	push	1
	push	20					; 00000014H
	lea	eax, DWORD PTR _buffer$[ebp]
	push	eax
	call	_fwrite
	add	esp, 16					; 00000010H
; Line 947
	mov	eax, DWORD PTR _next_address$S835
	add	eax, 20					; 00000014H
	mov	DWORD PTR _next_address$S835, eax
; Line 949
	mov	eax, DWORD PTR _symfile$S832
	push	eax
	mov	eax, DWORD PTR _total$[ebp]
	push	eax
	push	4
	mov	eax, DWORD PTR _addr_buffer$[ebp]
	push	eax
	call	_fwrite
	add	esp, 16					; 00000010H
; Line 950
	mov	eax, DWORD PTR _total$[ebp]
	shl	eax, 2
	add	eax, DWORD PTR _next_address$S835
	mov	DWORD PTR _next_address$S835, eax
; Line 952
	mov	eax, DWORD PTR _block_address$[ebp]
	push	eax
	mov	eax, DWORD PTR _total_blocks$S843
	add	eax, 2
	push	eax
	push	OFFSET $SG1147
	mov	eax, DWORD PTR _asmfile$S834
	push	eax
	call	_fprintf
	add	esp, 16					; 00000010H
; Line 953
	inc	DWORD PTR _total_blocks$S843
; Line 955
	mov	eax, DWORD PTR _block_address$[ebp]
	jmp	$L1125
; Line 956
$L1125:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_symout_block ENDP
_TEXT	ENDS
PUBLIC	_symout_function
_TEXT	SEGMENT
_address$ = -4
_stmt$ = 8
_args$ = 12
_superblock_address$ = 16
_symout_function PROC NEAR
; Line 971
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	push	ebx
	push	esi
	push	edi
; Line 972
	mov	eax, DWORD PTR _superblock_address$[ebp]
	mov	DWORD PTR _address$[ebp], eax
; Line 974
$L1155:
	cmp	DWORD PTR _stmt$[ebp], 0
	je	$L1156
; Line 976
	mov	eax, DWORD PTR _stmt$[ebp]
	mov	al, BYTE PTR [eax+12]
	and	eax, 255				; 000000ffH
	mov	DWORD PTR -8+[ebp], eax
	jmp	$L1157
; Line 978
$L1161:
; Line 980
	mov	eax, DWORD PTR _address$[ebp]
	push	eax
	push	0
	mov	eax, DWORD PTR _stmt$[ebp]
	mov	eax, DWORD PTR [eax+28]
	push	eax
	call	_symout_function
	add	esp, 12					; 0000000cH
; Line 981
	jmp	$L1158
; Line 983
$L1162:
; Line 984
	mov	eax, DWORD PTR _address$[ebp]
	push	eax
	push	0
	mov	eax, DWORD PTR _stmt$[ebp]
	mov	eax, DWORD PTR [eax+32]
	push	eax
	call	_symout_function
	add	esp, 12					; 0000000cH
; Line 985
	mov	eax, DWORD PTR _address$[ebp]
	push	eax
	push	0
	mov	eax, DWORD PTR _stmt$[ebp]
	mov	eax, DWORD PTR [eax+36]
	push	eax
	call	_symout_function
	add	esp, 12					; 0000000cH
; Line 986
	jmp	$L1158
; Line 988
$L1163:
; Line 990
	mov	eax, DWORD PTR _stmt$[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 15					; 0000000fH
	test	al, 1
	jne	$L1164
; Line 991
	jmp	$L1158
; Line 992
$L1164:
; Line 994
	mov	eax, DWORD PTR _superblock_address$[ebp]
	push	eax
	mov	eax, DWORD PTR _args$[ebp]
	push	eax
	mov	eax, DWORD PTR _stmt$[ebp]
	mov	eax, DWORD PTR [eax+44]
	push	eax
	mov	eax, DWORD PTR _stmt$[ebp]
	mov	eax, DWORD PTR [eax+32]
	push	eax
	call	_symout_block
	add	esp, 16					; 00000010H
	mov	DWORD PTR _address$[ebp], eax
; Line 996
	mov	eax, DWORD PTR _address$[ebp]
	push	eax
	push	0
	mov	eax, DWORD PTR _stmt$[ebp]
	mov	eax, DWORD PTR [eax+48]
	push	eax
	call	_symout_function
	add	esp, 12					; 0000000cH
; Line 997
	jmp	$L1158
$L1157:
	cmp	DWORD PTR -8+[ebp], 28			; 0000001cH
	je	$L1163
	cmp	DWORD PTR -8+[ebp], 29			; 0000001dH
	je	$L1162
	cmp	DWORD PTR -8+[ebp], 32			; 00000020H
	jl	$L1158
	cmp	DWORD PTR -8+[ebp], 33			; 00000021H
	jle	$L1161
	jmp	$L1158
$L1158:
; Line 998
	mov	eax, DWORD PTR _stmt$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _stmt$[ebp], eax
; Line 999
	jmp	$L1155
$L1156:
; Line 1000
	mov	eax, DWORD PTR _address$[ebp]
	jmp	$L1152
; Line 1001
$L1152:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_symout_function ENDP
_TEXT	ENDS
PUBLIC	_symout_function_end
_TEXT	SEGMENT
_symout_function_end PROC NEAR
; Line 1004
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 1006
	mov	eax, DWORD PTR _temporary_fwd_refs$S839
	push	eax
	call	_filter_undefined_types
	add	esp, 4
	push	eax
	call	_symout_types
	add	esp, 4
; Line 1007
	mov	DWORD PTR _temporary_fwd_refs$S839, 0
; Line 1008
$L1166:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_symout_function_end ENDP
_TEXT	ENDS
PUBLIC	_symout_top_blocks
_DATA	SEGMENT
	ORG $+2
$SG1183	DB	'.text 0', 0aH, 09H, '.gdbend 0', 0aH, 00H
$SG1184	DB	09H, '.gdbblock 0,%d', 0aH, 00H
	ORG $+3
$SG1192	DB	09H, '.gdbend 1', 0aH, 00H
$SG1193	DB	09H, '.gdbblock 1,%d', 0aH, 00H
_DATA	ENDS
_TEXT	SEGMENT
_decls$ = 8
_tags$ = 12
_decl$ = -52
_i$ = -36
_addr_buffer$ = -44
_buffer$ = -24
_n_decls$ = -40
_n_tags$ = -32
_velt$ = -48
_top_block_addr$ = -28
_symout_top_blocks PROC NEAR
; Line 1021
	push	ebp
	mov	ebp, esp
	sub	esp, 52					; 00000034H
	push	ebx
	push	esi
	push	edi
; Line 1032
	mov	eax, DWORD PTR _decls$[ebp]
	mov	DWORD PTR _decl$[ebp], eax
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L1179
$L1180:
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _decl$[ebp], eax
$L1179:
	cmp	DWORD PTR _decl$[ebp], 0
	je	$L1181
; Line 1033
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 1
	test	al, 1
	je	$L1182
	mov	eax, DWORD PTR _decl$[ebp]
	test	BYTE PTR [eax+16], 1
	jne	$L1182
; Line 1034
	inc	DWORD PTR _i$[ebp]
; Line 1035
$L1182:
	jmp	$L1180
$L1181:
	mov	eax, DWORD PTR _i$[ebp]
	mov	DWORD PTR _n_decls$[ebp], eax
; Line 1037
	mov	eax, DWORD PTR _n_decls$[ebp]
	shl	eax, 2
	push	eax
	call	_alloca
	add	esp, 4
	mov	DWORD PTR _addr_buffer$[ebp], eax
; Line 1039
	push	2
	mov	eax, DWORD PTR _addr_buffer$[ebp]
	push	eax
	mov	eax, DWORD PTR _decls$[ebp]
	push	eax
	call	_symout_block_symbols
	add	esp, 12					; 0000000cH
; Line 1041
	push	OFFSET $SG1183
	mov	eax, DWORD PTR _asmfile$S834
	push	eax
	call	_fprintf
	add	esp, 8
; Line 1042
	mov	eax, DWORD PTR _next_address$S835
	push	eax
	push	OFFSET $SG1184
	mov	eax, DWORD PTR _asmfile$S834
	push	eax
	call	_fprintf
	add	esp, 12					; 0000000cH
; Line 1044
	inc	DWORD PTR _total_blocks$S843
; Line 1045
	push	8
	call	_xmalloc
	add	esp, 4
	mov	DWORD PTR _velt$[ebp], eax
; Line 1046
	mov	eax, DWORD PTR _blockvec$S842
	mov	ecx, DWORD PTR _velt$[ebp]
	mov	DWORD PTR [ecx+4], eax
; Line 1047
	mov	eax, DWORD PTR _next_address$S835
	mov	ecx, DWORD PTR _velt$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 1048
	mov	eax, DWORD PTR _velt$[ebp]
	mov	DWORD PTR _blockvec$S842, eax
; Line 1050
	mov	eax, DWORD PTR _next_address$S835
	mov	DWORD PTR _top_block_addr$[ebp], eax
; Line 1052
	mov	DWORD PTR _buffer$[ebp], 0
; Line 1053
	mov	DWORD PTR _buffer$[ebp+4], 0
; Line 1054
	mov	DWORD PTR _buffer$[ebp+12], 0
; Line 1055
	mov	DWORD PTR _buffer$[ebp+8], 0
; Line 1056
	mov	eax, DWORD PTR _n_decls$[ebp]
	mov	DWORD PTR _buffer$[ebp+16], eax
; Line 1058
	mov	eax, DWORD PTR _symfile$S832
	push	eax
	push	1
	push	20					; 00000014H
	lea	eax, DWORD PTR _buffer$[ebp]
	push	eax
	call	_fwrite
	add	esp, 16					; 00000010H
; Line 1059
	mov	eax, DWORD PTR _next_address$S835
	add	eax, 20					; 00000014H
	mov	DWORD PTR _next_address$S835, eax
; Line 1061
	mov	eax, DWORD PTR _symfile$S832
	push	eax
	mov	eax, DWORD PTR _n_decls$[ebp]
	push	eax
	push	4
	mov	eax, DWORD PTR _addr_buffer$[ebp]
	push	eax
	call	_fwrite
	add	esp, 16					; 00000010H
; Line 1062
	mov	eax, DWORD PTR _n_decls$[ebp]
	shl	eax, 2
	add	eax, DWORD PTR _next_address$S835
	mov	DWORD PTR _next_address$S835, eax
; Line 1066
	mov	eax, DWORD PTR _decls$[ebp]
	mov	DWORD PTR _decl$[ebp], eax
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L1185
$L1186:
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _decl$[ebp], eax
$L1185:
	cmp	DWORD PTR _decl$[ebp], 0
	je	$L1187
; Line 1067
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+16]
	shr	eax, 1
	test	al, 1
	jne	$L1188
	mov	eax, DWORD PTR _decl$[ebp]
	test	BYTE PTR [eax+16], 1
	jne	$L1188
; Line 1068
	inc	DWORD PTR _i$[ebp]
; Line 1069
$L1188:
	jmp	$L1186
$L1187:
	mov	eax, DWORD PTR _i$[ebp]
	mov	DWORD PTR _n_decls$[ebp], eax
; Line 1071
	mov	eax, DWORD PTR _tags$[ebp]
	mov	DWORD PTR _decl$[ebp], eax
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L1189
$L1190:
	mov	eax, DWORD PTR _decl$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _decl$[ebp], eax
	inc	DWORD PTR _i$[ebp]
$L1189:
	cmp	DWORD PTR _decl$[ebp], 0
	je	$L1191
	jmp	$L1190
$L1191:
; Line 1072
	mov	eax, DWORD PTR _i$[ebp]
	mov	DWORD PTR _n_tags$[ebp], eax
; Line 1074
	mov	eax, DWORD PTR _n_tags$[ebp]
	add	eax, DWORD PTR _n_decls$[ebp]
	shl	eax, 2
	push	eax
	call	_alloca
	add	esp, 4
	mov	DWORD PTR _addr_buffer$[ebp], eax
; Line 1076
	push	1
	mov	eax, DWORD PTR _addr_buffer$[ebp]
	push	eax
	mov	eax, DWORD PTR _decls$[ebp]
	push	eax
	call	_symout_block_symbols
	add	esp, 12					; 0000000cH
; Line 1077
	mov	eax, DWORD PTR _n_decls$[ebp]
	shl	eax, 2
	add	eax, DWORD PTR _addr_buffer$[ebp]
	push	eax
	mov	eax, DWORD PTR _tags$[ebp]
	push	eax
	call	_symout_block_tags
	add	esp, 8
; Line 1079
	push	OFFSET $SG1192
	mov	eax, DWORD PTR _asmfile$S834
	push	eax
	call	_fprintf
	add	esp, 8
; Line 1080
	mov	eax, DWORD PTR _next_address$S835
	push	eax
	push	OFFSET $SG1193
	mov	eax, DWORD PTR _asmfile$S834
	push	eax
	call	_fprintf
	add	esp, 12					; 0000000cH
; Line 1082
	inc	DWORD PTR _total_blocks$S843
; Line 1083
	push	8
	call	_xmalloc
	add	esp, 4
	mov	DWORD PTR _velt$[ebp], eax
; Line 1084
	mov	eax, DWORD PTR _blockvec$S842
	mov	ecx, DWORD PTR _velt$[ebp]
	mov	DWORD PTR [ecx+4], eax
; Line 1085
	mov	eax, DWORD PTR _next_address$S835
	mov	ecx, DWORD PTR _velt$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 1086
	mov	eax, DWORD PTR _velt$[ebp]
	mov	DWORD PTR _blockvec$S842, eax
; Line 1088
	mov	DWORD PTR _buffer$[ebp], 0
; Line 1089
	mov	DWORD PTR _buffer$[ebp+4], 0
; Line 1090
	mov	eax, DWORD PTR _top_block_addr$[ebp]
	mov	DWORD PTR _buffer$[ebp+12], eax
; Line 1091
	mov	DWORD PTR _buffer$[ebp+8], 0
; Line 1092
	mov	eax, DWORD PTR _n_tags$[ebp]
	add	eax, DWORD PTR _n_decls$[ebp]
	mov	DWORD PTR _buffer$[ebp+16], eax
; Line 1094
	mov	eax, DWORD PTR _symfile$S832
	push	eax
	push	1
	push	20					; 00000014H
	lea	eax, DWORD PTR _buffer$[ebp]
	push	eax
	call	_fwrite
	add	esp, 16					; 00000010H
; Line 1095
	mov	eax, DWORD PTR _next_address$S835
	add	eax, 20					; 00000014H
	mov	DWORD PTR _next_address$S835, eax
; Line 1097
	mov	eax, DWORD PTR _symfile$S832
	push	eax
	mov	eax, DWORD PTR _n_tags$[ebp]
	add	eax, DWORD PTR _n_decls$[ebp]
	push	eax
	push	4
	mov	eax, DWORD PTR _addr_buffer$[ebp]
	push	eax
	call	_fwrite
	add	esp, 16					; 00000010H
; Line 1098
	mov	eax, DWORD PTR _n_tags$[ebp]
	add	eax, DWORD PTR _n_decls$[ebp]
	shl	eax, 2
	add	eax, DWORD PTR _next_address$S835
	mov	DWORD PTR _next_address$S835, eax
; Line 1099
$L1170:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_symout_top_blocks ENDP
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+3
$SG1200	DB	09H, '.gdblinetab %d,%d', 0aH, 00H
_DATA	ENDS
_TEXT	SEGMENT
_f$ = 8
_size$ = -8
_buffer$ = -4
_addr$ = -12
_symout_source_file PROC NEAR
; Line 1109
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
	push	ebx
	push	esi
	push	edi
; Line 1112
	mov	eax, DWORD PTR _f$[ebp]
	mov	eax, DWORD PTR [eax+12]
	lea	eax, DWORD PTR [eax*8-8]
	add	eax, 16					; 00000010H
	mov	DWORD PTR _size$[ebp], eax
; Line 1114
	mov	eax, DWORD PTR _size$[ebp]
	push	eax
	call	_alloca
	add	esp, 4
	mov	DWORD PTR _buffer$[ebp], eax
; Line 1118
	mov	eax, DWORD PTR _size$[ebp]
	push	eax
	push	0
	mov	eax, DWORD PTR _buffer$[ebp]
	push	eax
	call	_memset
	add	esp, 12					; 0000000cH
; Line 1121
	mov	eax, DWORD PTR _next_address$S835
	mov	ecx, DWORD PTR _buffer$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 1122
	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _f$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	call	_symout_strings
	add	esp, 16					; 00000010H
; Line 1123
	mov	eax, DWORD PTR _f$[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	ecx, DWORD PTR _buffer$[ebp]
	mov	DWORD PTR [ecx+4], eax
; Line 1126
	mov	eax, DWORD PTR _next_address$S835
	mov	DWORD PTR _addr$[ebp], eax
; Line 1127
	mov	eax, DWORD PTR _symfile$S832
	push	eax
	mov	eax, DWORD PTR _size$[ebp]
	push	eax
	push	1
	mov	eax, DWORD PTR _buffer$[ebp]
	push	eax
	call	_fwrite
	add	esp, 16					; 00000010H
; Line 1128
	mov	eax, DWORD PTR _size$[ebp]
	add	DWORD PTR _next_address$S835, eax
; Line 1132
	mov	eax, DWORD PTR _addr$[ebp]
	add	eax, 4
	push	eax
	mov	eax, DWORD PTR _f$[ebp]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	push	OFFSET $SG1200
	mov	eax, DWORD PTR _asmfile$S834
	push	eax
	call	_fprintf
	add	esp, 16					; 00000010H
; Line 1134
	mov	eax, DWORD PTR _addr$[ebp]
	jmp	$L1196
; Line 1135
$L1196:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_symout_source_file ENDP
_TEXT	ENDS
EXTRN	_gdbfiles:DWORD
_TEXT	SEGMENT
_f$ = -8
_nfiles$ = -4
_s$ = -20
_i$ = -16
_size$ = -12
_addr$ = -24
_symout_sources PROC NEAR
; Line 1142
	push	ebp
	mov	ebp, esp
	sub	esp, 24					; 00000018H
	push	ebx
	push	esi
	push	edi
; Line 1144
	mov	DWORD PTR _nfiles$[ebp], 0
; Line 1151
	mov	eax, DWORD PTR _gdbfiles
	mov	DWORD PTR _f$[ebp], eax
	jmp	$L1209
$L1210:
	mov	eax, DWORD PTR _f$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _f$[ebp], eax
$L1209:
	cmp	DWORD PTR _f$[ebp], 0
	je	$L1211
; Line 1152
	inc	DWORD PTR _nfiles$[ebp]
	jmp	$L1210
$L1211:
; Line 1155
	mov	eax, DWORD PTR _nfiles$[ebp]
	shl	eax, 2
	add	eax, 4
	mov	DWORD PTR _size$[ebp], eax
; Line 1156
	mov	eax, DWORD PTR _size$[ebp]
	push	eax
	call	_alloca
	add	esp, 4
	mov	DWORD PTR _s$[ebp], eax
; Line 1157
	mov	eax, DWORD PTR _nfiles$[ebp]
	mov	ecx, DWORD PTR _s$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 1160
	mov	eax, DWORD PTR _gdbfiles
	mov	DWORD PTR _f$[ebp], eax
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L1212
$L1213:
	mov	eax, DWORD PTR _f$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _f$[ebp], eax
	inc	DWORD PTR _i$[ebp]
$L1212:
	cmp	DWORD PTR _f$[ebp], 0
	je	$L1214
; Line 1161
	mov	eax, DWORD PTR _f$[ebp]
	push	eax
	call	_symout_source_file
	add	esp, 4
	mov	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _s$[ebp]
	mov	DWORD PTR [edx+ecx*4+4], eax
	jmp	$L1213
$L1214:
; Line 1164
	mov	eax, DWORD PTR _next_address$S835
	mov	DWORD PTR _addr$[ebp], eax
; Line 1165
	mov	eax, DWORD PTR _symfile$S832
	push	eax
	mov	eax, DWORD PTR _size$[ebp]
	push	eax
	push	1
	mov	eax, DWORD PTR _s$[ebp]
	push	eax
	call	_fwrite
	add	esp, 16					; 00000010H
; Line 1166
	mov	eax, DWORD PTR _size$[ebp]
	add	DWORD PTR _next_address$S835, eax
; Line 1167
	mov	eax, DWORD PTR _addr$[ebp]
	jmp	$L1202
; Line 1168
$L1202:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_symout_sources ENDP
_TEXT	ENDS
PUBLIC	_symout_finish
EXTRN	_time:NEAR
EXTRN	_ctime:NEAR
EXTRN	_getcwd:NEAR
EXTRN	_fatal_io_error:NEAR
EXTRN	_lseek:NEAR
EXTRN	_write:NEAR
EXTRN	_close:NEAR
EXTRN	_fileno:NEAR
_TEXT	SEGMENT
_filetime$ = 12
_blockvector$ = -1100
_typevector$ = -1104
_now$ = -68
_i$ = -1096
_buffer$ = -64
_dir$ = -1092
_filename$ = 8
_symout_finish PROC NEAR
; Line 1179
	push	ebp
	mov	ebp, esp
	sub	esp, 1104				; 00000450H
	push	ebx
	push	esi
	push	edi
; Line 1180
	mov	eax, DWORD PTR _total_blocks$S843
	lea	eax, DWORD PTR [eax*4+4]
	push	eax
	call	_alloca
	add	esp, 4
	mov	DWORD PTR _blockvector$[ebp], eax
; Line 1182
	push	0
	call	_time
	add	esp, 4
	mov	DWORD PTR _now$[ebp], eax
; Line 1188
	mov	eax, DWORD PTR _permanent_fwd_refs$S840
	push	eax
	call	_filter_undefined_types
	add	esp, 4
	push	eax
	call	_symout_types
	add	esp, 4
; Line 1190
	mov	eax, DWORD PTR _total_types$S838
	lea	eax, DWORD PTR [eax*4+4]
	push	eax
	call	_alloca
	add	esp, 4
	mov	DWORD PTR _typevector$[ebp], eax
; Line 1192
	mov	DWORD PTR _buffer$[ebp+40], 0
; Line 1193
	mov	eax, DWORD PTR _next_address$S835
	mov	DWORD PTR _buffer$[ebp+32], eax
; Line 1198
	mov	eax, DWORD PTR _blockvec$S842
	mov	eax, DWORD PTR [eax]
	mov	ecx, DWORD PTR _blockvector$[ebp]
	mov	DWORD PTR [ecx+8], eax
; Line 1199
	mov	eax, DWORD PTR _blockvec$S842
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _blockvec$S842, eax
; Line 1200
	mov	eax, DWORD PTR _blockvec$S842
	mov	eax, DWORD PTR [eax]
	mov	ecx, DWORD PTR _blockvector$[ebp]
	mov	DWORD PTR [ecx+4], eax
; Line 1201
	mov	eax, DWORD PTR _blockvec$S842
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _blockvec$S842, eax
; Line 1204
	mov	eax, DWORD PTR _total_blocks$S843
	mov	DWORD PTR _i$[ebp], eax
	jmp	$L1226
$L1227:
	dec	DWORD PTR _i$[ebp]
$L1226:
	cmp	DWORD PTR _i$[ebp], 2
	jle	$L1228
; Line 1206
	mov	eax, DWORD PTR _blockvec$S842
	mov	eax, DWORD PTR [eax]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _blockvector$[ebp]
	mov	DWORD PTR [edx+ecx*4], eax
; Line 1207
	mov	eax, DWORD PTR _blockvec$S842
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _blockvec$S842, eax
; Line 1208
	jmp	$L1227
$L1228:
; Line 1209
	mov	eax, DWORD PTR _total_blocks$S843
	mov	ecx, DWORD PTR _blockvector$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 1211
	mov	eax, DWORD PTR _symfile$S832
	push	eax
	mov	eax, DWORD PTR _total_blocks$S843
	inc	eax
	push	eax
	push	4
	mov	eax, DWORD PTR _blockvector$[ebp]
	push	eax
	call	_fwrite
	add	esp, 16					; 00000010H
; Line 1212
	mov	eax, DWORD PTR _total_blocks$S843
	lea	eax, DWORD PTR [eax*4+4]
	add	eax, DWORD PTR _next_address$S835
	mov	DWORD PTR _next_address$S835, eax
; Line 1214
	mov	eax, DWORD PTR _next_address$S835
	mov	DWORD PTR _buffer$[ebp+36], eax
; Line 1216
	mov	eax, DWORD PTR _total_types$S838
	mov	DWORD PTR _i$[ebp], eax
	jmp	$L1229
$L1230:
	dec	DWORD PTR _i$[ebp]
$L1229:
	cmp	DWORD PTR _i$[ebp], 0
	jle	$L1231
; Line 1218
	mov	eax, DWORD PTR _typevec$S837
	mov	eax, DWORD PTR [eax]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _typevector$[ebp]
	mov	DWORD PTR [edx+ecx*4], eax
; Line 1219
	mov	eax, DWORD PTR _typevec$S837
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _typevec$S837, eax
; Line 1220
	jmp	$L1230
$L1231:
; Line 1221
	mov	eax, DWORD PTR _total_types$S838
	mov	ecx, DWORD PTR _typevector$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 1223
	mov	eax, DWORD PTR _symfile$S832
	push	eax
	mov	eax, DWORD PTR _total_types$S838
	inc	eax
	push	eax
	push	4
	mov	eax, DWORD PTR _typevector$[ebp]
	push	eax
	call	_fwrite
	add	esp, 16					; 00000010H
; Line 1224
	mov	eax, DWORD PTR _total_types$S838
	lea	eax, DWORD PTR [eax*4+4]
	add	eax, DWORD PTR _next_address$S835
	mov	DWORD PTR _next_address$S835, eax
; Line 1226
	call	_symout_sources
	mov	DWORD PTR _buffer$[ebp+60], eax
; Line 1228
	mov	DWORD PTR _buffer$[ebp], 1
; Line 1229
	mov	DWORD PTR _buffer$[ebp+12], 0
; Line 1230
	mov	DWORD PTR _buffer$[ebp+16], 0
; Line 1231
	mov	DWORD PTR _buffer$[ebp+20], 0
; Line 1232
	mov	DWORD PTR _buffer$[ebp+8], 0
; Line 1234
	mov	eax, DWORD PTR _next_address$S835
	mov	DWORD PTR _buffer$[ebp+44], eax
; Line 1235
	push	0
	push	0
	push	0
	lea	eax, DWORD PTR _filetime$[ebp]
	push	eax
	call	_ctime
	add	esp, 4
	push	eax
	call	_symout_strings
	add	esp, 16					; 00000010H
; Line 1237
	mov	eax, DWORD PTR _next_address$S835
	mov	DWORD PTR _buffer$[ebp+48], eax
; Line 1238
	push	0
	push	0
	push	0
	lea	eax, DWORD PTR _now$[ebp]
	push	eax
	call	_ctime
	add	esp, 4
	push	eax
	call	_symout_strings
	add	esp, 16					; 00000010H
; Line 1240
	mov	eax, DWORD PTR _next_address$S835
	mov	DWORD PTR _buffer$[ebp+24], eax
; Line 1241
	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _filename$[ebp]
	push	eax
	call	_symout_strings
	add	esp, 16					; 00000010H
; Line 1243
	mov	eax, DWORD PTR _next_address$S835
	mov	DWORD PTR _buffer$[ebp+28], eax
; Line 1245
	push	1024					; 00000400H
	lea	eax, DWORD PTR _dir$[ebp]
	push	eax
	call	_getcwd
	add	esp, 8
	push	eax
	lea	eax, DWORD PTR _dir$[ebp]
	push	eax
	call	_strcpy
	add	esp, 8
; Line 1253
	push	0
	push	0
	push	0
	lea	eax, DWORD PTR _dir$[ebp]
	push	eax
	call	_symout_strings
	add	esp, 16					; 00000010H
; Line 1255
	mov	eax, DWORD PTR _symfile$S832
	push	eax
	call	_fflush
	add	esp, 4
; Line 1257
	mov	eax, DWORD PTR _symfile$S832
	test	BYTE PTR [eax+12], 32			; 00000020H
	je	$L1234
; Line 1258
	mov	eax, DWORD PTR _symfile_name$S833
	push	eax
	call	_fatal_io_error
	add	esp, 4
; Line 1260
$L1234:
	mov	eax, DWORD PTR _next_address$S835
	mov	DWORD PTR _buffer$[ebp+4], eax
; Line 1262
	push	0
	push	0
	mov	eax, DWORD PTR _symfile$S832
	push	eax
	call	_fileno
	add	esp, 4
	push	eax
	call	_lseek
	add	esp, 12					; 0000000cH
	or	eax, eax
	jge	$L1237
; Line 1263
	mov	eax, DWORD PTR _symfile_name$S833
	push	eax
	call	_pfatal_with_name
	add	esp, 4
; Line 1264
$L1237:
	push	64					; 00000040H
	lea	eax, DWORD PTR _buffer$[ebp]
	push	eax
	mov	eax, DWORD PTR _symfile$S832
	push	eax
	call	_fileno
	add	esp, 4
	push	eax
	call	_write
	add	esp, 12					; 0000000cH
	or	eax, eax
	jge	$L1239
; Line 1265
	mov	eax, DWORD PTR _symfile_name$S833
	push	eax
	call	_pfatal_with_name
	add	esp, 4
; Line 1266
$L1239:
	mov	eax, DWORD PTR _symfile$S832
	push	eax
	call	_fileno
	add	esp, 4
	push	eax
	call	_close
	add	esp, 4
; Line 1267
$L1218:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_symout_finish ENDP
_TEXT	ENDS
END
