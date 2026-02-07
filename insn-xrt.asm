	TITLE	insn-xrt.c
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
PUBLIC	_extract_119
PUBLIC	_extract_76
PUBLIC	_extract_54
PUBLIC	_extract_141
PUBLIC	_extract_33
PUBLIC	_extract_98
PUBLIC	_extract_12
PUBLIC	_insn_extract_fn
PUBLIC	_extract_120
PUBLIC	_extract_77
PUBLIC	_extract_55
PUBLIC	_extract_34
PUBLIC	_extract_99
PUBLIC	_extract_13
PUBLIC	_extract_121
PUBLIC	_extract_78
PUBLIC	_extract_56
PUBLIC	_extract_35
PUBLIC	_extract_100
PUBLIC	_extract_14
PUBLIC	_extract_122
PUBLIC	_extract_79
PUBLIC	_extract_57
PUBLIC	_extract_36
PUBLIC	_extract_101
PUBLIC	_extract_15
PUBLIC	_extract_123
PUBLIC	_extract_80
PUBLIC	_extract_58
PUBLIC	_extract_37
PUBLIC	_extract_124
PUBLIC	_extract_102
PUBLIC	_extract_16
PUBLIC	_extract_81
PUBLIC	_extract_59
PUBLIC	_extract_38
PUBLIC	_extract_125
PUBLIC	_extract_103
PUBLIC	_extract_17
PUBLIC	_extract_82
PUBLIC	_extract_60
PUBLIC	_extract_39
PUBLIC	_extract_126
PUBLIC	_extract_104
PUBLIC	_extract_18
PUBLIC	_extract_83
PUBLIC	_extract_61
PUBLIC	_extract_40
PUBLIC	_extract_127
PUBLIC	_extract_105
PUBLIC	_extract_19
PUBLIC	_extract_84
PUBLIC	_extract_62
PUBLIC	_extract_41
PUBLIC	_extract_128
PUBLIC	_extract_106
PUBLIC	_extract_20
PUBLIC	_extract_85
PUBLIC	_extract_63
PUBLIC	_extract_42
PUBLIC	_extract_129
PUBLIC	_extract_107
PUBLIC	_extract_64
PUBLIC	_extract_21
PUBLIC	_extract_86
PUBLIC	_extract_0
PUBLIC	_extract_65
PUBLIC	_extract_43
PUBLIC	_extract_130
PUBLIC	_extract_108
PUBLIC	_extract_22
PUBLIC	_extract_87
PUBLIC	_extract_1
PUBLIC	_extract_66
PUBLIC	_extract_44
PUBLIC	_extract_131
PUBLIC	_extract_109
PUBLIC	_extract_23
PUBLIC	_extract_88
PUBLIC	_extract_2
PUBLIC	_extract_67
PUBLIC	_extract_45
PUBLIC	_extract_132
PUBLIC	_extract_110
PUBLIC	_extract_24
PUBLIC	_extract_89
PUBLIC	_extract_3
PUBLIC	_extract_68
PUBLIC	_extract_46
PUBLIC	_extract_133
PUBLIC	_extract_111
PUBLIC	_extract_25
PUBLIC	_extract_90
PUBLIC	_extract_4
PUBLIC	_extract_69
PUBLIC	_extract_47
PUBLIC	_extract_134
PUBLIC	_extract_112
PUBLIC	_extract_26
PUBLIC	_extract_91
PUBLIC	_extract_5
PUBLIC	_extract_70
PUBLIC	_extract_48
PUBLIC	_extract_135
PUBLIC	_extract_113
PUBLIC	_extract_27
PUBLIC	_extract_92
PUBLIC	_extract_6
PUBLIC	_extract_71
PUBLIC	_extract_49
PUBLIC	_extract_136
PUBLIC	_extract_114
PUBLIC	_extract_28
PUBLIC	_extract_93
PUBLIC	_extract_7
PUBLIC	_extract_72
PUBLIC	_extract_50
PUBLIC	_extract_137
PUBLIC	_extract_115
PUBLIC	_extract_29
PUBLIC	_extract_94
PUBLIC	_extract_8
PUBLIC	_extract_73
PUBLIC	_extract_51
PUBLIC	_extract_138
PUBLIC	_extract_116
PUBLIC	_extract_30
PUBLIC	_extract_95
PUBLIC	_extract_9
PUBLIC	_extract_74
PUBLIC	_extract_52
PUBLIC	_extract_139
PUBLIC	_extract_117
PUBLIC	_extract_31
PUBLIC	_extract_96
PUBLIC	_extract_10
PUBLIC	_extract_75
PUBLIC	_extract_53
PUBLIC	_extract_140
PUBLIC	_extract_118
PUBLIC	_extract_32
PUBLIC	_extract_97
PUBLIC	_extract_11
_DATA	SEGMENT
_insn_extract_fn DD _extract_0
	DD	_extract_1
	DD	_extract_2
	DD	_extract_3
	DD	_extract_4
	DD	_extract_5
	DD	_extract_6
	DD	_extract_7
	DD	_extract_8
	DD	_extract_9
	DD	_extract_10
	DD	_extract_11
	DD	_extract_12
	DD	_extract_13
	DD	_extract_14
	DD	_extract_15
	DD	_extract_16
	DD	_extract_17
	DD	_extract_18
	DD	_extract_19
	DD	_extract_20
	DD	_extract_21
	DD	_extract_22
	DD	_extract_23
	DD	_extract_24
	DD	_extract_25
	DD	_extract_26
	DD	_extract_27
	DD	_extract_28
	DD	_extract_29
	DD	_extract_30
	DD	_extract_31
	DD	_extract_32
	DD	_extract_33
	DD	_extract_34
	DD	_extract_35
	DD	_extract_36
	DD	_extract_37
	DD	_extract_38
	DD	_extract_39
	DD	_extract_40
	DD	_extract_41
	DD	_extract_42
	DD	_extract_43
	DD	_extract_44
	DD	_extract_45
	DD	_extract_46
	DD	_extract_47
	DD	_extract_48
	DD	_extract_49
	DD	_extract_50
	DD	_extract_51
	DD	_extract_52
	DD	_extract_53
	DD	_extract_54
	DD	_extract_55
	DD	_extract_56
	DD	_extract_57
	DD	_extract_58
	DD	_extract_59
	DD	_extract_60
	DD	_extract_61
	DD	_extract_62
	DD	_extract_63
	DD	_extract_64
	DD	_extract_65
	DD	_extract_66
	DD	_extract_67
	DD	_extract_68
	DD	_extract_69
	DD	_extract_70
	DD	_extract_71
	DD	_extract_72
	DD	_extract_73
	DD	_extract_74
	DD	_extract_75
	DD	_extract_76
	DD	_extract_77
	DD	_extract_78
	DD	_extract_79
	DD	_extract_80
	DD	_extract_81
	DD	_extract_82
	DD	_extract_83
	DD	_extract_84
	DD	_extract_85
	DD	_extract_86
	DD	_extract_87
	DD	_extract_88
	DD	_extract_89
	DD	_extract_90
	DD	_extract_91
	DD	_extract_92
	DD	_extract_93
	DD	_extract_94
	DD	_extract_95
	DD	_extract_96
	DD	_extract_97
	DD	_extract_98
	DD	_extract_99
	DD	_extract_100
	DD	_extract_101
	DD	_extract_102
	DD	_extract_103
	DD	_extract_104
	DD	_extract_105
	DD	_extract_106
	DD	_extract_107
	DD	_extract_108
	DD	_extract_109
	DD	_extract_110
	DD	_extract_111
	DD	_extract_112
	DD	_extract_113
	DD	_extract_114
	DD	_extract_115
	DD	_extract_116
	DD	_extract_117
	DD	_extract_118
	DD	_extract_119
	DD	_extract_120
	DD	_extract_121
	DD	_extract_122
	DD	_extract_123
	DD	_extract_124
	DD	_extract_125
	DD	_extract_126
	DD	_extract_127
	DD	_extract_128
	DD	_extract_129
	DD	_extract_130
	DD	_extract_131
	DD	_extract_132
	DD	_extract_133
	DD	_extract_134
	DD	_extract_135
	DD	_extract_136
	DD	_extract_137
	DD	_extract_138
	DD	_extract_139
	DD	_extract_140
	DD	_extract_141
_DATA	ENDS
EXTRN	_recog_operand:BYTE
EXTRN	_recog_operand_loc:BYTE
_TEXT	SEGMENT
; File insn-xrt.c
_insn$ = 8
_extract_0 PROC NEAR
; Line 21
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 23
	mov	eax, DWORD PTR _insn$[ebp]
	add	eax, 8
	mov	DWORD PTR _recog_operand_loc, eax
	mov	eax, DWORD PTR _recog_operand_loc
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand, eax
; Line 24
$L351:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_extract_0 ENDP
_insn$ = 8
_extract_1 PROC NEAR
; Line 29
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 31
	mov	eax, DWORD PTR _insn$[ebp]
	add	eax, 8
	mov	DWORD PTR _recog_operand_loc, eax
	mov	eax, DWORD PTR _recog_operand_loc
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand, eax
; Line 32
$L354:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_extract_1 ENDP
_insn$ = 8
_extract_2 PROC NEAR
; Line 37
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 39
	mov	eax, DWORD PTR _insn$[ebp]
	add	eax, 8
	mov	DWORD PTR _recog_operand_loc, eax
	mov	eax, DWORD PTR _recog_operand_loc
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand, eax
; Line 40
$L357:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_extract_2 ENDP
_insn$ = 8
_extract_3 PROC NEAR
; Line 45
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 47
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	add	eax, 8
	mov	DWORD PTR _recog_operand_loc, eax
	mov	eax, DWORD PTR _recog_operand_loc
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand, eax
; Line 48
$L360:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_extract_3 ENDP
_insn$ = 8
_extract_4 PROC NEAR
; Line 53
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 55
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	add	eax, 8
	mov	DWORD PTR _recog_operand_loc, eax
	mov	eax, DWORD PTR _recog_operand_loc
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand, eax
; Line 56
$L363:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_extract_4 ENDP
_insn$ = 8
_extract_5 PROC NEAR
; Line 61
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 63
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+8]
	add	eax, 4
	mov	DWORD PTR _recog_operand_loc, eax
	mov	eax, DWORD PTR _recog_operand_loc
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand, eax
; Line 65
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+8]
	add	eax, 8
	mov	DWORD PTR _recog_operand_loc+4, eax
	mov	eax, DWORD PTR _recog_operand_loc+4
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand+4, eax
; Line 66
$L366:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_extract_5 ENDP
_insn$ = 8
_extract_6 PROC NEAR
; Line 71
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 73
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+8]
	add	eax, 4
	mov	DWORD PTR _recog_operand_loc, eax
	mov	eax, DWORD PTR _recog_operand_loc
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand, eax
; Line 75
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+8]
	add	eax, 8
	mov	DWORD PTR _recog_operand_loc+4, eax
	mov	eax, DWORD PTR _recog_operand_loc+4
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand+4, eax
; Line 76
$L369:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_extract_6 ENDP
_insn$ = 8
_extract_7 PROC NEAR
; Line 81
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 83
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+8]
	add	eax, 4
	mov	DWORD PTR _recog_operand_loc, eax
	mov	eax, DWORD PTR _recog_operand_loc
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand, eax
; Line 85
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+8]
	add	eax, 8
	mov	DWORD PTR _recog_operand_loc+4, eax
	mov	eax, DWORD PTR _recog_operand_loc+4
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand+4, eax
; Line 86
$L372:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_extract_7 ENDP
_insn$ = 8
_extract_8 PROC NEAR
; Line 91
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 93
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+8]
	add	eax, 4
	mov	DWORD PTR _recog_operand_loc, eax
	mov	eax, DWORD PTR _recog_operand_loc
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand, eax
; Line 95
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+8]
	add	eax, 8
	mov	DWORD PTR _recog_operand_loc+4, eax
	mov	eax, DWORD PTR _recog_operand_loc+4
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand+4, eax
; Line 96
$L375:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_extract_8 ENDP
_insn$ = 8
_extract_9 PROC NEAR
; Line 101
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 103
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+8]
	add	eax, 4
	mov	DWORD PTR _recog_operand_loc, eax
	mov	eax, DWORD PTR _recog_operand_loc
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand, eax
; Line 105
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+8]
	add	eax, 8
	mov	DWORD PTR _recog_operand_loc+4, eax
	mov	eax, DWORD PTR _recog_operand_loc+4
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand+4, eax
; Line 106
$L378:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_extract_9 ENDP
_insn$ = 8
_extract_10 PROC NEAR
; Line 111
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 113
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+8]
	add	eax, 4
	mov	DWORD PTR _recog_operand_loc, eax
	mov	eax, DWORD PTR _recog_operand_loc
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand, eax
; Line 115
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+8]
	add	eax, 8
	mov	DWORD PTR _recog_operand_loc+4, eax
	mov	eax, DWORD PTR _recog_operand_loc+4
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand+4, eax
; Line 116
$L381:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_extract_10 ENDP
_insn$ = 8
_extract_11 PROC NEAR
; Line 121
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 123
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+8]
	add	eax, 4
	mov	DWORD PTR _recog_operand_loc, eax
	mov	eax, DWORD PTR _recog_operand_loc
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand, eax
; Line 125
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+8]
	add	eax, 8
	mov	DWORD PTR _recog_operand_loc+4, eax
	mov	eax, DWORD PTR _recog_operand_loc+4
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand+4, eax
; Line 126
$L384:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_extract_11 ENDP
_insn$ = 8
_extract_12 PROC NEAR
; Line 131
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 133
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+8]
	add	eax, 4
	mov	DWORD PTR _recog_operand_loc, eax
	mov	eax, DWORD PTR _recog_operand_loc
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand, eax
; Line 135
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+8]
	add	eax, 8
	mov	DWORD PTR _recog_operand_loc+4, eax
	mov	eax, DWORD PTR _recog_operand_loc+4
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand+4, eax
; Line 136
$L387:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_extract_12 ENDP
_insn$ = 8
_extract_13 PROC NEAR
; Line 141
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 143
	mov	eax, DWORD PTR _insn$[ebp]
	add	eax, 4
	mov	DWORD PTR _recog_operand_loc, eax
	mov	eax, DWORD PTR _recog_operand_loc
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand, eax
; Line 145
	mov	eax, DWORD PTR _insn$[ebp]
	add	eax, 8
	mov	DWORD PTR _recog_operand_loc+4, eax
	mov	eax, DWORD PTR _recog_operand_loc+4
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand+4, eax
; Line 146
$L390:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_extract_13 ENDP
_insn$ = 8
_extract_14 PROC NEAR
; Line 151
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 153
	mov	eax, DWORD PTR _insn$[ebp]
	add	eax, 4
	mov	DWORD PTR _recog_operand_loc, eax
	mov	eax, DWORD PTR _recog_operand_loc
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand, eax
; Line 155
	mov	eax, DWORD PTR _insn$[ebp]
	add	eax, 8
	mov	DWORD PTR _recog_operand_loc+4, eax
	mov	eax, DWORD PTR _recog_operand_loc+4
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand+4, eax
; Line 156
$L393:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_extract_14 ENDP
_insn$ = 8
_extract_15 PROC NEAR
; Line 161
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 163
	mov	eax, DWORD PTR _insn$[ebp]
	add	eax, 4
	mov	DWORD PTR _recog_operand_loc, eax
	mov	eax, DWORD PTR _recog_operand_loc
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand, eax
; Line 165
	mov	eax, DWORD PTR _insn$[ebp]
	add	eax, 8
	mov	DWORD PTR _recog_operand_loc+4, eax
	mov	eax, DWORD PTR _recog_operand_loc+4
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand+4, eax
; Line 166
$L396:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_extract_15 ENDP
_insn$ = 8
_extract_16 PROC NEAR
; Line 171
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 173
	mov	eax, DWORD PTR _insn$[ebp]
	add	eax, 4
	mov	DWORD PTR _recog_operand_loc, eax
	mov	eax, DWORD PTR _recog_operand_loc
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand, eax
; Line 175
	mov	eax, DWORD PTR _insn$[ebp]
	add	eax, 8
	mov	DWORD PTR _recog_operand_loc+4, eax
	mov	eax, DWORD PTR _recog_operand_loc+4
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand+4, eax
; Line 176
$L399:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_extract_16 ENDP
_insn$ = 8
_extract_17 PROC NEAR
; Line 181
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 183
	mov	eax, DWORD PTR _insn$[ebp]
	add	eax, 4
	mov	DWORD PTR _recog_operand_loc, eax
	mov	eax, DWORD PTR _recog_operand_loc
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand, eax
; Line 185
	mov	eax, DWORD PTR _insn$[ebp]
	add	eax, 8
	mov	DWORD PTR _recog_operand_loc+4, eax
	mov	eax, DWORD PTR _recog_operand_loc+4
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand+4, eax
; Line 186
$L402:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_extract_17 ENDP
_insn$ = 8
_extract_18 PROC NEAR
; Line 191
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 193
	mov	eax, DWORD PTR _insn$[ebp]
	add	eax, 4
	mov	DWORD PTR _recog_operand_loc, eax
	mov	eax, DWORD PTR _recog_operand_loc
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand, eax
; Line 195
	mov	eax, DWORD PTR _insn$[ebp]
	add	eax, 8
	mov	DWORD PTR _recog_operand_loc+4, eax
	mov	eax, DWORD PTR _recog_operand_loc+4
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand+4, eax
; Line 196
$L405:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_extract_18 ENDP
_insn$ = 8
_extract_19 PROC NEAR
; Line 201
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 203
	mov	eax, DWORD PTR _insn$[ebp]
	add	eax, 4
	mov	DWORD PTR _recog_operand_loc, eax
	mov	eax, DWORD PTR _recog_operand_loc
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand, eax
; Line 205
	mov	eax, DWORD PTR _insn$[ebp]
	add	eax, 8
	mov	DWORD PTR _recog_operand_loc+4, eax
	mov	eax, DWORD PTR _recog_operand_loc+4
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand+4, eax
; Line 206
$L408:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_extract_19 ENDP
_insn$ = 8
_extract_20 PROC NEAR
; Line 211
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 213
	mov	eax, DWORD PTR _insn$[ebp]
	add	eax, 4
	mov	DWORD PTR _recog_operand_loc, eax
	mov	eax, DWORD PTR _recog_operand_loc
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand, eax
; Line 215
	mov	eax, DWORD PTR _insn$[ebp]
	add	eax, 8
	mov	DWORD PTR _recog_operand_loc+4, eax
	mov	eax, DWORD PTR _recog_operand_loc+4
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand+4, eax
; Line 216
$L411:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_extract_20 ENDP
_insn$ = 8
_extract_21 PROC NEAR
; Line 221
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 223
	mov	eax, DWORD PTR _insn$[ebp]
	add	eax, 4
	mov	DWORD PTR _recog_operand_loc, eax
	mov	eax, DWORD PTR _recog_operand_loc
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand, eax
; Line 225
	mov	eax, DWORD PTR _insn$[ebp]
	add	eax, 8
	mov	DWORD PTR _recog_operand_loc+4, eax
	mov	eax, DWORD PTR _recog_operand_loc+4
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand+4, eax
; Line 226
$L414:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_extract_21 ENDP
_insn$ = 8
_extract_22 PROC NEAR
; Line 231
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 233
	mov	eax, DWORD PTR _insn$[ebp]
	add	eax, 4
	mov	DWORD PTR _recog_operand_loc, eax
	mov	eax, DWORD PTR _recog_operand_loc
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand, eax
; Line 235
	mov	eax, DWORD PTR _insn$[ebp]
	add	eax, 8
	mov	DWORD PTR _recog_operand_loc+4, eax
	mov	eax, DWORD PTR _recog_operand_loc+4
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand+4, eax
; Line 236
$L417:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_extract_22 ENDP
_insn$ = 8
_extract_23 PROC NEAR
; Line 241
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 243
	mov	eax, DWORD PTR _insn$[ebp]
	add	eax, 4
	mov	DWORD PTR _recog_operand_loc, eax
	mov	eax, DWORD PTR _recog_operand_loc
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand, eax
; Line 245
	mov	eax, DWORD PTR _insn$[ebp]
	add	eax, 8
	mov	DWORD PTR _recog_operand_loc+4, eax
	mov	eax, DWORD PTR _recog_operand_loc+4
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand+4, eax
; Line 246
$L420:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_extract_23 ENDP
_insn$ = 8
_extract_24 PROC NEAR
; Line 251
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 253
	mov	eax, DWORD PTR _insn$[ebp]
	add	eax, 4
	mov	DWORD PTR _recog_operand_loc, eax
	mov	eax, DWORD PTR _recog_operand_loc
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand, eax
; Line 255
	mov	eax, DWORD PTR _insn$[ebp]
	add	eax, 8
	mov	DWORD PTR _recog_operand_loc+4, eax
	mov	eax, DWORD PTR _recog_operand_loc+4
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand+4, eax
; Line 256
$L423:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_extract_24 ENDP
_insn$ = 8
_extract_25 PROC NEAR
; Line 261
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 263
	mov	eax, DWORD PTR _insn$[ebp]
	add	eax, 4
	mov	DWORD PTR _recog_operand_loc, eax
	mov	eax, DWORD PTR _recog_operand_loc
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand, eax
; Line 265
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+8]
	add	eax, 4
	mov	DWORD PTR _recog_operand_loc+4, eax
	mov	eax, DWORD PTR _recog_operand_loc+4
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand+4, eax
; Line 266
$L426:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_extract_25 ENDP
_insn$ = 8
_extract_26 PROC NEAR
; Line 271
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 273
	mov	eax, DWORD PTR _insn$[ebp]
	add	eax, 4
	mov	DWORD PTR _recog_operand_loc, eax
	mov	eax, DWORD PTR _recog_operand_loc
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand, eax
; Line 275
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+8]
	add	eax, 4
	mov	DWORD PTR _recog_operand_loc+4, eax
	mov	eax, DWORD PTR _recog_operand_loc+4
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand+4, eax
; Line 276
$L429:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_extract_26 ENDP
_insn$ = 8
_extract_27 PROC NEAR
; Line 281
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 283
	mov	eax, DWORD PTR _insn$[ebp]
	add	eax, 4
	mov	DWORD PTR _recog_operand_loc, eax
	mov	eax, DWORD PTR _recog_operand_loc
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand, eax
; Line 285
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+8]
	add	eax, 4
	mov	DWORD PTR _recog_operand_loc+4, eax
	mov	eax, DWORD PTR _recog_operand_loc+4
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand+4, eax
; Line 286
$L432:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_extract_27 ENDP
_insn$ = 8
_extract_28 PROC NEAR
; Line 291
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 293
	mov	eax, DWORD PTR _insn$[ebp]
	add	eax, 4
	mov	DWORD PTR _recog_operand_loc, eax
	mov	eax, DWORD PTR _recog_operand_loc
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand, eax
; Line 295
	mov	eax, DWORD PTR _insn$[ebp]
	add	eax, 8
	mov	DWORD PTR _recog_operand_loc+4, eax
	mov	eax, DWORD PTR _recog_operand_loc+4
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand+4, eax
; Line 296
$L435:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_extract_28 ENDP
_insn$ = 8
_extract_29 PROC NEAR
; Line 301
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 303
	mov	eax, DWORD PTR _insn$[ebp]
	add	eax, 4
	mov	DWORD PTR _recog_operand_loc, eax
	mov	eax, DWORD PTR _recog_operand_loc
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand, eax
; Line 305
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+8]
	add	eax, 4
	mov	DWORD PTR _recog_operand_loc+4, eax
	mov	eax, DWORD PTR _recog_operand_loc+4
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand+4, eax
; Line 306
$L438:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_extract_29 ENDP
_insn$ = 8
_extract_30 PROC NEAR
; Line 311
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 313
	mov	eax, DWORD PTR _insn$[ebp]
	add	eax, 4
	mov	DWORD PTR _recog_operand_loc, eax
	mov	eax, DWORD PTR _recog_operand_loc
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand, eax
; Line 315
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+8]
	add	eax, 4
	mov	DWORD PTR _recog_operand_loc+4, eax
	mov	eax, DWORD PTR _recog_operand_loc+4
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand+4, eax
; Line 316
$L441:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_extract_30 ENDP
_insn$ = 8
_extract_31 PROC NEAR
; Line 321
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 323
	mov	eax, DWORD PTR _insn$[ebp]
	add	eax, 4
	mov	DWORD PTR _recog_operand_loc, eax
	mov	eax, DWORD PTR _recog_operand_loc
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand, eax
; Line 325
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+8]
	add	eax, 4
	mov	DWORD PTR _recog_operand_loc+4, eax
	mov	eax, DWORD PTR _recog_operand_loc+4
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand+4, eax
; Line 326
$L444:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_extract_31 ENDP
_insn$ = 8
_extract_32 PROC NEAR
; Line 331
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 333
	mov	eax, DWORD PTR _insn$[ebp]
	add	eax, 4
	mov	DWORD PTR _recog_operand_loc, eax
	mov	eax, DWORD PTR _recog_operand_loc
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand, eax
; Line 335
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+8]
	add	eax, 4
	mov	DWORD PTR _recog_operand_loc+4, eax
	mov	eax, DWORD PTR _recog_operand_loc+4
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand+4, eax
; Line 336
$L447:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_extract_32 ENDP
_insn$ = 8
_extract_33 PROC NEAR
; Line 341
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 343
	mov	eax, DWORD PTR _insn$[ebp]
	add	eax, 4
	mov	DWORD PTR _recog_operand_loc, eax
	mov	eax, DWORD PTR _recog_operand_loc
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand, eax
; Line 345
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+8]
	add	eax, 4
	mov	DWORD PTR _recog_operand_loc+4, eax
	mov	eax, DWORD PTR _recog_operand_loc+4
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand+4, eax
; Line 346
$L450:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_extract_33 ENDP
_insn$ = 8
_extract_34 PROC NEAR
; Line 351
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 353
	mov	eax, DWORD PTR _insn$[ebp]
	add	eax, 4
	mov	DWORD PTR _recog_operand_loc, eax
	mov	eax, DWORD PTR _recog_operand_loc
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand, eax
; Line 355
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+8]
	add	eax, 4
	mov	DWORD PTR _recog_operand_loc+4, eax
	mov	eax, DWORD PTR _recog_operand_loc+4
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand+4, eax
; Line 356
$L453:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_extract_34 ENDP
_insn$ = 8
_extract_35 PROC NEAR
; Line 361
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 363
	mov	eax, DWORD PTR _insn$[ebp]
	add	eax, 4
	mov	DWORD PTR _recog_operand_loc, eax
	mov	eax, DWORD PTR _recog_operand_loc
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand, eax
; Line 365
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+8]
	add	eax, 4
	mov	DWORD PTR _recog_operand_loc+4, eax
	mov	eax, DWORD PTR _recog_operand_loc+4
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand+4, eax
; Line 366
$L456:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_extract_35 ENDP
_insn$ = 8
_extract_36 PROC NEAR
; Line 371
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 373
	mov	eax, DWORD PTR _insn$[ebp]
	add	eax, 4
	mov	DWORD PTR _recog_operand_loc, eax
	mov	eax, DWORD PTR _recog_operand_loc
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand, eax
; Line 375
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+8]
	add	eax, 4
	mov	DWORD PTR _recog_operand_loc+4, eax
	mov	eax, DWORD PTR _recog_operand_loc+4
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand+4, eax
; Line 376
$L459:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_extract_36 ENDP
_insn$ = 8
_extract_37 PROC NEAR
; Line 381
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 383
	mov	eax, DWORD PTR _insn$[ebp]
	add	eax, 4
	mov	DWORD PTR _recog_operand_loc, eax
	mov	eax, DWORD PTR _recog_operand_loc
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand, eax
; Line 385
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+8]
	add	eax, 4
	mov	DWORD PTR _recog_operand_loc+4, eax
	mov	eax, DWORD PTR _recog_operand_loc+4
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand+4, eax
; Line 386
$L462:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_extract_37 ENDP
_insn$ = 8
_extract_38 PROC NEAR
; Line 391
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 393
	mov	eax, DWORD PTR _insn$[ebp]
	add	eax, 4
	mov	DWORD PTR _recog_operand_loc, eax
	mov	eax, DWORD PTR _recog_operand_loc
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand, eax
; Line 395
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+8]
	add	eax, 4
	mov	DWORD PTR _recog_operand_loc+4, eax
	mov	eax, DWORD PTR _recog_operand_loc+4
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand+4, eax
; Line 396
$L465:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_extract_38 ENDP
_insn$ = 8
_extract_39 PROC NEAR
; Line 401
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 403
	mov	eax, DWORD PTR _insn$[ebp]
	add	eax, 4
	mov	DWORD PTR _recog_operand_loc, eax
	mov	eax, DWORD PTR _recog_operand_loc
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand, eax
; Line 405
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+8]
	add	eax, 4
	mov	DWORD PTR _recog_operand_loc+4, eax
	mov	eax, DWORD PTR _recog_operand_loc+4
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand+4, eax
; Line 406
$L468:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_extract_39 ENDP
_insn$ = 8
_extract_40 PROC NEAR
; Line 411
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 413
	mov	eax, DWORD PTR _insn$[ebp]
	add	eax, 4
	mov	DWORD PTR _recog_operand_loc, eax
	mov	eax, DWORD PTR _recog_operand_loc
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand, eax
; Line 415
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+8]
	add	eax, 4
	mov	DWORD PTR _recog_operand_loc+4, eax
	mov	eax, DWORD PTR _recog_operand_loc+4
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand+4, eax
; Line 416
$L471:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_extract_40 ENDP
_insn$ = 8
_extract_41 PROC NEAR
; Line 421
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 423
	mov	eax, DWORD PTR _insn$[ebp]
	add	eax, 4
	mov	DWORD PTR _recog_operand_loc, eax
	mov	eax, DWORD PTR _recog_operand_loc
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand, eax
; Line 425
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+8]
	add	eax, 4
	mov	DWORD PTR _recog_operand_loc+4, eax
	mov	eax, DWORD PTR _recog_operand_loc+4
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand+4, eax
; Line 426
$L474:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_extract_41 ENDP
_insn$ = 8
_extract_42 PROC NEAR
; Line 431
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 433
	mov	eax, DWORD PTR _insn$[ebp]
	add	eax, 4
	mov	DWORD PTR _recog_operand_loc, eax
	mov	eax, DWORD PTR _recog_operand_loc
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand, eax
; Line 435
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+8]
	add	eax, 4
	mov	DWORD PTR _recog_operand_loc+4, eax
	mov	eax, DWORD PTR _recog_operand_loc+4
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand+4, eax
; Line 437
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+8]
	add	eax, 8
	mov	DWORD PTR _recog_operand_loc+8, eax
	mov	eax, DWORD PTR _recog_operand_loc+8
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand+8, eax
; Line 438
$L477:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_extract_42 ENDP
_insn$ = 8
_extract_43 PROC NEAR
; Line 443
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 445
	mov	eax, DWORD PTR _insn$[ebp]
	add	eax, 4
	mov	DWORD PTR _recog_operand_loc, eax
	mov	eax, DWORD PTR _recog_operand_loc
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand, eax
; Line 447
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+8]
	add	eax, 4
	mov	DWORD PTR _recog_operand_loc+4, eax
	mov	eax, DWORD PTR _recog_operand_loc+4
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand+4, eax
; Line 448
$L480:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_extract_43 ENDP
_insn$ = 8
_extract_44 PROC NEAR
; Line 453
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 455
	mov	eax, DWORD PTR _insn$[ebp]
	add	eax, 4
	mov	DWORD PTR _recog_operand_loc, eax
	mov	eax, DWORD PTR _recog_operand_loc
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand, eax
; Line 457
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+8]
	add	eax, 4
	mov	DWORD PTR _recog_operand_loc+4, eax
	mov	eax, DWORD PTR _recog_operand_loc+4
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand+4, eax
; Line 459
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+8]
	add	eax, 8
	mov	DWORD PTR _recog_operand_loc+8, eax
	mov	eax, DWORD PTR _recog_operand_loc+8
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand+8, eax
; Line 460
$L483:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_extract_44 ENDP
_insn$ = 8
_extract_45 PROC NEAR
; Line 465
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 467
	mov	eax, DWORD PTR _insn$[ebp]
	add	eax, 4
	mov	DWORD PTR _recog_operand_loc, eax
	mov	eax, DWORD PTR _recog_operand_loc
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand, eax
; Line 469
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+8]
	add	eax, 4
	mov	DWORD PTR _recog_operand_loc+4, eax
	mov	eax, DWORD PTR _recog_operand_loc+4
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand+4, eax
; Line 470
$L486:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_extract_45 ENDP
_insn$ = 8
_extract_46 PROC NEAR
; Line 475
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 477
	mov	eax, DWORD PTR _insn$[ebp]
	add	eax, 4
	mov	DWORD PTR _recog_operand_loc, eax
	mov	eax, DWORD PTR _recog_operand_loc
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand, eax
; Line 479
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+8]
	add	eax, 4
	mov	DWORD PTR _recog_operand_loc+4, eax
	mov	eax, DWORD PTR _recog_operand_loc+4
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand+4, eax
; Line 481
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+8]
	add	eax, 8
	mov	DWORD PTR _recog_operand_loc+8, eax
	mov	eax, DWORD PTR _recog_operand_loc+8
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand+8, eax
; Line 482
$L489:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_extract_46 ENDP
_insn$ = 8
_extract_47 PROC NEAR
; Line 487
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 489
	mov	eax, DWORD PTR _insn$[ebp]
	add	eax, 4
	mov	DWORD PTR _recog_operand_loc, eax
	mov	eax, DWORD PTR _recog_operand_loc
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand, eax
; Line 491
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+8]
	add	eax, 4
	mov	DWORD PTR _recog_operand_loc+4, eax
	mov	eax, DWORD PTR _recog_operand_loc+4
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand+4, eax
; Line 493
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+8]
	add	eax, 8
	mov	DWORD PTR _recog_operand_loc+8, eax
	mov	eax, DWORD PTR _recog_operand_loc+8
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand+8, eax
; Line 494
$L492:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_extract_47 ENDP
_insn$ = 8
_extract_48 PROC NEAR
; Line 499
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 501
	mov	eax, DWORD PTR _insn$[ebp]
	add	eax, 4
	mov	DWORD PTR _recog_operand_loc, eax
	mov	eax, DWORD PTR _recog_operand_loc
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand, eax
; Line 503
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+8]
	add	eax, 4
	mov	DWORD PTR _recog_operand_loc+4, eax
	mov	eax, DWORD PTR _recog_operand_loc+4
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand+4, eax
; Line 505
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+8]
	add	eax, 8
	mov	DWORD PTR _recog_operand_loc+8, eax
	mov	eax, DWORD PTR _recog_operand_loc+8
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand+8, eax
; Line 506
$L495:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_extract_48 ENDP
_insn$ = 8
_extract_49 PROC NEAR
; Line 511
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 513
	mov	eax, DWORD PTR _insn$[ebp]
	add	eax, 4
	mov	DWORD PTR _recog_operand_loc, eax
	mov	eax, DWORD PTR _recog_operand_loc
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand, eax
; Line 515
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+8]
	add	eax, 4
	mov	DWORD PTR _recog_operand_loc+4, eax
	mov	eax, DWORD PTR _recog_operand_loc+4
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand+4, eax
; Line 517
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+8]
	add	eax, 8
	mov	DWORD PTR _recog_operand_loc+8, eax
	mov	eax, DWORD PTR _recog_operand_loc+8
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand+8, eax
; Line 518
$L498:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_extract_49 ENDP
_insn$ = 8
_extract_50 PROC NEAR
; Line 523
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 525
	mov	eax, DWORD PTR _insn$[ebp]
	add	eax, 4
	mov	DWORD PTR _recog_operand_loc, eax
	mov	eax, DWORD PTR _recog_operand_loc
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand, eax
; Line 527
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+8]
	add	eax, 4
	mov	DWORD PTR _recog_operand_loc+4, eax
	mov	eax, DWORD PTR _recog_operand_loc+4
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand+4, eax
; Line 528
$L501:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_extract_50 ENDP
_insn$ = 8
_extract_51 PROC NEAR
; Line 533
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 535
	mov	eax, DWORD PTR _insn$[ebp]
	add	eax, 4
	mov	DWORD PTR _recog_operand_loc, eax
	mov	eax, DWORD PTR _recog_operand_loc
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand, eax
; Line 537
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+8]
	add	eax, 4
	mov	DWORD PTR _recog_operand_loc+4, eax
	mov	eax, DWORD PTR _recog_operand_loc+4
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand+4, eax
; Line 539
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+8]
	add	eax, 8
	mov	DWORD PTR _recog_operand_loc+8, eax
	mov	eax, DWORD PTR _recog_operand_loc+8
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand+8, eax
; Line 540
$L504:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_extract_51 ENDP
_insn$ = 8
_extract_52 PROC NEAR
; Line 545
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 547
	mov	eax, DWORD PTR _insn$[ebp]
	add	eax, 4
	mov	DWORD PTR _recog_operand_loc, eax
	mov	eax, DWORD PTR _recog_operand_loc
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand, eax
; Line 549
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+8]
	add	eax, 4
	mov	DWORD PTR _recog_operand_loc+4, eax
	mov	eax, DWORD PTR _recog_operand_loc+4
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand+4, eax
; Line 550
$L507:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_extract_52 ENDP
_insn$ = 8
_extract_53 PROC NEAR
; Line 555
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 557
	mov	eax, DWORD PTR _insn$[ebp]
	add	eax, 4
	mov	DWORD PTR _recog_operand_loc, eax
	mov	eax, DWORD PTR _recog_operand_loc
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand, eax
; Line 559
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+8]
	add	eax, 4
	mov	DWORD PTR _recog_operand_loc+4, eax
	mov	eax, DWORD PTR _recog_operand_loc+4
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand+4, eax
; Line 561
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+8]
	add	eax, 8
	mov	DWORD PTR _recog_operand_loc+8, eax
	mov	eax, DWORD PTR _recog_operand_loc+8
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand+8, eax
; Line 562
$L510:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_extract_53 ENDP
_insn$ = 8
_extract_54 PROC NEAR
; Line 567
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 569
	mov	eax, DWORD PTR _insn$[ebp]
	add	eax, 4
	mov	DWORD PTR _recog_operand_loc, eax
	mov	eax, DWORD PTR _recog_operand_loc
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand, eax
; Line 571
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+8]
	add	eax, 4
	mov	DWORD PTR _recog_operand_loc+4, eax
	mov	eax, DWORD PTR _recog_operand_loc+4
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand+4, eax
; Line 573
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+8]
	add	eax, 8
	mov	DWORD PTR _recog_operand_loc+8, eax
	mov	eax, DWORD PTR _recog_operand_loc+8
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand+8, eax
; Line 574
$L513:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_extract_54 ENDP
_insn$ = 8
_extract_55 PROC NEAR
; Line 579
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 581
	mov	eax, DWORD PTR _insn$[ebp]
	add	eax, 4
	mov	DWORD PTR _recog_operand_loc, eax
	mov	eax, DWORD PTR _recog_operand_loc
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand, eax
; Line 583
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+8]
	add	eax, 4
	mov	DWORD PTR _recog_operand_loc+4, eax
	mov	eax, DWORD PTR _recog_operand_loc+4
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand+4, eax
; Line 585
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+8]
	add	eax, 8
	mov	DWORD PTR _recog_operand_loc+8, eax
	mov	eax, DWORD PTR _recog_operand_loc+8
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand+8, eax
; Line 586
$L516:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_extract_55 ENDP
_insn$ = 8
_extract_56 PROC NEAR
; Line 591
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 593
	mov	eax, DWORD PTR _insn$[ebp]
	add	eax, 4
	mov	DWORD PTR _recog_operand_loc, eax
	mov	eax, DWORD PTR _recog_operand_loc
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand, eax
; Line 595
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+8]
	add	eax, 4
	mov	DWORD PTR _recog_operand_loc+4, eax
	mov	eax, DWORD PTR _recog_operand_loc+4
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand+4, eax
; Line 597
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+8]
	add	eax, 8
	mov	DWORD PTR _recog_operand_loc+8, eax
	mov	eax, DWORD PTR _recog_operand_loc+8
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand+8, eax
; Line 598
$L519:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_extract_56 ENDP
_insn$ = 8
_extract_57 PROC NEAR
; Line 603
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 605
	mov	eax, DWORD PTR _insn$[ebp]
	add	eax, 4
	mov	DWORD PTR _recog_operand_loc, eax
	mov	eax, DWORD PTR _recog_operand_loc
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand, eax
; Line 607
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+8]
	add	eax, 4
	mov	DWORD PTR _recog_operand_loc+4, eax
	mov	eax, DWORD PTR _recog_operand_loc+4
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand+4, eax
; Line 609
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+8]
	add	eax, 8
	mov	DWORD PTR _recog_operand_loc+8, eax
	mov	eax, DWORD PTR _recog_operand_loc+8
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand+8, eax
; Line 610
$L522:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_extract_57 ENDP
_insn$ = 8
_extract_58 PROC NEAR
; Line 615
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 617
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	add	eax, 4
	mov	DWORD PTR _recog_operand_loc, eax
	mov	eax, DWORD PTR _recog_operand_loc
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand, eax
; Line 619
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+8]
	add	eax, 4
	mov	DWORD PTR _recog_operand_loc+4, eax
	mov	eax, DWORD PTR _recog_operand_loc+4
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand+4, eax
; Line 621
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+8]
	add	eax, 8
	mov	DWORD PTR _recog_operand_loc+8, eax
	mov	eax, DWORD PTR _recog_operand_loc+8
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand+8, eax
; Line 622
$L525:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_extract_58 ENDP
_insn$ = 8
_extract_59 PROC NEAR
; Line 627
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 629
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	add	eax, 4
	mov	DWORD PTR _recog_operand_loc, eax
	mov	eax, DWORD PTR _recog_operand_loc
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand, eax
; Line 631
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+8]
	add	eax, 4
	mov	DWORD PTR _recog_operand_loc+4, eax
	mov	eax, DWORD PTR _recog_operand_loc+4
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand+4, eax
; Line 633
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+8]
	add	eax, 8
	mov	DWORD PTR _recog_operand_loc+8, eax
	mov	eax, DWORD PTR _recog_operand_loc+8
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand+8, eax
; Line 634
$L528:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_extract_59 ENDP
_insn$ = 8
_extract_60 PROC NEAR
; Line 639
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 641
	mov	eax, DWORD PTR _insn$[ebp]
	add	eax, 4
	mov	DWORD PTR _recog_operand_loc, eax
	mov	eax, DWORD PTR _recog_operand_loc
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand, eax
; Line 643
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+8]
	add	eax, 4
	mov	DWORD PTR _recog_operand_loc+4, eax
	mov	eax, DWORD PTR _recog_operand_loc+4
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand+4, eax
; Line 645
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+8]
	add	eax, 8
	mov	DWORD PTR _recog_operand_loc+8, eax
	mov	eax, DWORD PTR _recog_operand_loc+8
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand+8, eax
; Line 646
$L531:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_extract_60 ENDP
_insn$ = 8
_extract_61 PROC NEAR
; Line 651
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 653
	mov	eax, DWORD PTR _insn$[ebp]
	add	eax, 4
	mov	DWORD PTR _recog_operand_loc, eax
	mov	eax, DWORD PTR _recog_operand_loc
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand, eax
; Line 655
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+8]
	add	eax, 4
	mov	DWORD PTR _recog_operand_loc+4, eax
	mov	eax, DWORD PTR _recog_operand_loc+4
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand+4, eax
; Line 657
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+8]
	add	eax, 8
	mov	DWORD PTR _recog_operand_loc+8, eax
	mov	eax, DWORD PTR _recog_operand_loc+8
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand+8, eax
; Line 658
$L534:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_extract_61 ENDP
_insn$ = 8
_extract_62 PROC NEAR
; Line 663
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 665
	mov	eax, DWORD PTR _insn$[ebp]
	add	eax, 4
	mov	DWORD PTR _recog_operand_loc, eax
	mov	eax, DWORD PTR _recog_operand_loc
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand, eax
; Line 667
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+8]
	add	eax, 4
	mov	DWORD PTR _recog_operand_loc+4, eax
	mov	eax, DWORD PTR _recog_operand_loc+4
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand+4, eax
; Line 669
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+8]
	add	eax, 8
	mov	DWORD PTR _recog_operand_loc+8, eax
	mov	eax, DWORD PTR _recog_operand_loc+8
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand+8, eax
; Line 670
$L537:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_extract_62 ENDP
_insn$ = 8
_extract_63 PROC NEAR
; Line 675
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 677
	mov	eax, DWORD PTR _insn$[ebp]
	add	eax, 4
	mov	DWORD PTR _recog_operand_loc, eax
	mov	eax, DWORD PTR _recog_operand_loc
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand, eax
; Line 679
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+8]
	add	eax, 4
	mov	DWORD PTR _recog_operand_loc+4, eax
	mov	eax, DWORD PTR _recog_operand_loc+4
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand+4, eax
; Line 681
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+8]
	add	eax, 8
	mov	DWORD PTR _recog_operand_loc+8, eax
	mov	eax, DWORD PTR _recog_operand_loc+8
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand+8, eax
; Line 682
$L540:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_extract_63 ENDP
_extract_64 PROC NEAR
; Line 684
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
$L542:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_extract_64 ENDP
_extract_65 PROC NEAR
; Line 686
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
$L544:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_extract_65 ENDP
_TEXT	ENDS
EXTRN	_recog_dup_loc:BYTE
EXTRN	_recog_dup_num:BYTE
_TEXT	SEGMENT
_insn$ = 8
_extract_66 PROC NEAR
; Line 691
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 693
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+8]
	add	eax, 4
	mov	DWORD PTR _recog_operand_loc+12, eax
	mov	eax, DWORD PTR _recog_operand_loc+12
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand+12, eax
; Line 694
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+8]
	add	eax, 4
	mov	DWORD PTR _recog_dup_loc, eax
; Line 695
	mov	BYTE PTR _recog_dup_num, 1
; Line 696
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+8]
	add	eax, 8
	mov	DWORD PTR _recog_dup_loc+4, eax
; Line 697
	mov	BYTE PTR _recog_dup_num+1, 2
; Line 699
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	add	eax, 4
	mov	DWORD PTR _recog_operand_loc, eax
	mov	eax, DWORD PTR _recog_operand_loc
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand, eax
; Line 701
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+8]
	add	eax, 4
	mov	DWORD PTR _recog_operand_loc+4, eax
	mov	eax, DWORD PTR _recog_operand_loc+4
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand+4, eax
; Line 703
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+8]
	add	eax, 8
	mov	DWORD PTR _recog_operand_loc+8, eax
	mov	eax, DWORD PTR _recog_operand_loc+8
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand+8, eax
; Line 704
$L547:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_extract_66 ENDP
_insn$ = 8
_extract_67 PROC NEAR
; Line 709
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 711
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+8]
	add	eax, 4
	mov	DWORD PTR _recog_operand_loc+12, eax
	mov	eax, DWORD PTR _recog_operand_loc+12
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand+12, eax
; Line 712
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+8]
	add	eax, 4
	mov	DWORD PTR _recog_dup_loc, eax
; Line 713
	mov	BYTE PTR _recog_dup_num, 1
; Line 714
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+8]
	add	eax, 8
	mov	DWORD PTR _recog_dup_loc+4, eax
; Line 715
	mov	BYTE PTR _recog_dup_num+1, 2
; Line 717
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	add	eax, 4
	mov	DWORD PTR _recog_operand_loc, eax
	mov	eax, DWORD PTR _recog_operand_loc
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand, eax
; Line 719
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+8]
	add	eax, 4
	mov	DWORD PTR _recog_operand_loc+4, eax
	mov	eax, DWORD PTR _recog_operand_loc+4
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand+4, eax
; Line 721
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+8]
	add	eax, 8
	mov	DWORD PTR _recog_operand_loc+8, eax
	mov	eax, DWORD PTR _recog_operand_loc+8
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand+8, eax
; Line 722
$L550:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_extract_67 ENDP
_insn$ = 8
_extract_68 PROC NEAR
; Line 727
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 729
	mov	eax, DWORD PTR _insn$[ebp]
	add	eax, 4
	mov	DWORD PTR _recog_operand_loc, eax
	mov	eax, DWORD PTR _recog_operand_loc
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand, eax
; Line 731
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+8]
	add	eax, 4
	mov	DWORD PTR _recog_operand_loc+4, eax
	mov	eax, DWORD PTR _recog_operand_loc+4
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand+4, eax
; Line 733
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+8]
	add	eax, 8
	mov	DWORD PTR _recog_operand_loc+8, eax
	mov	eax, DWORD PTR _recog_operand_loc+8
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand+8, eax
; Line 734
$L553:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_extract_68 ENDP
_insn$ = 8
_extract_69 PROC NEAR
; Line 739
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 741
	mov	eax, DWORD PTR _insn$[ebp]
	add	eax, 4
	mov	DWORD PTR _recog_operand_loc, eax
	mov	eax, DWORD PTR _recog_operand_loc
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand, eax
; Line 743
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+8]
	add	eax, 4
	mov	DWORD PTR _recog_operand_loc+4, eax
	mov	eax, DWORD PTR _recog_operand_loc+4
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand+4, eax
; Line 745
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+8]
	add	eax, 8
	mov	DWORD PTR _recog_operand_loc+8, eax
	mov	eax, DWORD PTR _recog_operand_loc+8
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand+8, eax
; Line 746
$L556:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_extract_69 ENDP
_insn$ = 8
_extract_70 PROC NEAR
; Line 751
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 753
	mov	eax, DWORD PTR _insn$[ebp]
	add	eax, 4
	mov	DWORD PTR _recog_operand_loc, eax
	mov	eax, DWORD PTR _recog_operand_loc
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand, eax
; Line 755
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+8]
	add	eax, 4
	mov	DWORD PTR _recog_operand_loc+4, eax
	mov	eax, DWORD PTR _recog_operand_loc+4
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand+4, eax
; Line 757
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+8]
	add	eax, 8
	mov	DWORD PTR _recog_operand_loc+8, eax
	mov	eax, DWORD PTR _recog_operand_loc+8
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand+8, eax
; Line 758
$L559:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_extract_70 ENDP
_insn$ = 8
_extract_71 PROC NEAR
; Line 763
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 765
	mov	eax, DWORD PTR _insn$[ebp]
	add	eax, 4
	mov	DWORD PTR _recog_operand_loc, eax
	mov	eax, DWORD PTR _recog_operand_loc
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand, eax
; Line 767
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+8]
	add	eax, 4
	mov	DWORD PTR _recog_operand_loc+4, eax
	mov	eax, DWORD PTR _recog_operand_loc+4
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand+4, eax
; Line 769
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+8]
	add	eax, 8
	mov	DWORD PTR _recog_operand_loc+8, eax
	mov	eax, DWORD PTR _recog_operand_loc+8
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand+8, eax
; Line 770
$L562:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_extract_71 ENDP
_insn$ = 8
_extract_72 PROC NEAR
; Line 775
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 777
	mov	eax, DWORD PTR _insn$[ebp]
	add	eax, 4
	mov	DWORD PTR _recog_operand_loc, eax
	mov	eax, DWORD PTR _recog_operand_loc
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand, eax
; Line 779
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+8]
	add	eax, 4
	mov	DWORD PTR _recog_operand_loc+4, eax
	mov	eax, DWORD PTR _recog_operand_loc+4
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand+4, eax
; Line 781
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+8]
	add	eax, 8
	mov	DWORD PTR _recog_operand_loc+8, eax
	mov	eax, DWORD PTR _recog_operand_loc+8
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand+8, eax
; Line 782
$L565:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_extract_72 ENDP
_insn$ = 8
_extract_73 PROC NEAR
; Line 787
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 789
	mov	eax, DWORD PTR _insn$[ebp]
	add	eax, 4
	mov	DWORD PTR _recog_operand_loc, eax
	mov	eax, DWORD PTR _recog_operand_loc
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand, eax
; Line 791
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+8]
	add	eax, 4
	mov	DWORD PTR _recog_operand_loc+4, eax
	mov	eax, DWORD PTR _recog_operand_loc+4
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand+4, eax
; Line 793
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+8]
	add	eax, 8
	mov	DWORD PTR _recog_operand_loc+8, eax
	mov	eax, DWORD PTR _recog_operand_loc+8
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand+8, eax
; Line 794
$L568:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_extract_73 ENDP
_insn$ = 8
_extract_74 PROC NEAR
; Line 799
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 801
	mov	eax, DWORD PTR _insn$[ebp]
	add	eax, 4
	mov	DWORD PTR _recog_operand_loc, eax
	mov	eax, DWORD PTR _recog_operand_loc
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand, eax
; Line 803
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+8]
	add	eax, 4
	mov	DWORD PTR _recog_operand_loc+4, eax
	mov	eax, DWORD PTR _recog_operand_loc+4
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand+4, eax
; Line 805
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+8]
	add	eax, 8
	mov	DWORD PTR _recog_operand_loc+8, eax
	mov	eax, DWORD PTR _recog_operand_loc+8
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand+8, eax
; Line 806
$L571:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_extract_74 ENDP
_insn$ = 8
_extract_75 PROC NEAR
; Line 811
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 813
	mov	eax, DWORD PTR _insn$[ebp]
	add	eax, 4
	mov	DWORD PTR _recog_operand_loc, eax
	mov	eax, DWORD PTR _recog_operand_loc
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand, eax
; Line 815
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+8]
	add	eax, 4
	mov	DWORD PTR _recog_operand_loc+4, eax
	mov	eax, DWORD PTR _recog_operand_loc+4
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand+4, eax
; Line 817
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+8]
	add	eax, 8
	mov	DWORD PTR _recog_operand_loc+8, eax
	mov	eax, DWORD PTR _recog_operand_loc+8
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand+8, eax
; Line 818
$L574:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_extract_75 ENDP
_insn$ = 8
_extract_76 PROC NEAR
; Line 823
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 825
	mov	eax, DWORD PTR _insn$[ebp]
	add	eax, 4
	mov	DWORD PTR _recog_operand_loc, eax
	mov	eax, DWORD PTR _recog_operand_loc
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand, eax
; Line 827
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+8]
	add	eax, 4
	mov	DWORD PTR _recog_operand_loc+4, eax
	mov	eax, DWORD PTR _recog_operand_loc+4
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand+4, eax
; Line 829
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+8]
	add	eax, 8
	mov	DWORD PTR _recog_operand_loc+8, eax
	mov	eax, DWORD PTR _recog_operand_loc+8
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand+8, eax
; Line 830
$L577:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_extract_76 ENDP
_insn$ = 8
_extract_77 PROC NEAR
; Line 835
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 837
	mov	eax, DWORD PTR _insn$[ebp]
	add	eax, 4
	mov	DWORD PTR _recog_operand_loc, eax
	mov	eax, DWORD PTR _recog_operand_loc
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand, eax
; Line 839
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+8]
	add	eax, 4
	mov	DWORD PTR _recog_operand_loc+4, eax
	mov	eax, DWORD PTR _recog_operand_loc+4
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand+4, eax
; Line 840
$L580:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_extract_77 ENDP
_insn$ = 8
_extract_78 PROC NEAR
; Line 845
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 847
	mov	eax, DWORD PTR _insn$[ebp]
	add	eax, 4
	mov	DWORD PTR _recog_operand_loc, eax
	mov	eax, DWORD PTR _recog_operand_loc
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand, eax
; Line 849
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+8]
	add	eax, 4
	mov	DWORD PTR _recog_operand_loc+4, eax
	mov	eax, DWORD PTR _recog_operand_loc+4
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand+4, eax
; Line 850
$L583:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_extract_78 ENDP
_insn$ = 8
_extract_79 PROC NEAR
; Line 855
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 857
	mov	eax, DWORD PTR _insn$[ebp]
	add	eax, 4
	mov	DWORD PTR _recog_operand_loc, eax
	mov	eax, DWORD PTR _recog_operand_loc
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand, eax
; Line 859
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+8]
	add	eax, 4
	mov	DWORD PTR _recog_operand_loc+4, eax
	mov	eax, DWORD PTR _recog_operand_loc+4
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand+4, eax
; Line 860
$L586:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_extract_79 ENDP
_insn$ = 8
_extract_80 PROC NEAR
; Line 865
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 867
	mov	eax, DWORD PTR _insn$[ebp]
	add	eax, 4
	mov	DWORD PTR _recog_operand_loc, eax
	mov	eax, DWORD PTR _recog_operand_loc
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand, eax
; Line 869
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+8]
	add	eax, 4
	mov	DWORD PTR _recog_operand_loc+4, eax
	mov	eax, DWORD PTR _recog_operand_loc+4
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand+4, eax
; Line 870
$L589:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_extract_80 ENDP
_insn$ = 8
_extract_81 PROC NEAR
; Line 875
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 877
	mov	eax, DWORD PTR _insn$[ebp]
	add	eax, 4
	mov	DWORD PTR _recog_operand_loc, eax
	mov	eax, DWORD PTR _recog_operand_loc
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand, eax
; Line 879
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+8]
	add	eax, 4
	mov	DWORD PTR _recog_operand_loc+4, eax
	mov	eax, DWORD PTR _recog_operand_loc+4
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand+4, eax
; Line 880
$L592:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_extract_81 ENDP
_insn$ = 8
_extract_82 PROC NEAR
; Line 885
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 887
	mov	eax, DWORD PTR _insn$[ebp]
	add	eax, 4
	mov	DWORD PTR _recog_operand_loc, eax
	mov	eax, DWORD PTR _recog_operand_loc
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand, eax
; Line 889
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+8]
	add	eax, 4
	mov	DWORD PTR _recog_operand_loc+4, eax
	mov	eax, DWORD PTR _recog_operand_loc+4
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand+4, eax
; Line 890
$L595:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_extract_82 ENDP
_insn$ = 8
_extract_83 PROC NEAR
; Line 895
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 897
	mov	eax, DWORD PTR _insn$[ebp]
	add	eax, 4
	mov	DWORD PTR _recog_operand_loc, eax
	mov	eax, DWORD PTR _recog_operand_loc
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand, eax
; Line 899
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+8]
	add	eax, 4
	mov	DWORD PTR _recog_operand_loc+4, eax
	mov	eax, DWORD PTR _recog_operand_loc+4
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand+4, eax
; Line 900
$L598:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_extract_83 ENDP
_insn$ = 8
_extract_84 PROC NEAR
; Line 905
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 907
	mov	eax, DWORD PTR _insn$[ebp]
	add	eax, 4
	mov	DWORD PTR _recog_operand_loc, eax
	mov	eax, DWORD PTR _recog_operand_loc
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand, eax
; Line 909
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+8]
	add	eax, 4
	mov	DWORD PTR _recog_operand_loc+4, eax
	mov	eax, DWORD PTR _recog_operand_loc+4
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand+4, eax
; Line 910
$L601:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_extract_84 ENDP
_insn$ = 8
_extract_85 PROC NEAR
; Line 915
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 917
	mov	eax, DWORD PTR _insn$[ebp]
	add	eax, 4
	mov	DWORD PTR _recog_operand_loc, eax
	mov	eax, DWORD PTR _recog_operand_loc
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand, eax
; Line 919
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+8]
	add	eax, 4
	mov	DWORD PTR _recog_operand_loc+4, eax
	mov	eax, DWORD PTR _recog_operand_loc+4
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand+4, eax
; Line 920
$L604:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_extract_85 ENDP
_insn$ = 8
_extract_86 PROC NEAR
; Line 925
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 927
	mov	eax, DWORD PTR _insn$[ebp]
	add	eax, 4
	mov	DWORD PTR _recog_operand_loc, eax
	mov	eax, DWORD PTR _recog_operand_loc
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand, eax
; Line 929
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+8]
	add	eax, 4
	mov	DWORD PTR _recog_operand_loc+4, eax
	mov	eax, DWORD PTR _recog_operand_loc+4
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand+4, eax
; Line 930
$L607:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_extract_86 ENDP
_insn$ = 8
_extract_87 PROC NEAR
; Line 935
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 937
	mov	eax, DWORD PTR _insn$[ebp]
	add	eax, 4
	mov	DWORD PTR _recog_operand_loc, eax
	mov	eax, DWORD PTR _recog_operand_loc
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand, eax
; Line 939
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+8]
	add	eax, 4
	mov	DWORD PTR _recog_operand_loc+4, eax
	mov	eax, DWORD PTR _recog_operand_loc+4
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand+4, eax
; Line 941
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+8]
	add	eax, 8
	mov	DWORD PTR _recog_operand_loc+8, eax
	mov	eax, DWORD PTR _recog_operand_loc+8
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand+8, eax
; Line 942
$L610:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_extract_87 ENDP
_insn$ = 8
_extract_88 PROC NEAR
; Line 947
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 949
	mov	eax, DWORD PTR _insn$[ebp]
	add	eax, 4
	mov	DWORD PTR _recog_operand_loc, eax
	mov	eax, DWORD PTR _recog_operand_loc
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand, eax
; Line 951
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+8]
	add	eax, 4
	mov	DWORD PTR _recog_operand_loc+4, eax
	mov	eax, DWORD PTR _recog_operand_loc+4
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand+4, eax
; Line 953
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+8]
	add	eax, 8
	mov	DWORD PTR _recog_operand_loc+8, eax
	mov	eax, DWORD PTR _recog_operand_loc+8
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand+8, eax
; Line 954
$L613:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_extract_88 ENDP
_insn$ = 8
_extract_89 PROC NEAR
; Line 959
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 961
	mov	eax, DWORD PTR _insn$[ebp]
	add	eax, 4
	mov	DWORD PTR _recog_operand_loc, eax
	mov	eax, DWORD PTR _recog_operand_loc
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand, eax
; Line 963
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+8]
	add	eax, 4
	mov	DWORD PTR _recog_operand_loc+4, eax
	mov	eax, DWORD PTR _recog_operand_loc+4
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand+4, eax
; Line 965
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+8]
	add	eax, 8
	mov	DWORD PTR _recog_operand_loc+8, eax
	mov	eax, DWORD PTR _recog_operand_loc+8
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand+8, eax
; Line 966
$L616:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_extract_89 ENDP
_insn$ = 8
_extract_90 PROC NEAR
; Line 971
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 973
	mov	eax, DWORD PTR _insn$[ebp]
	add	eax, 4
	mov	DWORD PTR _recog_operand_loc, eax
	mov	eax, DWORD PTR _recog_operand_loc
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand, eax
; Line 975
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+8]
	add	eax, 4
	mov	DWORD PTR _recog_operand_loc+4, eax
	mov	eax, DWORD PTR _recog_operand_loc+4
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand+4, eax
; Line 977
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+8]
	add	eax, 8
	mov	DWORD PTR _recog_operand_loc+8, eax
	mov	eax, DWORD PTR _recog_operand_loc+8
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand+8, eax
; Line 978
$L619:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_extract_90 ENDP
_insn$ = 8
_extract_91 PROC NEAR
; Line 983
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 985
	mov	eax, DWORD PTR _insn$[ebp]
	add	eax, 4
	mov	DWORD PTR _recog_operand_loc, eax
	mov	eax, DWORD PTR _recog_operand_loc
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand, eax
; Line 987
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+8]
	add	eax, 4
	mov	DWORD PTR _recog_operand_loc+4, eax
	mov	eax, DWORD PTR _recog_operand_loc+4
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand+4, eax
; Line 989
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+8]
	add	eax, 8
	mov	DWORD PTR _recog_operand_loc+8, eax
	mov	eax, DWORD PTR _recog_operand_loc+8
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand+8, eax
; Line 990
$L622:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_extract_91 ENDP
_insn$ = 8
_extract_92 PROC NEAR
; Line 995
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 997
	mov	eax, DWORD PTR _insn$[ebp]
	add	eax, 4
	mov	DWORD PTR _recog_operand_loc, eax
	mov	eax, DWORD PTR _recog_operand_loc
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand, eax
; Line 999
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+8]
	add	eax, 4
	mov	DWORD PTR _recog_operand_loc+4, eax
	mov	eax, DWORD PTR _recog_operand_loc+4
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand+4, eax
; Line 1001
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+8]
	add	eax, 8
	mov	DWORD PTR _recog_operand_loc+8, eax
	mov	eax, DWORD PTR _recog_operand_loc+8
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand+8, eax
; Line 1002
$L625:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_extract_92 ENDP
_insn$ = 8
_extract_93 PROC NEAR
; Line 1007
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 1009
	mov	eax, DWORD PTR _insn$[ebp]
	add	eax, 4
	mov	DWORD PTR _recog_operand_loc, eax
	mov	eax, DWORD PTR _recog_operand_loc
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand, eax
; Line 1011
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+8]
	add	eax, 4
	mov	DWORD PTR _recog_operand_loc+4, eax
	mov	eax, DWORD PTR _recog_operand_loc+4
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand+4, eax
; Line 1013
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+8]
	add	eax, 8
	mov	DWORD PTR _recog_operand_loc+8, eax
	mov	eax, DWORD PTR _recog_operand_loc+8
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand+8, eax
; Line 1014
$L628:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_extract_93 ENDP
_insn$ = 8
_extract_94 PROC NEAR
; Line 1019
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 1021
	mov	eax, DWORD PTR _insn$[ebp]
	add	eax, 4
	mov	DWORD PTR _recog_operand_loc, eax
	mov	eax, DWORD PTR _recog_operand_loc
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand, eax
; Line 1023
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+8]
	add	eax, 4
	mov	DWORD PTR _recog_operand_loc+4, eax
	mov	eax, DWORD PTR _recog_operand_loc+4
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand+4, eax
; Line 1025
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+8]
	add	eax, 8
	mov	DWORD PTR _recog_operand_loc+8, eax
	mov	eax, DWORD PTR _recog_operand_loc+8
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand+8, eax
; Line 1026
$L631:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_extract_94 ENDP
_insn$ = 8
_extract_95 PROC NEAR
; Line 1031
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 1033
	mov	eax, DWORD PTR _insn$[ebp]
	add	eax, 4
	mov	DWORD PTR _recog_operand_loc, eax
	mov	eax, DWORD PTR _recog_operand_loc
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand, eax
; Line 1035
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+8]
	add	eax, 4
	mov	DWORD PTR _recog_operand_loc+4, eax
	mov	eax, DWORD PTR _recog_operand_loc+4
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand+4, eax
; Line 1037
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+8]
	add	eax, 8
	mov	DWORD PTR _recog_operand_loc+8, eax
	mov	eax, DWORD PTR _recog_operand_loc+8
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand+8, eax
; Line 1038
$L634:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_extract_95 ENDP
_insn$ = 8
_extract_96 PROC NEAR
; Line 1043
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 1045
	mov	eax, DWORD PTR _insn$[ebp]
	add	eax, 4
	mov	DWORD PTR _recog_operand_loc, eax
	mov	eax, DWORD PTR _recog_operand_loc
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand, eax
; Line 1047
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+8]
	add	eax, 4
	mov	DWORD PTR _recog_operand_loc+4, eax
	mov	eax, DWORD PTR _recog_operand_loc+4
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand+4, eax
; Line 1049
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+8]
	add	eax, 8
	mov	DWORD PTR _recog_operand_loc+8, eax
	mov	eax, DWORD PTR _recog_operand_loc+8
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand+8, eax
; Line 1050
$L637:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_extract_96 ENDP
_insn$ = 8
_extract_97 PROC NEAR
; Line 1055
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 1057
	mov	eax, DWORD PTR _insn$[ebp]
	add	eax, 4
	mov	DWORD PTR _recog_operand_loc, eax
	mov	eax, DWORD PTR _recog_operand_loc
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand, eax
; Line 1059
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+8]
	add	eax, 4
	mov	DWORD PTR _recog_operand_loc+4, eax
	mov	eax, DWORD PTR _recog_operand_loc+4
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand+4, eax
; Line 1061
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+8]
	add	eax, 8
	mov	DWORD PTR _recog_operand_loc+8, eax
	mov	eax, DWORD PTR _recog_operand_loc+8
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand+8, eax
; Line 1062
$L640:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_extract_97 ENDP
_insn$ = 8
_extract_98 PROC NEAR
; Line 1067
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 1069
	mov	eax, DWORD PTR _insn$[ebp]
	add	eax, 4
	mov	DWORD PTR _recog_operand_loc, eax
	mov	eax, DWORD PTR _recog_operand_loc
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand, eax
; Line 1071
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+8]
	add	eax, 4
	mov	DWORD PTR _recog_operand_loc+4, eax
	mov	eax, DWORD PTR _recog_operand_loc+4
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand+4, eax
; Line 1073
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+8]
	add	eax, 8
	mov	DWORD PTR _recog_operand_loc+8, eax
	mov	eax, DWORD PTR _recog_operand_loc+8
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand+8, eax
; Line 1074
$L643:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_extract_98 ENDP
_insn$ = 8
_extract_99 PROC NEAR
; Line 1079
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 1081
	mov	eax, DWORD PTR _insn$[ebp]
	add	eax, 4
	mov	DWORD PTR _recog_operand_loc, eax
	mov	eax, DWORD PTR _recog_operand_loc
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand, eax
; Line 1083
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+8]
	add	eax, 4
	mov	DWORD PTR _recog_operand_loc+4, eax
	mov	eax, DWORD PTR _recog_operand_loc+4
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand+4, eax
; Line 1085
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+8]
	add	eax, 8
	mov	DWORD PTR _recog_operand_loc+8, eax
	mov	eax, DWORD PTR _recog_operand_loc+8
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand+8, eax
; Line 1086
$L646:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_extract_99 ENDP
_insn$ = 8
_extract_100 PROC NEAR
; Line 1091
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 1093
	mov	eax, DWORD PTR _insn$[ebp]
	add	eax, 4
	mov	DWORD PTR _recog_operand_loc, eax
	mov	eax, DWORD PTR _recog_operand_loc
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand, eax
; Line 1095
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+8]
	add	eax, 4
	mov	DWORD PTR _recog_operand_loc+4, eax
	mov	eax, DWORD PTR _recog_operand_loc+4
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand+4, eax
; Line 1097
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+8]
	add	eax, 8
	mov	DWORD PTR _recog_operand_loc+8, eax
	mov	eax, DWORD PTR _recog_operand_loc+8
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand+8, eax
; Line 1098
$L649:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_extract_100 ENDP
_insn$ = 8
_extract_101 PROC NEAR
; Line 1103
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 1105
	mov	eax, DWORD PTR _insn$[ebp]
	add	eax, 4
	mov	DWORD PTR _recog_operand_loc, eax
	mov	eax, DWORD PTR _recog_operand_loc
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand, eax
; Line 1107
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+8]
	add	eax, 4
	mov	DWORD PTR _recog_operand_loc+4, eax
	mov	eax, DWORD PTR _recog_operand_loc+4
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand+4, eax
; Line 1109
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+8]
	add	eax, 8
	mov	DWORD PTR _recog_operand_loc+8, eax
	mov	eax, DWORD PTR _recog_operand_loc+8
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand+8, eax
; Line 1110
$L652:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_extract_101 ENDP
_insn$ = 8
_extract_102 PROC NEAR
; Line 1115
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 1117
	mov	eax, DWORD PTR _insn$[ebp]
	add	eax, 4
	mov	DWORD PTR _recog_operand_loc, eax
	mov	eax, DWORD PTR _recog_operand_loc
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand, eax
; Line 1119
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+8]
	add	eax, 4
	mov	DWORD PTR _recog_operand_loc+4, eax
	mov	eax, DWORD PTR _recog_operand_loc+4
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand+4, eax
; Line 1121
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+8]
	add	eax, 8
	mov	DWORD PTR _recog_operand_loc+8, eax
	mov	eax, DWORD PTR _recog_operand_loc+8
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand+8, eax
; Line 1122
$L655:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_extract_102 ENDP
_insn$ = 8
_extract_103 PROC NEAR
; Line 1127
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 1129
	mov	eax, DWORD PTR _insn$[ebp]
	add	eax, 4
	mov	DWORD PTR _recog_operand_loc, eax
	mov	eax, DWORD PTR _recog_operand_loc
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand, eax
; Line 1131
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+8]
	add	eax, 4
	mov	DWORD PTR _recog_operand_loc+4, eax
	mov	eax, DWORD PTR _recog_operand_loc+4
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand+4, eax
; Line 1133
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+8]
	add	eax, 8
	mov	DWORD PTR _recog_operand_loc+8, eax
	mov	eax, DWORD PTR _recog_operand_loc+8
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand+8, eax
; Line 1134
$L658:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_extract_103 ENDP
_insn$ = 8
_extract_104 PROC NEAR
; Line 1139
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 1141
	mov	eax, DWORD PTR _insn$[ebp]
	add	eax, 4
	mov	DWORD PTR _recog_operand_loc, eax
	mov	eax, DWORD PTR _recog_operand_loc
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand, eax
; Line 1143
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+8]
	add	eax, 4
	mov	DWORD PTR _recog_operand_loc+4, eax
	mov	eax, DWORD PTR _recog_operand_loc+4
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand+4, eax
; Line 1145
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+8]
	add	eax, 8
	mov	DWORD PTR _recog_operand_loc+8, eax
	mov	eax, DWORD PTR _recog_operand_loc+8
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand+8, eax
; Line 1146
$L661:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_extract_104 ENDP
_insn$ = 8
_extract_105 PROC NEAR
; Line 1151
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 1153
	mov	eax, DWORD PTR _insn$[ebp]
	add	eax, 4
	mov	DWORD PTR _recog_operand_loc, eax
	mov	eax, DWORD PTR _recog_operand_loc
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand, eax
; Line 1154
$L664:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_extract_105 ENDP
_insn$ = 8
_extract_106 PROC NEAR
; Line 1159
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 1161
	mov	eax, DWORD PTR _insn$[ebp]
	add	eax, 4
	mov	DWORD PTR _recog_operand_loc, eax
	mov	eax, DWORD PTR _recog_operand_loc
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand, eax
; Line 1162
$L667:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_extract_106 ENDP
_insn$ = 8
_extract_107 PROC NEAR
; Line 1167
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 1169
	mov	eax, DWORD PTR _insn$[ebp]
	add	eax, 4
	mov	DWORD PTR _recog_operand_loc, eax
	mov	eax, DWORD PTR _recog_operand_loc
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand, eax
; Line 1170
$L670:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_extract_107 ENDP
_insn$ = 8
_extract_108 PROC NEAR
; Line 1175
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 1177
	mov	eax, DWORD PTR _insn$[ebp]
	add	eax, 4
	mov	DWORD PTR _recog_operand_loc, eax
	mov	eax, DWORD PTR _recog_operand_loc
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand, eax
; Line 1178
$L673:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_extract_108 ENDP
_insn$ = 8
_extract_109 PROC NEAR
; Line 1183
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 1185
	mov	eax, DWORD PTR _insn$[ebp]
	add	eax, 4
	mov	DWORD PTR _recog_operand_loc, eax
	mov	eax, DWORD PTR _recog_operand_loc
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand, eax
; Line 1186
$L676:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_extract_109 ENDP
_insn$ = 8
_extract_110 PROC NEAR
; Line 1191
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 1193
	mov	eax, DWORD PTR _insn$[ebp]
	add	eax, 4
	mov	DWORD PTR _recog_operand_loc, eax
	mov	eax, DWORD PTR _recog_operand_loc
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand, eax
; Line 1194
$L679:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_extract_110 ENDP
_insn$ = 8
_extract_111 PROC NEAR
; Line 1199
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 1201
	mov	eax, DWORD PTR _insn$[ebp]
	add	eax, 4
	mov	DWORD PTR _recog_operand_loc, eax
	mov	eax, DWORD PTR _recog_operand_loc
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand, eax
; Line 1202
$L682:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_extract_111 ENDP
_insn$ = 8
_extract_112 PROC NEAR
; Line 1207
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 1209
	mov	eax, DWORD PTR _insn$[ebp]
	add	eax, 4
	mov	DWORD PTR _recog_operand_loc, eax
	mov	eax, DWORD PTR _recog_operand_loc
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand, eax
; Line 1210
$L685:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_extract_112 ENDP
_insn$ = 8
_extract_113 PROC NEAR
; Line 1215
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 1217
	mov	eax, DWORD PTR _insn$[ebp]
	add	eax, 4
	mov	DWORD PTR _recog_operand_loc, eax
	mov	eax, DWORD PTR _recog_operand_loc
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand, eax
; Line 1218
$L688:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_extract_113 ENDP
_insn$ = 8
_extract_114 PROC NEAR
; Line 1223
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 1225
	mov	eax, DWORD PTR _insn$[ebp]
	add	eax, 4
	mov	DWORD PTR _recog_operand_loc, eax
	mov	eax, DWORD PTR _recog_operand_loc
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand, eax
; Line 1226
$L691:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_extract_114 ENDP
_insn$ = 8
_extract_115 PROC NEAR
; Line 1231
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 1233
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+8]
	add	eax, 4
	mov	DWORD PTR _recog_operand_loc, eax
	mov	eax, DWORD PTR _recog_operand_loc
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand, eax
; Line 1234
$L694:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_extract_115 ENDP
_insn$ = 8
_extract_116 PROC NEAR
; Line 1239
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 1241
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+8]
	add	eax, 4
	mov	DWORD PTR _recog_operand_loc, eax
	mov	eax, DWORD PTR _recog_operand_loc
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand, eax
; Line 1242
$L697:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_extract_116 ENDP
_insn$ = 8
_extract_117 PROC NEAR
; Line 1247
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 1249
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+8]
	add	eax, 4
	mov	DWORD PTR _recog_operand_loc, eax
	mov	eax, DWORD PTR _recog_operand_loc
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand, eax
; Line 1250
$L700:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_extract_117 ENDP
_insn$ = 8
_extract_118 PROC NEAR
; Line 1255
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 1257
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+8]
	add	eax, 4
	mov	DWORD PTR _recog_operand_loc, eax
	mov	eax, DWORD PTR _recog_operand_loc
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand, eax
; Line 1258
$L703:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_extract_118 ENDP
_extract_119 PROC NEAR
; Line 1260
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
$L705:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_extract_119 ENDP
_insn$ = 8
_extract_120 PROC NEAR
; Line 1265
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 1267
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+8]
	add	eax, 4
	mov	DWORD PTR _recog_operand_loc, eax
	mov	eax, DWORD PTR _recog_operand_loc
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand, eax
; Line 1268
$L708:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_extract_120 ENDP
_insn$ = 8
_extract_121 PROC NEAR
; Line 1273
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 1275
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+8]
	add	eax, 4
	mov	DWORD PTR _recog_operand_loc, eax
	mov	eax, DWORD PTR _recog_operand_loc
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand, eax
; Line 1276
$L711:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_extract_121 ENDP
_insn$ = 8
_extract_122 PROC NEAR
; Line 1281
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 1283
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+8]
	add	eax, 4
	mov	DWORD PTR _recog_operand_loc, eax
	mov	eax, DWORD PTR _recog_operand_loc
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand, eax
; Line 1284
$L714:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_extract_122 ENDP
_insn$ = 8
_extract_123 PROC NEAR
; Line 1289
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 1291
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+8]
	add	eax, 4
	mov	DWORD PTR _recog_operand_loc, eax
	mov	eax, DWORD PTR _recog_operand_loc
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand, eax
; Line 1292
$L717:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_extract_123 ENDP
_extract_124 PROC NEAR
; Line 1294
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
$L719:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_extract_124 ENDP
_insn$ = 8
_extract_125 PROC NEAR
; Line 1299
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 1301
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+8]
	add	eax, 4
	mov	DWORD PTR _recog_operand_loc, eax
	mov	eax, DWORD PTR _recog_operand_loc
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand, eax
; Line 1302
$L722:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_extract_125 ENDP
_insn$ = 8
_extract_126 PROC NEAR
; Line 1307
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 1309
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+8]
	add	eax, 4
	mov	DWORD PTR _recog_operand_loc, eax
	mov	eax, DWORD PTR _recog_operand_loc
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand, eax
; Line 1310
$L725:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_extract_126 ENDP
_insn$ = 8
_extract_127 PROC NEAR
; Line 1315
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 1317
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+12]
	add	eax, 4
	mov	DWORD PTR _recog_operand_loc, eax
	mov	eax, DWORD PTR _recog_operand_loc
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand, eax
; Line 1318
$L728:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_extract_127 ENDP
_insn$ = 8
_extract_128 PROC NEAR
; Line 1323
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 1325
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+12]
	add	eax, 4
	mov	DWORD PTR _recog_operand_loc, eax
	mov	eax, DWORD PTR _recog_operand_loc
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand, eax
; Line 1326
$L731:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_extract_128 ENDP
_insn$ = 8
_extract_129 PROC NEAR
; Line 1331
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 1333
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+12]
	add	eax, 4
	mov	DWORD PTR _recog_operand_loc, eax
	mov	eax, DWORD PTR _recog_operand_loc
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand, eax
; Line 1334
$L734:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_extract_129 ENDP
_insn$ = 8
_extract_130 PROC NEAR
; Line 1339
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 1341
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+12]
	add	eax, 4
	mov	DWORD PTR _recog_operand_loc, eax
	mov	eax, DWORD PTR _recog_operand_loc
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand, eax
; Line 1342
$L737:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_extract_130 ENDP
_insn$ = 8
_extract_131 PROC NEAR
; Line 1347
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 1349
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+12]
	add	eax, 4
	mov	DWORD PTR _recog_operand_loc, eax
	mov	eax, DWORD PTR _recog_operand_loc
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand, eax
; Line 1350
$L740:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_extract_131 ENDP
_insn$ = 8
_extract_132 PROC NEAR
; Line 1355
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 1357
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+12]
	add	eax, 4
	mov	DWORD PTR _recog_operand_loc, eax
	mov	eax, DWORD PTR _recog_operand_loc
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand, eax
; Line 1358
$L743:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_extract_132 ENDP
_insn$ = 8
_extract_133 PROC NEAR
; Line 1363
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 1365
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+12]
	add	eax, 4
	mov	DWORD PTR _recog_operand_loc, eax
	mov	eax, DWORD PTR _recog_operand_loc
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand, eax
; Line 1366
$L746:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_extract_133 ENDP
_insn$ = 8
_extract_134 PROC NEAR
; Line 1371
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 1373
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+12]
	add	eax, 4
	mov	DWORD PTR _recog_operand_loc, eax
	mov	eax, DWORD PTR _recog_operand_loc
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand, eax
; Line 1374
$L749:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_extract_134 ENDP
_insn$ = 8
_extract_135 PROC NEAR
; Line 1379
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 1381
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+12]
	add	eax, 4
	mov	DWORD PTR _recog_operand_loc, eax
	mov	eax, DWORD PTR _recog_operand_loc
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand, eax
; Line 1382
$L752:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_extract_135 ENDP
_insn$ = 8
_extract_136 PROC NEAR
; Line 1387
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 1389
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+12]
	add	eax, 4
	mov	DWORD PTR _recog_operand_loc, eax
	mov	eax, DWORD PTR _recog_operand_loc
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand, eax
; Line 1390
$L755:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_extract_136 ENDP
_insn$ = 8
_extract_137 PROC NEAR
; Line 1395
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 1397
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+8]
	add	eax, 4
	mov	DWORD PTR _recog_operand_loc, eax
	mov	eax, DWORD PTR _recog_operand_loc
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand, eax
; Line 1398
$L758:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_extract_137 ENDP
_insn$ = 8
_extract_138 PROC NEAR
; Line 1403
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 1405
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+4]
	add	eax, 4
	mov	DWORD PTR _recog_operand_loc+4, eax
	mov	eax, DWORD PTR _recog_operand_loc+4
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand+4, eax
; Line 1407
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	add	eax, 8
	mov	DWORD PTR _recog_operand_loc, eax
	mov	eax, DWORD PTR _recog_operand_loc
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand, eax
; Line 1408
$L761:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_extract_138 ENDP
_insn$ = 8
_extract_139 PROC NEAR
; Line 1413
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 1415
	mov	eax, DWORD PTR _insn$[ebp]
	add	eax, 4
	mov	DWORD PTR _recog_operand_loc, eax
	mov	eax, DWORD PTR _recog_operand_loc
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand, eax
; Line 1417
	mov	eax, DWORD PTR _insn$[ebp]
	add	eax, 8
	mov	DWORD PTR _recog_operand_loc+4, eax
	mov	eax, DWORD PTR _recog_operand_loc+4
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand+4, eax
; Line 1418
$L764:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_extract_139 ENDP
_insn$ = 8
_extract_140 PROC NEAR
; Line 1423
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 1425
	mov	eax, DWORD PTR _insn$[ebp]
	add	eax, 4
	mov	DWORD PTR _recog_operand_loc, eax
	mov	eax, DWORD PTR _recog_operand_loc
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand, eax
; Line 1427
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+8]
	add	eax, 4
	mov	DWORD PTR _recog_operand_loc+4, eax
	mov	eax, DWORD PTR _recog_operand_loc+4
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand+4, eax
; Line 1429
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+8]
	add	eax, 8
	mov	DWORD PTR _recog_operand_loc+8, eax
	mov	eax, DWORD PTR _recog_operand_loc+8
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _recog_operand+8, eax
; Line 1430
$L767:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_extract_140 ENDP
_extract_141 PROC NEAR
; Line 1435
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 1436
$L770:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_extract_141 ENDP
_TEXT	ENDS
PUBLIC	_insn_extract
EXTRN	_fatal_insn_not_found:NEAR
_TEXT	SEGMENT
_insn$ = 8
_insn_extract PROC NEAR
; Line 1482
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 1483
	mov	eax, DWORD PTR _insn$[ebp]
	cmp	DWORD PTR [eax+20], -1
	jne	$L776
	mov	eax, DWORD PTR _insn$[ebp]
	push	eax
	call	_fatal_insn_not_found
	add	esp, 4
; Line 1484
$L776:
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+16]
	push	eax
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+20]
	call	DWORD PTR _insn_extract_fn[eax*4]
	add	esp, 4
; Line 1485
$L775:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_insn_extract ENDP
_TEXT	ENDS
END
