	TITLE	insn-out.c
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
PUBLIC	_insn_outfun
PUBLIC	_insn_gen_function
PUBLIC	_insn_n_operands
PUBLIC	_insn_n_dups
PUBLIC	_insn_operand_constraint
PUBLIC	_insn_template
PUBLIC	_fp_pop_level
PUBLIC	_insn_operand_mode
PUBLIC	_insn_operand_strict_low
PUBLIC	_insn_operand_predicate
PUBLIC	_insn_machine_info
PUBLIC	_insn_n_alternatives
EXTRN	_gen_one_cmplqi2:NEAR
EXTRN	_gen_tstsf:NEAR
EXTRN	_gen_ashlsi3:NEAR
EXTRN	_gen_tstdf:NEAR
EXTRN	_gen_ashlhi3:NEAR
EXTRN	_gen_cmpsi:NEAR
EXTRN	_gen_ashlqi3:NEAR
EXTRN	_gen_cmphi:NEAR
EXTRN	_gen_ashrsi3:NEAR
EXTRN	_gen_cmpqi:NEAR
EXTRN	_gen_ashrhi3:NEAR
EXTRN	_gen_cmpdf:NEAR
EXTRN	_gen_ashrqi3:NEAR
EXTRN	_gen_cmpsf:NEAR
EXTRN	_gen_lshlsi3:NEAR
EXTRN	_gen_movsi:NEAR
EXTRN	_gen_lshlhi3:NEAR
EXTRN	_gen_movhi:NEAR
EXTRN	_gen_lshlqi3:NEAR
EXTRN	_gen_movqi:NEAR
EXTRN	_gen_lshrsi3:NEAR
EXTRN	_gen_movsf:NEAR
EXTRN	_gen_lshrhi3:NEAR
EXTRN	_gen_movdf:NEAR
EXTRN	_gen_lshrqi3:NEAR
EXTRN	_gen_movdi:NEAR
EXTRN	_gen_rotlsi3:NEAR
EXTRN	_gen_truncsiqi2:NEAR
EXTRN	_gen_rotlhi3:NEAR
EXTRN	_gen_trunchiqi2:NEAR
EXTRN	_gen_rotlqi3:NEAR
EXTRN	_gen_truncsihi2:NEAR
EXTRN	_gen_rotrsi3:NEAR
EXTRN	_gen_zero_extendhisi2:NEAR
EXTRN	_gen_rotrhi3:NEAR
EXTRN	_gen_zero_extendqihi2:NEAR
EXTRN	_gen_zero_extendqisi2:NEAR
EXTRN	_gen_rotrqi3:NEAR
EXTRN	_gen_extendhisi2:NEAR
EXTRN	_gen_seq:NEAR
EXTRN	_gen_extendqihi2:NEAR
EXTRN	_gen_sne:NEAR
EXTRN	_gen_extendqisi2:NEAR
EXTRN	_gen_sgt:NEAR
EXTRN	_gen_extendsfdf2:NEAR
EXTRN	_gen_sgtu:NEAR
EXTRN	_gen_truncdfsf2:NEAR
EXTRN	_gen_slt:NEAR
EXTRN	_gen_sltu:NEAR
EXTRN	_gen_floatsisf2:NEAR
EXTRN	_gen_sge:NEAR
EXTRN	_gen_floatsidf2:NEAR
EXTRN	_gen_sgeu:NEAR
EXTRN	_gen_addsi3:NEAR
EXTRN	_gen_sle:NEAR
EXTRN	_gen_addhi3:NEAR
EXTRN	_gen_sleu:NEAR
EXTRN	_gen_addqi3:NEAR
EXTRN	_gen_beq:NEAR
EXTRN	_gen_adddf3:NEAR
EXTRN	_gen_bne:NEAR
EXTRN	_gen_addsf3:NEAR
EXTRN	_gen_bgt:NEAR
EXTRN	_gen_subsi3:NEAR
EXTRN	_gen_bgtu:NEAR
EXTRN	_gen_subhi3:NEAR
EXTRN	_gen_blt:NEAR
EXTRN	_gen_subqi3:NEAR
EXTRN	_gen_bltu:NEAR
EXTRN	_gen_subdf3:NEAR
EXTRN	_gen_bge:NEAR
EXTRN	_gen_subsf3:NEAR
EXTRN	_gen_bgeu:NEAR
EXTRN	_gen_mulhi3:NEAR
EXTRN	_gen_ble:NEAR
EXTRN	_gen_mulsi3:NEAR
EXTRN	_gen_bleu:NEAR
EXTRN	_gen_umulhi3:NEAR
EXTRN	_gen_jump:NEAR
EXTRN	_gen_umulsi3:NEAR
EXTRN	_gen_tablejump:NEAR
EXTRN	_gen_muldf3:NEAR
EXTRN	_gen_mulsf3:NEAR
EXTRN	_gen_call:NEAR
EXTRN	_gen_divdf3:NEAR
EXTRN	_gen_call_value:NEAR
EXTRN	_gen_divsf3:NEAR
EXTRN	_gen_nop:NEAR
EXTRN	_gen_divmodsi4:NEAR
EXTRN	_general_operand:NEAR
EXTRN	_gen_udivmodsi4:NEAR
EXTRN	_push_operand:NEAR
EXTRN	_gen_andsi3:NEAR
EXTRN	_gen_andhi3:NEAR
EXTRN	_indirect_operand:NEAR
EXTRN	_gen_andqi3:NEAR
EXTRN	_gen_iorsi3:NEAR
EXTRN	_register_operand:NEAR
EXTRN	_gen_iorhi3:NEAR
EXTRN	_address_operand:NEAR
EXTRN	_gen_iorqi3:NEAR
EXTRN	_gen_xorsi3:NEAR
EXTRN	_gen_xorhi3:NEAR
EXTRN	_gen_xorqi3:NEAR
EXTRN	_gen_negsi2:NEAR
EXTRN	_gen_neghi2:NEAR
EXTRN	_gen_negqi2:NEAR
EXTRN	_gen_negsf2:NEAR
EXTRN	_gen_negdf2:NEAR
EXTRN	_gen_abssf2:NEAR
EXTRN	_gen_absdf2:NEAR
EXTRN	_gen_tstsi:NEAR
EXTRN	_gen_one_cmplsi2:NEAR
EXTRN	_gen_tsthi:NEAR
EXTRN	_gen_one_cmplhi2:NEAR
EXTRN	_gen_tstqi:NEAR
_DATA	SEGMENT
_fp_pop_level DD 00H
$SG627	DB	'ax', 00H
	ORG $+1
$SG628	DB	'dx', 00H
	ORG $+1
$SG629	DB	'cx', 00H
	ORG $+1
$SG630	DB	'bx', 00H
	ORG $+1
$SG631	DB	'si', 00H
	ORG $+1
$SG632	DB	'di', 00H
	ORG $+1
$SG633	DB	'bp', 00H
	ORG $+1
$SG634	DB	'sp', 00H
	ORG $+1
$SG635	DB	'st', 00H
	ORG $+1
$SG636	DB	'st(1)', 00H
	ORG $+2
_hi_reg_name$S626 DD FLAT:$SG627
	DD	FLAT:$SG628
	DD	FLAT:$SG629
	DD	FLAT:$SG630
	DD	FLAT:$SG631
	DD	FLAT:$SG632
	DD	FLAT:$SG633
	DD	FLAT:$SG634
	DD	FLAT:$SG635
	DD	FLAT:$SG636
$SG638	DB	'al', 00H
	ORG $+1
$SG639	DB	'dl', 00H
	ORG $+1
$SG640	DB	'cl', 00H
	ORG $+1
$SG641	DB	'bl', 00H
	ORG $+1
$SG642	DB	'si', 00H
	ORG $+1
$SG643	DB	'di', 00H
	ORG $+1
$SG644	DB	'bp', 00H
	ORG $+1
$SG645	DB	'sp', 00H
	ORG $+1
_qi_reg_name$S637 DD FLAT:$SG638
	DD	FLAT:$SG639
	DD	FLAT:$SG640
	DD	FLAT:$SG641
	DD	FLAT:$SG642
	DD	FLAT:$SG643
	DD	FLAT:$SG644
	DD	FLAT:$SG645
$SG2029	DB	'push%L0 %1', 00H
	ORG $+1
$SG2030	DB	'push%W0 %1', 00H
	ORG $+1
$SG2031	DB	'inc%L0 %0', 00H
	ORG $+2
$SG2032	DB	'dec%L0 %0', 00H
	ORG $+2
$SG2033	DB	'dec%L0 %0', 00H
	ORG $+2
$SG2034	DB	'movz%W0%L0 %1,%0', 00H
	ORG $+3
$SG2035	DB	'movz%B0%W0 %1,%0', 00H
	ORG $+3
$SG2036	DB	'movz%B0%L0 %1,%0', 00H
	ORG $+3
$SG2037	DB	'movs%W0%L0 %1,%0', 00H
	ORG $+3
$SG2038	DB	'movs%B0%W0 %1,%0', 00H
	ORG $+3
$SG2039	DB	'movs%B0%L0 %1,%0', 00H
	ORG $+3
$SG2040	DB	'add%L0 %2,%0', 00H
	ORG $+3
$SG2041	DB	'inc%W0 %0', 00H
	ORG $+2
$SG2042	DB	'add%W0 %2,%0', 00H
	ORG $+3
$SG2043	DB	'inc%B0 %0', 00H
	ORG $+2
$SG2044	DB	'add%B0 %2,%0', 00H
	ORG $+3
$SG2045	DB	'sub%L0 %2,%0', 00H
	ORG $+3
$SG2046	DB	'dec%W0 %0', 00H
	ORG $+2
$SG2047	DB	'sub%W0 %2,%0', 00H
	ORG $+3
$SG2048	DB	'dec%B0 %0', 00H
	ORG $+2
$SG2049	DB	'sub%B0 %2,%0', 00H
	ORG $+3
$SG2050	DB	'mul%W0 %2,%0', 00H
	ORG $+3
$SG2051	DB	'mul%L0 %2,%0', 00H
	ORG $+3
$SG2052	DB	'cltd', 0aH, 09H, 'idiv%L0 %2', 00H
	ORG $+3
$SG2053	DB	'xor%L0 %3,%3', 0aH, 09H, 'div%L0 %2', 00H
$SG2054	DB	'and%L0 %2,%0', 00H
	ORG $+3
$SG2055	DB	'and%W0 %2,%0', 00H
	ORG $+3
$SG2056	DB	'and%B0 %2,%0', 00H
	ORG $+3
$SG2057	DB	'or%L0 %2,%0', 00H
$SG2058	DB	'or%W0 %2,%0', 00H
$SG2059	DB	'or%B0 %2,%0', 00H
$SG2060	DB	'xor%L0 %2,%0', 00H
	ORG $+3
$SG2061	DB	'xor%W0 %2,%0', 00H
	ORG $+3
$SG2062	DB	'xor%B0 %2,%0', 00H
	ORG $+3
$SG2063	DB	'neg%L0 %0', 00H
	ORG $+2
$SG2064	DB	'neg%W0 %0', 00H
	ORG $+2
$SG2065	DB	'neg%B0 %0', 00H
	ORG $+2
$SG2066	DB	'not%L0 %0', 00H
	ORG $+2
$SG2067	DB	'not%W0 %0', 00H
	ORG $+2
$SG2068	DB	'not%B0 %0', 00H
	ORG $+2
$SG2069	DB	'je %l0', 00H
	ORG $+1
$SG2070	DB	'jne %l0', 00H
$SG2071	DB	'ja %l0', 00H
	ORG $+1
$SG2072	DB	'jb %l0', 00H
	ORG $+1
$SG2073	DB	'jae %l0', 00H
$SG2074	DB	'jbe %l0', 00H
$SG2075	DB	'jne %l0', 00H
$SG2076	DB	'je %l0', 00H
	ORG $+1
$SG2077	DB	'jbe %l0', 00H
$SG2078	DB	'jae %l0', 00H
$SG2079	DB	'jb %l0', 00H
	ORG $+1
$SG2080	DB	'ja %l0', 00H
	ORG $+1
$SG2081	DB	'jmp %l0', 00H
$SG2082	DB	'nop', 00H
_DATA	ENDS
CONST	SEGMENT
_insn_template DD 00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	FLAT:$SG2029
	DD	00H
	DD	FLAT:$SG2030
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	FLAT:$SG2031
	DD	FLAT:$SG2032
	DD	FLAT:$SG2033
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	FLAT:$SG2034
	DD	FLAT:$SG2035
	DD	FLAT:$SG2036
	DD	FLAT:$SG2037
	DD	FLAT:$SG2038
	DD	FLAT:$SG2039
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	FLAT:$SG2040
	DD	FLAT:$SG2041
	DD	FLAT:$SG2042
	DD	FLAT:$SG2043
	DD	FLAT:$SG2044
	DD	00H
	DD	00H
	DD	FLAT:$SG2045
	DD	FLAT:$SG2046
	DD	FLAT:$SG2047
	DD	FLAT:$SG2048
	DD	FLAT:$SG2049
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	FLAT:$SG2050
	DD	FLAT:$SG2051
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	FLAT:$SG2052
	DD	FLAT:$SG2053
	DD	FLAT:$SG2054
	DD	FLAT:$SG2055
	DD	FLAT:$SG2056
	DD	FLAT:$SG2057
	DD	FLAT:$SG2058
	DD	FLAT:$SG2059
	DD	FLAT:$SG2060
	DD	FLAT:$SG2061
	DD	FLAT:$SG2062
	DD	FLAT:$SG2063
	DD	FLAT:$SG2064
	DD	FLAT:$SG2065
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	FLAT:$SG2066
	DD	FLAT:$SG2067
	DD	FLAT:$SG2068
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	FLAT:$SG2069
	DD	FLAT:$SG2070
	DD	00H
	DD	FLAT:$SG2071
	DD	00H
	DD	00H
	DD	FLAT:$SG2072
	DD	00H
	DD	FLAT:$SG2073
	DD	00H
	DD	00H
	DD	FLAT:$SG2074
	DD	FLAT:$SG2075
	DD	FLAT:$SG2076
	DD	00H
	DD	FLAT:$SG2077
	DD	00H
	DD	FLAT:$SG2078
	DD	00H
	DD	FLAT:$SG2079
	DD	00H
	DD	FLAT:$SG2080
	DD	FLAT:$SG2081
	DD	00H
	DD	00H
	DD	00H
	DD	FLAT:$SG2082
_insn_outfun DD	FLAT:_output_0
	DD	FLAT:_output_1
	DD	FLAT:_output_2
	DD	FLAT:_output_3
	DD	FLAT:_output_4
	DD	FLAT:_output_5
	DD	FLAT:_output_6
	DD	FLAT:_output_7
	DD	FLAT:_output_8
	DD	FLAT:_output_9
	DD	FLAT:_output_10
	DD	FLAT:_output_11
	DD	FLAT:_output_12
	DD	00H
	DD	FLAT:_output_14
	DD	00H
	DD	FLAT:_output_16
	DD	FLAT:_output_17
	DD	FLAT:_output_18
	DD	FLAT:_output_19
	DD	FLAT:_output_20
	DD	FLAT:_output_21
	DD	FLAT:_output_22
	DD	FLAT:_output_23
	DD	FLAT:_output_24
	DD	00H
	DD	00H
	DD	00H
	DD	FLAT:_output_28
	DD	FLAT:_output_29
	DD	FLAT:_output_30
	DD	FLAT:_output_31
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	FLAT:_output_38
	DD	FLAT:_output_39
	DD	FLAT:_output_40
	DD	FLAT:_output_41
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	FLAT:_output_47
	DD	FLAT:_output_48
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	FLAT:_output_54
	DD	FLAT:_output_55
	DD	FLAT:_output_56
	DD	FLAT:_output_57
	DD	00H
	DD	00H
	DD	FLAT:_output_60
	DD	FLAT:_output_61
	DD	FLAT:_output_62
	DD	FLAT:_output_63
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	FLAT:_output_80
	DD	FLAT:_output_81
	DD	FLAT:_output_82
	DD	FLAT:_output_83
	DD	00H
	DD	00H
	DD	00H
	DD	FLAT:_output_87
	DD	FLAT:_output_88
	DD	FLAT:_output_89
	DD	FLAT:_output_90
	DD	FLAT:_output_91
	DD	FLAT:_output_92
	DD	FLAT:_output_93
	DD	FLAT:_output_94
	DD	FLAT:_output_95
	DD	FLAT:_output_96
	DD	FLAT:_output_97
	DD	FLAT:_output_98
	DD	FLAT:_output_99
	DD	FLAT:_output_100
	DD	FLAT:_output_101
	DD	FLAT:_output_102
	DD	FLAT:_output_103
	DD	FLAT:_output_104
	DD	FLAT:_output_105
	DD	FLAT:_output_106
	DD	FLAT:_output_107
	DD	FLAT:_output_108
	DD	FLAT:_output_109
	DD	FLAT:_output_110
	DD	FLAT:_output_111
	DD	FLAT:_output_112
	DD	FLAT:_output_113
	DD	FLAT:_output_114
	DD	00H
	DD	00H
	DD	FLAT:_output_117
	DD	00H
	DD	00H
	DD	FLAT:_output_120
	DD	00H
	DD	FLAT:_output_122
	DD	00H
	DD	00H
	DD	FLAT:_output_125
	DD	00H
	DD	00H
	DD	00H
	DD	FLAT:_output_129
	DD	00H
	DD	FLAT:_output_131
	DD	00H
	DD	FLAT:_output_133
	DD	00H
	DD	FLAT:_output_135
	DD	00H
	DD	00H
	DD	FLAT:_output_138
	DD	FLAT:_output_139
	DD	FLAT:_output_140
	DD	00H
_insn_gen_function DD FLAT:_gen_tstsi
	DD	FLAT:_gen_tsthi
	DD	FLAT:_gen_tstqi
	DD	FLAT:_gen_tstsf
	DD	FLAT:_gen_tstdf
	DD	FLAT:_gen_cmpsi
	DD	FLAT:_gen_cmphi
	DD	FLAT:_gen_cmpqi
	DD	FLAT:_gen_cmpdf
	DD	FLAT:_gen_cmpsf
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	FLAT:_gen_movsi
	DD	00H
	DD	FLAT:_gen_movhi
	DD	00H
	DD	FLAT:_gen_movqi
	DD	00H
	DD	FLAT:_gen_movsf
	DD	00H
	DD	FLAT:_gen_movdf
	DD	00H
	DD	FLAT:_gen_movdi
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	FLAT:_gen_truncsiqi2
	DD	FLAT:_gen_trunchiqi2
	DD	FLAT:_gen_truncsihi2
	DD	FLAT:_gen_zero_extendhisi2
	DD	FLAT:_gen_zero_extendqihi2
	DD	FLAT:_gen_zero_extendqisi2
	DD	FLAT:_gen_extendhisi2
	DD	FLAT:_gen_extendqihi2
	DD	FLAT:_gen_extendqisi2
	DD	FLAT:_gen_extendsfdf2
	DD	FLAT:_gen_truncdfsf2
	DD	FLAT:_gen_floatsisf2
	DD	FLAT:_gen_floatsidf2
	DD	FLAT:_gen_addsi3
	DD	00H
	DD	FLAT:_gen_addhi3
	DD	00H
	DD	FLAT:_gen_addqi3
	DD	FLAT:_gen_adddf3
	DD	FLAT:_gen_addsf3
	DD	FLAT:_gen_subsi3
	DD	00H
	DD	FLAT:_gen_subhi3
	DD	00H
	DD	FLAT:_gen_subqi3
	DD	FLAT:_gen_subdf3
	DD	FLAT:_gen_subsf3
	DD	FLAT:_gen_mulhi3
	DD	FLAT:_gen_mulsi3
	DD	FLAT:_gen_umulhi3
	DD	FLAT:_gen_umulsi3
	DD	FLAT:_gen_muldf3
	DD	FLAT:_gen_mulsf3
	DD	FLAT:_gen_divdf3
	DD	FLAT:_gen_divsf3
	DD	FLAT:_gen_divmodsi4
	DD	FLAT:_gen_udivmodsi4
	DD	00H
	DD	00H
	DD	FLAT:_gen_andsi3
	DD	FLAT:_gen_andhi3
	DD	FLAT:_gen_andqi3
	DD	FLAT:_gen_iorsi3
	DD	FLAT:_gen_iorhi3
	DD	FLAT:_gen_iorqi3
	DD	FLAT:_gen_xorsi3
	DD	FLAT:_gen_xorhi3
	DD	FLAT:_gen_xorqi3
	DD	FLAT:_gen_negsi2
	DD	FLAT:_gen_neghi2
	DD	FLAT:_gen_negqi2
	DD	FLAT:_gen_negsf2
	DD	FLAT:_gen_negdf2
	DD	FLAT:_gen_abssf2
	DD	FLAT:_gen_absdf2
	DD	FLAT:_gen_one_cmplsi2
	DD	FLAT:_gen_one_cmplhi2
	DD	FLAT:_gen_one_cmplqi2
	DD	FLAT:_gen_ashlsi3
	DD	FLAT:_gen_ashlhi3
	DD	FLAT:_gen_ashlqi3
	DD	FLAT:_gen_ashrsi3
	DD	FLAT:_gen_ashrhi3
	DD	FLAT:_gen_ashrqi3
	DD	FLAT:_gen_lshlsi3
	DD	FLAT:_gen_lshlhi3
	DD	FLAT:_gen_lshlqi3
	DD	FLAT:_gen_lshrsi3
	DD	FLAT:_gen_lshrhi3
	DD	FLAT:_gen_lshrqi3
	DD	FLAT:_gen_rotlsi3
	DD	FLAT:_gen_rotlhi3
	DD	FLAT:_gen_rotlqi3
	DD	FLAT:_gen_rotrsi3
	DD	FLAT:_gen_rotrhi3
	DD	FLAT:_gen_rotrqi3
	DD	FLAT:_gen_seq
	DD	FLAT:_gen_sne
	DD	FLAT:_gen_sgt
	DD	FLAT:_gen_sgtu
	DD	FLAT:_gen_slt
	DD	FLAT:_gen_sltu
	DD	FLAT:_gen_sge
	DD	FLAT:_gen_sgeu
	DD	FLAT:_gen_sle
	DD	FLAT:_gen_sleu
	DD	FLAT:_gen_beq
	DD	FLAT:_gen_bne
	DD	FLAT:_gen_bgt
	DD	FLAT:_gen_bgtu
	DD	FLAT:_gen_blt
	DD	00H
	DD	FLAT:_gen_bltu
	DD	FLAT:_gen_bge
	DD	FLAT:_gen_bgeu
	DD	FLAT:_gen_ble
	DD	00H
	DD	FLAT:_gen_bleu
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	FLAT:_gen_jump
	DD	FLAT:_gen_tablejump
	DD	FLAT:_gen_call
	DD	FLAT:_gen_call_value
	DD	FLAT:_gen_nop
CONST	ENDS
_DATA	SEGMENT
_insn_n_operands DD 01H
	DD	01H
	DD	01H
	DD	01H
	DD	01H
	DD	02H
	DD	02H
	DD	02H
	DD	02H
	DD	02H
	DD	02H
	DD	02H
	DD	02H
	DD	02H
	DD	02H
	DD	02H
	DD	02H
	DD	02H
	DD	02H
	DD	02H
	DD	02H
	DD	02H
	DD	02H
	DD	02H
	DD	02H
	DD	02H
	DD	02H
	DD	02H
	DD	02H
	DD	02H
	DD	02H
	DD	02H
	DD	02H
	DD	02H
	DD	02H
	DD	02H
	DD	02H
	DD	02H
	DD	02H
	DD	02H
	DD	02H
	DD	02H
	DD	03H
	DD	02H
	DD	03H
	DD	02H
	DD	03H
	DD	03H
	DD	03H
	DD	03H
	DD	02H
	DD	03H
	DD	02H
	DD	03H
	DD	03H
	DD	03H
	DD	03H
	DD	03H
	DD	03H
	DD	03H
	DD	03H
	DD	03H
	DD	03H
	DD	03H
	DD	04H
	DD	04H
	DD	04H
	DD	04H
	DD	03H
	DD	03H
	DD	03H
	DD	03H
	DD	03H
	DD	03H
	DD	03H
	DD	03H
	DD	03H
	DD	02H
	DD	02H
	DD	02H
	DD	02H
	DD	02H
	DD	02H
	DD	02H
	DD	02H
	DD	02H
	DD	02H
	DD	03H
	DD	03H
	DD	03H
	DD	03H
	DD	03H
	DD	03H
	DD	03H
	DD	03H
	DD	03H
	DD	03H
	DD	03H
	DD	03H
	DD	03H
	DD	03H
	DD	03H
	DD	03H
	DD	03H
	DD	03H
	DD	01H
	DD	01H
	DD	01H
	DD	01H
	DD	01H
	DD	01H
	DD	01H
	DD	01H
	DD	01H
	DD	01H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	01H
	DD	02H
	DD	03H
	DD	00H
_insn_n_dups DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	02H
	DD	02H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
$SG2088	DB	'rm', 00H
	ORG $+1
$SG2089	DB	'rm', 00H
	ORG $+1
$SG2090	DB	'qm', 00H
	ORG $+1
$SG2091	DB	'rm,f', 00H
	ORG $+3
$SG2092	DB	'rm,f', 00H
	ORG $+3
$SG2093	DB	'mr,ri', 00H
	ORG $+2
$SG2094	DB	'ri,mr', 00H
	ORG $+2
$SG2095	DB	'mr,ri', 00H
	ORG $+2
$SG2096	DB	'ri,mr', 00H
	ORG $+2
$SG2097	DB	'qn,mq', 00H
	ORG $+2
$SG2098	DB	'qm,nq', 00H
	ORG $+2
$SG2099	DB	'm,f*r,m,f,r,!*r', 00H
$SG2100	DB	'm,m,f*r,r,f,*r', 00H
	ORG $+1
$SG2101	DB	'm,f*r,m,f,r,!*r', 00H
$SG2102	DB	'm,m,f*r,r,f,*r', 00H
	ORG $+1
$SG2103	DB	'rm,ri', 00H
	ORG $+2
$SG2104	DB	'ri,rm', 00H
	ORG $+2
$SG2105	DB	'rm,ri', 00H
	ORG $+2
$SG2106	DB	'ri,rm', 00H
	ORG $+2
$SG2107	DB	'qm,qi', 00H
	ORG $+2
$SG2108	DB	'qi,qm', 00H
	ORG $+2
$SG2109	DB	'=<', 00H
	ORG $+1
$SG2110	DB	'g', 00H
	ORG $+2
$SG2111	DB	'=g,r', 00H
	ORG $+3
$SG2112	DB	'ri,m', 00H
	ORG $+3
$SG2113	DB	'=<', 00H
	ORG $+1
$SG2114	DB	'g', 00H
	ORG $+2
$SG2115	DB	'=g,r', 00H
	ORG $+3
$SG2116	DB	'ri,m', 00H
	ORG $+3
$SG2117	DB	'=<', 00H
	ORG $+1
$SG2118	DB	'q', 00H
	ORG $+2
$SG2119	DB	'=q,*r,m', 00H
$SG2120	DB	'*g,q,qi', 00H
$SG2121	DB	'=<,<', 00H
	ORG $+3
$SG2122	DB	'gF,f', 00H
	ORG $+3
$SG2123	DB	'=rf,mrf,!rm', 00H
$SG2124	DB	'mrf,rf,F', 00H
	ORG $+3
$SG2125	DB	'=<,<', 00H
	ORG $+3
$SG2126	DB	'gF,f', 00H
	ORG $+3
$SG2127	DB	'=rmf,&fr,!rm', 00H
	ORG $+3
$SG2128	DB	'fr,mrf,F', 00H
	ORG $+3
$SG2129	DB	'=<', 00H
	ORG $+1
$SG2130	DB	'roiF', 00H
	ORG $+3
$SG2131	DB	'=&r,rm', 00H
	ORG $+1
$SG2132	DB	'm,riF', 00H
	ORG $+2
$SG2133	DB	'=g', 00H
	ORG $+1
$SG2134	DB	'0', 00H
	ORG $+2
$SG2135	DB	'=g', 00H
	ORG $+1
$SG2136	DB	'0', 00H
	ORG $+2
$SG2137	DB	'=g', 00H
	ORG $+1
$SG2138	DB	'0', 00H
	ORG $+2
$SG2139	DB	'=r', 00H
	ORG $+1
$SG2140	DB	'p', 00H
	ORG $+2
$SG2141	DB	'=q,m', 00H
	ORG $+3
$SG2142	DB	'qim,qn', 00H
	ORG $+1
$SG2143	DB	'=q,m', 00H
	ORG $+3
$SG2144	DB	'qim,qn', 00H
	ORG $+1
$SG2145	DB	'=r,m', 00H
	ORG $+3
$SG2146	DB	'rim,rn', 00H
	ORG $+1
$SG2147	DB	'=r', 00H
	ORG $+1
$SG2148	DB	'rm', 00H
	ORG $+1
$SG2149	DB	'=r', 00H
	ORG $+1
$SG2150	DB	'qm', 00H
	ORG $+1
$SG2151	DB	'=r', 00H
	ORG $+1
$SG2152	DB	'qm', 00H
	ORG $+1
$SG2153	DB	'=r', 00H
	ORG $+1
$SG2154	DB	'rm', 00H
	ORG $+1
$SG2155	DB	'=r', 00H
	ORG $+1
$SG2156	DB	'qm', 00H
	ORG $+1
$SG2157	DB	'=r', 00H
	ORG $+1
$SG2158	DB	'qm', 00H
	ORG $+1
$SG2159	DB	'=fm,f,fm,fm', 00H
$SG2160	DB	'm,0,f,!*r', 00H
	ORG $+2
$SG2161	DB	'=m,!*r', 00H
	ORG $+1
$SG2162	DB	'f,f', 00H
$SG2163	DB	'=fm,fm', 00H
	ORG $+1
$SG2164	DB	'm,!*r', 00H
	ORG $+2
$SG2165	DB	'=fm,fm', 00H
	ORG $+1
$SG2166	DB	'm,!*r', 00H
	ORG $+2
$SG2167	DB	'=rm,r', 00H
	ORG $+2
$SG2168	DB	'%0,0', 00H
	ORG $+3
$SG2169	DB	'ri,rm', 00H
	ORG $+2
$SG2170	DB	'=g', 00H
	ORG $+1
$SG2171	DB	'0', 00H
	ORG $+2
$SG2172	DB	'=rm,r', 00H
	ORG $+2
$SG2173	DB	'%0,0', 00H
	ORG $+3
$SG2174	DB	'ri,rm', 00H
	ORG $+2
$SG2175	DB	'=qm', 00H
$SG2176	DB	'0', 00H
	ORG $+2
$SG2177	DB	'=m,q', 00H
	ORG $+3
$SG2178	DB	'%0,0', 00H
	ORG $+3
$SG2179	DB	'qn,qmn', 00H
	ORG $+1
$SG2180	DB	'=f,m,f', 00H
	ORG $+1
$SG2181	DB	'%0,0,0', 00H
	ORG $+1
$SG2182	DB	'm,!f,!*r', 00H
	ORG $+3
$SG2183	DB	'=f,m,f', 00H
	ORG $+1
$SG2184	DB	'%0,0,0', 00H
	ORG $+1
$SG2185	DB	'm,!f,!*r', 00H
	ORG $+3
$SG2186	DB	'=rm,r', 00H
	ORG $+2
$SG2187	DB	'0,0', 00H
$SG2188	DB	'ri,rm', 00H
	ORG $+2
$SG2189	DB	'=g', 00H
	ORG $+1
$SG2190	DB	'0', 00H
	ORG $+2
$SG2191	DB	'=rm,r', 00H
	ORG $+2
$SG2192	DB	'0,0', 00H
$SG2193	DB	'ri,rm', 00H
	ORG $+2
$SG2194	DB	'=qm', 00H
$SG2195	DB	'0', 00H
	ORG $+2
$SG2196	DB	'=m,q', 00H
	ORG $+3
$SG2197	DB	'0,0', 00H
$SG2198	DB	'qn,qmn', 00H
	ORG $+1
$SG2199	DB	'=f,m,f,f', 00H
	ORG $+3
$SG2200	DB	'0,0,0,m', 00H
$SG2201	DB	'm,!f,!*r,*0', 00H
$SG2202	DB	'=f,m,f,f', 00H
	ORG $+3
$SG2203	DB	'0,0,0,m', 00H
$SG2204	DB	'm,!f,!*r,*0', 00H
$SG2205	DB	'=r,r', 00H
	ORG $+3
$SG2206	DB	'%0,rm', 00H
	ORG $+2
$SG2207	DB	'g,i', 00H
$SG2208	DB	'=r,r', 00H
	ORG $+3
$SG2209	DB	'%0,rm', 00H
	ORG $+2
$SG2210	DB	'g,i', 00H
$SG2211	DB	'=a', 00H
	ORG $+1
$SG2212	DB	'%0', 00H
	ORG $+1
$SG2213	DB	'rm', 00H
	ORG $+1
$SG2214	DB	'=a', 00H
	ORG $+1
$SG2215	DB	'%0', 00H
	ORG $+1
$SG2216	DB	'rm', 00H
	ORG $+1
$SG2217	DB	'=f,m,f', 00H
	ORG $+1
$SG2218	DB	'%0,0,0', 00H
	ORG $+1
$SG2219	DB	'm,!f,!*r', 00H
	ORG $+3
$SG2220	DB	'=f,m,f', 00H
	ORG $+1
$SG2221	DB	'%0,0,0', 00H
	ORG $+1
$SG2222	DB	'm,!f,!*r', 00H
	ORG $+3
$SG2223	DB	'=f,m,f,f', 00H
	ORG $+3
$SG2224	DB	'0,0,0,m', 00H
$SG2225	DB	'm,!f,!*r,*0', 00H
$SG2226	DB	'=f,m,f,f', 00H
	ORG $+3
$SG2227	DB	'0,0,0,m', 00H
$SG2228	DB	'm,!f,!*r,*0', 00H
$SG2229	DB	00H
	ORG $+3
$SG2230	DB	00H
	ORG $+3
$SG2231	DB	00H
	ORG $+3
$SG2232	DB	00H
	ORG $+3
$SG2233	DB	00H
	ORG $+3
$SG2234	DB	00H
	ORG $+3
$SG2235	DB	00H
	ORG $+3
$SG2236	DB	00H
	ORG $+3
$SG2237	DB	'=a', 00H
	ORG $+1
$SG2238	DB	'0', 00H
	ORG $+2
$SG2239	DB	'rm', 00H
	ORG $+1
$SG2240	DB	'=&d', 00H
$SG2241	DB	'=a', 00H
	ORG $+1
$SG2242	DB	'0', 00H
	ORG $+2
$SG2243	DB	'rm', 00H
	ORG $+1
$SG2244	DB	'=&d', 00H
$SG2245	DB	'=rm,r', 00H
	ORG $+2
$SG2246	DB	'%0,0', 00H
	ORG $+3
$SG2247	DB	'ri,rm', 00H
	ORG $+2
$SG2248	DB	'=rm,r', 00H
	ORG $+2
$SG2249	DB	'%0,0', 00H
	ORG $+3
$SG2250	DB	'ri,rm', 00H
	ORG $+2
$SG2251	DB	'=m,q', 00H
	ORG $+3
$SG2252	DB	'%0,0', 00H
	ORG $+3
$SG2253	DB	'qn,qmn', 00H
	ORG $+1
$SG2254	DB	'=rm,r', 00H
	ORG $+2
$SG2255	DB	'%0,0', 00H
	ORG $+3
$SG2256	DB	'ri,rm', 00H
	ORG $+2
$SG2257	DB	'=rm,r', 00H
	ORG $+2
$SG2258	DB	'%0,0', 00H
	ORG $+3
$SG2259	DB	'ri,rm', 00H
	ORG $+2
$SG2260	DB	'=m,q', 00H
	ORG $+3
$SG2261	DB	'%0,0', 00H
	ORG $+3
$SG2262	DB	'qn,qmn', 00H
	ORG $+1
$SG2263	DB	'=rm,r', 00H
	ORG $+2
$SG2264	DB	'%0,0', 00H
	ORG $+3
$SG2265	DB	'ri,rm', 00H
	ORG $+2
$SG2266	DB	'=rm,r', 00H
	ORG $+2
$SG2267	DB	'%0,0', 00H
	ORG $+3
$SG2268	DB	'ri,rm', 00H
	ORG $+2
$SG2269	DB	'=qm', 00H
$SG2270	DB	'%0', 00H
	ORG $+1
$SG2271	DB	'qn', 00H
	ORG $+1
$SG2272	DB	'=rm', 00H
$SG2273	DB	'0', 00H
	ORG $+2
$SG2274	DB	'=rm', 00H
$SG2275	DB	'0', 00H
	ORG $+2
$SG2276	DB	'=qm', 00H
$SG2277	DB	'0', 00H
	ORG $+2
$SG2278	DB	'=f,!m', 00H
	ORG $+2
$SG2279	DB	'0,0', 00H
$SG2280	DB	'=f,!m', 00H
	ORG $+2
$SG2281	DB	'0,0', 00H
$SG2282	DB	'=f,!m', 00H
	ORG $+2
$SG2283	DB	'0,0', 00H
$SG2284	DB	'=f,!m', 00H
	ORG $+2
$SG2285	DB	'0,0', 00H
$SG2286	DB	'=rm', 00H
$SG2287	DB	'0', 00H
	ORG $+2
$SG2288	DB	'=rm', 00H
$SG2289	DB	'0', 00H
	ORG $+2
$SG2290	DB	'=qm', 00H
$SG2291	DB	'0', 00H
	ORG $+2
$SG2292	DB	'=rm', 00H
$SG2293	DB	'0', 00H
	ORG $+2
$SG2294	DB	'cI', 00H
	ORG $+1
$SG2295	DB	'=rm', 00H
$SG2296	DB	'0', 00H
	ORG $+2
$SG2297	DB	'cI', 00H
	ORG $+1
$SG2298	DB	'=qm', 00H
$SG2299	DB	'0', 00H
	ORG $+2
$SG2300	DB	'cI', 00H
	ORG $+1
$SG2301	DB	'=rm', 00H
$SG2302	DB	'0', 00H
	ORG $+2
$SG2303	DB	'cI', 00H
	ORG $+1
$SG2304	DB	'=rm', 00H
$SG2305	DB	'0', 00H
	ORG $+2
$SG2306	DB	'cI', 00H
	ORG $+1
$SG2307	DB	'=qm', 00H
$SG2308	DB	'0', 00H
	ORG $+2
$SG2309	DB	'cI', 00H
	ORG $+1
$SG2310	DB	'=rm', 00H
$SG2311	DB	'0', 00H
	ORG $+2
$SG2312	DB	'cI', 00H
	ORG $+1
$SG2313	DB	'=rm', 00H
$SG2314	DB	'0', 00H
	ORG $+2
$SG2315	DB	'cI', 00H
	ORG $+1
$SG2316	DB	'=qm', 00H
$SG2317	DB	'0', 00H
	ORG $+2
$SG2318	DB	'cI', 00H
	ORG $+1
$SG2319	DB	'=rm', 00H
$SG2320	DB	'0', 00H
	ORG $+2
$SG2321	DB	'cI', 00H
	ORG $+1
$SG2322	DB	'=rm', 00H
$SG2323	DB	'0', 00H
	ORG $+2
$SG2324	DB	'cI', 00H
	ORG $+1
$SG2325	DB	'=qm', 00H
$SG2326	DB	'0', 00H
	ORG $+2
$SG2327	DB	'cI', 00H
	ORG $+1
$SG2328	DB	'=rm', 00H
$SG2329	DB	'0', 00H
	ORG $+2
$SG2330	DB	'cI', 00H
	ORG $+1
$SG2331	DB	'=rm', 00H
$SG2332	DB	'0', 00H
	ORG $+2
$SG2333	DB	'cI', 00H
	ORG $+1
$SG2334	DB	'=qm', 00H
$SG2335	DB	'0', 00H
	ORG $+2
$SG2336	DB	'cI', 00H
	ORG $+1
$SG2337	DB	'=rm', 00H
$SG2338	DB	'0', 00H
	ORG $+2
$SG2339	DB	'cI', 00H
	ORG $+1
$SG2340	DB	'=rm', 00H
$SG2341	DB	'0', 00H
	ORG $+2
$SG2342	DB	'cI', 00H
	ORG $+1
$SG2343	DB	'=qm', 00H
$SG2344	DB	'0', 00H
	ORG $+2
$SG2345	DB	'cI', 00H
	ORG $+1
$SG2346	DB	'=q', 00H
	ORG $+1
$SG2347	DB	'=q', 00H
	ORG $+1
$SG2348	DB	'=q', 00H
	ORG $+1
$SG2349	DB	'=q', 00H
	ORG $+1
$SG2350	DB	'=q', 00H
	ORG $+1
$SG2351	DB	'=q', 00H
	ORG $+1
$SG2352	DB	'=q', 00H
	ORG $+1
$SG2353	DB	'=q', 00H
	ORG $+1
$SG2354	DB	'=q', 00H
	ORG $+1
$SG2355	DB	'=q', 00H
	ORG $+1
$SG2356	DB	'rm', 00H
	ORG $+1
$SG2357	DB	'm', 00H
	ORG $+2
$SG2358	DB	'g', 00H
	ORG $+2
$SG2359	DB	'=rf', 00H
$SG2360	DB	'm', 00H
	ORG $+2
$SG2361	DB	'g', 00H
_DATA	ENDS
CONST	SEGMENT
_insn_operand_constraint DD FLAT:$SG2088
	ORG $+24
	DD	FLAT:$SG2089
	ORG $+24
	DD	FLAT:$SG2090
	ORG $+24
	DD	FLAT:$SG2091
	ORG $+24
	DD	FLAT:$SG2092
	ORG $+24
	DD	FLAT:$SG2093
	DD	FLAT:$SG2094
	ORG $+20
	DD	FLAT:$SG2095
	DD	FLAT:$SG2096
	ORG $+20
	DD	FLAT:$SG2097
	DD	FLAT:$SG2098
	ORG $+20
	DD	FLAT:$SG2099
	DD	FLAT:$SG2100
	ORG $+20
	DD	FLAT:$SG2101
	DD	FLAT:$SG2102
	ORG $+20
	DD	FLAT:$SG2103
	DD	FLAT:$SG2104
	ORG $+20
	DD	FLAT:$SG2105
	DD	FLAT:$SG2106
	ORG $+20
	DD	FLAT:$SG2107
	DD	FLAT:$SG2108
	ORG $+20
	DD	FLAT:$SG2109
	DD	FLAT:$SG2110
	ORG $+20
	DD	FLAT:$SG2111
	DD	FLAT:$SG2112
	ORG $+20
	DD	FLAT:$SG2113
	DD	FLAT:$SG2114
	ORG $+20
	DD	FLAT:$SG2115
	DD	FLAT:$SG2116
	ORG $+20
	DD	FLAT:$SG2117
	DD	FLAT:$SG2118
	ORG $+20
	DD	FLAT:$SG2119
	DD	FLAT:$SG2120
	ORG $+20
	DD	FLAT:$SG2121
	DD	FLAT:$SG2122
	ORG $+20
	DD	FLAT:$SG2123
	DD	FLAT:$SG2124
	ORG $+20
	DD	FLAT:$SG2125
	DD	FLAT:$SG2126
	ORG $+20
	DD	FLAT:$SG2127
	DD	FLAT:$SG2128
	ORG $+20
	DD	FLAT:$SG2129
	DD	FLAT:$SG2130
	ORG $+20
	DD	FLAT:$SG2131
	DD	FLAT:$SG2132
	ORG $+20
	DD	FLAT:$SG2133
	DD	FLAT:$SG2134
	ORG $+20
	DD	FLAT:$SG2135
	DD	FLAT:$SG2136
	ORG $+20
	DD	FLAT:$SG2137
	DD	FLAT:$SG2138
	ORG $+20
	DD	FLAT:$SG2139
	DD	FLAT:$SG2140
	ORG $+20
	DD	FLAT:$SG2141
	DD	FLAT:$SG2142
	ORG $+20
	DD	FLAT:$SG2143
	DD	FLAT:$SG2144
	ORG $+20
	DD	FLAT:$SG2145
	DD	FLAT:$SG2146
	ORG $+20
	DD	FLAT:$SG2147
	DD	FLAT:$SG2148
	ORG $+20
	DD	FLAT:$SG2149
	DD	FLAT:$SG2150
	ORG $+20
	DD	FLAT:$SG2151
	DD	FLAT:$SG2152
	ORG $+20
	DD	FLAT:$SG2153
	DD	FLAT:$SG2154
	ORG $+20
	DD	FLAT:$SG2155
	DD	FLAT:$SG2156
	ORG $+20
	DD	FLAT:$SG2157
	DD	FLAT:$SG2158
	ORG $+20
	DD	FLAT:$SG2159
	DD	FLAT:$SG2160
	ORG $+20
	DD	FLAT:$SG2161
	DD	FLAT:$SG2162
	ORG $+20
	DD	FLAT:$SG2163
	DD	FLAT:$SG2164
	ORG $+20
	DD	FLAT:$SG2165
	DD	FLAT:$SG2166
	ORG $+20
	DD	FLAT:$SG2167
	DD	FLAT:$SG2168
	DD	FLAT:$SG2169
	ORG $+16
	DD	FLAT:$SG2170
	DD	FLAT:$SG2171
	ORG $+20
	DD	FLAT:$SG2172
	DD	FLAT:$SG2173
	DD	FLAT:$SG2174
	ORG $+16
	DD	FLAT:$SG2175
	DD	FLAT:$SG2176
	ORG $+20
	DD	FLAT:$SG2177
	DD	FLAT:$SG2178
	DD	FLAT:$SG2179
	ORG $+16
	DD	FLAT:$SG2180
	DD	FLAT:$SG2181
	DD	FLAT:$SG2182
	ORG $+16
	DD	FLAT:$SG2183
	DD	FLAT:$SG2184
	DD	FLAT:$SG2185
	ORG $+16
	DD	FLAT:$SG2186
	DD	FLAT:$SG2187
	DD	FLAT:$SG2188
	ORG $+16
	DD	FLAT:$SG2189
	DD	FLAT:$SG2190
	ORG $+20
	DD	FLAT:$SG2191
	DD	FLAT:$SG2192
	DD	FLAT:$SG2193
	ORG $+16
	DD	FLAT:$SG2194
	DD	FLAT:$SG2195
	ORG $+20
	DD	FLAT:$SG2196
	DD	FLAT:$SG2197
	DD	FLAT:$SG2198
	ORG $+16
	DD	FLAT:$SG2199
	DD	FLAT:$SG2200
	DD	FLAT:$SG2201
	ORG $+16
	DD	FLAT:$SG2202
	DD	FLAT:$SG2203
	DD	FLAT:$SG2204
	ORG $+16
	DD	FLAT:$SG2205
	DD	FLAT:$SG2206
	DD	FLAT:$SG2207
	ORG $+16
	DD	FLAT:$SG2208
	DD	FLAT:$SG2209
	DD	FLAT:$SG2210
	ORG $+16
	DD	FLAT:$SG2211
	DD	FLAT:$SG2212
	DD	FLAT:$SG2213
	ORG $+16
	DD	FLAT:$SG2214
	DD	FLAT:$SG2215
	DD	FLAT:$SG2216
	ORG $+16
	DD	FLAT:$SG2217
	DD	FLAT:$SG2218
	DD	FLAT:$SG2219
	ORG $+16
	DD	FLAT:$SG2220
	DD	FLAT:$SG2221
	DD	FLAT:$SG2222
	ORG $+16
	DD	FLAT:$SG2223
	DD	FLAT:$SG2224
	DD	FLAT:$SG2225
	ORG $+16
	DD	FLAT:$SG2226
	DD	FLAT:$SG2227
	DD	FLAT:$SG2228
	ORG $+16
	DD	FLAT:$SG2229
	DD	FLAT:$SG2230
	DD	FLAT:$SG2231
	DD	FLAT:$SG2232
	ORG $+12
	DD	FLAT:$SG2233
	DD	FLAT:$SG2234
	DD	FLAT:$SG2235
	DD	FLAT:$SG2236
	ORG $+12
	DD	FLAT:$SG2237
	DD	FLAT:$SG2238
	DD	FLAT:$SG2239
	DD	FLAT:$SG2240
	ORG $+12
	DD	FLAT:$SG2241
	DD	FLAT:$SG2242
	DD	FLAT:$SG2243
	DD	FLAT:$SG2244
	ORG $+12
	DD	FLAT:$SG2245
	DD	FLAT:$SG2246
	DD	FLAT:$SG2247
	ORG $+16
	DD	FLAT:$SG2248
	DD	FLAT:$SG2249
	DD	FLAT:$SG2250
	ORG $+16
	DD	FLAT:$SG2251
	DD	FLAT:$SG2252
	DD	FLAT:$SG2253
	ORG $+16
	DD	FLAT:$SG2254
	DD	FLAT:$SG2255
	DD	FLAT:$SG2256
	ORG $+16
	DD	FLAT:$SG2257
	DD	FLAT:$SG2258
	DD	FLAT:$SG2259
	ORG $+16
	DD	FLAT:$SG2260
	DD	FLAT:$SG2261
	DD	FLAT:$SG2262
	ORG $+16
	DD	FLAT:$SG2263
	DD	FLAT:$SG2264
	DD	FLAT:$SG2265
	ORG $+16
	DD	FLAT:$SG2266
	DD	FLAT:$SG2267
	DD	FLAT:$SG2268
	ORG $+16
	DD	FLAT:$SG2269
	DD	FLAT:$SG2270
	DD	FLAT:$SG2271
	ORG $+16
	DD	FLAT:$SG2272
	DD	FLAT:$SG2273
	ORG $+20
	DD	FLAT:$SG2274
	DD	FLAT:$SG2275
	ORG $+20
	DD	FLAT:$SG2276
	DD	FLAT:$SG2277
	ORG $+20
	DD	FLAT:$SG2278
	DD	FLAT:$SG2279
	ORG $+20
	DD	FLAT:$SG2280
	DD	FLAT:$SG2281
	ORG $+20
	DD	FLAT:$SG2282
	DD	FLAT:$SG2283
	ORG $+20
	DD	FLAT:$SG2284
	DD	FLAT:$SG2285
	ORG $+20
	DD	FLAT:$SG2286
	DD	FLAT:$SG2287
	ORG $+20
	DD	FLAT:$SG2288
	DD	FLAT:$SG2289
	ORG $+20
	DD	FLAT:$SG2290
	DD	FLAT:$SG2291
	ORG $+20
	DD	FLAT:$SG2292
	DD	FLAT:$SG2293
	DD	FLAT:$SG2294
	ORG $+16
	DD	FLAT:$SG2295
	DD	FLAT:$SG2296
	DD	FLAT:$SG2297
	ORG $+16
	DD	FLAT:$SG2298
	DD	FLAT:$SG2299
	DD	FLAT:$SG2300
	ORG $+16
	DD	FLAT:$SG2301
	DD	FLAT:$SG2302
	DD	FLAT:$SG2303
	ORG $+16
	DD	FLAT:$SG2304
	DD	FLAT:$SG2305
	DD	FLAT:$SG2306
	ORG $+16
	DD	FLAT:$SG2307
	DD	FLAT:$SG2308
	DD	FLAT:$SG2309
	ORG $+16
	DD	FLAT:$SG2310
	DD	FLAT:$SG2311
	DD	FLAT:$SG2312
	ORG $+16
	DD	FLAT:$SG2313
	DD	FLAT:$SG2314
	DD	FLAT:$SG2315
	ORG $+16
	DD	FLAT:$SG2316
	DD	FLAT:$SG2317
	DD	FLAT:$SG2318
	ORG $+16
	DD	FLAT:$SG2319
	DD	FLAT:$SG2320
	DD	FLAT:$SG2321
	ORG $+16
	DD	FLAT:$SG2322
	DD	FLAT:$SG2323
	DD	FLAT:$SG2324
	ORG $+16
	DD	FLAT:$SG2325
	DD	FLAT:$SG2326
	DD	FLAT:$SG2327
	ORG $+16
	DD	FLAT:$SG2328
	DD	FLAT:$SG2329
	DD	FLAT:$SG2330
	ORG $+16
	DD	FLAT:$SG2331
	DD	FLAT:$SG2332
	DD	FLAT:$SG2333
	ORG $+16
	DD	FLAT:$SG2334
	DD	FLAT:$SG2335
	DD	FLAT:$SG2336
	ORG $+16
	DD	FLAT:$SG2337
	DD	FLAT:$SG2338
	DD	FLAT:$SG2339
	ORG $+16
	DD	FLAT:$SG2340
	DD	FLAT:$SG2341
	DD	FLAT:$SG2342
	ORG $+16
	DD	FLAT:$SG2343
	DD	FLAT:$SG2344
	DD	FLAT:$SG2345
	ORG $+16
	DD	FLAT:$SG2346
	ORG $+24
	DD	FLAT:$SG2347
	ORG $+24
	DD	FLAT:$SG2348
	ORG $+24
	DD	FLAT:$SG2349
	ORG $+24
	DD	FLAT:$SG2350
	ORG $+24
	DD	FLAT:$SG2351
	ORG $+24
	DD	FLAT:$SG2352
	ORG $+24
	DD	FLAT:$SG2353
	ORG $+24
	DD	FLAT:$SG2354
	ORG $+24
	DD	FLAT:$SG2355
	ORG $+24
	DD	00H
	ORG $+24
	DD	00H
	ORG $+24
	DD	00H
	ORG $+24
	DD	00H
	ORG $+24
	DD	00H
	ORG $+24
	DD	00H
	ORG $+24
	DD	00H
	ORG $+24
	DD	00H
	ORG $+24
	DD	00H
	ORG $+24
	DD	00H
	ORG $+24
	DD	00H
	ORG $+24
	DD	00H
	ORG $+24
	DD	00H
	ORG $+24
	DD	00H
	ORG $+24
	DD	00H
	ORG $+24
	DD	00H
	ORG $+24
	DD	00H
	ORG $+24
	DD	00H
	ORG $+24
	DD	00H
	ORG $+24
	DD	00H
	ORG $+24
	DD	00H
	ORG $+24
	DD	00H
	ORG $+24
	DD	00H
	ORG $+24
	DD	FLAT:$SG2356
	ORG $+24
	DD	FLAT:$SG2357
	DD	FLAT:$SG2358
	ORG $+20
	DD	FLAT:$SG2359
	DD	FLAT:$SG2360
	DD	FLAT:$SG2361
	ORG $+16
	DD	00H
	ORG $+24
CONST	ENDS
_DATA	SEGMENT
	ORG $+2
_insn_operand_mode DD 04H
	ORG $+24
	DD	02H
	ORG $+24
	DD	01H
	ORG $+24
	DD	0aH
	ORG $+24
	DD	0bH
	ORG $+24
	DD	04H
	DD	04H
	ORG $+20
	DD	02H
	DD	02H
	ORG $+20
	DD	01H
	DD	01H
	ORG $+20
	DD	0bH
	DD	0bH
	ORG $+20
	DD	0aH
	DD	0aH
	ORG $+20
	DD	04H
	DD	04H
	ORG $+20
	DD	02H
	DD	02H
	ORG $+20
	DD	01H
	DD	01H
	ORG $+20
	DD	04H
	DD	04H
	ORG $+20
	DD	04H
	DD	04H
	ORG $+20
	DD	02H
	DD	02H
	ORG $+20
	DD	02H
	DD	02H
	ORG $+20
	DD	01H
	DD	01H
	ORG $+20
	DD	01H
	DD	01H
	ORG $+20
	DD	0aH
	DD	0aH
	ORG $+20
	DD	0aH
	DD	0aH
	ORG $+20
	DD	0bH
	DD	0bH
	ORG $+20
	DD	0bH
	DD	0bH
	ORG $+20
	DD	06H
	DD	06H
	ORG $+20
	DD	06H
	DD	06H
	ORG $+20
	DD	04H
	DD	04H
	ORG $+20
	DD	04H
	DD	04H
	ORG $+20
	DD	04H
	DD	04H
	ORG $+20
	DD	04H
	DD	01H
	ORG $+20
	DD	01H
	DD	04H
	ORG $+20
	DD	01H
	DD	02H
	ORG $+20
	DD	02H
	DD	04H
	ORG $+20
	DD	04H
	DD	02H
	ORG $+20
	DD	02H
	DD	01H
	ORG $+20
	DD	04H
	DD	01H
	ORG $+20
	DD	04H
	DD	02H
	ORG $+20
	DD	02H
	DD	01H
	ORG $+20
	DD	04H
	DD	01H
	ORG $+20
	DD	0bH
	DD	0aH
	ORG $+20
	DD	0aH
	DD	0bH
	ORG $+20
	DD	0aH
	DD	04H
	ORG $+20
	DD	0bH
	DD	04H
	ORG $+20
	DD	04H
	DD	04H
	DD	04H
	ORG $+16
	DD	02H
	DD	02H
	ORG $+20
	DD	02H
	DD	02H
	DD	02H
	ORG $+16
	DD	01H
	DD	01H
	ORG $+20
	DD	01H
	DD	01H
	DD	01H
	ORG $+16
	DD	0bH
	DD	0bH
	DD	0bH
	ORG $+16
	DD	0aH
	DD	0aH
	DD	0aH
	ORG $+16
	DD	04H
	DD	04H
	DD	04H
	ORG $+16
	DD	02H
	DD	02H
	ORG $+20
	DD	02H
	DD	02H
	DD	02H
	ORG $+16
	DD	01H
	DD	01H
	ORG $+20
	DD	01H
	DD	01H
	DD	01H
	ORG $+16
	DD	0bH
	DD	0bH
	DD	0bH
	ORG $+16
	DD	0aH
	DD	0aH
	DD	0aH
	ORG $+16
	DD	02H
	DD	02H
	DD	02H
	ORG $+16
	DD	04H
	DD	04H
	DD	04H
	ORG $+16
	DD	02H
	DD	02H
	DD	02H
	ORG $+16
	DD	04H
	DD	04H
	DD	04H
	ORG $+16
	DD	0bH
	DD	0bH
	DD	0bH
	ORG $+16
	DD	0aH
	DD	0aH
	DD	0aH
	ORG $+16
	DD	0bH
	DD	0bH
	DD	0bH
	ORG $+16
	DD	0aH
	DD	0aH
	DD	0aH
	ORG $+16
	DD	04H
	DD	04H
	DD	04H
	DD	04H
	ORG $+12
	DD	04H
	DD	04H
	DD	04H
	DD	04H
	ORG $+12
	DD	04H
	DD	04H
	DD	04H
	DD	04H
	ORG $+12
	DD	04H
	DD	04H
	DD	04H
	DD	04H
	ORG $+12
	DD	04H
	DD	04H
	DD	04H
	ORG $+16
	DD	02H
	DD	02H
	DD	02H
	ORG $+16
	DD	01H
	DD	01H
	DD	01H
	ORG $+16
	DD	04H
	DD	04H
	DD	04H
	ORG $+16
	DD	02H
	DD	02H
	DD	02H
	ORG $+16
	DD	01H
	DD	01H
	DD	01H
	ORG $+16
	DD	04H
	DD	04H
	DD	04H
	ORG $+16
	DD	02H
	DD	02H
	DD	02H
	ORG $+16
	DD	01H
	DD	01H
	DD	01H
	ORG $+16
	DD	04H
	DD	04H
	ORG $+20
	DD	02H
	DD	02H
	ORG $+20
	DD	01H
	DD	01H
	ORG $+20
	DD	0aH
	DD	0aH
	ORG $+20
	DD	0bH
	DD	0bH
	ORG $+20
	DD	0aH
	DD	0aH
	ORG $+20
	DD	0bH
	DD	0bH
	ORG $+20
	DD	04H
	DD	04H
	ORG $+20
	DD	02H
	DD	02H
	ORG $+20
	DD	01H
	DD	01H
	ORG $+20
	DD	04H
	DD	04H
	DD	04H
	ORG $+16
	DD	02H
	DD	02H
	DD	02H
	ORG $+16
	DD	01H
	DD	01H
	DD	01H
	ORG $+16
	DD	04H
	DD	04H
	DD	04H
	ORG $+16
	DD	02H
	DD	02H
	DD	02H
	ORG $+16
	DD	01H
	DD	01H
	DD	01H
	ORG $+16
	DD	04H
	DD	04H
	DD	04H
	ORG $+16
	DD	02H
	DD	02H
	DD	02H
	ORG $+16
	DD	01H
	DD	01H
	DD	01H
	ORG $+16
	DD	04H
	DD	04H
	DD	04H
	ORG $+16
	DD	02H
	DD	02H
	DD	02H
	ORG $+16
	DD	01H
	DD	01H
	DD	01H
	ORG $+16
	DD	04H
	DD	04H
	DD	04H
	ORG $+16
	DD	02H
	DD	02H
	DD	02H
	ORG $+16
	DD	01H
	DD	01H
	DD	01H
	ORG $+16
	DD	04H
	DD	04H
	DD	04H
	ORG $+16
	DD	02H
	DD	02H
	DD	02H
	ORG $+16
	DD	01H
	DD	01H
	DD	01H
	ORG $+16
	DD	01H
	ORG $+24
	DD	01H
	ORG $+24
	DD	01H
	ORG $+24
	DD	01H
	ORG $+24
	DD	01H
	ORG $+24
	DD	01H
	ORG $+24
	DD	01H
	ORG $+24
	DD	01H
	ORG $+24
	DD	01H
	ORG $+24
	DD	01H
	ORG $+24
	DD	00H
	ORG $+24
	DD	00H
	ORG $+24
	DD	00H
	ORG $+24
	DD	00H
	ORG $+24
	DD	00H
	ORG $+24
	DD	00H
	ORG $+24
	DD	00H
	ORG $+24
	DD	00H
	ORG $+24
	DD	00H
	ORG $+24
	DD	00H
	ORG $+24
	DD	00H
	ORG $+24
	DD	00H
	ORG $+24
	DD	00H
	ORG $+24
	DD	00H
	ORG $+24
	DD	00H
	ORG $+24
	DD	00H
	ORG $+24
	DD	00H
	ORG $+24
	DD	00H
	ORG $+24
	DD	00H
	ORG $+24
	DD	00H
	ORG $+24
	DD	00H
	ORG $+24
	DD	00H
	ORG $+24
	DD	00H
	ORG $+24
	DD	04H
	ORG $+24
	DD	01H
	DD	04H
	ORG $+20
	DD	00H
	DD	01H
	DD	04H
	ORG $+16
	DD	00H
	ORG $+24
_insn_operand_strict_low DB 00H
	ORG $+6
	DB	00H
	ORG $+6
	DB	00H
	ORG $+6
	DB	00H
	ORG $+6
	DB	00H
	ORG $+6
	DB	00H
	DB	00H
	ORG $+5
	DB	00H
	DB	00H
	ORG $+5
	DB	00H
	DB	00H
	ORG $+5
	DB	00H
	DB	00H
	ORG $+5
	DB	00H
	DB	00H
	ORG $+5
	DB	00H
	DB	00H
	ORG $+5
	DB	00H
	DB	00H
	ORG $+5
	DB	00H
	DB	00H
	ORG $+5
	DB	00H
	DB	00H
	ORG $+5
	DB	00H
	DB	00H
	ORG $+5
	DB	00H
	DB	00H
	ORG $+5
	DB	00H
	DB	00H
	ORG $+5
	DB	00H
	DB	00H
	ORG $+5
	DB	00H
	DB	00H
	ORG $+5
	DB	00H
	DB	00H
	ORG $+5
	DB	00H
	DB	00H
	ORG $+5
	DB	00H
	DB	00H
	ORG $+5
	DB	00H
	DB	00H
	ORG $+5
	DB	00H
	DB	00H
	ORG $+5
	DB	00H
	DB	00H
	ORG $+5
	DB	00H
	DB	00H
	ORG $+5
	DB	00H
	DB	00H
	ORG $+5
	DB	00H
	DB	00H
	ORG $+5
	DB	00H
	DB	00H
	ORG $+5
	DB	00H
	DB	00H
	ORG $+5
	DB	00H
	DB	00H
	ORG $+5
	DB	00H
	DB	00H
	ORG $+5
	DB	00H
	DB	00H
	ORG $+5
	DB	00H
	DB	00H
	ORG $+5
	DB	00H
	DB	00H
	ORG $+5
	DB	00H
	DB	00H
	ORG $+5
	DB	00H
	DB	00H
	ORG $+5
	DB	00H
	DB	00H
	ORG $+5
	DB	00H
	DB	00H
	ORG $+5
	DB	00H
	DB	00H
	ORG $+5
	DB	00H
	DB	00H
	ORG $+5
	DB	00H
	DB	00H
	ORG $+5
	DB	00H
	DB	00H
	DB	00H
	ORG $+4
	DB	00H
	DB	00H
	ORG $+5
	DB	00H
	DB	00H
	DB	00H
	ORG $+4
	DB	00H
	DB	00H
	ORG $+5
	DB	00H
	DB	00H
	DB	00H
	ORG $+4
	DB	00H
	DB	00H
	DB	00H
	ORG $+4
	DB	00H
	DB	00H
	DB	00H
	ORG $+4
	DB	00H
	DB	00H
	DB	00H
	ORG $+4
	DB	00H
	DB	00H
	ORG $+5
	DB	00H
	DB	00H
	DB	00H
	ORG $+4
	DB	00H
	DB	00H
	ORG $+5
	DB	00H
	DB	00H
	DB	00H
	ORG $+4
	DB	00H
	DB	00H
	DB	00H
	ORG $+4
	DB	00H
	DB	00H
	DB	00H
	ORG $+4
	DB	00H
	DB	00H
	DB	00H
	ORG $+4
	DB	00H
	DB	00H
	DB	00H
	ORG $+4
	DB	00H
	DB	00H
	DB	00H
	ORG $+4
	DB	00H
	DB	00H
	DB	00H
	ORG $+4
	DB	00H
	DB	00H
	DB	00H
	ORG $+4
	DB	00H
	DB	00H
	DB	00H
	ORG $+4
	DB	00H
	DB	00H
	DB	00H
	ORG $+4
	DB	00H
	DB	00H
	DB	00H
	ORG $+4
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	ORG $+3
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	ORG $+3
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	ORG $+3
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	ORG $+3
	DB	00H
	DB	00H
	DB	00H
	ORG $+4
	DB	00H
	DB	00H
	DB	00H
	ORG $+4
	DB	00H
	DB	00H
	DB	00H
	ORG $+4
	DB	00H
	DB	00H
	DB	00H
	ORG $+4
	DB	00H
	DB	00H
	DB	00H
	ORG $+4
	DB	00H
	DB	00H
	DB	00H
	ORG $+4
	DB	00H
	DB	00H
	DB	00H
	ORG $+4
	DB	00H
	DB	00H
	DB	00H
	ORG $+4
	DB	00H
	DB	00H
	DB	00H
	ORG $+4
	DB	00H
	DB	00H
	ORG $+5
	DB	00H
	DB	00H
	ORG $+5
	DB	00H
	DB	00H
	ORG $+5
	DB	00H
	DB	00H
	ORG $+5
	DB	00H
	DB	00H
	ORG $+5
	DB	00H
	DB	00H
	ORG $+5
	DB	00H
	DB	00H
	ORG $+5
	DB	00H
	DB	00H
	ORG $+5
	DB	00H
	DB	00H
	ORG $+5
	DB	00H
	DB	00H
	ORG $+5
	DB	00H
	DB	00H
	DB	00H
	ORG $+4
	DB	00H
	DB	00H
	DB	00H
	ORG $+4
	DB	00H
	DB	00H
	DB	00H
	ORG $+4
	DB	00H
	DB	00H
	DB	00H
	ORG $+4
	DB	00H
	DB	00H
	DB	00H
	ORG $+4
	DB	00H
	DB	00H
	DB	00H
	ORG $+4
	DB	00H
	DB	00H
	DB	00H
	ORG $+4
	DB	00H
	DB	00H
	DB	00H
	ORG $+4
	DB	00H
	DB	00H
	DB	00H
	ORG $+4
	DB	00H
	DB	00H
	DB	00H
	ORG $+4
	DB	00H
	DB	00H
	DB	00H
	ORG $+4
	DB	00H
	DB	00H
	DB	00H
	ORG $+4
	DB	00H
	DB	00H
	DB	00H
	ORG $+4
	DB	00H
	DB	00H
	DB	00H
	ORG $+4
	DB	00H
	DB	00H
	DB	00H
	ORG $+4
	DB	00H
	DB	00H
	DB	00H
	ORG $+4
	DB	00H
	DB	00H
	DB	00H
	ORG $+4
	DB	00H
	DB	00H
	DB	00H
	ORG $+4
	DB	00H
	ORG $+6
	DB	00H
	ORG $+6
	DB	00H
	ORG $+6
	DB	00H
	ORG $+6
	DB	00H
	ORG $+6
	DB	00H
	ORG $+6
	DB	00H
	ORG $+6
	DB	00H
	ORG $+6
	DB	00H
	ORG $+6
	DB	00H
	ORG $+6
	DB	00H
	ORG $+6
	DB	00H
	ORG $+6
	DB	00H
	ORG $+6
	DB	00H
	ORG $+6
	DB	00H
	ORG $+6
	DB	00H
	ORG $+6
	DB	00H
	ORG $+6
	DB	00H
	ORG $+6
	DB	00H
	ORG $+6
	DB	00H
	ORG $+6
	DB	00H
	ORG $+6
	DB	00H
	ORG $+6
	DB	00H
	ORG $+6
	DB	00H
	ORG $+6
	DB	00H
	ORG $+6
	DB	00H
	ORG $+6
	DB	00H
	ORG $+6
	DB	00H
	ORG $+6
	DB	00H
	ORG $+6
	DB	00H
	ORG $+6
	DB	00H
	ORG $+6
	DB	00H
	ORG $+6
	DB	00H
	ORG $+6
	DB	00H
	ORG $+6
	DB	00H
	DB	00H
	ORG $+5
	DB	00H
	DB	00H
	DB	00H
	ORG $+4
	DB	00H
	ORG $+6
_DATA	ENDS
CONST	SEGMENT
_insn_operand_predicate DD FLAT:_general_operand
	ORG $+24
	DD	FLAT:_general_operand
	ORG $+24
	DD	FLAT:_general_operand
	ORG $+24
	DD	FLAT:_general_operand
	ORG $+24
	DD	FLAT:_general_operand
	ORG $+24
	DD	FLAT:_general_operand
	DD	FLAT:_general_operand
	ORG $+20
	DD	FLAT:_general_operand
	DD	FLAT:_general_operand
	ORG $+20
	DD	FLAT:_general_operand
	DD	FLAT:_general_operand
	ORG $+20
	DD	FLAT:_general_operand
	DD	FLAT:_general_operand
	ORG $+20
	DD	FLAT:_general_operand
	DD	FLAT:_general_operand
	ORG $+20
	DD	FLAT:_general_operand
	DD	FLAT:_general_operand
	ORG $+20
	DD	FLAT:_general_operand
	DD	FLAT:_general_operand
	ORG $+20
	DD	FLAT:_general_operand
	DD	FLAT:_general_operand
	ORG $+20
	DD	FLAT:_push_operand
	DD	FLAT:_general_operand
	ORG $+20
	DD	FLAT:_general_operand
	DD	FLAT:_general_operand
	ORG $+20
	DD	FLAT:_push_operand
	DD	FLAT:_general_operand
	ORG $+20
	DD	FLAT:_general_operand
	DD	FLAT:_general_operand
	ORG $+20
	DD	FLAT:_push_operand
	DD	FLAT:_general_operand
	ORG $+20
	DD	FLAT:_general_operand
	DD	FLAT:_general_operand
	ORG $+20
	DD	FLAT:_push_operand
	DD	FLAT:_general_operand
	ORG $+20
	DD	FLAT:_general_operand
	DD	FLAT:_general_operand
	ORG $+20
	DD	FLAT:_push_operand
	DD	FLAT:_general_operand
	ORG $+20
	DD	FLAT:_general_operand
	DD	FLAT:_general_operand
	ORG $+20
	DD	FLAT:_push_operand
	DD	FLAT:_general_operand
	ORG $+20
	DD	FLAT:_general_operand
	DD	FLAT:_general_operand
	ORG $+20
	DD	FLAT:_general_operand
	DD	FLAT:_general_operand
	ORG $+20
	DD	FLAT:_general_operand
	DD	FLAT:_general_operand
	ORG $+20
	DD	FLAT:_general_operand
	DD	FLAT:_general_operand
	ORG $+20
	DD	FLAT:_register_operand
	DD	FLAT:_address_operand
	ORG $+20
	DD	FLAT:_general_operand
	DD	FLAT:_general_operand
	ORG $+20
	DD	FLAT:_general_operand
	DD	FLAT:_general_operand
	ORG $+20
	DD	FLAT:_general_operand
	DD	FLAT:_general_operand
	ORG $+20
	DD	FLAT:_general_operand
	DD	FLAT:_general_operand
	ORG $+20
	DD	FLAT:_general_operand
	DD	FLAT:_general_operand
	ORG $+20
	DD	FLAT:_general_operand
	DD	FLAT:_general_operand
	ORG $+20
	DD	FLAT:_general_operand
	DD	FLAT:_general_operand
	ORG $+20
	DD	FLAT:_general_operand
	DD	FLAT:_general_operand
	ORG $+20
	DD	FLAT:_general_operand
	DD	FLAT:_general_operand
	ORG $+20
	DD	FLAT:_general_operand
	DD	FLAT:_general_operand
	ORG $+20
	DD	FLAT:_general_operand
	DD	FLAT:_general_operand
	ORG $+20
	DD	FLAT:_general_operand
	DD	FLAT:_general_operand
	ORG $+20
	DD	FLAT:_general_operand
	DD	FLAT:_general_operand
	ORG $+20
	DD	FLAT:_general_operand
	DD	FLAT:_general_operand
	DD	FLAT:_general_operand
	ORG $+16
	DD	FLAT:_general_operand
	DD	FLAT:_general_operand
	ORG $+20
	DD	FLAT:_general_operand
	DD	FLAT:_general_operand
	DD	FLAT:_general_operand
	ORG $+16
	DD	FLAT:_general_operand
	DD	FLAT:_general_operand
	ORG $+20
	DD	FLAT:_general_operand
	DD	FLAT:_general_operand
	DD	FLAT:_general_operand
	ORG $+16
	DD	FLAT:_general_operand
	DD	FLAT:_general_operand
	DD	FLAT:_general_operand
	ORG $+16
	DD	FLAT:_general_operand
	DD	FLAT:_general_operand
	DD	FLAT:_general_operand
	ORG $+16
	DD	FLAT:_general_operand
	DD	FLAT:_general_operand
	DD	FLAT:_general_operand
	ORG $+16
	DD	FLAT:_general_operand
	DD	FLAT:_general_operand
	ORG $+20
	DD	FLAT:_general_operand
	DD	FLAT:_general_operand
	DD	FLAT:_general_operand
	ORG $+16
	DD	FLAT:_general_operand
	DD	FLAT:_general_operand
	ORG $+20
	DD	FLAT:_general_operand
	DD	FLAT:_general_operand
	DD	FLAT:_general_operand
	ORG $+16
	DD	FLAT:_general_operand
	DD	FLAT:_general_operand
	DD	FLAT:_general_operand
	ORG $+16
	DD	FLAT:_general_operand
	DD	FLAT:_general_operand
	DD	FLAT:_general_operand
	ORG $+16
	DD	FLAT:_general_operand
	DD	FLAT:_general_operand
	DD	FLAT:_general_operand
	ORG $+16
	DD	FLAT:_general_operand
	DD	FLAT:_general_operand
	DD	FLAT:_general_operand
	ORG $+16
	DD	FLAT:_general_operand
	DD	FLAT:_general_operand
	DD	FLAT:_general_operand
	ORG $+16
	DD	FLAT:_general_operand
	DD	FLAT:_general_operand
	DD	FLAT:_general_operand
	ORG $+16
	DD	FLAT:_general_operand
	DD	FLAT:_general_operand
	DD	FLAT:_general_operand
	ORG $+16
	DD	FLAT:_general_operand
	DD	FLAT:_general_operand
	DD	FLAT:_general_operand
	ORG $+16
	DD	FLAT:_general_operand
	DD	FLAT:_general_operand
	DD	FLAT:_general_operand
	ORG $+16
	DD	FLAT:_general_operand
	DD	FLAT:_general_operand
	DD	FLAT:_general_operand
	ORG $+16
	DD	FLAT:_general_operand
	DD	FLAT:_general_operand
	DD	FLAT:_general_operand
	DD	FLAT:_general_operand
	ORG $+12
	DD	FLAT:_general_operand
	DD	FLAT:_general_operand
	DD	FLAT:_general_operand
	DD	FLAT:_general_operand
	ORG $+12
	DD	FLAT:_general_operand
	DD	FLAT:_general_operand
	DD	FLAT:_general_operand
	DD	FLAT:_general_operand
	ORG $+12
	DD	FLAT:_general_operand
	DD	FLAT:_general_operand
	DD	FLAT:_general_operand
	DD	FLAT:_general_operand
	ORG $+12
	DD	FLAT:_general_operand
	DD	FLAT:_general_operand
	DD	FLAT:_general_operand
	ORG $+16
	DD	FLAT:_general_operand
	DD	FLAT:_general_operand
	DD	FLAT:_general_operand
	ORG $+16
	DD	FLAT:_general_operand
	DD	FLAT:_general_operand
	DD	FLAT:_general_operand
	ORG $+16
	DD	FLAT:_general_operand
	DD	FLAT:_general_operand
	DD	FLAT:_general_operand
	ORG $+16
	DD	FLAT:_general_operand
	DD	FLAT:_general_operand
	DD	FLAT:_general_operand
	ORG $+16
	DD	FLAT:_general_operand
	DD	FLAT:_general_operand
	DD	FLAT:_general_operand
	ORG $+16
	DD	FLAT:_general_operand
	DD	FLAT:_general_operand
	DD	FLAT:_general_operand
	ORG $+16
	DD	FLAT:_general_operand
	DD	FLAT:_general_operand
	DD	FLAT:_general_operand
	ORG $+16
	DD	FLAT:_general_operand
	DD	FLAT:_general_operand
	DD	FLAT:_general_operand
	ORG $+16
	DD	FLAT:_general_operand
	DD	FLAT:_general_operand
	ORG $+20
	DD	FLAT:_general_operand
	DD	FLAT:_general_operand
	ORG $+20
	DD	FLAT:_general_operand
	DD	FLAT:_general_operand
	ORG $+20
	DD	FLAT:_general_operand
	DD	FLAT:_general_operand
	ORG $+20
	DD	FLAT:_general_operand
	DD	FLAT:_general_operand
	ORG $+20
	DD	FLAT:_general_operand
	DD	FLAT:_general_operand
	ORG $+20
	DD	FLAT:_general_operand
	DD	FLAT:_general_operand
	ORG $+20
	DD	FLAT:_general_operand
	DD	FLAT:_general_operand
	ORG $+20
	DD	FLAT:_general_operand
	DD	FLAT:_general_operand
	ORG $+20
	DD	FLAT:_general_operand
	DD	FLAT:_general_operand
	ORG $+20
	DD	FLAT:_general_operand
	DD	FLAT:_general_operand
	DD	FLAT:_general_operand
	ORG $+16
	DD	FLAT:_general_operand
	DD	FLAT:_general_operand
	DD	FLAT:_general_operand
	ORG $+16
	DD	FLAT:_general_operand
	DD	FLAT:_general_operand
	DD	FLAT:_general_operand
	ORG $+16
	DD	FLAT:_general_operand
	DD	FLAT:_general_operand
	DD	FLAT:_general_operand
	ORG $+16
	DD	FLAT:_general_operand
	DD	FLAT:_general_operand
	DD	FLAT:_general_operand
	ORG $+16
	DD	FLAT:_general_operand
	DD	FLAT:_general_operand
	DD	FLAT:_general_operand
	ORG $+16
	DD	FLAT:_general_operand
	DD	FLAT:_general_operand
	DD	FLAT:_general_operand
	ORG $+16
	DD	FLAT:_general_operand
	DD	FLAT:_general_operand
	DD	FLAT:_general_operand
	ORG $+16
	DD	FLAT:_general_operand
	DD	FLAT:_general_operand
	DD	FLAT:_general_operand
	ORG $+16
	DD	FLAT:_general_operand
	DD	FLAT:_general_operand
	DD	FLAT:_general_operand
	ORG $+16
	DD	FLAT:_general_operand
	DD	FLAT:_general_operand
	DD	FLAT:_general_operand
	ORG $+16
	DD	FLAT:_general_operand
	DD	FLAT:_general_operand
	DD	FLAT:_general_operand
	ORG $+16
	DD	FLAT:_general_operand
	DD	FLAT:_general_operand
	DD	FLAT:_general_operand
	ORG $+16
	DD	FLAT:_general_operand
	DD	FLAT:_general_operand
	DD	FLAT:_general_operand
	ORG $+16
	DD	FLAT:_general_operand
	DD	FLAT:_general_operand
	DD	FLAT:_general_operand
	ORG $+16
	DD	FLAT:_general_operand
	DD	FLAT:_general_operand
	DD	FLAT:_general_operand
	ORG $+16
	DD	FLAT:_general_operand
	DD	FLAT:_general_operand
	DD	FLAT:_general_operand
	ORG $+16
	DD	FLAT:_general_operand
	DD	FLAT:_general_operand
	DD	FLAT:_general_operand
	ORG $+16
	DD	FLAT:_general_operand
	ORG $+24
	DD	FLAT:_general_operand
	ORG $+24
	DD	FLAT:_general_operand
	ORG $+24
	DD	FLAT:_general_operand
	ORG $+24
	DD	FLAT:_general_operand
	ORG $+24
	DD	FLAT:_general_operand
	ORG $+24
	DD	FLAT:_general_operand
	ORG $+24
	DD	FLAT:_general_operand
	ORG $+24
	DD	FLAT:_general_operand
	ORG $+24
	DD	FLAT:_general_operand
	ORG $+24
	DD	00H
	ORG $+24
	DD	00H
	ORG $+24
	DD	00H
	ORG $+24
	DD	00H
	ORG $+24
	DD	00H
	ORG $+24
	DD	00H
	ORG $+24
	DD	00H
	ORG $+24
	DD	00H
	ORG $+24
	DD	00H
	ORG $+24
	DD	00H
	ORG $+24
	DD	00H
	ORG $+24
	DD	00H
	ORG $+24
	DD	00H
	ORG $+24
	DD	00H
	ORG $+24
	DD	00H
	ORG $+24
	DD	00H
	ORG $+24
	DD	00H
	ORG $+24
	DD	00H
	ORG $+24
	DD	00H
	ORG $+24
	DD	00H
	ORG $+24
	DD	00H
	ORG $+24
	DD	00H
	ORG $+24
	DD	00H
	ORG $+24
	DD	FLAT:_general_operand
	ORG $+24
	DD	FLAT:_indirect_operand
	DD	FLAT:_general_operand
	ORG $+20
	DD	00H
	DD	FLAT:_indirect_operand
	DD	FLAT:_general_operand
	ORG $+16
	DD	00H
	ORG $+24
CONST	ENDS
_DATA	SEGMENT
	ORG $+6
_insn_machine_info DD 00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
_insn_n_alternatives DD 01H
	DD	01H
	DD	01H
	DD	02H
	DD	02H
	DD	02H
	DD	02H
	DD	02H
	DD	06H
	DD	06H
	DD	02H
	DD	02H
	DD	02H
	DD	01H
	DD	02H
	DD	01H
	DD	02H
	DD	01H
	DD	03H
	DD	02H
	DD	03H
	DD	02H
	DD	03H
	DD	01H
	DD	02H
	DD	01H
	DD	01H
	DD	01H
	DD	01H
	DD	02H
	DD	02H
	DD	02H
	DD	01H
	DD	01H
	DD	01H
	DD	01H
	DD	01H
	DD	01H
	DD	04H
	DD	02H
	DD	02H
	DD	02H
	DD	02H
	DD	01H
	DD	02H
	DD	01H
	DD	02H
	DD	03H
	DD	03H
	DD	02H
	DD	01H
	DD	02H
	DD	01H
	DD	02H
	DD	04H
	DD	04H
	DD	02H
	DD	02H
	DD	01H
	DD	01H
	DD	03H
	DD	03H
	DD	04H
	DD	04H
	DD	00H
	DD	00H
	DD	01H
	DD	01H
	DD	02H
	DD	02H
	DD	02H
	DD	02H
	DD	02H
	DD	02H
	DD	02H
	DD	02H
	DD	01H
	DD	01H
	DD	01H
	DD	01H
	DD	02H
	DD	02H
	DD	02H
	DD	02H
	DD	01H
	DD	01H
	DD	01H
	DD	01H
	DD	01H
	DD	01H
	DD	01H
	DD	01H
	DD	01H
	DD	01H
	DD	01H
	DD	01H
	DD	01H
	DD	01H
	DD	01H
	DD	01H
	DD	01H
	DD	01H
	DD	01H
	DD	01H
	DD	01H
	DD	01H
	DD	01H
	DD	01H
	DD	01H
	DD	01H
	DD	01H
	DD	01H
	DD	01H
	DD	01H
	DD	01H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	00H
	DD	01H
	DD	01H
	DD	01H
	DD	00H
_DATA	ENDS
EXTRN	_mode_size:BYTE
EXTRN	_stack_pointer_rtx:DWORD
EXTRN	_gen_rtx:NEAR
EXTRN	_fprintf:NEAR
EXTRN	_asm_out_file:DWORD
EXTRN	_output_asm_insn:NEAR
_DATA	SEGMENT
$SG656	DB	'fstp%z0 %0', 00H
	ORG $+1
$SG662	DB	'add%L0 %1,%0', 00H
	ORG $+3
$SG666	DB	'%', 00H
	ORG $+2
$SG667	DB	09H, 'fstp %sst (0)', 0aH, 00H
$SG668	DB	00H
_DATA	ENDS
_TEXT	SEGMENT
; File config\out-i386.c
_op$ = 8
_rev$ = 12
_n$ = 16
_operands$ = 20
_insn$ = 24
_temp$658 = -4
_tem1$659 = -8
_xops$661 = -16
_fp_call_internal PROC NEAR
; Line 83
	push	ebp
	mov	ebp, esp
	sub	esp, 16					; 00000010H
	push	ebx
	push	esi
	push	edi
; Line 84
	mov	eax, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L654
	mov	eax, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [eax]
	cmp	DWORD PTR [eax+4], 8
	jl	$L655
	mov	eax, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [eax]
	cmp	DWORD PTR [eax+4], 10			; 0000000aH
	jl	$L653
$L655:
$L654:
; Line 88
	mov	eax, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [eax]
	push	eax
	push	8
	push	11					; 0000000bH
	push	34					; 00000022H
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	push	eax
	call	_output_movf
	add	esp, 8
; Line 89
	mov	eax, DWORD PTR _insn$[ebp]
	push	eax
	mov	eax, DWORD PTR _rev$[ebp]
	push	eax
	mov	eax, DWORD PTR _op$[ebp]
	push	eax
	call	_output_asm_insn_double_reg_op
	add	esp, 12					; 0000000cH
; Line 90
	mov	eax, OFFSET FLAT:$SG656
	jmp	$L652
; Line 93
$L653:
	mov	eax, DWORD PTR _n$[ebp]
	mov	ecx, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L657
	mov	eax, DWORD PTR _n$[ebp]
	mov	ecx, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4]
	cmp	DWORD PTR [eax+4], 8
	jl	$L657
	mov	eax, DWORD PTR _n$[ebp]
	mov	ecx, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4]
	cmp	DWORD PTR [eax+4], 10			; 0000000aH
	jge	$L657
; Line 95
	mov	eax, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _temp$658[ebp], eax
; Line 96
	mov	eax, DWORD PTR _op$[ebp]
	mov	DWORD PTR _tem1$659[ebp], eax
; Line 97
	mov	eax, DWORD PTR _n$[ebp]
	mov	ecx, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4]
	mov	ecx, DWORD PTR _operands$[ebp]
	mov	DWORD PTR [ecx+4], eax
; Line 98
	mov	eax, DWORD PTR _rev$[ebp]
	mov	DWORD PTR _op$[ebp], eax
; Line 99
	mov	eax, DWORD PTR _temp$658[ebp]
	mov	ecx, DWORD PTR _n$[ebp]
	mov	edx, DWORD PTR _operands$[ebp]
	mov	DWORD PTR [edx+ecx*4], eax
; Line 100
	mov	eax, DWORD PTR _tem1$659[ebp]
	mov	DWORD PTR _rev$[ebp], eax
; Line 103
$L657:
	mov	eax, DWORD PTR _n$[ebp]
	mov	ecx, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L660
; Line 106
	mov	eax, DWORD PTR _n$[ebp]
	mov	ecx, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4]
	push	eax
	call	_via_memory
	add	esp, 4
; Line 107
	mov	eax, DWORD PTR _stack_pointer_rtx
	push	eax
	mov	eax, DWORD PTR _n$[ebp]
	mov	ecx, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	sar	eax, 24					; 00000018H
	push	eax
	push	37					; 00000025H
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	mov	ecx, DWORD PTR _n$[ebp]
	mov	edx, DWORD PTR _operands$[ebp]
	mov	DWORD PTR [edx+ecx*4], eax
; Line 108
	mov	eax, DWORD PTR _stack_pointer_rtx
	mov	DWORD PTR _xops$661[ebp], eax
; Line 110
	mov	eax, DWORD PTR _n$[ebp]
	mov	ecx, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	sar	eax, 22					; 00000016H
	mov	eax, DWORD PTR _mode_size[eax]
	push	eax
	push	0
	push	30					; 0000001eH
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _xops$661[ebp+4], eax
; Line 111
	mov	eax, DWORD PTR _n$[ebp]
	shl	eax, 2
	add	eax, DWORD PTR _operands$[ebp]
	push	eax
	mov	eax, DWORD PTR _op$[ebp]
	push	eax
	call	_output_asm_insn
	add	esp, 8
; Line 112
	lea	eax, DWORD PTR _xops$661[ebp]
	push	eax
	push	OFFSET FLAT:$SG662
	call	_output_asm_insn
	add	esp, 8
; Line 114
	jmp	$L663
$L660:
; Line 115
	mov	eax, DWORD PTR _n$[ebp]
	shl	eax, 2
	add	eax, DWORD PTR _operands$[ebp]
	push	eax
	mov	eax, DWORD PTR _op$[ebp]
	push	eax
	call	_output_asm_insn
	add	esp, 8
$L663:
; Line 117
	mov	eax, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L664
	mov	eax, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [eax]
	cmp	DWORD PTR [eax+4], 8
	jl	$L664
	mov	eax, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [eax]
	cmp	DWORD PTR [eax+4], 10			; 0000000aH
	jge	$L664
; Line 124
	mov	eax, DWORD PTR _insn$[ebp]
	push	eax
	call	_fp_top_dead_p1
	add	esp, 4
	or	eax, eax
	je	$L665
; Line 125
	push	OFFSET FLAT:$SG666
	push	OFFSET FLAT:$SG667
	mov	eax, DWORD PTR _asm_out_file
	push	eax
	call	_fprintf
	add	esp, 12					; 0000000cH
$L665:
; Line 128
$L664:
	mov	eax, OFFSET FLAT:$SG668
	jmp	$L652
; Line 129
$L652:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_fp_call_internal ENDP
_TEXT	ENDS
PUBLIC	_top_dead_p
EXTRN	__flsbuf:NEAR
EXTRN	_fputc:NEAR
_DATA	SEGMENT
	ORG $+3
$SG678	DB	'%', 00H
	ORG $+2
$SG679	DB	'%', 00H
	ORG $+2
$SG680	DB	'p %sst,%sst(1)', 00H
	ORG $+1
$SG685	DB	'%', 00H
	ORG $+2
$SG686	DB	'%', 00H
	ORG $+2
$SG687	DB	'%sst(1) %sst,', 00H
_DATA	ENDS
_TEXT	SEGMENT
_op$ = 8
_rev$ = 12
_insn$ = 16
_output_asm_insn_double_reg_op PROC NEAR
; Line 147
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	push	ebx
	push	esi
	push	edi
; Line 148
	mov	eax, DWORD PTR _asm_out_file
	push	eax
	push	9
	call	_fputc
	add	esp, 8
; Line 149
	mov	eax, DWORD PTR _insn$[ebp]
	push	eax
	call	_top_dead_p
	add	esp, 4
	or	eax, eax
	je	$L674
; Line 156
	mov	eax, DWORD PTR _op$[ebp]
	mov	DWORD PTR _rev$[ebp], eax
; Line 158
$L676:
	mov	eax, DWORD PTR _rev$[ebp]
	movsx	eax, BYTE PTR [eax]
	or	eax, eax
	je	$L677
	mov	eax, DWORD PTR _rev$[ebp]
	movsx	eax, BYTE PTR [eax]
	cmp	eax, 37					; 00000025H
	je	$L677
; Line 159
	mov	eax, DWORD PTR _rev$[ebp]
	mov	DWORD PTR -4+[ebp], eax
	inc	DWORD PTR _rev$[ebp]
	mov	eax, DWORD PTR _asm_out_file
	push	eax
	mov	eax, DWORD PTR -4+[ebp]
	movsx	eax, BYTE PTR [eax]
	push	eax
	call	_fputc
	add	esp, 8
	jmp	$L676
$L677:
; Line 162
	push	OFFSET FLAT:$SG678
	push	OFFSET FLAT:$SG679
	push	OFFSET FLAT:$SG680
	mov	eax, DWORD PTR _asm_out_file
	push	eax
	call	_fprintf
	add	esp, 16					; 00000010H
; Line 164
	jmp	$L681
$L674:
; Line 166
$L683:
	mov	eax, DWORD PTR _op$[ebp]
	movsx	eax, BYTE PTR [eax]
	or	eax, eax
	je	$L684
	mov	eax, DWORD PTR _op$[ebp]
	movsx	eax, BYTE PTR [eax]
	cmp	eax, 37					; 00000025H
	je	$L684
; Line 167
	mov	eax, DWORD PTR _op$[ebp]
	mov	DWORD PTR -8+[ebp], eax
	inc	DWORD PTR _op$[ebp]
	mov	eax, DWORD PTR _asm_out_file
	push	eax
	mov	eax, DWORD PTR -8+[ebp]
	movsx	eax, BYTE PTR [eax]
	push	eax
	call	_fputc
	add	esp, 8
	jmp	$L683
$L684:
; Line 168
	push	OFFSET FLAT:$SG685
	push	OFFSET FLAT:$SG686
	push	OFFSET FLAT:$SG687
	mov	eax, DWORD PTR _asm_out_file
	push	eax
	call	_fprintf
	add	esp, 16					; 00000010H
; Line 169
$L681:
; Line 170
	mov	eax, DWORD PTR _asm_out_file
	dec	DWORD PTR [eax+4]
	mov	eax, DWORD PTR _asm_out_file
	cmp	DWORD PTR [eax+4], 0
	jl	$L2369
	mov	eax, DWORD PTR _asm_out_file
	mov	eax, DWORD PTR [eax]
	mov	BYTE PTR [eax], 10			; 0000000aH
	mov	eax, DWORD PTR _asm_out_file
	inc	DWORD PTR [eax]
	jmp	$L2370
$L2369:
	mov	eax, DWORD PTR _asm_out_file
	push	eax
	push	10					; 0000000aH
	call	__flsbuf
	add	esp, 8
$L2370:
; Line 171
$L672:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_output_asm_insn_double_reg_op ENDP
_TEXT	ENDS
EXTRN	_abort:NEAR
_DATA	SEGMENT
	ORG $+2
$SG694	DB	'push%L0 %0', 00H
	ORG $+1
$SG695	DB	'push%L0 %0', 00H
_DATA	ENDS
_TEXT	SEGMENT
_x$ = 8
_xops$693 = -4
_via_memory PROC NEAR
; Line 180
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 181
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L690
; Line 182
	call	_abort
; Line 183
$L690:
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	mov	ecx, 184549376				; 0b000000H
	and	ecx, -16777216				; ff000000H
	cmp	eax, ecx
	jne	$L692
; Line 186
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	inc	eax
	push	eax
	push	4
	push	34					; 00000022H
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _xops$693[ebp], eax
; Line 187
	lea	eax, DWORD PTR _xops$693[ebp]
	push	eax
	push	OFFSET FLAT:$SG694
	call	_output_asm_insn
	add	esp, 8
; Line 189
$L692:
	lea	eax, DWORD PTR _x$[ebp]
	push	eax
	push	OFFSET FLAT:$SG695
	call	_output_asm_insn
	add	esp, 8
; Line 190
$L689:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_via_memory ENDP
_TEXT	ENDS
PUBLIC	_fp_store_sf
_DATA	SEGMENT
	ORG $+1
$SG701	DB	'add%L0 %2,%0', 00H
	ORG $+3
$SG702	DB	'fst%S0 %1', 00H
	ORG $+2
$SG703	DB	'pop%L0 %0', 00H
	ORG $+2
$SG706	DB	'fst%S0 %0', 00H
_DATA	ENDS
_TEXT	SEGMENT
_target$ = 8
_xoperands$700 = -12
_fp_store_sf PROC NEAR
; Line 198
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
	push	ebx
	push	esi
	push	edi
; Line 199
	mov	eax, DWORD PTR _target$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L699
; Line 202
	mov	eax, DWORD PTR _stack_pointer_rtx
	mov	DWORD PTR _xoperands$700[ebp], eax
; Line 203
	mov	eax, DWORD PTR _stack_pointer_rtx
	push	eax
	push	4
	push	37					; 00000025H
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _xoperands$700[ebp+4], eax
; Line 204
	push	-4					; fffffffcH
	push	0
	push	30					; 0000001eH
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _xoperands$700[ebp+8], eax
; Line 205
	lea	eax, DWORD PTR _xoperands$700[ebp]
	push	eax
	push	OFFSET FLAT:$SG701
	call	_output_asm_insn
	add	esp, 8
; Line 206
	lea	eax, DWORD PTR _xoperands$700[ebp]
	push	eax
	push	OFFSET FLAT:$SG702
	call	_output_asm_insn
	add	esp, 8
; Line 207
	lea	eax, DWORD PTR _target$[ebp]
	push	eax
	push	OFFSET FLAT:$SG703
	call	_output_asm_insn
	add	esp, 8
; Line 209
	jmp	$L704
$L699:
	mov	eax, DWORD PTR _target$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2424832				; 00250000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L705
; Line 210
	lea	eax, DWORD PTR _target$[ebp]
	push	eax
	push	OFFSET FLAT:$SG706
	call	_output_asm_insn
	add	esp, 8
; Line 211
$L705:
$L704:
$L698:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_fp_store_sf ENDP
_TEXT	ENDS
PUBLIC	_fp_pop_sf
_DATA	SEGMENT
	ORG $+2
$SG712	DB	'add%L0 %2,%0', 00H
	ORG $+3
$SG713	DB	'fstp%S0 %1', 00H
	ORG $+1
$SG714	DB	'pop%L0 %0', 00H
	ORG $+2
$SG717	DB	'fstp%S0 %0', 00H
_DATA	ENDS
_TEXT	SEGMENT
_target$ = 8
_xoperands$711 = -12
_fp_pop_sf PROC NEAR
; Line 219
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
	push	ebx
	push	esi
	push	edi
; Line 220
	mov	eax, DWORD PTR _target$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L710
; Line 223
	mov	eax, DWORD PTR _stack_pointer_rtx
	mov	DWORD PTR _xoperands$711[ebp], eax
; Line 224
	mov	eax, DWORD PTR _stack_pointer_rtx
	push	eax
	push	4
	push	37					; 00000025H
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _xoperands$711[ebp+4], eax
; Line 225
	push	-4					; fffffffcH
	push	0
	push	30					; 0000001eH
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _xoperands$711[ebp+8], eax
; Line 226
	lea	eax, DWORD PTR _xoperands$711[ebp]
	push	eax
	push	OFFSET FLAT:$SG712
	call	_output_asm_insn
	add	esp, 8
; Line 227
	lea	eax, DWORD PTR _xoperands$711[ebp]
	push	eax
	push	OFFSET FLAT:$SG713
	call	_output_asm_insn
	add	esp, 8
; Line 228
	lea	eax, DWORD PTR _target$[ebp]
	push	eax
	push	OFFSET FLAT:$SG714
	call	_output_asm_insn
	add	esp, 8
; Line 231
	jmp	$L715
$L710:
	mov	eax, DWORD PTR _target$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2424832				; 00250000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L716
; Line 234
	lea	eax, DWORD PTR _target$[ebp]
	push	eax
	push	OFFSET FLAT:$SG717
	call	_output_asm_insn
	add	esp, 8
; Line 236
	jmp	$L718
$L716:
	call	_abort
$L718:
$L715:
; Line 237
$L709:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_fp_pop_sf ENDP
_TEXT	ENDS
PUBLIC	_fp_store_df
_DATA	SEGMENT
	ORG $+1
$SG724	DB	'add%L0 %3,%0', 00H
	ORG $+3
$SG725	DB	'fst%Q0 %2', 00H
	ORG $+2
$SG726	DB	'pop%L0 %0', 00H
	ORG $+2
$SG727	DB	'pop%L0 %1', 00H
	ORG $+2
$SG730	DB	'fst%Q0 %0', 00H
_DATA	ENDS
_TEXT	SEGMENT
_target$ = 8
_xoperands$723 = -16
_fp_store_df PROC NEAR
; Line 244
	push	ebp
	mov	ebp, esp
	sub	esp, 16					; 00000010H
	push	ebx
	push	esi
	push	edi
; Line 245
	mov	eax, DWORD PTR _target$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L722
; Line 248
	mov	eax, DWORD PTR _stack_pointer_rtx
	mov	DWORD PTR _xoperands$723[ebp], eax
; Line 249
	mov	eax, DWORD PTR _target$[ebp]
	mov	eax, DWORD PTR [eax+4]
	inc	eax
	push	eax
	push	4
	push	34					; 00000022H
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _xoperands$723[ebp+4], eax
; Line 250
	mov	eax, DWORD PTR _stack_pointer_rtx
	push	eax
	push	4
	push	37					; 00000025H
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _xoperands$723[ebp+8], eax
; Line 251
	push	-8					; fffffff8H
	push	0
	push	30					; 0000001eH
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _xoperands$723[ebp+12], eax
; Line 252
	lea	eax, DWORD PTR _xoperands$723[ebp]
	push	eax
	push	OFFSET FLAT:$SG724
	call	_output_asm_insn
	add	esp, 8
; Line 253
	lea	eax, DWORD PTR _xoperands$723[ebp]
	push	eax
	push	OFFSET FLAT:$SG725
	call	_output_asm_insn
	add	esp, 8
; Line 254
	lea	eax, DWORD PTR _target$[ebp]
	push	eax
	push	OFFSET FLAT:$SG726
	call	_output_asm_insn
	add	esp, 8
; Line 255
	lea	eax, DWORD PTR _xoperands$723[ebp]
	push	eax
	push	OFFSET FLAT:$SG727
	call	_output_asm_insn
	add	esp, 8
; Line 257
	jmp	$L728
$L722:
	mov	eax, DWORD PTR _target$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2424832				; 00250000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L729
; Line 258
	lea	eax, DWORD PTR _target$[ebp]
	push	eax
	push	OFFSET FLAT:$SG730
	call	_output_asm_insn
	add	esp, 8
; Line 259
$L729:
$L728:
$L721:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_fp_store_df ENDP
_TEXT	ENDS
PUBLIC	_fp_pop_df
_DATA	SEGMENT
	ORG $+2
$SG736	DB	'add%L0 %3,%0', 00H
	ORG $+3
$SG737	DB	'fstp%Q0 %2', 00H
	ORG $+1
$SG738	DB	'pop%L0 %0', 00H
	ORG $+2
$SG739	DB	'pop%L0 %1', 00H
	ORG $+2
$SG742	DB	'fstp%z0 %0', 00H
_DATA	ENDS
_TEXT	SEGMENT
_target$ = 8
_xoperands$735 = -16
_fp_pop_df PROC NEAR
; Line 266
	push	ebp
	mov	ebp, esp
	sub	esp, 16					; 00000010H
	push	ebx
	push	esi
	push	edi
; Line 267
	mov	eax, DWORD PTR _target$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L734
; Line 270
	mov	eax, DWORD PTR _stack_pointer_rtx
	mov	DWORD PTR _xoperands$735[ebp], eax
; Line 271
	mov	eax, DWORD PTR _target$[ebp]
	mov	eax, DWORD PTR [eax+4]
	inc	eax
	push	eax
	push	4
	push	34					; 00000022H
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _xoperands$735[ebp+4], eax
; Line 272
	mov	eax, DWORD PTR _stack_pointer_rtx
	push	eax
	push	4
	push	37					; 00000025H
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _xoperands$735[ebp+8], eax
; Line 273
	push	-8					; fffffff8H
	push	0
	push	30					; 0000001eH
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _xoperands$735[ebp+12], eax
; Line 274
	lea	eax, DWORD PTR _xoperands$735[ebp]
	push	eax
	push	OFFSET FLAT:$SG736
	call	_output_asm_insn
	add	esp, 8
; Line 276
	lea	eax, DWORD PTR _xoperands$735[ebp]
	push	eax
	push	OFFSET FLAT:$SG737
	call	_output_asm_insn
	add	esp, 8
; Line 277
	lea	eax, DWORD PTR _target$[ebp]
	push	eax
	push	OFFSET FLAT:$SG738
	call	_output_asm_insn
	add	esp, 8
; Line 278
	lea	eax, DWORD PTR _xoperands$735[ebp]
	push	eax
	push	OFFSET FLAT:$SG739
	call	_output_asm_insn
	add	esp, 8
; Line 280
	jmp	$L740
$L734:
	mov	eax, DWORD PTR _target$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2424832				; 00250000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L741
; Line 283
	lea	eax, DWORD PTR _target$[ebp]
	push	eax
	push	OFFSET FLAT:$SG742
	call	_output_asm_insn
	add	esp, 8
; Line 285
$L741:
$L740:
$L733:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_fp_pop_df ENDP
_TEXT	ENDS
PUBLIC	_fp_push_sf
_DATA	SEGMENT
	ORG $+1
$SG749	DB	'push%L0 %0', 00H
	ORG $+1
$SG750	DB	'fld%S0 %0 ', 0aH, 09H, 'add%L0 %2,%1', 00H
	ORG $+3
$SG752	DB	'fld%S0 %0', 00H
_DATA	ENDS
_TEXT	SEGMENT
_x$ = 8
_xfops$748 = -12
_fp_push_sf PROC NEAR
; Line 320
	push	ebp
	mov	ebp, esp
	sub	esp, 20					; 00000014H
	push	ebx
	push	esi
	push	edi
; Line 322
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L746
; Line 326
	lea	eax, DWORD PTR _x$[ebp]
	push	eax
	push	OFFSET FLAT:$SG749
	call	_output_asm_insn
	add	esp, 8
; Line 327
	mov	eax, DWORD PTR _stack_pointer_rtx
	push	eax
	push	4
	push	37					; 00000025H
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _xfops$748[ebp], eax
; Line 328
	push	4
	push	0
	push	30					; 0000001eH
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _xfops$748[ebp+8], eax
; Line 329
	mov	eax, DWORD PTR _stack_pointer_rtx
	mov	DWORD PTR _xfops$748[ebp+4], eax
; Line 330
	lea	eax, DWORD PTR _xfops$748[ebp]
	push	eax
	push	OFFSET FLAT:$SG750
	call	_output_asm_insn
	add	esp, 8
; Line 332
	jmp	$L751
$L746:
; Line 333
	lea	eax, DWORD PTR _x$[ebp]
	push	eax
	push	OFFSET FLAT:$SG752
	call	_output_asm_insn
	add	esp, 8
$L751:
; Line 334
$L745:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_fp_push_sf ENDP
_TEXT	ENDS
PUBLIC	_fp_push_df
_DATA	SEGMENT
	ORG $+2
$SG759	DB	'push%L0 %1', 00H
	ORG $+1
$SG760	DB	'push%L0 %0', 00H
	ORG $+1
$SG761	DB	'fld%Q0 %0 ', 0aH, 09H, 'add%L0 %2,%1', 00H
	ORG $+3
$SG764	DB	'fld%Q0 %0', 00H
_DATA	ENDS
_TEXT	SEGMENT
_x$ = 8
_xoperands$757 = -20
_xfops$758 = -12
_fp_push_df PROC NEAR
; Line 341
	push	ebp
	mov	ebp, esp
	sub	esp, 20					; 00000014H
	push	ebx
	push	esi
	push	edi
; Line 344
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L756
; Line 348
	mov	eax, DWORD PTR _x$[ebp]
	mov	DWORD PTR _xoperands$757[ebp], eax
; Line 349
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	inc	eax
	push	eax
	push	4
	push	34					; 00000022H
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _xoperands$757[ebp+4], eax
; Line 350
	lea	eax, DWORD PTR _xoperands$757[ebp]
	push	eax
	push	OFFSET FLAT:$SG759
	call	_output_asm_insn
	add	esp, 8
; Line 351
	lea	eax, DWORD PTR _xoperands$757[ebp]
	push	eax
	push	OFFSET FLAT:$SG760
	call	_output_asm_insn
	add	esp, 8
; Line 352
	mov	eax, DWORD PTR _stack_pointer_rtx
	push	eax
	push	4
	push	37					; 00000025H
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _xfops$758[ebp], eax
; Line 353
	push	8
	push	0
	push	30					; 0000001eH
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _xfops$758[ebp+8], eax
; Line 354
	mov	eax, DWORD PTR _stack_pointer_rtx
	mov	DWORD PTR _xfops$758[ebp+4], eax
; Line 355
	lea	eax, DWORD PTR _xfops$758[ebp]
	push	eax
	push	OFFSET FLAT:$SG761
	call	_output_asm_insn
	add	esp, 8
; Line 357
	jmp	$L762
$L756:
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2424832				; 00250000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L763
; Line 358
	lea	eax, DWORD PTR _x$[ebp]
	push	eax
	push	OFFSET FLAT:$SG764
	call	_output_asm_insn
	add	esp, 8
; Line 359
$L763:
$L762:
$L755:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_fp_push_df ENDP
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+2
$SG771	DB	'push%L0 %1', 00H
	ORG $+1
$SG777	DB	'mov%L0 %1,%0', 00H
	ORG $+3
$SG781	DB	'mov%L0 %1,%0', 00H
	ORG $+3
$SG783	DB	'push%L0 %1', 00H
	ORG $+1
$SG784	DB	'pop%L0 %0', 00H
_DATA	ENDS
_TEXT	SEGMENT
_x$ = -4
_operands$ = 8
_singlemove_string PROC NEAR
; Line 366
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 369
	mov	eax, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2424832				; 00250000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L769
	mov	eax, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _x$[ebp], eax
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 4128768				; 003f0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L769
; Line 371
	mov	eax, DWORD PTR _x$[ebp]
	mov	ecx, DWORD PTR _stack_pointer_rtx
	cmp	DWORD PTR [eax+4], ecx
	je	$L770
; Line 372
	call	_abort
; Line 373
$L770:
	mov	eax, OFFSET FLAT:$SG771
	jmp	$L767
; Line 375
	jmp	$L772
$L769:
	mov	eax, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2031616				; 001f0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L773
; Line 377
	mov	eax, DWORD PTR _operands$[ebp]
	push	eax
	call	_output_move_const_single
	add	esp, 4
	jmp	$L767
; Line 379
	jmp	$L774
$L773:
	mov	eax, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L776
	mov	eax, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L775
$L776:
; Line 380
	mov	eax, OFFSET FLAT:$SG777
	jmp	$L767
; Line 381
	jmp	$L778
$L775:
	mov	eax, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2490368				; 00260000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L780
	mov	eax, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2555904				; 00270000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L780
	mov	eax, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L780
	mov	eax, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2097152				; 00200000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L779
$L780:
; Line 382
	mov	eax, OFFSET FLAT:$SG781
	jmp	$L767
; Line 383
	jmp	$L782
$L779:
; Line 385
	mov	eax, DWORD PTR _operands$[ebp]
	push	eax
	push	OFFSET FLAT:$SG783
	call	_output_asm_insn
	add	esp, 8
; Line 386
	mov	eax, OFFSET FLAT:$SG784
	jmp	$L767
; Line 387
$L782:
$L778:
$L774:
$L772:
; Line 388
$L767:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_singlemove_string ENDP
_addr$ = 8
_find_addr_reg PROC NEAR
; Line 396
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 397
$L789:
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2883584				; 002c0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L790
; Line 399
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L791
; Line 400
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _addr$[ebp], eax
; Line 401
	jmp	$L792
$L791:
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L793
; Line 402
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _addr$[ebp], eax
; Line 403
	jmp	$L794
$L793:
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2490368				; 00260000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L796
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2555904				; 00270000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L796
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L796
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2097152				; 00200000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L795
$L796:
; Line 404
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _addr$[ebp], eax
; Line 405
	jmp	$L797
$L795:
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2490368				; 00260000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L799
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2555904				; 00270000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L799
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L799
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2097152				; 00200000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L798
$L799:
; Line 406
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _addr$[ebp], eax
; Line 407
	jmp	$L800
$L798:
; Line 408
	call	_abort
$L800:
$L797:
$L794:
$L792:
; Line 409
	jmp	$L789
$L790:
; Line 410
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L801
; Line 411
	mov	eax, DWORD PTR _addr$[ebp]
	jmp	$L787
; Line 412
$L801:
	call	_abort
; Line 413
$L787:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_find_addr_reg ENDP
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+2
$SG808	DB	'sub%L0 %0,%1', 00H
	ORG $+3
$SG811	DB	'add%L0 %0,%1', 00H
_DATA	ENDS
_TEXT	SEGMENT
_n$ = 8
_x$ = 12
_xops$ = -8
_asm_add PROC NEAR
; Line 421
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	push	ebx
	push	esi
	push	edi
; Line 423
	mov	eax, DWORD PTR _x$[ebp]
	mov	DWORD PTR _xops$[ebp+4], eax
; Line 424
	cmp	DWORD PTR _n$[ebp], 0
	jge	$L807
; Line 426
	mov	eax, DWORD PTR _n$[ebp]
	neg	eax
	push	eax
	push	0
	push	30					; 0000001eH
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _xops$[ebp], eax
; Line 427
	lea	eax, DWORD PTR _xops$[ebp]
	push	eax
	push	OFFSET FLAT:$SG808
	call	_output_asm_insn
	add	esp, 8
; Line 429
	jmp	$L809
$L807:
	cmp	DWORD PTR _n$[ebp], 0
	jle	$L810
; Line 431
	mov	eax, DWORD PTR _n$[ebp]
	push	eax
	push	0
	push	30					; 0000001eH
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _xops$[ebp], eax
; Line 432
	lea	eax, DWORD PTR _xops$[ebp]
	push	eax
	push	OFFSET FLAT:$SG811
	call	_output_asm_insn
	add	esp, 8
; Line 434
$L810:
$L809:
$L805:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_asm_add ENDP
_TEXT	ENDS
PUBLIC	_output_move_double
EXTRN	_adj_offsettable_operand:NEAR
EXTRN	_const0_rtx:DWORD
EXTRN	_reg_overlap_mentioned_p:NEAR
EXTRN	_offsettable_memref_p:NEAR
_DATA	SEGMENT
	ORG $+3
$SG884	DB	00H
_DATA	ENDS
_TEXT	SEGMENT
_operands$ = 8
_optype0$ = -24
_optype1$ = -20
_latehalf$ = -16
_addreg0$ = -8
_addreg1$ = -4
_output_move_double PROC NEAR
; Line 442
	push	ebp
	mov	ebp, esp
	sub	esp, 24					; 00000018H
	push	ebx
	push	esi
	push	edi
; Line 445
	mov	DWORD PTR _addreg0$[ebp], 0
	mov	DWORD PTR _addreg1$[ebp], 0
; Line 449
	mov	eax, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L828
; Line 450
	mov	DWORD PTR _optype0$[ebp], 0
; Line 451
	jmp	$L829
$L828:
	mov	eax, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [eax]
	push	eax
	call	_offsettable_memref_p
	add	esp, 4
	or	eax, eax
	je	$L831
; Line 452
	mov	DWORD PTR _optype0$[ebp], 1
; Line 453
	jmp	$L832
$L831:
	mov	eax, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 4325376				; 00420000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L833
; Line 454
	mov	DWORD PTR _optype0$[ebp], 4
; Line 455
	jmp	$L834
$L833:
	mov	eax, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 4128768				; 003f0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L835
; Line 456
	mov	DWORD PTR _optype0$[ebp], 3
; Line 457
	jmp	$L836
$L835:
	mov	eax, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2424832				; 00250000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L837
; Line 458
	mov	DWORD PTR _optype0$[ebp], 2
; Line 459
	jmp	$L838
$L837:
; Line 460
	mov	DWORD PTR _optype0$[ebp], 6
$L838:
$L836:
$L834:
$L832:
$L829:
; Line 462
	mov	eax, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L839
; Line 463
	mov	DWORD PTR _optype1$[ebp], 0
; Line 464
	jmp	$L840
$L839:
; Line 465
	mov	eax, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2490368				; 00260000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L842
	mov	eax, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2555904				; 00270000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L842
	mov	eax, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L842
	mov	eax, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2097152				; 00200000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L842
	mov	eax, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2031616				; 001f0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L841
$L842:
; Line 466
	mov	DWORD PTR _optype1$[ebp], 5
; Line 467
	jmp	$L843
$L841:
	mov	eax, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	call	_offsettable_memref_p
	add	esp, 4
	or	eax, eax
	je	$L844
; Line 468
	mov	DWORD PTR _optype1$[ebp], 1
; Line 469
	jmp	$L845
$L844:
	mov	eax, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 4325376				; 00420000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L846
; Line 470
	mov	DWORD PTR _optype1$[ebp], 4
; Line 471
	jmp	$L847
$L846:
	mov	eax, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 4128768				; 003f0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L848
; Line 472
	mov	DWORD PTR _optype1$[ebp], 3
; Line 473
	jmp	$L849
$L848:
	mov	eax, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2424832				; 00250000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L850
; Line 474
	mov	DWORD PTR _optype1$[ebp], 2
; Line 475
	jmp	$L851
$L850:
; Line 476
	mov	DWORD PTR _optype1$[ebp], 6
$L851:
$L849:
$L847:
$L845:
$L843:
$L840:
; Line 482
	cmp	DWORD PTR _optype0$[ebp], 6
	je	$L853
	cmp	DWORD PTR _optype1$[ebp], 6
	jne	$L852
$L853:
; Line 483
	call	_abort
; Line 489
$L852:
	cmp	DWORD PTR _optype0$[ebp], 3
	jne	$L854
	cmp	DWORD PTR _optype1$[ebp], 4
	jne	$L854
; Line 491
	mov	eax, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _operands$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 492
	mov	eax, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [eax]
	push	eax
	push	-8					; fffffff8H
	call	_asm_add
	add	esp, 8
; Line 493
	mov	eax, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [eax]
	push	eax
	push	6
	push	37					; 00000025H
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	mov	ecx, DWORD PTR _operands$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 494
	mov	DWORD PTR _optype0$[ebp], 1
; Line 496
$L854:
	cmp	DWORD PTR _optype0$[ebp], 4
	jne	$L855
	cmp	DWORD PTR _optype1$[ebp], 3
	jne	$L855
; Line 498
	mov	eax, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _operands$[ebp]
	mov	DWORD PTR [ecx+4], eax
; Line 499
	mov	eax, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	push	-8					; fffffff8H
	call	_asm_add
	add	esp, 8
; Line 500
	mov	eax, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	push	6
	push	37					; 00000025H
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	mov	ecx, DWORD PTR _operands$[ebp]
	mov	DWORD PTR [ecx+4], eax
; Line 501
	mov	DWORD PTR _optype1$[ebp], 1
; Line 507
$L855:
	cmp	DWORD PTR _optype0$[ebp], 2
	jne	$L856
; Line 508
	mov	eax, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	call	_find_addr_reg
	add	esp, 4
	mov	DWORD PTR _addreg0$[ebp], eax
; Line 510
$L856:
	cmp	DWORD PTR _optype1$[ebp], 2
	jne	$L857
; Line 511
	mov	eax, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	call	_find_addr_reg
	add	esp, 4
	mov	DWORD PTR _addreg1$[ebp], eax
; Line 522
$L857:
	cmp	DWORD PTR _optype0$[ebp], 0
	jne	$L858
; Line 523
	mov	eax, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	eax, DWORD PTR [eax+4]
	inc	eax
	push	eax
	push	4
	push	34					; 00000022H
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _latehalf$[ebp], eax
; Line 524
	jmp	$L859
$L858:
	cmp	DWORD PTR _optype0$[ebp], 1
	jne	$L860
; Line 525
	push	4
	mov	eax, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [eax]
	push	eax
	call	_adj_offsettable_operand
	add	esp, 8
	mov	DWORD PTR _latehalf$[ebp], eax
; Line 526
	jmp	$L861
$L860:
; Line 527
	mov	eax, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _latehalf$[ebp], eax
$L861:
$L859:
; Line 529
	cmp	DWORD PTR _optype1$[ebp], 0
	jne	$L862
; Line 530
	mov	eax, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	inc	eax
	push	eax
	push	4
	push	34					; 00000022H
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _latehalf$[ebp+4], eax
; Line 531
	jmp	$L863
$L862:
	cmp	DWORD PTR _optype1$[ebp], 1
	jne	$L864
; Line 532
	push	4
	mov	eax, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	call	_adj_offsettable_operand
	add	esp, 8
	mov	DWORD PTR _latehalf$[ebp+4], eax
; Line 533
	jmp	$L865
$L864:
	cmp	DWORD PTR _optype1$[ebp], 5
	jne	$L866
; Line 535
	mov	eax, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2490368				; 00260000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L868
	mov	eax, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2555904				; 00270000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L868
	mov	eax, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L868
	mov	eax, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2097152				; 00200000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L867
$L868:
; Line 536
	mov	eax, DWORD PTR _const0_rtx
	mov	DWORD PTR _latehalf$[ebp+4], eax
; Line 537
	jmp	$L869
$L867:
	mov	eax, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2031616				; 001f0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L870
; Line 540
	mov	eax, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+16]
	push	eax
	push	0
	push	30					; 0000001eH
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _latehalf$[ebp+4], eax
; Line 542
	mov	eax, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+12]
	push	eax
	push	0
	push	30					; 0000001eH
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	mov	ecx, DWORD PTR _operands$[ebp]
	mov	DWORD PTR [ecx+4], eax
; Line 544
$L870:
$L869:
; Line 545
	jmp	$L871
$L866:
; Line 546
	mov	eax, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _latehalf$[ebp+4], eax
$L871:
$L865:
$L863:
; Line 553
	cmp	DWORD PTR _optype0$[ebp], 3
	jne	$L873
	mov	eax, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	cmp	DWORD PTR [eax+4], 7
	jne	$L873
	mov	eax, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	mov	eax, DWORD PTR _stack_pointer_rtx
	push	eax
	call	_reg_overlap_mentioned_p
	add	esp, 8
	or	eax, eax
	je	$L873
; Line 554
	mov	eax, DWORD PTR _latehalf$[ebp+4]
	mov	ecx, DWORD PTR _operands$[ebp]
	mov	DWORD PTR [ecx+4], eax
; Line 564
$L873:
; Line 566
	cmp	DWORD PTR _optype0$[ebp], 3
	je	$L875
	cmp	DWORD PTR _optype1$[ebp], 3
	je	$L875
	cmp	DWORD PTR _optype0$[ebp], 0
	jne	$L874
	cmp	DWORD PTR _optype1$[ebp], 0
	jne	$L874
	mov	eax, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	ecx, DWORD PTR _latehalf$[ebp+4]
	mov	ecx, DWORD PTR [ecx+4]
	cmp	DWORD PTR [eax+4], ecx
	jne	$L874
$L875:
; Line 569
	cmp	DWORD PTR _addreg0$[ebp], 0
	je	$L876
; Line 570
	mov	eax, DWORD PTR _addreg0$[ebp]
	push	eax
	push	4
	call	_asm_add
	add	esp, 8
; Line 571
$L876:
	cmp	DWORD PTR _addreg1$[ebp], 0
	je	$L877
; Line 572
	mov	eax, DWORD PTR _addreg1$[ebp]
	push	eax
	push	4
	call	_asm_add
	add	esp, 8
; Line 575
$L877:
	lea	eax, DWORD PTR _latehalf$[ebp]
	push	eax
	lea	eax, DWORD PTR _latehalf$[ebp]
	push	eax
	call	_singlemove_string
	add	esp, 4
	push	eax
	call	_output_asm_insn
	add	esp, 8
; Line 578
	cmp	DWORD PTR _addreg0$[ebp], 0
	je	$L878
; Line 579
	mov	eax, DWORD PTR _addreg0$[ebp]
	push	eax
	push	-4					; fffffffcH
	call	_asm_add
	add	esp, 8
; Line 580
$L878:
	cmp	DWORD PTR _addreg1$[ebp], 0
	je	$L879
; Line 581
	mov	eax, DWORD PTR _addreg1$[ebp]
	push	eax
	push	-4					; fffffffcH
	call	_asm_add
	add	esp, 8
; Line 584
$L879:
	mov	eax, DWORD PTR _operands$[ebp]
	push	eax
	call	_singlemove_string
	add	esp, 4
	jmp	$L814
; Line 589
$L874:
	mov	eax, DWORD PTR _operands$[ebp]
	push	eax
	mov	eax, DWORD PTR _operands$[ebp]
	push	eax
	call	_singlemove_string
	add	esp, 4
	push	eax
	call	_output_asm_insn
	add	esp, 8
; Line 592
	cmp	DWORD PTR _addreg0$[ebp], 0
	je	$L880
; Line 593
	mov	eax, DWORD PTR _addreg0$[ebp]
	push	eax
	push	4
	call	_asm_add
	add	esp, 8
; Line 594
$L880:
	cmp	DWORD PTR _addreg1$[ebp], 0
	je	$L881
; Line 595
	mov	eax, DWORD PTR _addreg1$[ebp]
	push	eax
	push	4
	call	_asm_add
	add	esp, 8
; Line 598
$L881:
	lea	eax, DWORD PTR _latehalf$[ebp]
	push	eax
	lea	eax, DWORD PTR _latehalf$[ebp]
	push	eax
	call	_singlemove_string
	add	esp, 4
	push	eax
	call	_output_asm_insn
	add	esp, 8
; Line 601
	cmp	DWORD PTR _addreg0$[ebp], 0
	je	$L882
; Line 602
	mov	eax, DWORD PTR _addreg0$[ebp]
	push	eax
	push	-4					; fffffffcH
	call	_asm_add
	add	esp, 8
; Line 603
$L882:
	cmp	DWORD PTR _addreg1$[ebp], 0
	je	$L883
; Line 604
	mov	eax, DWORD PTR _addreg1$[ebp]
	push	eax
	push	-4					; fffffffcH
	call	_asm_add
	add	esp, 8
; Line 606
$L883:
	mov	eax, OFFSET FLAT:$SG884
	jmp	$L814
; Line 607
$L814:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_output_move_double ENDP
_TEXT	ENDS
PUBLIC	_standard_80387_constant_p
EXTRN	__fltused:NEAR
CONST	SEGMENT
$T2371	DQ	00000000000000000r		; 0
$T2372	DQ	03ff0000000000000r		; 1
CONST	ENDS
_TEXT	SEGMENT
_x$ = 8
_u$ = -8
_d$ = -16
_standard_80387_constant_p PROC NEAR
; Line 612
	push	ebp
	mov	ebp, esp
	sub	esp, 16					; 00000010H
	push	ebx
	push	esi
	push	edi
; Line 615
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _u$[ebp], eax
; Line 616
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _u$[ebp+4], eax
; Line 617
	mov	eax, DWORD PTR _u$[ebp+4]
	mov	DWORD PTR _d$[ebp+4], eax
	mov	eax, DWORD PTR _u$[ebp]
	mov	DWORD PTR _d$[ebp], eax
; Line 619
	fld	QWORD PTR _d$[ebp]
	fcomp	QWORD PTR $T2371
	fnstsw	ax
	test	ah, 64					; 00000040H
	je	$L891
; Line 620
	mov	eax, 1
	jmp	$L887
; Line 621
$L891:
	fld	QWORD PTR _d$[ebp]
	fcomp	QWORD PTR $T2372
	fnstsw	ax
	test	ah, 64					; 00000040H
	je	$L892
; Line 622
	mov	eax, 2
	jmp	$L887
; Line 627
$L892:
	sub	eax, eax
	jmp	$L887
; Line 628
$L887:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_standard_80387_constant_p ENDP
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+3
$SG907	DB	'fldz', 00H
	ORG $+3
$SG909	DB	'fld1', 00H
_DATA	ENDS
_TEXT	SEGMENT
_operands$ = 8
_conval$905 = -4
_u1$912 = -16
_u2$914 = -8
_output_move_const_single PROC NEAR
; Line 653
	push	ebp
	mov	ebp, esp
	sub	esp, 16					; 00000010H
	push	ebx
	push	esi
	push	edi
; Line 654
	mov	eax, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L904
	mov	eax, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [eax]
	cmp	DWORD PTR [eax+4], 8
	jl	$L904
	mov	eax, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [eax]
	cmp	DWORD PTR [eax+4], 10			; 0000000aH
	jge	$L904
; Line 656
	mov	eax, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	call	_standard_80387_constant_p
	add	esp, 4
	mov	DWORD PTR _conval$905[ebp], eax
; Line 659
	cmp	DWORD PTR _conval$905[ebp], 1
	jne	$L906
; Line 660
	mov	eax, OFFSET FLAT:$SG907
	jmp	$L903
; Line 661
$L906:
	cmp	DWORD PTR _conval$905[ebp], 2
	jne	$L908
; Line 662
	mov	eax, OFFSET FLAT:$SG909
	jmp	$L903
; Line 664
$L908:
; Line 665
$L904:
	mov	eax, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2031616				; 001f0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L910
; Line 669
	mov	eax, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+12]
	mov	DWORD PTR _u1$912[ebp], eax
; Line 670
	mov	eax, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+16]
	mov	DWORD PTR _u1$912[ebp+4], eax
; Line 671
	fld	QWORD PTR _u1$912[ebp]
	fstp	DWORD PTR _u2$914[ebp]
; Line 672
	mov	eax, DWORD PTR _u2$914[ebp]
	push	eax
	push	0
	push	30					; 0000001eH
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	mov	ecx, DWORD PTR _operands$[ebp]
	mov	DWORD PTR [ecx+4], eax
; Line 674
$L910:
	mov	eax, DWORD PTR _operands$[ebp]
	push	eax
	call	_singlemove_string
	add	esp, 4
	jmp	$L903
; Line 675
$L903:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_output_move_const_single ENDP
_TEXT	ENDS
PUBLIC	_output_movsf
_TEXT	SEGMENT
_to$ = 8
_from$ = 12
_xops$ = -8
_output_movsf PROC NEAR
; Line 684
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	push	ebx
	push	esi
	push	edi
; Line 686
	mov	eax, DWORD PTR _to$[ebp]
	mov	DWORD PTR _xops$[ebp], eax
; Line 687
	mov	eax, DWORD PTR _from$[ebp]
	mov	DWORD PTR _xops$[ebp+4], eax
; Line 688
	mov	eax, DWORD PTR _from$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L922
	mov	eax, DWORD PTR _from$[ebp]
	cmp	DWORD PTR [eax+4], 8
	jl	$L923
	mov	eax, DWORD PTR _from$[ebp]
	cmp	DWORD PTR [eax+4], 10			; 0000000aH
	jl	$L921
$L923:
$L922:
	mov	eax, DWORD PTR _to$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L920
	mov	eax, DWORD PTR _to$[ebp]
	cmp	DWORD PTR [eax+4], 8
	jl	$L920
	mov	eax, DWORD PTR _to$[ebp]
	cmp	DWORD PTR [eax+4], 10			; 0000000aH
	jge	$L920
$L921:
; Line 690
	mov	eax, DWORD PTR _xops$[ebp+4]
	mov	DWORD PTR _from$[ebp], eax
; Line 693
$L920:
	mov	eax, DWORD PTR _from$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L924
	mov	eax, DWORD PTR _from$[ebp]
	cmp	DWORD PTR [eax+4], 8
	jl	$L924
	mov	eax, DWORD PTR _from$[ebp]
	cmp	DWORD PTR [eax+4], 10			; 0000000aH
	jge	$L924
; Line 705
	mov	eax, DWORD PTR _to$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L926
	mov	eax, DWORD PTR _to$[ebp]
	cmp	DWORD PTR [eax+4], 8
	jl	$L927
	mov	eax, DWORD PTR _to$[ebp]
	cmp	DWORD PTR [eax+4], 10			; 0000000aH
	jl	$L925
$L927:
$L926:
; Line 706
	mov	eax, DWORD PTR _to$[ebp]
	push	eax
	call	_fp_pop_sf
	add	esp, 4
; Line 707
$L925:
; Line 708
	jmp	$L928
$L924:
	mov	eax, DWORD PTR _to$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L929
	mov	eax, DWORD PTR _to$[ebp]
	cmp	DWORD PTR [eax+4], 8
	jl	$L929
	mov	eax, DWORD PTR _to$[ebp]
	cmp	DWORD PTR [eax+4], 10			; 0000000aH
	jge	$L929
; Line 709
	mov	eax, DWORD PTR _from$[ebp]
	push	eax
	call	_fp_push_sf
	add	esp, 4
; Line 710
	jmp	$L930
$L929:
; Line 711
	lea	eax, DWORD PTR _xops$[ebp]
	push	eax
	lea	eax, DWORD PTR _xops$[ebp]
	push	eax
	call	_singlemove_string
	add	esp, 4
	push	eax
	call	_output_asm_insn
	add	esp, 8
$L930:
$L928:
; Line 712
$L918:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_output_movsf ENDP
_TEXT	ENDS
PUBLIC	_output_movdf
_TEXT	SEGMENT
_to$ = 8
_from$ = 12
_xops$ = -8
_output_movdf PROC NEAR
; Line 721
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	push	ebx
	push	esi
	push	edi
; Line 723
	mov	eax, DWORD PTR _to$[ebp]
	mov	DWORD PTR _xops$[ebp], eax
; Line 724
	mov	eax, DWORD PTR _from$[ebp]
	mov	DWORD PTR _xops$[ebp+4], eax
; Line 725
	mov	eax, DWORD PTR _from$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L938
	mov	eax, DWORD PTR _from$[ebp]
	cmp	DWORD PTR [eax+4], 8
	jl	$L939
	mov	eax, DWORD PTR _from$[ebp]
	cmp	DWORD PTR [eax+4], 10			; 0000000aH
	jl	$L937
$L939:
$L938:
	mov	eax, DWORD PTR _to$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L936
	mov	eax, DWORD PTR _to$[ebp]
	cmp	DWORD PTR [eax+4], 8
	jl	$L936
	mov	eax, DWORD PTR _to$[ebp]
	cmp	DWORD PTR [eax+4], 10			; 0000000aH
	jge	$L936
$L937:
; Line 727
	mov	eax, DWORD PTR _xops$[ebp+4]
	mov	DWORD PTR _from$[ebp], eax
; Line 728
	mov	eax, DWORD PTR _xops$[ebp]
	mov	DWORD PTR _to$[ebp], eax
; Line 730
$L936:
	mov	eax, DWORD PTR _from$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L940
	mov	eax, DWORD PTR _from$[ebp]
	cmp	DWORD PTR [eax+4], 8
	jl	$L940
	mov	eax, DWORD PTR _from$[ebp]
	cmp	DWORD PTR [eax+4], 10			; 0000000aH
	jge	$L940
; Line 741
	mov	eax, DWORD PTR _to$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L942
	mov	eax, DWORD PTR _to$[ebp]
	cmp	DWORD PTR [eax+4], 8
	jl	$L943
	mov	eax, DWORD PTR _to$[ebp]
	cmp	DWORD PTR [eax+4], 10			; 0000000aH
	jl	$L941
$L943:
$L942:
; Line 742
	mov	eax, DWORD PTR _to$[ebp]
	push	eax
	call	_fp_pop_df
	add	esp, 4
; Line 743
$L941:
; Line 744
	jmp	$L944
$L940:
	mov	eax, DWORD PTR _to$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L945
	mov	eax, DWORD PTR _to$[ebp]
	cmp	DWORD PTR [eax+4], 8
	jl	$L945
	mov	eax, DWORD PTR _to$[ebp]
	cmp	DWORD PTR [eax+4], 10			; 0000000aH
	jge	$L945
; Line 745
	mov	eax, DWORD PTR _from$[ebp]
	push	eax
	call	_fp_push_df
	add	esp, 4
; Line 746
	jmp	$L946
$L945:
; Line 747
	lea	eax, DWORD PTR _xops$[ebp]
	push	eax
	lea	eax, DWORD PTR _xops$[ebp]
	push	eax
	call	_output_move_double
	add	esp, 4
	push	eax
	call	_output_asm_insn
	add	esp, 8
$L946:
$L944:
; Line 748
$L934:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_output_movdf ENDP
_to$ = 8
_from$ = 12
_output_movf PROC NEAR
; Line 756
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 757
	mov	eax, DWORD PTR _from$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	mov	ecx, 167772160				; 0a000000H
	and	ecx, -16777216				; ff000000H
	cmp	eax, ecx
	je	$L951
	mov	eax, DWORD PTR _to$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	mov	ecx, 167772160				; 0a000000H
	and	ecx, -16777216				; ff000000H
	cmp	eax, ecx
	jne	$L950
$L951:
; Line 758
	mov	eax, DWORD PTR _from$[ebp]
	push	eax
	mov	eax, DWORD PTR _to$[ebp]
	push	eax
	call	_output_movsf
	add	esp, 8
; Line 759
	jmp	$L952
$L950:
; Line 760
	mov	eax, DWORD PTR _from$[ebp]
	push	eax
	mov	eax, DWORD PTR _to$[ebp]
	push	eax
	call	_output_movdf
	add	esp, 8
$L952:
; Line 761
$L949:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_output_movf ENDP
_TEXT	ENDS
PUBLIC	_function_prologue
EXTRN	_frame_pointer_rtx:DWORD
EXTRN	_regs_ever_live:TBYTE
EXTRN	_call_used_regs:TBYTE
EXTRN	_frame_pointer_needed:DWORD
_DATA	SEGMENT
	ORG $+3
$SG963	DB	'push%L0 %1', 00H
	ORG $+1
$SG964	DB	'mov%L0 %0,%1', 00H
	ORG $+3
$SG966	DB	'sub%L0 %2,%0', 00H
	ORG $+3
$SG971	DB	'%', 00H
	ORG $+2
$SG972	DB	'l', 00H
	ORG $+2
$SG973	DB	09H, 'push%s %se%s', 0aH, 00H
_DATA	ENDS
_TEXT	SEGMENT
_xops$ = -24
_file$ = 8
_size$ = 12
_regno$ = -28
_nregs$ = -8
_limit$ = -4
_function_prologue PROC NEAR
; Line 770
	push	ebp
	mov	ebp, esp
	sub	esp, 28					; 0000001cH
	push	ebx
	push	esi
	push	edi
; Line 777
	mov	eax, DWORD PTR _stack_pointer_rtx
	mov	DWORD PTR _xops$[ebp], eax
; Line 778
	mov	eax, DWORD PTR _frame_pointer_rtx
	mov	DWORD PTR _xops$[ebp+4], eax
; Line 779
	mov	eax, DWORD PTR _size$[ebp]
	push	eax
	push	0
	push	30					; 0000001eH
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _xops$[ebp+8], eax
; Line 780
	cmp	DWORD PTR _frame_pointer_needed, 0
	je	$L962
; Line 782
	lea	eax, DWORD PTR _xops$[ebp]
	push	eax
	push	OFFSET FLAT:$SG963
	call	_output_asm_insn
	add	esp, 8
; Line 783
	lea	eax, DWORD PTR _xops$[ebp]
	push	eax
	push	OFFSET FLAT:$SG964
	call	_output_asm_insn
	add	esp, 8
; Line 784
	cmp	DWORD PTR _size$[ebp], 0
	je	$L965
; Line 785
	lea	eax, DWORD PTR _xops$[ebp]
	push	eax
	push	OFFSET FLAT:$SG966
	call	_output_asm_insn
	add	esp, 8
; Line 786
$L965:
; Line 797
$L962:
	mov	DWORD PTR _nregs$[ebp], 0
; Line 798
	cmp	DWORD PTR _frame_pointer_needed, 1
	sbb	eax, eax
	and	eax, 1
	add	eax, 6
	mov	DWORD PTR _limit$[ebp], eax
; Line 799
	mov	eax, DWORD PTR _limit$[ebp]
	dec	eax
	mov	DWORD PTR _regno$[ebp], eax
	jmp	$L967
$L968:
	dec	DWORD PTR _regno$[ebp]
$L967:
	cmp	DWORD PTR _regno$[ebp], 0
	jl	$L969
; Line 800
	mov	eax, DWORD PTR _regno$[ebp]
	movsx	eax, BYTE PTR _regs_ever_live[eax]
	or	eax, eax
	je	$L970
	mov	eax, DWORD PTR _regno$[ebp]
	movsx	eax, BYTE PTR _call_used_regs[eax]
	or	eax, eax
	jne	$L970
; Line 802
	mov	eax, DWORD PTR _regno$[ebp]
	mov	eax, DWORD PTR _hi_reg_name$S626[eax*4]
	push	eax
	push	OFFSET FLAT:$SG971
	push	OFFSET FLAT:$SG972
	push	OFFSET FLAT:$SG973
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	call	_fprintf
	add	esp, 20					; 00000014H
; Line 804
$L970:
	jmp	$L968
$L969:
$L956:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_function_prologue ENDP
_TEXT	ENDS
PUBLIC	_function_epilogue
EXTRN	_current_function_args_size:DWORD
EXTRN	_current_function_pops_args:DWORD
EXTRN	_current_function_returns_struct:DWORD
EXTRN	_frame_pointer_needed:DWORD
_DATA	SEGMENT
	ORG $+1
$SG991	DB	'lea%L0 %0,%1', 00H
	ORG $+3
$SG996	DB	'l', 00H
	ORG $+2
$SG997	DB	09H, 'pop%s ', 00H
$SG998	DB	'%', 00H
	ORG $+2
$SG999	DB	'%se%s', 0aH, 00H
	ORG $+1
$SG1001	DB	09H, 'leave', 0aH, 00H
$SG1003	DB	'$', 00H
	ORG $+2
$SG1004	DB	09H, 'ret %s%d', 0aH, 00H
	ORG $+1
$SG1007	DB	'$', 00H
	ORG $+2
$SG1008	DB	09H, 'ret %s%d', 0aH, 00H
	ORG $+1
$SG1010	DB	09H, 'ret', 0aH, 00H
_DATA	ENDS
_TEXT	SEGMENT
_file$ = 8
_size$ = 12
_regno$ = -16
_nregs$ = -12
_limit$ = -8
_return_struct_adjust$ = -4
_xops$990 = -28
_function_epilogue PROC NEAR
; Line 810
	push	ebp
	mov	ebp, esp
	sub	esp, 28					; 0000001cH
	push	ebx
	push	esi
	push	edi
; Line 820
	cmp	DWORD PTR _frame_pointer_needed, 1
	sbb	eax, eax
	and	eax, 1
	add	eax, 6
	mov	DWORD PTR _limit$[ebp], eax
; Line 821
	mov	DWORD PTR _nregs$[ebp], 0
; Line 828
	cmp	DWORD PTR _current_function_returns_struct, 1
	cmc
	sbb	eax, eax
	and	eax, 4
	mov	DWORD PTR _return_struct_adjust$[ebp], eax
; Line 830
	mov	eax, DWORD PTR _limit$[ebp]
	dec	eax
	mov	DWORD PTR _regno$[ebp], eax
	jmp	$L985
$L986:
	dec	DWORD PTR _regno$[ebp]
$L985:
	cmp	DWORD PTR _regno$[ebp], 0
	jl	$L987
; Line 831
	mov	eax, DWORD PTR _regno$[ebp]
	movsx	eax, BYTE PTR _regs_ever_live[eax]
	or	eax, eax
	je	$L988
	mov	eax, DWORD PTR _regno$[ebp]
	movsx	eax, BYTE PTR _call_used_regs[eax]
	or	eax, eax
	jne	$L988
; Line 832
	inc	DWORD PTR _nregs$[ebp]
; Line 837
$L988:
	jmp	$L986
$L987:
	cmp	DWORD PTR _nregs$[ebp], 0
	je	$L989
	cmp	DWORD PTR _frame_pointer_needed, 0
	je	$L989
; Line 841
	mov	eax, DWORD PTR _size$[ebp]
	neg	eax
	mov	ecx, DWORD PTR _nregs$[ebp]
	shl	ecx, 2
	sub	eax, ecx
	push	eax
	mov	eax, DWORD PTR _frame_pointer_rtx
	push	eax
	push	4
	push	37					; 00000025H
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	push	eax
	call	_adj_offsettable_operand
	add	esp, 8
	mov	DWORD PTR _xops$990[ebp], eax
; Line 842
	mov	eax, DWORD PTR _stack_pointer_rtx
	mov	DWORD PTR _xops$990[ebp+4], eax
; Line 843
	lea	eax, DWORD PTR _xops$990[ebp]
	push	eax
	push	OFFSET FLAT:$SG991
	call	_output_asm_insn
	add	esp, 8
; Line 845
$L989:
	mov	DWORD PTR _regno$[ebp], 0
	jmp	$L992
$L993:
	inc	DWORD PTR _regno$[ebp]
$L992:
	mov	eax, DWORD PTR _regno$[ebp]
	cmp	DWORD PTR _limit$[ebp], eax
	jle	$L994
; Line 847
	mov	eax, DWORD PTR _regno$[ebp]
	movsx	eax, BYTE PTR _regs_ever_live[eax]
	or	eax, eax
	je	$L995
	mov	eax, DWORD PTR _regno$[ebp]
	movsx	eax, BYTE PTR _call_used_regs[eax]
	or	eax, eax
	jne	$L995
; Line 849
	push	OFFSET FLAT:$SG996
	push	OFFSET FLAT:$SG997
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	call	_fprintf
	add	esp, 12					; 0000000cH
; Line 850
	mov	eax, DWORD PTR _regno$[ebp]
	mov	eax, DWORD PTR _hi_reg_name$S626[eax*4]
	push	eax
	push	OFFSET FLAT:$SG998
	push	OFFSET FLAT:$SG999
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	call	_fprintf
	add	esp, 16					; 00000010H
; Line 852
$L995:
	jmp	$L993
$L994:
; Line 854
	cmp	DWORD PTR _frame_pointer_needed, 0
	je	$L1000
; Line 855
	push	OFFSET FLAT:$SG1001
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	call	_fprintf
	add	esp, 8
; Line 856
$L1000:
	cmp	DWORD PTR _current_function_pops_args, 0
	je	$L1002
	cmp	DWORD PTR _current_function_args_size, 0
	je	$L1002
; Line 858
	mov	eax, DWORD PTR _return_struct_adjust$[ebp]
	add	eax, DWORD PTR _current_function_args_size
	push	eax
	push	OFFSET FLAT:$SG1003
	push	OFFSET FLAT:$SG1004
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	call	_fprintf
	add	esp, 16					; 00000010H
; Line 859
	jmp	$L1005
$L1002:
	cmp	DWORD PTR _return_struct_adjust$[ebp], 0
	je	$L1006
; Line 860
	mov	eax, DWORD PTR _return_struct_adjust$[ebp]
	push	eax
	push	OFFSET FLAT:$SG1007
	push	OFFSET FLAT:$SG1008
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	call	_fprintf
	add	esp, 16					; 00000010H
; Line 861
	jmp	$L1009
$L1006:
; Line 862
	push	OFFSET FLAT:$SG1010
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	call	_fprintf
	add	esp, 8
$L1009:
$L1005:
; Line 863
$L977:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_function_epilogue ENDP
_TEXT	ENDS
PUBLIC	_hard_regno_mode_ok
_TEXT	SEGMENT
_regno$ = 8
_mode$ = 12
_hard_regno_mode_ok PROC NEAR
; Line 869
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 875
	cmp	DWORD PTR _regno$[ebp], 2
	jl	$L2374
	cmp	DWORD PTR _regno$[ebp], 4
	jl	$L2376
	cmp	DWORD PTR _regno$[ebp], 8
	jl	$L2378
	cmp	DWORD PTR _mode$[ebp], 11		; 0000000bH
	je	$L2382
	cmp	DWORD PTR _mode$[ebp], 10		; 0000000aH
	jne	$L2380
$L2382:
	mov	eax, 1
	jmp	$L2381
$L2380:
	sub	eax, eax
$L2381:
	jmp	$L2379
$L2378:
	mov	eax, DWORD PTR _mode$[ebp]
	dec	eax
	cmp	eax, 1
	sbb	eax, eax
	inc	eax
$L2379:
	jmp	$L2377
$L2376:
	mov	eax, 1
$L2377:
	jmp	$L2375
$L2374:
	mov	eax, 1
$L2375:
	jmp	$L1014
; Line 876
$L1014:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_hard_regno_mode_ok ENDP
_TEXT	ENDS
PUBLIC	_print_operand
EXTRN	_fputs:NEAR
EXTRN	_output_addr_const:NEAR
EXTRN	_output_address:NEAR
_DATA	SEGMENT
	ORG $+2
$SG1033	DB	'%', 00H
	ORG $+2
$SG1034	DB	'%s', 00H
	ORG $+1
$SG1053	DB	'%', 00H
	ORG $+2
$SG1054	DB	'%s', 00H
	ORG $+1
$SG1063	DB	'e', 00H
	ORG $+2
$SG1080	DB	'%.22e', 00H
	ORG $+2
$SG1082	DB	'$', 00H
	ORG $+2
$SG1083	DB	'0x%x', 00H
	ORG $+3
$SG1088	DB	'%.22e', 00H
	ORG $+2
$SG1092	DB	'$', 00H
	ORG $+2
$SG1096	DB	'$', 00H
_DATA	ENDS
_TEXT	SEGMENT
_u$1076 = -8
_u1$1078 = -12
_file$ = 8
_x$ = 12
_code$ = 16
_u$1087 = -20
_print_operand PROC NEAR
; Line 917
	push	ebp
	mov	ebp, esp
	sub	esp, 36					; 00000024H
	push	ebx
	push	esi
	push	edi
; Line 918
	cmp	DWORD PTR _code$[ebp], 0
	je	$L1020
; Line 920
	mov	eax, DWORD PTR _code$[ebp]
	mov	DWORD PTR -28+[ebp], eax
	jmp	$L1021
; Line 922
$L1025:
; Line 924
	mov	eax, DWORD PTR _file$[ebp]
	dec	DWORD PTR [eax+4]
	mov	eax, DWORD PTR _file$[ebp]
	cmp	DWORD PTR [eax+4], 0
	jl	$L2383
	mov	eax, DWORD PTR _file$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	BYTE PTR [eax], 42			; 0000002aH
	mov	eax, DWORD PTR _file$[ebp]
	inc	DWORD PTR [eax]
	jmp	$L2384
$L2383:
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	push	42					; 0000002aH
	call	__flsbuf
	add	esp, 8
$L2384:
; Line 925
$L1026:
	jmp	$L1019
; Line 927
$L1027:
; Line 928
	mov	eax, DWORD PTR _file$[ebp]
	dec	DWORD PTR [eax+4]
	mov	eax, DWORD PTR _file$[ebp]
	cmp	DWORD PTR [eax+4], 0
	jl	$L2385
	mov	eax, DWORD PTR _file$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	BYTE PTR [eax], 108			; 0000006cH
	mov	eax, DWORD PTR _file$[ebp]
	inc	DWORD PTR [eax]
	jmp	$L2386
$L2385:
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	push	108					; 0000006cH
	call	__flsbuf
	add	esp, 8
$L2386:
; Line 929
	jmp	$L1019
; Line 931
$L1028:
; Line 932
	mov	eax, DWORD PTR _file$[ebp]
	dec	DWORD PTR [eax+4]
	mov	eax, DWORD PTR _file$[ebp]
	cmp	DWORD PTR [eax+4], 0
	jl	$L2387
	mov	eax, DWORD PTR _file$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	BYTE PTR [eax], 119			; 00000077H
	mov	eax, DWORD PTR _file$[ebp]
	inc	DWORD PTR [eax]
	jmp	$L2388
$L2387:
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	push	119					; 00000077H
	call	__flsbuf
	add	esp, 8
$L2388:
; Line 933
	jmp	$L1019
; Line 935
$L1029:
; Line 936
	mov	eax, DWORD PTR _file$[ebp]
	dec	DWORD PTR [eax+4]
	mov	eax, DWORD PTR _file$[ebp]
	cmp	DWORD PTR [eax+4], 0
	jl	$L2389
	mov	eax, DWORD PTR _file$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	BYTE PTR [eax], 98			; 00000062H
	mov	eax, DWORD PTR _file$[ebp]
	inc	DWORD PTR [eax]
	jmp	$L2390
$L2389:
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	push	98					; 00000062H
	call	__flsbuf
	add	esp, 8
$L2390:
; Line 937
	jmp	$L1019
; Line 939
$L1030:
; Line 940
	mov	eax, DWORD PTR _file$[ebp]
	dec	DWORD PTR [eax+4]
	mov	eax, DWORD PTR _file$[ebp]
	cmp	DWORD PTR [eax+4], 0
	jl	$L2391
	mov	eax, DWORD PTR _file$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	BYTE PTR [eax], 108			; 0000006cH
	mov	eax, DWORD PTR _file$[ebp]
	inc	DWORD PTR [eax]
	jmp	$L2392
$L2391:
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	push	108					; 0000006cH
	call	__flsbuf
	add	esp, 8
$L2392:
; Line 941
	jmp	$L1019
; Line 943
$L1031:
; Line 944
	mov	eax, DWORD PTR _file$[ebp]
	dec	DWORD PTR [eax+4]
	mov	eax, DWORD PTR _file$[ebp]
	cmp	DWORD PTR [eax+4], 0
	jl	$L2393
	mov	eax, DWORD PTR _file$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	BYTE PTR [eax], 115			; 00000073H
	mov	eax, DWORD PTR _file$[ebp]
	inc	DWORD PTR [eax]
	jmp	$L2394
$L2393:
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	push	115					; 00000073H
	call	__flsbuf
	add	esp, 8
$L2394:
; Line 945
	jmp	$L1019
; Line 947
$L1032:
; Line 948
	push	OFFSET FLAT:$SG1033
	push	OFFSET FLAT:$SG1034
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	call	_fprintf
	add	esp, 12					; 0000000cH
; Line 949
	jmp	$L1019
; Line 951
$L1035:
; Line 953
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	sar	eax, 22					; 00000016H
	mov	eax, DWORD PTR _mode_size[eax]
	mov	DWORD PTR -32+[ebp], eax
	jmp	$L1036
; Line 955
$L1040:
; Line 956
	mov	eax, DWORD PTR _file$[ebp]
	dec	DWORD PTR [eax+4]
	mov	eax, DWORD PTR _file$[ebp]
	cmp	DWORD PTR [eax+4], 0
	jl	$L2395
	mov	eax, DWORD PTR _file$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	BYTE PTR [eax], 119			; 00000077H
	mov	eax, DWORD PTR _file$[ebp]
	inc	DWORD PTR [eax]
	jmp	$L2396
$L2395:
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	push	119					; 00000077H
	call	__flsbuf
	add	esp, 8
$L2396:
; Line 957
	jmp	$L1019
; Line 958
$L1041:
; Line 959
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	mov	ecx, 167772160				; 0a000000H
	and	ecx, -16777216				; ff000000H
	cmp	eax, ecx
	jne	$L1042
; Line 961
	mov	eax, DWORD PTR _file$[ebp]
	dec	DWORD PTR [eax+4]
	mov	eax, DWORD PTR _file$[ebp]
	cmp	DWORD PTR [eax+4], 0
	jl	$L2397
	mov	eax, DWORD PTR _file$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	BYTE PTR [eax], 115			; 00000073H
	mov	eax, DWORD PTR _file$[ebp]
	inc	DWORD PTR [eax]
	jmp	$L2398
$L2397:
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	push	115					; 00000073H
	call	__flsbuf
	add	esp, 8
$L2398:
; Line 962
	jmp	$L1019
; Line 964
	jmp	$L1043
$L1042:
; Line 965
	mov	eax, DWORD PTR _file$[ebp]
	dec	DWORD PTR [eax+4]
	mov	eax, DWORD PTR _file$[ebp]
	cmp	DWORD PTR [eax+4], 0
	jl	$L2399
	mov	eax, DWORD PTR _file$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	BYTE PTR [eax], 108			; 0000006cH
	mov	eax, DWORD PTR _file$[ebp]
	inc	DWORD PTR [eax]
	jmp	$L2400
$L2399:
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	push	108					; 0000006cH
	call	__flsbuf
	add	esp, 8
$L2400:
$L1043:
; Line 966
	jmp	$L1019
; Line 967
$L1044:
; Line 968
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1046
	mov	eax, DWORD PTR _x$[ebp]
	cmp	DWORD PTR [eax+4], 8
	jl	$L1047
	mov	eax, DWORD PTR _x$[ebp]
	cmp	DWORD PTR [eax+4], 10			; 0000000aH
	jl	$L1045
$L1047:
$L1046:
	mov	eax, DWORD PTR _file$[ebp]
	dec	DWORD PTR [eax+4]
	mov	eax, DWORD PTR _file$[ebp]
	cmp	DWORD PTR [eax+4], 0
	jl	$L2401
	mov	eax, DWORD PTR _file$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	BYTE PTR [eax], 108			; 0000006cH
	mov	eax, DWORD PTR _file$[ebp]
	inc	DWORD PTR [eax]
	jmp	$L2402
$L2401:
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	push	108					; 0000006cH
	call	__flsbuf
	add	esp, 8
$L2402:
; Line 969
$L1045:
	jmp	$L1019
; Line 970
$L1048:
; Line 971
	mov	eax, DWORD PTR _file$[ebp]
	dec	DWORD PTR [eax+4]
	mov	eax, DWORD PTR _file$[ebp]
	cmp	DWORD PTR [eax+4], 0
	jl	$L2403
	mov	eax, DWORD PTR _file$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	BYTE PTR [eax], 98			; 00000062H
	mov	eax, DWORD PTR _file$[ebp]
	inc	DWORD PTR [eax]
	jmp	$L2404
$L2403:
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	push	98					; 00000062H
	call	__flsbuf
	add	esp, 8
$L2404:
; Line 972
	jmp	$L1019
; Line 973
	jmp	$L1037
$L1036:
	cmp	DWORD PTR -32+[ebp], 1
	je	$L1048
	cmp	DWORD PTR -32+[ebp], 2
	je	$L1040
	cmp	DWORD PTR -32+[ebp], 4
	je	$L1041
	cmp	DWORD PTR -32+[ebp], 8
	je	$L1044
	jmp	$L1037
$L1037:
; Line 974
	jmp	$L1022
$L1021:
	cmp	DWORD PTR -28+[ebp], 82			; 00000052H
	jg	$L2411
	je	$L1032
	cmp	DWORD PTR -28+[ebp], 42			; 0000002aH
	je	$L1025
	cmp	DWORD PTR -28+[ebp], 66			; 00000042H
	je	$L1029
	cmp	DWORD PTR -28+[ebp], 76			; 0000004cH
	je	$L1027
	cmp	DWORD PTR -28+[ebp], 81			; 00000051H
	je	$L1030
	jmp	$L1022
$L2411:
	cmp	DWORD PTR -28+[ebp], 83			; 00000053H
	je	$L1031
	cmp	DWORD PTR -28+[ebp], 87			; 00000057H
	je	$L1028
	cmp	DWORD PTR -28+[ebp], 122		; 0000007aH
	je	$L1035
	jmp	$L1022
$L1022:
; Line 976
$L1020:
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1049
; Line 978
$L1050:
	push	OFFSET FLAT:$SG1053
	push	OFFSET FLAT:$SG1054
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	call	_fprintf
	add	esp, 12					; 0000000cH
	cmp	DWORD PTR _code$[ebp], 119		; 00000077H
	jne	$L2405
	mov	DWORD PTR -24+[ebp], 2
	jmp	$L2406
$L2405:
	cmp	DWORD PTR _code$[ebp], 98		; 00000062H
	jne	$L2407
	mov	DWORD PTR -24+[ebp], 1
	jmp	$L2408
$L2407:
	cmp	DWORD PTR _code$[ebp], 107		; 0000006bH
	jne	$L2409
	mov	DWORD PTR -24+[ebp], 4
	jmp	$L2410
$L2409:
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	sar	eax, 22					; 00000016H
	mov	eax, DWORD PTR _mode_size[eax]
	mov	DWORD PTR -24+[ebp], eax
$L2410:
$L2408:
$L2406:
	mov	eax, DWORD PTR -24+[ebp]
	mov	DWORD PTR -36+[ebp], eax
	jmp	$L1055
$L1059:
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1061
	mov	eax, DWORD PTR _x$[ebp]
	cmp	DWORD PTR [eax+4], 8
	jl	$L1062
	mov	eax, DWORD PTR _x$[ebp]
	cmp	DWORD PTR [eax+4], 10			; 0000000aH
	jl	$L1060
$L1062:
$L1061:
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	push	OFFSET FLAT:$SG1063
	call	_fputs
	add	esp, 8
$L1060:
$L1064:
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR _hi_reg_name$S626[eax*4]
	push	eax
	call	_fputs
	add	esp, 8
	jmp	$L1056
$L1065:
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR _qi_reg_name$S637[eax*4]
	push	eax
	call	_fputs
	add	esp, 8
	jmp	$L1056
	jmp	$L1056
$L1055:
	cmp	DWORD PTR -36+[ebp], 1
	je	$L1065
	cmp	DWORD PTR -36+[ebp], 2
	je	$L1064
	cmp	DWORD PTR -36+[ebp], 4
	je	$L1059
	cmp	DWORD PTR -36+[ebp], 8
	je	$L1059
	jmp	$L1056
$L1056:
$L1051:
$L1052:
; Line 980
	jmp	$L1066
$L1049:
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2424832				; 00250000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1067
; Line 983
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2490368				; 00260000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1069
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2555904				; 00270000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1069
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1069
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2097152				; 00200000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1068
$L1069:
; Line 984
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	call	_output_addr_const
	add	esp, 8
; Line 985
	jmp	$L1071
$L1068:
; Line 986
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	call	_output_address
	add	esp, 4
$L1071:
; Line 988
	jmp	$L1073
$L1067:
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2031616				; 001f0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1074
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	mov	ecx, 167772160				; 0a000000H
	and	ecx, -16777216				; ff000000H
	cmp	eax, ecx
	jne	$L1074
; Line 992
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	DWORD PTR _u$1076[ebp], eax
; Line 993
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	DWORD PTR _u$1076[ebp+4], eax
; Line 994
	fld	QWORD PTR _u$1076[ebp]
	fstp	DWORD PTR _u1$1078[ebp]
; Line 995
	cmp	DWORD PTR _code$[ebp], 102		; 00000066H
	jne	$L1079
; Line 996
	fld	DWORD PTR _u1$1078[ebp]
	sub	esp, 8
	fstp	QWORD PTR [esp]
	push	OFFSET FLAT:$SG1080
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	call	_fprintf
	add	esp, 16					; 00000010H
; Line 997
	jmp	$L1081
$L1079:
; Line 999
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	push	OFFSET FLAT:$SG1082
	call	_fputs
	add	esp, 8
; Line 1000
	mov	eax, DWORD PTR _u1$1078[ebp]
	push	eax
	push	OFFSET FLAT:$SG1083
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	call	_fprintf
	add	esp, 12					; 0000000cH
; Line 1001
$L1081:
; Line 1003
	jmp	$L1084
$L1074:
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2031616				; 001f0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1085
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	mov	ecx, 184549376				; 0b000000H
	and	ecx, -16777216				; ff000000H
	cmp	eax, ecx
	jne	$L1085
; Line 1006
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	DWORD PTR _u$1087[ebp], eax
; Line 1007
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	DWORD PTR _u$1087[ebp+4], eax
; Line 1008
	mov	eax, DWORD PTR _u$1087[ebp+4]
	push	eax
	mov	eax, DWORD PTR _u$1087[ebp]
	push	eax
	push	OFFSET FLAT:$SG1088
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	call	_fprintf
	add	esp, 16					; 00000010H
; Line 1010
	jmp	$L1089
$L1085:
; Line 1012
	cmp	DWORD PTR _code$[ebp], 99		; 00000063H
	je	$L1090
; Line 1014
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1091
; Line 1015
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	push	OFFSET FLAT:$SG1092
	call	_fputs
	add	esp, 8
; Line 1016
	jmp	$L1093
$L1091:
; Line 1017
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2097152				; 00200000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1095
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2555904				; 00270000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1095
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2490368				; 00260000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1094
$L1095:
; Line 1018
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	push	OFFSET FLAT:$SG1096
	call	_fputs
	add	esp, 8
; Line 1019
$L1094:
$L1093:
; Line 1020
$L1090:
	mov	eax, DWORD PTR _x$[ebp]
	push	eax
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	call	_output_addr_const
	add	esp, 8
; Line 1021
$L1089:
$L1084:
$L1073:
$L1066:
; Line 1022
$L1019:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_print_operand ENDP
_TEXT	ENDS
PUBLIC	_print_operand_address
EXTRN	_reg_renumber:DWORD
EXTRN	_output_asm_label:NEAR
_DATA	SEGMENT
	ORG $+2
$SG1111	DB	'%', 00H
	ORG $+2
$SG1112	DB	'%se', 00H
$SG1153	DB	'%', 00H
	ORG $+2
$SG1154	DB	'%s', 00H
	ORG $+1
$SG1163	DB	'e', 00H
	ORG $+2
$SG1170	DB	',', 00H
	ORG $+2
$SG1174	DB	'%', 00H
	ORG $+2
$SG1175	DB	'%s', 00H
	ORG $+1
$SG1184	DB	'e', 00H
	ORG $+2
$SG1188	DB	',%d', 00H
$SG1197	DB	'%', 00H
	ORG $+2
$SG1198	DB	'%s', 00H
	ORG $+1
$SG1207	DB	'e', 00H
	ORG $+2
$SG1214	DB	',', 00H
	ORG $+2
$SG1218	DB	'%', 00H
	ORG $+2
$SG1219	DB	'%s', 00H
	ORG $+1
$SG1228	DB	'e', 00H
	ORG $+2
$SG1232	DB	',%d', 00H
$SG1235	DB	'%d', 00H
_DATA	ENDS
_TEXT	SEGMENT
_file$ = 8
_addr$ = 12
_reg1$ = -20
_reg2$ = -12
_breg$ = -4
_ireg$ = -16
_offset$ = -8
_scale$1190 = -28
_scale$1143 = -24
_print_operand_address PROC NEAR
; Line 1030
	push	ebp
	mov	ebp, esp
	sub	esp, 48					; 00000030H
	push	ebx
	push	esi
	push	edi
; Line 1034
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	sar	eax, 16					; 00000010H
	mov	DWORD PTR -32+[ebp], eax
	jmp	$L1106
; Line 1036
$L1110:
; Line 1037
	mov	eax, DWORD PTR _file$[ebp]
	dec	DWORD PTR [eax+4]
	mov	eax, DWORD PTR _file$[ebp]
	cmp	DWORD PTR [eax+4], 0
	jl	$L2412
	mov	eax, DWORD PTR _file$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	BYTE PTR [eax], 40			; 00000028H
	mov	eax, DWORD PTR _file$[ebp]
	inc	DWORD PTR [eax]
	jmp	$L2413
$L2412:
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	push	40					; 00000028H
	call	__flsbuf
	add	esp, 8
$L2413:
; Line 1038
	push	OFFSET FLAT:$SG1111
	push	OFFSET FLAT:$SG1112
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	call	_fprintf
	add	esp, 12					; 0000000cH
; Line 1039
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR _hi_reg_name$S626[eax*4]
	push	eax
	call	_fputs
	add	esp, 8
; Line 1040
	mov	eax, DWORD PTR _file$[ebp]
	dec	DWORD PTR [eax+4]
	mov	eax, DWORD PTR _file$[ebp]
	cmp	DWORD PTR [eax+4], 0
	jl	$L2414
	mov	eax, DWORD PTR _file$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	BYTE PTR [eax], 41			; 00000029H
	mov	eax, DWORD PTR _file$[ebp]
	inc	DWORD PTR [eax]
	jmp	$L2415
$L2414:
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	push	41					; 00000029H
	call	__flsbuf
	add	esp, 8
$L2415:
; Line 1041
	jmp	$L1107
; Line 1043
$L1113:
; Line 1044
	mov	DWORD PTR _reg1$[ebp], 0
; Line 1045
	mov	DWORD PTR _reg2$[ebp], 0
; Line 1046
	mov	DWORD PTR _ireg$[ebp], 0
; Line 1047
	mov	DWORD PTR _breg$[ebp], 0
; Line 1048
	mov	DWORD PTR _offset$[ebp], 0
; Line 1049
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2490368				; 00260000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1115
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2555904				; 00270000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1115
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1115
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2097152				; 00200000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1114
$L1115:
; Line 1051
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _offset$[ebp], eax
; Line 1052
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _addr$[ebp], eax
; Line 1054
	jmp	$L1116
$L1114:
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2490368				; 00260000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1118
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2555904				; 00270000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1118
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1118
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2097152				; 00200000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1117
$L1118:
; Line 1056
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _offset$[ebp], eax
; Line 1057
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _addr$[ebp], eax
; Line 1059
$L1117:
$L1116:
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2883584				; 002c0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1119
; Line 1060
	jmp	$L1120
$L1119:
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 3080192				; 002f0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1121
; Line 1062
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _reg1$[ebp], eax
; Line 1063
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _addr$[ebp], eax
; Line 1065
	jmp	$L1122
$L1121:
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 3080192				; 002f0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1123
; Line 1067
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _reg1$[ebp], eax
; Line 1068
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _addr$[ebp], eax
; Line 1070
	jmp	$L1124
$L1123:
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1125
; Line 1072
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _reg1$[ebp], eax
; Line 1073
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _addr$[ebp], eax
; Line 1075
	jmp	$L1126
$L1125:
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1127
; Line 1077
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _reg1$[ebp], eax
; Line 1078
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _addr$[ebp], eax
; Line 1080
$L1127:
$L1126:
$L1124:
$L1122:
$L1120:
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1129
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 3080192				; 002f0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1128
$L1129:
; Line 1082
	cmp	DWORD PTR _reg1$[ebp], 0
	jne	$L1130
	mov	eax, DWORD PTR _addr$[ebp]
	mov	DWORD PTR _reg1$[ebp], eax
; Line 1083
	jmp	$L1131
$L1130:
	mov	eax, DWORD PTR _addr$[ebp]
	mov	DWORD PTR _reg2$[ebp], eax
$L1131:
; Line 1084
	mov	DWORD PTR _addr$[ebp], 0
; Line 1086
$L1128:
	cmp	DWORD PTR _offset$[ebp], 0
	je	$L1132
; Line 1088
	cmp	DWORD PTR _addr$[ebp], 0
	je	$L1133
	call	_abort
; Line 1089
$L1133:
	mov	eax, DWORD PTR _offset$[ebp]
	mov	DWORD PTR _addr$[ebp], eax
; Line 1091
$L1132:
; Line 1092
	cmp	DWORD PTR _reg1$[ebp], 0
	je	$L1136
	mov	eax, DWORD PTR _reg1$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 3080192				; 002f0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1135
$L1136:
	cmp	DWORD PTR _reg2$[ebp], 0
	je	$L1134
	mov	eax, DWORD PTR _reg2$[ebp]
	cmp	DWORD PTR [eax+4], 7
	jle	$L1137
	mov	eax, DWORD PTR _reg2$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _reg_renumber
	movsx	eax, WORD PTR [ecx+eax*2]
	cmp	eax, 7
	ja	$L1134
$L1137:
$L1135:
; Line 1094
	mov	eax, DWORD PTR _reg2$[ebp]
	mov	DWORD PTR _breg$[ebp], eax
; Line 1095
	mov	eax, DWORD PTR _reg1$[ebp]
	mov	DWORD PTR _ireg$[ebp], eax
; Line 1097
	jmp	$L1138
$L1134:
	cmp	DWORD PTR _reg1$[ebp], 0
	je	$L1139
	mov	eax, DWORD PTR _reg1$[ebp]
	cmp	DWORD PTR [eax+4], 7
	jle	$L1140
	mov	eax, DWORD PTR _reg1$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _reg_renumber
	movsx	eax, WORD PTR [ecx+eax*2]
	cmp	eax, 7
	ja	$L1139
$L1140:
; Line 1099
	mov	eax, DWORD PTR _reg1$[ebp]
	mov	DWORD PTR _breg$[ebp], eax
; Line 1100
	mov	eax, DWORD PTR _reg2$[ebp]
	mov	DWORD PTR _ireg$[ebp], eax
; Line 1103
$L1139:
$L1138:
	cmp	DWORD PTR _ireg$[ebp], 0
	jne	$L1142
	cmp	DWORD PTR _breg$[ebp], 0
	je	$L1141
$L1142:
; Line 1105
	mov	DWORD PTR _scale$1143[ebp], 1
; Line 1107
	cmp	DWORD PTR _addr$[ebp], 0
	je	$L1144
; Line 1109
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2490368				; 00260000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1145
; Line 1110
	mov	eax, DWORD PTR _addr$[ebp]
	push	eax
	call	_output_asm_label
	add	esp, 4
; Line 1111
	jmp	$L1147
$L1145:
; Line 1112
	mov	eax, DWORD PTR _addr$[ebp]
	push	eax
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	call	_output_addr_const
	add	esp, 8
$L1147:
; Line 1115
$L1144:
	cmp	DWORD PTR _ireg$[ebp], 0
	je	$L1148
	mov	eax, DWORD PTR _ireg$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 3080192				; 002f0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1148
; Line 1117
	mov	eax, DWORD PTR _ireg$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _scale$1143[ebp], eax
; Line 1118
	mov	eax, DWORD PTR _ireg$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _ireg$[ebp], eax
; Line 1121
$L1148:
	mov	eax, DWORD PTR _file$[ebp]
	dec	DWORD PTR [eax+4]
	mov	eax, DWORD PTR _file$[ebp]
	cmp	DWORD PTR [eax+4], 0
	jl	$L2416
	mov	eax, DWORD PTR _file$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	BYTE PTR [eax], 40			; 00000028H
	mov	eax, DWORD PTR _file$[ebp]
	inc	DWORD PTR [eax]
	jmp	$L2417
$L2416:
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	push	40					; 00000028H
	call	__flsbuf
	add	esp, 8
$L2417:
	cmp	DWORD PTR _breg$[ebp], 0
	je	$L1149
$L1150:
	push	OFFSET FLAT:$SG1153
	push	OFFSET FLAT:$SG1154
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	call	_fprintf
	add	esp, 12					; 0000000cH
	mov	eax, DWORD PTR _breg$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	sar	eax, 22					; 00000016H
	mov	eax, DWORD PTR _mode_size[eax]
	mov	DWORD PTR -36+[ebp], eax
	jmp	$L1155
$L1159:
	mov	eax, DWORD PTR _breg$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1161
	mov	eax, DWORD PTR _breg$[ebp]
	cmp	DWORD PTR [eax+4], 8
	jl	$L1162
	mov	eax, DWORD PTR _breg$[ebp]
	cmp	DWORD PTR [eax+4], 10			; 0000000aH
	jl	$L1160
$L1162:
$L1161:
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	push	OFFSET FLAT:$SG1163
	call	_fputs
	add	esp, 8
$L1160:
$L1164:
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	mov	eax, DWORD PTR _breg$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR _hi_reg_name$S626[eax*4]
	push	eax
	call	_fputs
	add	esp, 8
	jmp	$L1156
$L1165:
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	mov	eax, DWORD PTR _breg$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR _qi_reg_name$S637[eax*4]
	push	eax
	call	_fputs
	add	esp, 8
	jmp	$L1156
	jmp	$L1156
$L1155:
	cmp	DWORD PTR -36+[ebp], 1
	je	$L1165
	cmp	DWORD PTR -36+[ebp], 2
	je	$L1164
	cmp	DWORD PTR -36+[ebp], 4
	je	$L1159
	cmp	DWORD PTR -36+[ebp], 8
	je	$L1159
	jmp	$L1156
$L1156:
$L1151:
$L1152:
$L1149:
	cmp	DWORD PTR _ireg$[ebp], 0
	je	$L1166
$L1167:
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	push	OFFSET FLAT:$SG1170
	call	_fputs
	add	esp, 8
$L1171:
	push	OFFSET FLAT:$SG1174
	push	OFFSET FLAT:$SG1175
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	call	_fprintf
	add	esp, 12					; 0000000cH
	mov	eax, DWORD PTR _ireg$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	sar	eax, 22					; 00000016H
	mov	eax, DWORD PTR _mode_size[eax]
	mov	DWORD PTR -40+[ebp], eax
	jmp	$L1176
$L1180:
	mov	eax, DWORD PTR _ireg$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1182
	mov	eax, DWORD PTR _ireg$[ebp]
	cmp	DWORD PTR [eax+4], 8
	jl	$L1183
	mov	eax, DWORD PTR _ireg$[ebp]
	cmp	DWORD PTR [eax+4], 10			; 0000000aH
	jl	$L1181
$L1183:
$L1182:
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	push	OFFSET FLAT:$SG1184
	call	_fputs
	add	esp, 8
$L1181:
$L1185:
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	mov	eax, DWORD PTR _ireg$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR _hi_reg_name$S626[eax*4]
	push	eax
	call	_fputs
	add	esp, 8
	jmp	$L1177
$L1186:
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	mov	eax, DWORD PTR _ireg$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR _qi_reg_name$S637[eax*4]
	push	eax
	call	_fputs
	add	esp, 8
	jmp	$L1177
	jmp	$L1177
$L1176:
	cmp	DWORD PTR -40+[ebp], 1
	je	$L1186
	cmp	DWORD PTR -40+[ebp], 2
	je	$L1185
	cmp	DWORD PTR -40+[ebp], 4
	je	$L1180
	cmp	DWORD PTR -40+[ebp], 8
	je	$L1180
	jmp	$L1177
$L1177:
$L1172:
$L1173:
$L1168:
$L1169:
	cmp	DWORD PTR _scale$1143[ebp], 1
	je	$L1187
	mov	eax, DWORD PTR _scale$1143[ebp]
	push	eax
	push	OFFSET FLAT:$SG1188
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	call	_fprintf
	add	esp, 12					; 0000000cH
$L1187:
$L1166:
	mov	eax, DWORD PTR _file$[ebp]
	dec	DWORD PTR [eax+4]
	mov	eax, DWORD PTR _file$[ebp]
	cmp	DWORD PTR [eax+4], 0
	jl	$L2418
	mov	eax, DWORD PTR _file$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	BYTE PTR [eax], 41			; 00000029H
	mov	eax, DWORD PTR _file$[ebp]
	inc	DWORD PTR [eax]
	jmp	$L2419
$L2418:
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	push	41					; 00000029H
	call	__flsbuf
	add	esp, 8
$L2419:
; Line 1122
	jmp	$L1107
; Line 1125
$L1141:
$L1189:
; Line 1128
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1191
; Line 1130
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _scale$1190[ebp], eax
; Line 1131
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _ireg$[ebp], eax
; Line 1133
	jmp	$L1192
$L1191:
; Line 1135
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _scale$1190[ebp], eax
; Line 1136
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _ireg$[ebp], eax
; Line 1137
$L1192:
; Line 1138
	mov	eax, DWORD PTR _const0_rtx
	push	eax
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	call	_output_addr_const
	add	esp, 8
; Line 1139
	mov	eax, DWORD PTR _file$[ebp]
	dec	DWORD PTR [eax+4]
	mov	eax, DWORD PTR _file$[ebp]
	cmp	DWORD PTR [eax+4], 0
	jl	$L2420
	mov	eax, DWORD PTR _file$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	BYTE PTR [eax], 40			; 00000028H
	mov	eax, DWORD PTR _file$[ebp]
	inc	DWORD PTR [eax]
	jmp	$L2421
$L2420:
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	push	40					; 00000028H
	call	__flsbuf
	add	esp, 8
$L2421:
	jmp	$L1193
$L1194:
	push	OFFSET FLAT:$SG1197
	push	OFFSET FLAT:$SG1198
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	call	_fprintf
	add	esp, 12					; 0000000cH
	sub	eax, eax
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	sar	eax, 22					; 00000016H
	mov	eax, DWORD PTR _mode_size[eax]
	mov	DWORD PTR -44+[ebp], eax
	jmp	$L1199
$L1203:
	sub	eax, eax
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1205
	mov	eax, 4
	cmp	DWORD PTR [eax], 8
	jl	$L1206
	mov	eax, 4
	cmp	DWORD PTR [eax], 10			; 0000000aH
	jl	$L1204
$L1206:
$L1205:
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	push	OFFSET FLAT:$SG1207
	call	_fputs
	add	esp, 8
$L1204:
$L1208:
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	mov	eax, 4
	mov	eax, DWORD PTR [eax]
	mov	eax, DWORD PTR _hi_reg_name$S626[eax*4]
	push	eax
	call	_fputs
	add	esp, 8
	jmp	$L1200
$L1209:
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	mov	eax, 4
	mov	eax, DWORD PTR [eax]
	mov	eax, DWORD PTR _qi_reg_name$S637[eax*4]
	push	eax
	call	_fputs
	add	esp, 8
	jmp	$L1200
	jmp	$L1200
$L1199:
	cmp	DWORD PTR -44+[ebp], 1
	je	$L1209
	cmp	DWORD PTR -44+[ebp], 2
	je	$L1208
	cmp	DWORD PTR -44+[ebp], 4
	je	$L1203
	cmp	DWORD PTR -44+[ebp], 8
	je	$L1203
	jmp	$L1200
$L1200:
$L1195:
$L1196:
$L1193:
	cmp	DWORD PTR _ireg$[ebp], 0
	je	$L1210
$L1211:
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	push	OFFSET FLAT:$SG1214
	call	_fputs
	add	esp, 8
$L1215:
	push	OFFSET FLAT:$SG1218
	push	OFFSET FLAT:$SG1219
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	call	_fprintf
	add	esp, 12					; 0000000cH
	mov	eax, DWORD PTR _ireg$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	sar	eax, 22					; 00000016H
	mov	eax, DWORD PTR _mode_size[eax]
	mov	DWORD PTR -48+[ebp], eax
	jmp	$L1220
$L1224:
	mov	eax, DWORD PTR _ireg$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1226
	mov	eax, DWORD PTR _ireg$[ebp]
	cmp	DWORD PTR [eax+4], 8
	jl	$L1227
	mov	eax, DWORD PTR _ireg$[ebp]
	cmp	DWORD PTR [eax+4], 10			; 0000000aH
	jl	$L1225
$L1227:
$L1226:
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	push	OFFSET FLAT:$SG1228
	call	_fputs
	add	esp, 8
$L1225:
$L1229:
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	mov	eax, DWORD PTR _ireg$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR _hi_reg_name$S626[eax*4]
	push	eax
	call	_fputs
	add	esp, 8
	jmp	$L1221
$L1230:
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	mov	eax, DWORD PTR _ireg$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR _qi_reg_name$S637[eax*4]
	push	eax
	call	_fputs
	add	esp, 8
	jmp	$L1221
	jmp	$L1221
$L1220:
	cmp	DWORD PTR -48+[ebp], 1
	je	$L1230
	cmp	DWORD PTR -48+[ebp], 2
	je	$L1229
	cmp	DWORD PTR -48+[ebp], 4
	je	$L1224
	cmp	DWORD PTR -48+[ebp], 8
	je	$L1224
	jmp	$L1221
$L1221:
$L1216:
$L1217:
$L1212:
$L1213:
	cmp	DWORD PTR _scale$1190[ebp], 1
	je	$L1231
	mov	eax, DWORD PTR _scale$1190[ebp]
	push	eax
	push	OFFSET FLAT:$SG1232
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	call	_fprintf
	add	esp, 12					; 0000000cH
$L1231:
$L1210:
	mov	eax, DWORD PTR _file$[ebp]
	dec	DWORD PTR [eax+4]
	mov	eax, DWORD PTR _file$[ebp]
	cmp	DWORD PTR [eax+4], 0
	jl	$L2422
	mov	eax, DWORD PTR _file$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	BYTE PTR [eax], 41			; 00000029H
	mov	eax, DWORD PTR _file$[ebp]
	inc	DWORD PTR [eax]
	jmp	$L2423
$L2422:
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	push	41					; 00000029H
	call	__flsbuf
	add	esp, 8
$L2423:
; Line 1141
	jmp	$L1107
; Line 1143
$L1233:
; Line 1146
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1234
	mov	eax, DWORD PTR _addr$[ebp]
	cmp	DWORD PTR [eax+4], 32768		; 00008000H
	jge	$L1234
	mov	eax, DWORD PTR _addr$[ebp]
	cmp	DWORD PTR [eax+4], -32768		; ffff8000H
	jl	$L1234
; Line 1147
	mov	eax, DWORD PTR _addr$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	push	OFFSET FLAT:$SG1235
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	call	_fprintf
	add	esp, 12					; 0000000cH
; Line 1148
	jmp	$L1236
$L1234:
; Line 1149
	mov	eax, DWORD PTR _addr$[ebp]
	push	eax
	mov	eax, DWORD PTR _file$[ebp]
	push	eax
	call	_output_addr_const
	add	esp, 8
$L1236:
; Line 1150
	jmp	$L1107
$L1106:
	cmp	DWORD PTR -32+[ebp], 34			; 00000022H
	je	$L1110
	cmp	DWORD PTR -32+[ebp], 44			; 0000002cH
	je	$L1113
	cmp	DWORD PTR -32+[ebp], 47			; 0000002fH
	je	$L1189
	jmp	$L1233
$L1107:
; Line 1151
$L1100:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_print_operand_address ENDP
_TEXT	ENDS
PUBLIC	_notice_update_cc
EXTRN	_pc_rtx:DWORD
EXTRN	_cc0_rtx:DWORD
EXTRN	_cc_status:BYTE
_TEXT	SEGMENT
_exp$ = 8
_notice_update_cc PROC NEAR
; Line 1165
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 1166
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1638400				; 00190000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1240
; Line 1169
	mov	eax, DWORD PTR _exp$[ebp]
	mov	ecx, DWORD PTR _pc_rtx
	cmp	DWORD PTR [eax+4], ecx
	jne	$L1241
; Line 1170
	jmp	$L1239
; Line 1175
$L1241:
; Line 1176
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1242
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1243
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2424832				; 00250000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1242
$L1243:
; Line 1179
	cmp	DWORD PTR _cc_status+4, 0
	je	$L1244
	mov	eax, DWORD PTR _cc_status+4
	push	eax
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	call	_reg_overlap_mentioned_p
	add	esp, 8
	or	eax, eax
	je	$L1244
; Line 1180
	mov	DWORD PTR _cc_status+4, 0
; Line 1181
$L1244:
; Line 1182
	cmp	DWORD PTR _cc_status+8, 0
	je	$L1245
	mov	eax, DWORD PTR _cc_status+8
	push	eax
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	call	_reg_overlap_mentioned_p
	add	esp, 8
	or	eax, eax
	je	$L1245
; Line 1183
	mov	DWORD PTR _cc_status+8, 0
; Line 1184
$L1245:
	jmp	$L1239
; Line 1188
$L1242:
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2424832				; 00250000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1246
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1246
; Line 1190
	cmp	DWORD PTR _cc_status+4, 0
	je	$L1247
	mov	eax, DWORD PTR _cc_status+4
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2424832				; 00250000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1247
; Line 1191
	mov	DWORD PTR _cc_status+4, 0
; Line 1192
$L1247:
	cmp	DWORD PTR _cc_status+8, 0
	je	$L1248
	mov	eax, DWORD PTR _cc_status+8
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2424832				; 00250000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1248
; Line 1193
	mov	DWORD PTR _cc_status+8, 0
; Line 1194
$L1248:
	jmp	$L1239
; Line 1197
	jmp	$L1249
$L1246:
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1835008				; 001c0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1250
; Line 1199
	mov	DWORD PTR _cc_status, 0
	mov	DWORD PTR _cc_status+4, 0
	mov	DWORD PTR _cc_status+8, 0
; Line 1200
	jmp	$L1239
; Line 1203
	jmp	$L1251
$L1250:
	mov	eax, DWORD PTR _exp$[ebp]
	mov	ecx, DWORD PTR _cc0_rtx
	cmp	DWORD PTR [eax+4], ecx
	jne	$L1252
; Line 1205
	mov	DWORD PTR _cc_status, 0
	mov	DWORD PTR _cc_status+4, 0
	mov	DWORD PTR _cc_status+8, 0
; Line 1206
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _cc_status+4, eax
; Line 1207
	jmp	$L1239
; Line 1210
	jmp	$L1253
$L1252:
; Line 1212
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	mov	ecx, 67108864				; 04000000H
	and	ecx, -16777216				; ff000000H
	cmp	eax, ecx
	je	$L1255
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	mov	ecx, 33554432				; 02000000H
	and	ecx, -16777216				; ff000000H
	cmp	eax, ecx
	je	$L1255
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	mov	ecx, 16777216				; 01000000H
	and	ecx, -16777216				; ff000000H
	cmp	eax, ecx
	jne	$L1254
$L1255:
; Line 1213
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	sar	eax, 16					; 00000010H
	mov	DWORD PTR -4+[ebp], eax
	jmp	$L1256
; Line 1215
$L1260:
; Line 1219
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1261
; Line 1221
	mov	DWORD PTR _cc_status, 0
	mov	DWORD PTR _cc_status+4, 0
	mov	DWORD PTR _cc_status+8, 0
; Line 1222
	jmp	$L1257
; Line 1227
$L1261:
$L1262:
; Line 1229
	mov	DWORD PTR _cc_status, 8
; Line 1230
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _cc_status+4, eax
; Line 1231
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _cc_status+8, eax
; Line 1232
	jmp	$L1257
; Line 1234
$L1263:
; Line 1235
	mov	DWORD PTR _cc_status, 0
	mov	DWORD PTR _cc_status+4, 0
	mov	DWORD PTR _cc_status+8, 0
; Line 1236
	jmp	$L1257
$L1256:
	sub	DWORD PTR -4+[ebp], 44			; 0000002cH
	cmp	DWORD PTR -4+[ebp], 17			; 00000011H
	ja	$L1263
	shl	DWORD PTR -4+[ebp], 2
	mov	eax, DWORD PTR -4+[ebp]
	jmp	DWORD PTR $L2424[eax]
$L2424:
	DD	OFFSET FLAT:$L1262
	DD	OFFSET FLAT:$L1262
	DD	OFFSET FLAT:$L1262
	DD	OFFSET FLAT:$L1263
	DD	OFFSET FLAT:$L1263
	DD	OFFSET FLAT:$L1263
	DD	OFFSET FLAT:$L1263
	DD	OFFSET FLAT:$L1263
	DD	OFFSET FLAT:$L1263
	DD	OFFSET FLAT:$L1262
	DD	OFFSET FLAT:$L1262
	DD	OFFSET FLAT:$L1262
	DD	OFFSET FLAT:$L1263
	DD	OFFSET FLAT:$L1260
	DD	OFFSET FLAT:$L1260
	DD	OFFSET FLAT:$L1263
	DD	OFFSET FLAT:$L1260
	DD	OFFSET FLAT:$L1260
$L1257:
; Line 1237
	jmp	$L1264
$L1254:
; Line 1239
	mov	DWORD PTR _cc_status, 0
	mov	DWORD PTR _cc_status+4, 0
	mov	DWORD PTR _cc_status+8, 0
; Line 1240
$L1264:
$L1253:
$L1251:
$L1249:
; Line 1242
	jmp	$L1265
$L1240:
; Line 1243
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1310720				; 00140000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1266
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1638400				; 00190000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1266
; Line 1245
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _pc_rtx
	cmp	DWORD PTR [eax+4], ecx
	jne	$L1267
; Line 1246
	jmp	$L1239
; Line 1247
$L1267:
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _cc0_rtx
	cmp	DWORD PTR [eax+4], ecx
	jne	$L1268
; Line 1249
	mov	DWORD PTR _cc_status, 0
	mov	DWORD PTR _cc_status+4, 0
	mov	DWORD PTR _cc_status+8, 0
; Line 1250
	mov	eax, DWORD PTR _exp$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _cc_status+4, eax
; Line 1251
	jmp	$L1239
; Line 1253
$L1268:
	mov	DWORD PTR _cc_status, 0
	mov	DWORD PTR _cc_status+4, 0
	mov	DWORD PTR _cc_status+8, 0
; Line 1255
	jmp	$L1269
$L1266:
; Line 1257
	mov	DWORD PTR _cc_status, 0
	mov	DWORD PTR _cc_status+4, 0
	mov	DWORD PTR _cc_status+8, 0
; Line 1258
$L1269:
$L1265:
; Line 1259
$L1239:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_notice_update_cc ENDP
_TEXT	ENDS
EXTRN	_find_regno_note:NEAR
EXTRN	_optimize:DWORD
_TEXT	SEGMENT
_insn$ = 8
_top_dead_p PROC NEAR
; Line 1266
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 1268
	cmp	DWORD PTR _optimize, 0
	je	$L1273
; Line 1270
	push	8
	push	1
	mov	eax, DWORD PTR _insn$[ebp]
	push	eax
	call	_find_regno_note
	add	esp, 12					; 0000000cH
	or	eax, eax
	jne	$L2427
	push	9
	push	1
	mov	eax, DWORD PTR _insn$[ebp]
	push	eax
	call	_find_regno_note
	add	esp, 12					; 0000000cH
	or	eax, eax
	je	$L2425
$L2427:
	mov	eax, 1
	jmp	$L2426
$L2425:
	sub	eax, eax
$L2426:
	jmp	$L1271
; Line 1272
$L1273:
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 983040				; 000f0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1275
; Line 1273
	mov	eax, DWORD PTR _insn$[ebp]
	push	eax
	call	_call_top_dead_p
	add	esp, 4
	jmp	$L1271
; Line 1275
$L1275:
	mov	eax, DWORD PTR _insn$[ebp]
	push	eax
	call	_fp_top_dead_p1
	add	esp, 4
	jmp	$L1271
; Line 1276
$L1271:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_top_dead_p ENDP
_insn$ = 8
_i$ = -4
_call_top_dead_p PROC NEAR
; Line 1289
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 1291
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L1279
$L1280:
	inc	DWORD PTR _i$[ebp]
$L1279:
	cmp	DWORD PTR _i$[ebp], 3
	jge	$L1281
; Line 1293
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	DWORD PTR _insn$[ebp], eax
; Line 1294
	cmp	DWORD PTR _insn$[ebp], 0
	jne	$L1282
; Line 1295
	mov	eax, 1
	jmp	$L1277
; Line 1296
$L1282:
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1179648				; 00120000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1284
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1114112				; 00110000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1283
$L1284:
; Line 1297
	jmp	$L1280
; Line 1298
$L1283:
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1048576				; 00100000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1285
; Line 1299
	call	_abort
; Line 1300
$L1285:
; Line 1301
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1638400				; 00190000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1286
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	ecx, DWORD PTR _stack_pointer_rtx
	cmp	DWORD PTR [eax+4], ecx
	je	$L1286
; Line 1302
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	call	_mentions_fp_top
	add	esp, 4
	cmp	eax, 1
	sbb	eax, eax
	neg	eax
	jmp	$L1277
; Line 1303
$L1286:
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1835008				; 001c0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1287
; Line 1304
	mov	eax, 1
	jmp	$L1277
; Line 1305
$L1287:
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1703936				; 001a0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1288
; Line 1306
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L2430
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax+4]
	cmp	DWORD PTR [eax+4], 8
	jl	$L2431
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax+4]
	cmp	DWORD PTR [eax+4], 10			; 0000000aH
	jl	$L2428
$L2431:
$L2430:
	mov	eax, 1
	jmp	$L2429
$L2428:
	sub	eax, eax
$L2429:
	jmp	$L1277
; Line 1307
$L1288:
	jmp	$L1280
$L1281:
; Line 1308
	mov	eax, 1
	jmp	$L1277
; Line 1309
$L1277:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_call_top_dead_p ENDP
_TEXT	ENDS
EXTRN	_optimize:DWORD
_TEXT	SEGMENT
_insn$ = 8
_past_jump$ = -4
_fp_top_dead_p1 PROC NEAR
; Line 1318
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	push	ebx
	push	esi
	push	edi
; Line 1321
	mov	DWORD PTR _past_jump$[ebp], 0
; Line 1323
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	DWORD PTR _insn$[ebp], eax
	jmp	$L1293
$L1294:
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	DWORD PTR _insn$[ebp], eax
$L1293:
	cmp	DWORD PTR _insn$[ebp], 0
	je	$L1295
; Line 1325
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	sar	eax, 16					; 00000010H
	mov	DWORD PTR -8+[ebp], eax
	jmp	$L1296
; Line 1327
$L1300:
; Line 1329
	mov	eax, 1
	jmp	$L1290
; Line 1331
$L1301:
; Line 1334
	cmp	DWORD PTR _optimize, 0
	jne	$L1302
; Line 1336
	mov	eax, 1
	jmp	$L1290
; Line 1337
$L1302:
	mov	eax, DWORD PTR _insn$[ebp]
	cmp	DWORD PTR [eax+32], 0
	jne	$L1303
; Line 1338
	mov	eax, 1
	jmp	$L1290
; Line 1340
$L1303:
	cmp	DWORD PTR _past_jump$[ebp], 0
	je	$L1304
; Line 1341
	mov	eax, 1
	jmp	$L1290
; Line 1342
$L1304:
	mov	DWORD PTR _past_jump$[ebp], 1
; Line 1343
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+32]
	mov	DWORD PTR _insn$[ebp], eax
; Line 1344
$L1305:
; Line 1345
	cmp	DWORD PTR _optimize, 0
	jne	$L1306
; Line 1346
	mov	eax, 1
	jmp	$L1290
; Line 1347
$L1306:
	jmp	$L1297
; Line 1349
$L1307:
; Line 1350
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1638400				; 00190000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1308
; Line 1352
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	call	_mentions_fp_top
	add	esp, 4
	or	eax, eax
	je	$L1309
; Line 1353
	sub	eax, eax
	jmp	$L1290
; Line 1354
	jmp	$L1310
$L1309:
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+16]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	call	_mentions_fp_top
	add	esp, 4
	or	eax, eax
	je	$L1311
; Line 1355
	mov	eax, 1
	jmp	$L1290
; Line 1356
$L1311:
$L1310:
; Line 1357
	jmp	$L1312
$L1308:
	mov	eax, DWORD PTR _insn$[ebp]
	mov	eax, DWORD PTR [eax+16]
	push	eax
	call	_mentions_fp_top
	add	esp, 4
	or	eax, eax
	je	$L1313
; Line 1358
	sub	eax, eax
	jmp	$L1290
; Line 1359
$L1313:
$L1312:
	jmp	$L1297
; Line 1360
	jmp	$L1297
$L1296:
	cmp	DWORD PTR -8+[ebp], 13			; 0000000dH
	je	$L1307
	cmp	DWORD PTR -8+[ebp], 14			; 0000000eH
	je	$L1301
	cmp	DWORD PTR -8+[ebp], 15			; 0000000fH
	je	$L1300
	cmp	DWORD PTR -8+[ebp], 17			; 00000011H
	je	$L1305
	jmp	$L1297
$L1297:
; Line 1361
	jmp	$L1294
$L1295:
; Line 1362
	mov	eax, 1
	jmp	$L1290
; Line 1363
$L1290:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_fp_top_dead_p1 ENDP
_TEXT	ENDS
EXTRN	_rtx_length:BYTE
EXTRN	_rtx_format:BYTE
_TEXT	SEGMENT
_x$ = 8
_code$ = -4
_fmt$1323 = -12
_i$1324 = -8
_j$1331 = -16
_mentions_fp_top PROC NEAR
; Line 1370
	push	ebp
	mov	ebp, esp
	sub	esp, 20					; 00000014H
	push	ebx
	push	esi
	push	edi
; Line 1373
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	sar	eax, 16					; 00000010H
	mov	DWORD PTR _code$[ebp], eax
; Line 1374
	mov	eax, DWORD PTR _code$[ebp]
	mov	DWORD PTR -20+[ebp], eax
	jmp	$L1317
; Line 1376
$L1321:
; Line 1384
	sub	eax, eax
	jmp	$L1315
; Line 1386
$L1322:
; Line 1387
	mov	eax, DWORD PTR _x$[ebp]
	cmp	DWORD PTR [eax+4], 8
	jl	$L2432
	mov	eax, DWORD PTR _x$[ebp]
	cmp	DWORD PTR [eax+4], 10			; 0000000aH
	jge	$L2432
	mov	eax, 1
	jmp	$L2433
$L2432:
	sub	eax, eax
$L2433:
	jmp	$L1315
; Line 1388
	jmp	$L1318
$L1317:
	sub	DWORD PTR -20+[ebp], 27			; 0000001bH
	cmp	DWORD PTR -20+[ebp], 13			; 0000000dH
	ja	$L1318
	shl	DWORD PTR -20+[ebp], 2
	mov	eax, DWORD PTR -20+[ebp]
	jmp	DWORD PTR $L2434[eax]
$L2434:
	DD	OFFSET FLAT:$L1321
	DD	OFFSET FLAT:$L1318
	DD	OFFSET FLAT:$L1318
	DD	OFFSET FLAT:$L1321
	DD	OFFSET FLAT:$L1318
	DD	OFFSET FLAT:$L1321
	DD	OFFSET FLAT:$L1321
	DD	OFFSET FLAT:$L1322
	DD	OFFSET FLAT:$L1318
	DD	OFFSET FLAT:$L1318
	DD	OFFSET FLAT:$L1321
	DD	OFFSET FLAT:$L1321
	DD	OFFSET FLAT:$L1321
	DD	OFFSET FLAT:$L1321
$L1318:
; Line 1392
	mov	eax, DWORD PTR _code$[ebp]
	mov	eax, DWORD PTR _rtx_format[eax*4]
	mov	DWORD PTR _fmt$1323[ebp], eax
; Line 1395
	mov	eax, DWORD PTR _code$[ebp]
	mov	eax, DWORD PTR _rtx_length[eax*4]
	dec	eax
	mov	DWORD PTR _i$1324[ebp], eax
	jmp	$L1325
$L1326:
	dec	DWORD PTR _i$1324[ebp]
$L1325:
	cmp	DWORD PTR _i$1324[ebp], 0
	jl	$L1327
; Line 1397
	mov	eax, DWORD PTR _i$1324[ebp]
	mov	ecx, DWORD PTR _fmt$1323[ebp]
	movsx	eax, BYTE PTR [eax+ecx]
	cmp	eax, 101				; 00000065H
	jne	$L1328
; Line 1399
	mov	eax, DWORD PTR _i$1324[ebp]
	mov	ecx, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+4]
	push	eax
	call	_mentions_fp_top
	add	esp, 4
	or	eax, eax
	je	$L1329
; Line 1400
	mov	eax, 1
	jmp	$L1315
; Line 1401
$L1329:
; Line 1402
$L1328:
	mov	eax, DWORD PTR _i$1324[ebp]
	mov	ecx, DWORD PTR _fmt$1323[ebp]
	movsx	eax, BYTE PTR [eax+ecx]
	cmp	eax, 69					; 00000045H
	jne	$L1330
; Line 1405
	mov	DWORD PTR _j$1331[ebp], 0
	jmp	$L1332
$L1333:
	inc	DWORD PTR _j$1331[ebp]
$L1332:
	mov	eax, DWORD PTR _i$1324[ebp]
	mov	ecx, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+4]
	mov	ecx, DWORD PTR _j$1331[ebp]
	cmp	DWORD PTR [eax], ecx
	jbe	$L1334
; Line 1406
	mov	eax, DWORD PTR _i$1324[ebp]
	mov	ecx, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4+4]
	mov	ecx, DWORD PTR _j$1331[ebp]
	mov	eax, DWORD PTR [eax+ecx*4+4]
	push	eax
	call	_mentions_fp_top
	add	esp, 4
	or	eax, eax
	je	$L1335
; Line 1407
	mov	eax, 1
	jmp	$L1315
; Line 1408
$L1335:
	jmp	$L1333
$L1334:
; Line 1409
$L1330:
	jmp	$L1326
$L1327:
; Line 1411
	sub	eax, eax
	jmp	$L1315
; Line 1412
$L1315:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_mentions_fp_top ENDP
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+1
$SG1341	DB	'test%L0 %0,%0', 00H
	ORG $+2
$SG1342	DB	'cmp%L0 %1,%0', 00H
_DATA	ENDS
_TEXT	SEGMENT
; File insn-out.c
_operands$ = 8
_output_0 PROC NEAR
; Line 29
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 32
	mov	eax, DWORD PTR _const0_rtx
	mov	ecx, DWORD PTR _operands$[ebp]
	mov	DWORD PTR [ecx+4], eax
; Line 33
	mov	eax, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1340
; Line 34
	mov	eax, OFFSET FLAT:$SG1341
	jmp	$L1339
; Line 35
$L1340:
	mov	eax, OFFSET FLAT:$SG1342
	jmp	$L1339
; Line 37
$L1339:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_output_0 ENDP
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+3
$SG1348	DB	'test%W0 %0,%0', 00H
	ORG $+2
$SG1349	DB	'cmp%W0 %1,%0', 00H
_DATA	ENDS
_TEXT	SEGMENT
_operands$ = 8
_output_1 PROC NEAR
; Line 43
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 46
	mov	eax, DWORD PTR _const0_rtx
	mov	ecx, DWORD PTR _operands$[ebp]
	mov	DWORD PTR [ecx+4], eax
; Line 47
	mov	eax, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1347
; Line 48
	mov	eax, OFFSET FLAT:$SG1348
	jmp	$L1346
; Line 49
$L1347:
	mov	eax, OFFSET FLAT:$SG1349
	jmp	$L1346
; Line 51
$L1346:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_output_1 ENDP
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+3
$SG1355	DB	'test%B0 %0,%0', 00H
	ORG $+2
$SG1356	DB	'cmp%B0 %1,%0', 00H
_DATA	ENDS
_TEXT	SEGMENT
_operands$ = 8
_output_2 PROC NEAR
; Line 57
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 60
	mov	eax, DWORD PTR _const0_rtx
	mov	ecx, DWORD PTR _operands$[ebp]
	mov	DWORD PTR [ecx+4], eax
; Line 61
	mov	eax, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1354
; Line 62
	mov	eax, OFFSET FLAT:$SG1355
	jmp	$L1353
; Line 63
$L1354:
	mov	eax, OFFSET FLAT:$SG1356
	jmp	$L1353
; Line 65
$L1353:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_output_2 ENDP
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+3
$SG1366	DB	'ftst', 0aH, 09H, 'fnstsw %R0ax', 0aH, 09H, 'sahf', 00H
	ORG $+3
$SG1368	DB	'ftst', 0aH, 09H, 'fstp %0(0)', 0aH, 09H, 'fnstsw %R0ax', 0aH
	DB	09H, 'sahf', 00H
	ORG $+3
$SG1369	DB	00H
_DATA	ENDS
_TEXT	SEGMENT
_operands$ = 8
_insn$ = 12
_xops$1361 = -4
_output_3 PROC NEAR
; Line 71
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 75
	mov	eax, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1363
	mov	eax, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [eax]
	cmp	DWORD PTR [eax+4], 8
	jl	$L1364
	mov	eax, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [eax]
	cmp	DWORD PTR [eax+4], 10			; 0000000aH
	jl	$L1362
$L1364:
$L1363:
; Line 76
	mov	eax, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [eax]
	push	eax
	call	_fp_push_sf
	add	esp, 4
; Line 78
$L1362:
	push	8
	push	11					; 0000000bH
	push	34					; 00000022H
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _xops$1361[ebp], eax
; Line 79
	or	DWORD PTR _cc_status, 2048		; 00000800H
; Line 80
	mov	eax, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1365
	mov	eax, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [eax]
	cmp	DWORD PTR [eax+4], 8
	jl	$L1365
	mov	eax, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [eax]
	cmp	DWORD PTR [eax+4], 10			; 0000000aH
	jge	$L1365
	mov	eax, DWORD PTR _insn$[ebp]
	push	eax
	call	_top_dead_p
	add	esp, 4
	or	eax, eax
	jne	$L1365
; Line 81
	lea	eax, DWORD PTR _xops$1361[ebp]
	push	eax
	push	OFFSET FLAT:$SG1366
	call	_output_asm_insn
	add	esp, 8
; Line 82
	jmp	$L1367
$L1365:
; Line 83
	lea	eax, DWORD PTR _xops$1361[ebp]
	push	eax
	push	OFFSET FLAT:$SG1368
	call	_output_asm_insn
	add	esp, 8
$L1367:
; Line 84
	mov	eax, OFFSET FLAT:$SG1369
	jmp	$L1360
; Line 86
$L1360:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_output_3 ENDP
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+3
$SG1379	DB	'ftst', 0aH, 09H, 'fnstsw %R0ax', 0aH, 09H, 'sahf', 00H
	ORG $+3
$SG1381	DB	'ftst', 0aH, 09H, 'fstp %0(0)', 0aH, 09H, 'fnstsw %R0ax', 0aH
	DB	09H, 'sahf', 00H
	ORG $+3
$SG1382	DB	00H
_DATA	ENDS
_TEXT	SEGMENT
_operands$ = 8
_insn$ = 12
_xops$1374 = -4
_output_4 PROC NEAR
; Line 92
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 96
	mov	eax, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1376
	mov	eax, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [eax]
	cmp	DWORD PTR [eax+4], 8
	jl	$L1377
	mov	eax, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [eax]
	cmp	DWORD PTR [eax+4], 10			; 0000000aH
	jl	$L1375
$L1377:
$L1376:
; Line 97
	mov	eax, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [eax]
	push	eax
	call	_fp_push_df
	add	esp, 4
; Line 99
$L1375:
	push	8
	push	11					; 0000000bH
	push	34					; 00000022H
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _xops$1374[ebp], eax
; Line 100
	or	DWORD PTR _cc_status, 2048		; 00000800H
; Line 101
	mov	eax, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1378
	mov	eax, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [eax]
	cmp	DWORD PTR [eax+4], 8
	jl	$L1378
	mov	eax, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [eax]
	cmp	DWORD PTR [eax+4], 10			; 0000000aH
	jge	$L1378
	mov	eax, DWORD PTR _insn$[ebp]
	push	eax
	call	_top_dead_p
	add	esp, 4
	or	eax, eax
	jne	$L1378
; Line 102
	lea	eax, DWORD PTR _xops$1374[ebp]
	push	eax
	push	OFFSET FLAT:$SG1379
	call	_output_asm_insn
	add	esp, 8
; Line 103
	jmp	$L1380
$L1378:
; Line 104
	lea	eax, DWORD PTR _xops$1374[ebp]
	push	eax
	push	OFFSET FLAT:$SG1381
	call	_output_asm_insn
	add	esp, 8
$L1380:
; Line 105
	mov	eax, OFFSET FLAT:$SG1382
	jmp	$L1373
; Line 107
$L1373:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_output_4 ENDP
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+3
$SG1389	DB	'cmp%L0 %0,%1', 00H
	ORG $+3
$SG1390	DB	'cmp%L0 %1,%0', 00H
_DATA	ENDS
_TEXT	SEGMENT
_operands$ = 8
_output_5 PROC NEAR
; Line 113
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 117
	mov	eax, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1388
	mov	eax, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1387
	mov	eax, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2424832				; 00250000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1387
$L1388:
; Line 119
	or	DWORD PTR _cc_status, 1
; Line 120
	mov	eax, OFFSET FLAT:$SG1389
	jmp	$L1386
; Line 122
$L1387:
	mov	eax, OFFSET FLAT:$SG1390
	jmp	$L1386
; Line 124
$L1386:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_output_5 ENDP
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+3
$SG1397	DB	'cmp%W0 %0,%1', 00H
	ORG $+3
$SG1398	DB	'cmp%W0 %1,%0', 00H
_DATA	ENDS
_TEXT	SEGMENT
_operands$ = 8
_output_6 PROC NEAR
; Line 130
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 134
	mov	eax, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1396
	mov	eax, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1395
	mov	eax, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2424832				; 00250000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1395
$L1396:
; Line 136
	or	DWORD PTR _cc_status, 1
; Line 137
	mov	eax, OFFSET FLAT:$SG1397
	jmp	$L1394
; Line 139
$L1395:
	mov	eax, OFFSET FLAT:$SG1398
	jmp	$L1394
; Line 141
$L1394:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_output_6 ENDP
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+3
$SG1405	DB	'cmp%B0 %0,%1', 00H
	ORG $+3
$SG1406	DB	'cmp%B0 %1,%0', 00H
_DATA	ENDS
_TEXT	SEGMENT
_operands$ = 8
_output_7 PROC NEAR
; Line 147
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 151
	mov	eax, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1404
	mov	eax, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1403
	mov	eax, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2424832				; 00250000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1403
$L1404:
; Line 153
	or	DWORD PTR _cc_status, 1
; Line 154
	mov	eax, OFFSET FLAT:$SG1405
	jmp	$L1402
; Line 156
$L1403:
	mov	eax, OFFSET FLAT:$SG1406
	jmp	$L1402
; Line 158
$L1402:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_output_7 ENDP
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+3
$SG1416	DB	'fcompp', 0aH, 09H, 'fnstsw %R0ax', 0aH, 09H, 'sahf', 00H
_DATA	ENDS
_TEXT	SEGMENT
_tem$1412 = -4
_operands$ = 8
_output_8 PROC NEAR
; Line 164
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 167
	mov	eax, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1411
	mov	eax, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [eax]
	cmp	DWORD PTR [eax+4], 8
	jl	$L1411
	mov	eax, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [eax]
	cmp	DWORD PTR [eax+4], 10			; 0000000aH
	jge	$L1411
; Line 169
	mov	eax, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _tem$1412[ebp], eax
; Line 170
	mov	eax, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	ecx, DWORD PTR _operands$[ebp]
	mov	DWORD PTR [ecx+4], eax
; Line 171
	mov	eax, DWORD PTR _tem$1412[ebp]
	mov	ecx, DWORD PTR _operands$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 172
	or	DWORD PTR _cc_status, 1
; Line 174
$L1411:
	mov	eax, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1414
	mov	eax, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [eax+4]
	cmp	DWORD PTR [eax+4], 8
	jl	$L1415
	mov	eax, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [eax+4]
	cmp	DWORD PTR [eax+4], 10			; 0000000aH
	jl	$L1413
$L1415:
$L1414:
; Line 175
	mov	eax, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	push	8
	push	11					; 0000000bH
	push	34					; 00000022H
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	push	eax
	call	_output_movdf
	add	esp, 8
; Line 176
$L1413:
	mov	eax, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [eax]
	push	eax
	push	8
	push	11					; 0000000bH
	push	34					; 00000022H
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	push	eax
	call	_output_movdf
	add	esp, 8
; Line 179
	or	DWORD PTR _cc_status, 2048		; 00000800H
; Line 180
	mov	eax, OFFSET FLAT:$SG1416
	jmp	$L1410
; Line 182
$L1410:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_output_8 ENDP
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+1
$SG1426	DB	'fcompp', 0aH, 09H, 'fnstsw %R0ax', 0aH, 09H, 'sahf', 00H
_DATA	ENDS
_TEXT	SEGMENT
_operands$ = 8
_tem$1422 = -4
_output_9 PROC NEAR
; Line 188
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 191
	mov	eax, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1421
	mov	eax, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [eax]
	cmp	DWORD PTR [eax+4], 8
	jl	$L1421
	mov	eax, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [eax]
	cmp	DWORD PTR [eax+4], 10			; 0000000aH
	jge	$L1421
; Line 193
	mov	eax, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _tem$1422[ebp], eax
; Line 194
	mov	eax, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	ecx, DWORD PTR _operands$[ebp]
	mov	DWORD PTR [ecx+4], eax
; Line 195
	mov	eax, DWORD PTR _tem$1422[ebp]
	mov	ecx, DWORD PTR _operands$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 196
	or	DWORD PTR _cc_status, 1
; Line 198
$L1421:
	mov	eax, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1424
	mov	eax, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [eax+4]
	cmp	DWORD PTR [eax+4], 8
	jl	$L1425
	mov	eax, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [eax+4]
	cmp	DWORD PTR [eax+4], 10			; 0000000aH
	jl	$L1423
$L1425:
$L1424:
; Line 199
	mov	eax, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	push	8
	push	11					; 0000000bH
	push	34					; 00000022H
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	push	eax
	call	_output_movsf
	add	esp, 8
; Line 200
$L1423:
	mov	eax, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [eax]
	push	eax
	push	8
	push	11					; 0000000bH
	push	34					; 00000022H
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	push	eax
	call	_output_movsf
	add	esp, 8
; Line 203
	or	DWORD PTR _cc_status, 2048		; 00000800H
; Line 204
	mov	eax, OFFSET FLAT:$SG1426
	jmp	$L1420
; Line 206
$L1420:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_output_9 ENDP
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+1
$SG1433	DB	'test%L0 %1,%0', 00H
	ORG $+2
$SG1434	DB	'test%L0 %0,%1', 00H
_DATA	ENDS
_TEXT	SEGMENT
_operands$ = 8
_output_10 PROC NEAR
; Line 212
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 215
	mov	eax, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2490368				; 00260000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1432
	mov	eax, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2555904				; 00270000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1432
	mov	eax, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1432
	mov	eax, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2097152				; 00200000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1432
	mov	eax, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2424832				; 00250000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1431
$L1432:
; Line 216
	mov	eax, OFFSET FLAT:$SG1433
	jmp	$L1430
; Line 217
$L1431:
	mov	eax, OFFSET FLAT:$SG1434
	jmp	$L1430
; Line 219
$L1430:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_output_10 ENDP
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+2
$SG1441	DB	'test%W0 %1,%0', 00H
	ORG $+2
$SG1442	DB	'test%W0 %0,%1', 00H
_DATA	ENDS
_TEXT	SEGMENT
_operands$ = 8
_output_11 PROC NEAR
; Line 225
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 228
	mov	eax, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2490368				; 00260000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1440
	mov	eax, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2555904				; 00270000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1440
	mov	eax, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1440
	mov	eax, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2097152				; 00200000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1440
	mov	eax, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2424832				; 00250000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1439
$L1440:
; Line 229
	mov	eax, OFFSET FLAT:$SG1441
	jmp	$L1438
; Line 230
$L1439:
	mov	eax, OFFSET FLAT:$SG1442
	jmp	$L1438
; Line 232
$L1438:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_output_11 ENDP
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+2
$SG1449	DB	'test%B0 %1,%0', 00H
	ORG $+2
$SG1450	DB	'test%B0 %0,%1', 00H
_DATA	ENDS
_TEXT	SEGMENT
_operands$ = 8
_output_12 PROC NEAR
; Line 238
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 241
	mov	eax, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2490368				; 00260000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1448
	mov	eax, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2555904				; 00270000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1448
	mov	eax, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1448
	mov	eax, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2097152				; 00200000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1448
	mov	eax, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2424832				; 00250000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1447
$L1448:
; Line 242
	mov	eax, OFFSET FLAT:$SG1449
	jmp	$L1446
; Line 243
$L1447:
	mov	eax, OFFSET FLAT:$SG1450
	jmp	$L1446
; Line 245
$L1446:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_output_12 ENDP
_TEXT	ENDS
EXTRN	_const1_rtx:DWORD
EXTRN	_find_reg_note:NEAR
EXTRN	_no_labels_between_p:NEAR
_DATA	SEGMENT
	ORG $+2
$SG1457	DB	'xor%L0 %0,%0', 00H
	ORG $+3
$SG1460	DB	'inc%L0 %0', 00H
	ORG $+2
$SG1461	DB	'mov%L0 %1,%0', 00H
_DATA	ENDS
_TEXT	SEGMENT
_operands$ = 8
_insn$ = 12
_link$1455 = -4
_output_14 PROC NEAR
; Line 251
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 255
	mov	eax, DWORD PTR _operands$[ebp]
	mov	ecx, DWORD PTR _const0_rtx
	cmp	DWORD PTR [eax+4], ecx
	jne	$L1456
	mov	eax, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1456
; Line 256
	mov	eax, OFFSET FLAT:$SG1457
	jmp	$L1454
; Line 257
$L1456:
; Line 263
	mov	eax, DWORD PTR _operands$[ebp]
	mov	ecx, DWORD PTR _const1_rtx
	cmp	DWORD PTR [eax+4], ecx
	jne	$L1459
	push	0
	push	4
	mov	eax, DWORD PTR _insn$[ebp]
	push	eax
	call	_find_reg_note
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _link$1455[ebp], eax
	cmp	DWORD PTR _link$1455[ebp], 0
	je	$L1459
	mov	eax, DWORD PTR _link$1455[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shr	eax, 27					; 0000001bH
	test	al, 1
	jne	$L1459
	mov	eax, DWORD PTR _link$1455[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1179648				; 00120000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1459
	mov	eax, DWORD PTR _insn$[ebp]
	push	eax
	mov	eax, DWORD PTR _link$1455[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	call	_no_labels_between_p
	add	esp, 8
	or	eax, eax
	je	$L1459
; Line 265
	mov	eax, OFFSET FLAT:$SG1460
	jmp	$L1454
; Line 266
$L1459:
	mov	eax, OFFSET FLAT:$SG1461
	jmp	$L1454
; Line 268
$L1454:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_output_14 ENDP
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+3
$SG1468	DB	'xor%W0 %0,%0', 00H
	ORG $+3
$SG1470	DB	'inc%W0 %0', 00H
	ORG $+2
$SG1471	DB	'mov%W0 %1,%0', 00H
_DATA	ENDS
_TEXT	SEGMENT
_operands$ = 8
_insn$ = 12
_link$1466 = -4
_output_16 PROC NEAR
; Line 274
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 278
	mov	eax, DWORD PTR _operands$[ebp]
	mov	ecx, DWORD PTR _const0_rtx
	cmp	DWORD PTR [eax+4], ecx
	jne	$L1467
	mov	eax, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1467
; Line 279
	mov	eax, OFFSET FLAT:$SG1468
	jmp	$L1465
; Line 280
$L1467:
; Line 286
	mov	eax, DWORD PTR _operands$[ebp]
	mov	ecx, DWORD PTR _const1_rtx
	cmp	DWORD PTR [eax+4], ecx
	jne	$L1469
	push	0
	push	4
	mov	eax, DWORD PTR _insn$[ebp]
	push	eax
	call	_find_reg_note
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _link$1466[ebp], eax
	cmp	DWORD PTR _link$1466[ebp], 0
	je	$L1469
	mov	eax, DWORD PTR _link$1466[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shr	eax, 27					; 0000001bH
	test	al, 1
	jne	$L1469
	mov	eax, DWORD PTR _link$1466[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1179648				; 00120000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1469
	mov	eax, DWORD PTR _insn$[ebp]
	push	eax
	mov	eax, DWORD PTR _link$1466[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	call	_no_labels_between_p
	add	esp, 8
	or	eax, eax
	je	$L1469
; Line 288
	mov	eax, OFFSET FLAT:$SG1470
	jmp	$L1465
; Line 289
$L1469:
	mov	eax, OFFSET FLAT:$SG1471
	jmp	$L1465
; Line 291
$L1465:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_output_16 ENDP
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+3
$SG1476	DB	'push%W0 %1', 00H
_DATA	ENDS
_TEXT	SEGMENT
_operands$ = 8
_output_17 PROC NEAR
; Line 297
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 300
	mov	eax, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	push	2
	push	34					; 00000022H
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	mov	ecx, DWORD PTR _operands$[ebp]
	mov	DWORD PTR [ecx+4], eax
; Line 301
	mov	eax, OFFSET FLAT:$SG1476
	jmp	$L1475
; Line 303
$L1475:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_output_17 ENDP
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+1
$SG1483	DB	'xor%B0 %0,%0', 00H
	ORG $+3
$SG1485	DB	'inc%B0 %0', 00H
	ORG $+2
$SG1489	DB	'mov%W0 %w1,%w0', 00H
	ORG $+1
$SG1490	DB	'mov%B0 %1,%0', 00H
_DATA	ENDS
_TEXT	SEGMENT
_operands$ = 8
_insn$ = 12
_link$1481 = -4
_output_18 PROC NEAR
; Line 309
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 313
	mov	eax, DWORD PTR _operands$[ebp]
	mov	ecx, DWORD PTR _const0_rtx
	cmp	DWORD PTR [eax+4], ecx
	jne	$L1482
	mov	eax, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1482
; Line 314
	mov	eax, OFFSET FLAT:$SG1483
	jmp	$L1480
; Line 315
$L1482:
; Line 321
	mov	eax, DWORD PTR _operands$[ebp]
	mov	ecx, DWORD PTR _const1_rtx
	cmp	DWORD PTR [eax+4], ecx
	jne	$L1484
	push	0
	push	4
	mov	eax, DWORD PTR _insn$[ebp]
	push	eax
	call	_find_reg_note
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _link$1481[ebp], eax
	cmp	DWORD PTR _link$1481[ebp], 0
	je	$L1484
	mov	eax, DWORD PTR _link$1481[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shr	eax, 27					; 0000001bH
	test	al, 1
	jne	$L1484
	mov	eax, DWORD PTR _link$1481[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1179648				; 00120000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1484
	mov	eax, DWORD PTR _insn$[ebp]
	push	eax
	mov	eax, DWORD PTR _link$1481[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	call	_no_labels_between_p
	add	esp, 8
	or	eax, eax
	je	$L1484
; Line 323
	mov	eax, OFFSET FLAT:$SG1485
	jmp	$L1480
; Line 325
$L1484:
	mov	eax, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1488
	mov	eax, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [eax]
	cmp	DWORD PTR [eax+4], 4
	jl	$L1488
	mov	eax, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [eax]
	cmp	DWORD PTR [eax+4], 10			; 0000000aH
	jl	$L1487
$L1488:
	mov	eax, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1486
	mov	eax, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [eax+4]
	cmp	DWORD PTR [eax+4], 4
	jl	$L1486
	mov	eax, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [eax+4]
	cmp	DWORD PTR [eax+4], 10			; 0000000aH
	jge	$L1486
$L1487:
; Line 326
	mov	eax, OFFSET FLAT:$SG1489
	jmp	$L1480
; Line 327
$L1486:
	mov	eax, OFFSET FLAT:$SG1490
	jmp	$L1480
; Line 329
$L1480:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_output_18 ENDP
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+3
$SG1497	DB	'sub%L0 %1,%2', 00H
	ORG $+3
$SG1499	DB	'fstp%S0 %0', 00H
	ORG $+1
$SG1501	DB	'fst%S0 %0', 00H
	ORG $+2
$SG1502	DB	00H
	ORG $+3
$SG1503	DB	'push%L0 %1', 00H
_DATA	ENDS
_TEXT	SEGMENT
_operands$ = 8
_insn$ = 12
_xops$1496 = -12
_output_19 PROC NEAR
; Line 335
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
	push	ebx
	push	esi
	push	edi
; Line 338
	mov	eax, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1495
	mov	eax, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [eax+4]
	cmp	DWORD PTR [eax+4], 8
	jl	$L1495
	mov	eax, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [eax+4]
	cmp	DWORD PTR [eax+4], 10			; 0000000aH
	jge	$L1495
; Line 341
	mov	eax, DWORD PTR _stack_pointer_rtx
	push	eax
	push	10					; 0000000aH
	push	37					; 00000025H
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _xops$1496[ebp], eax
; Line 342
	push	4
	push	0
	push	30					; 0000001eH
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _xops$1496[ebp+4], eax
; Line 343
	mov	eax, DWORD PTR _stack_pointer_rtx
	mov	DWORD PTR _xops$1496[ebp+8], eax
; Line 345
	lea	eax, DWORD PTR _xops$1496[ebp]
	push	eax
	push	OFFSET FLAT:$SG1497
	call	_output_asm_insn
	add	esp, 8
; Line 346
	mov	eax, DWORD PTR _insn$[ebp]
	push	eax
	call	_top_dead_p
	add	esp, 4
	or	eax, eax
	je	$L1498
; Line 347
	lea	eax, DWORD PTR _xops$1496[ebp]
	push	eax
	push	OFFSET FLAT:$SG1499
	call	_output_asm_insn
	add	esp, 8
; Line 348
	jmp	$L1500
$L1498:
; Line 349
	lea	eax, DWORD PTR _xops$1496[ebp]
	push	eax
	push	OFFSET FLAT:$SG1501
	call	_output_asm_insn
	add	esp, 8
$L1500:
; Line 350
	mov	eax, OFFSET FLAT:$SG1502
	jmp	$L1494
; Line 352
$L1495:
	mov	eax, OFFSET FLAT:$SG1503
	jmp	$L1494
; Line 354
$L1494:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_output_19 ENDP
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+1
$SG1512	DB	00H
_DATA	ENDS
_TEXT	SEGMENT
_operands$ = 8
_insn$ = 12
_output_20 PROC NEAR
; Line 360
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 365
	mov	eax, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1508
	mov	eax, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [eax+4]
	cmp	DWORD PTR [eax+4], 8
	jl	$L1508
	mov	eax, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [eax+4]
	cmp	DWORD PTR [eax+4], 10			; 0000000aH
	jge	$L1508
	mov	eax, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1509
	mov	eax, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [eax]
	cmp	DWORD PTR [eax+4], 8
	jl	$L1510
	mov	eax, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [eax]
	cmp	DWORD PTR [eax+4], 10			; 0000000aH
	jl	$L1508
$L1510:
$L1509:
	mov	eax, DWORD PTR _insn$[ebp]
	push	eax
	call	_top_dead_p
	add	esp, 4
	or	eax, eax
	jne	$L1508
; Line 366
	mov	eax, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [eax]
	push	eax
	call	_fp_store_sf
	add	esp, 4
; Line 367
	jmp	$L1511
$L1508:
; Line 368
	mov	eax, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	mov	eax, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [eax]
	push	eax
	call	_output_movsf
	add	esp, 8
$L1511:
; Line 369
	mov	eax, OFFSET FLAT:$SG1512
	jmp	$L1507
; Line 371
$L1507:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_output_20 ENDP
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+3
$SG1519	DB	'sub%L0 %1,%2', 00H
	ORG $+3
$SG1521	DB	'fstp%Q0 %0', 00H
	ORG $+1
$SG1523	DB	'fst%Q0 %0', 00H
	ORG $+2
$SG1524	DB	00H
_DATA	ENDS
_TEXT	SEGMENT
_operands$ = 8
_insn$ = 12
_xops$1518 = -12
_output_21 PROC NEAR
; Line 377
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
	push	ebx
	push	esi
	push	edi
; Line 380
	mov	eax, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1517
	mov	eax, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [eax+4]
	cmp	DWORD PTR [eax+4], 8
	jl	$L1517
	mov	eax, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [eax+4]
	cmp	DWORD PTR [eax+4], 10			; 0000000aH
	jge	$L1517
; Line 383
	mov	eax, DWORD PTR _stack_pointer_rtx
	push	eax
	push	11					; 0000000bH
	push	37					; 00000025H
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _xops$1518[ebp], eax
; Line 384
	push	8
	push	0
	push	30					; 0000001eH
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _xops$1518[ebp+4], eax
; Line 385
	mov	eax, DWORD PTR _stack_pointer_rtx
	mov	DWORD PTR _xops$1518[ebp+8], eax
; Line 387
	lea	eax, DWORD PTR _xops$1518[ebp]
	push	eax
	push	OFFSET FLAT:$SG1519
	call	_output_asm_insn
	add	esp, 8
; Line 388
	mov	eax, DWORD PTR _insn$[ebp]
	push	eax
	call	_top_dead_p
	add	esp, 4
	or	eax, eax
	je	$L1520
; Line 389
	lea	eax, DWORD PTR _xops$1518[ebp]
	push	eax
	push	OFFSET FLAT:$SG1521
	call	_output_asm_insn
	add	esp, 8
; Line 390
	jmp	$L1522
$L1520:
; Line 391
	lea	eax, DWORD PTR _xops$1518[ebp]
	push	eax
	push	OFFSET FLAT:$SG1523
	call	_output_asm_insn
	add	esp, 8
$L1522:
; Line 392
	mov	eax, OFFSET FLAT:$SG1524
	jmp	$L1516
; Line 394
	jmp	$L1525
$L1517:
; Line 395
	mov	eax, DWORD PTR _operands$[ebp]
	push	eax
	call	_output_move_double
	add	esp, 4
	jmp	$L1516
$L1525:
; Line 397
$L1516:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_output_21 ENDP
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+3
$SG1534	DB	00H
_DATA	ENDS
_TEXT	SEGMENT
_operands$ = 8
_insn$ = 12
_output_22 PROC NEAR
; Line 403
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 408
	mov	eax, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1530
	mov	eax, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [eax+4]
	cmp	DWORD PTR [eax+4], 8
	jl	$L1530
	mov	eax, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [eax+4]
	cmp	DWORD PTR [eax+4], 10			; 0000000aH
	jge	$L1530
	mov	eax, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1531
	mov	eax, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [eax]
	cmp	DWORD PTR [eax+4], 8
	jl	$L1532
	mov	eax, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [eax]
	cmp	DWORD PTR [eax+4], 10			; 0000000aH
	jl	$L1530
$L1532:
$L1531:
	mov	eax, DWORD PTR _insn$[ebp]
	push	eax
	call	_top_dead_p
	add	esp, 4
	or	eax, eax
	jne	$L1530
; Line 409
	mov	eax, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [eax]
	push	eax
	call	_fp_store_df
	add	esp, 4
; Line 410
	jmp	$L1533
$L1530:
; Line 411
	mov	eax, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	mov	eax, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [eax]
	push	eax
	call	_output_movdf
	add	esp, 8
$L1533:
; Line 412
	mov	eax, OFFSET FLAT:$SG1534
	jmp	$L1529
; Line 414
$L1529:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_output_22 ENDP
_operands$ = 8
_output_23 PROC NEAR
; Line 420
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 423
	mov	eax, DWORD PTR _operands$[ebp]
	push	eax
	call	_output_move_double
	add	esp, 4
	jmp	$L1538
; Line 425
$L1538:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_output_23 ENDP
_operands$ = 8
_output_24 PROC NEAR
; Line 431
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 434
	mov	eax, DWORD PTR _operands$[ebp]
	push	eax
	call	_output_move_double
	add	esp, 4
	jmp	$L1542
; Line 436
$L1542:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_output_24 ENDP
_TEXT	ENDS
EXTRN	_rtx_equal_p:NEAR
_DATA	SEGMENT
	ORG $+3
$SG1549	DB	'add%L0 %1,%0', 00H
	ORG $+3
$SG1550	DB	'lea%L0 %a1,%0', 00H
_DATA	ENDS
_TEXT	SEGMENT
_operands$ = 8
_output_28 PROC NEAR
; Line 442
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 445
	mov	DWORD PTR _cc_status, 0
	mov	DWORD PTR _cc_status+4, 0
	mov	DWORD PTR _cc_status+8, 0
; Line 449
	mov	eax, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2883584				; 002c0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1548
	mov	eax, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1548
	mov	eax, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	mov	eax, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [eax]
	push	eax
	call	_rtx_equal_p
	add	esp, 8
	or	eax, eax
	je	$L1548
; Line 451
	mov	eax, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+8]
	mov	ecx, DWORD PTR _operands$[ebp]
	mov	DWORD PTR [ecx+4], eax
; Line 452
	mov	eax, OFFSET FLAT:$SG1549
	jmp	$L1546
; Line 454
$L1548:
	mov	eax, OFFSET FLAT:$SG1550
	jmp	$L1546
; Line 456
$L1546:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_output_28 ENDP
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+2
$SG1557	DB	'mov%L0 %1,%k0', 00H
	ORG $+2
$SG1558	DB	'mov%B0 %b1,%0', 00H
_DATA	ENDS
_TEXT	SEGMENT
_operands$ = 8
_output_29 PROC NEAR
; Line 462
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 465
	mov	eax, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2490368				; 00260000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1556
	mov	eax, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2555904				; 00270000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1556
	mov	eax, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1556
	mov	eax, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2097152				; 00200000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1555
$L1556:
	mov	eax, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1555
; Line 466
	mov	eax, OFFSET FLAT:$SG1557
	jmp	$L1554
; Line 467
$L1555:
	mov	eax, OFFSET FLAT:$SG1558
	jmp	$L1554
; Line 469
$L1554:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_output_29 ENDP
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+2
$SG1565	DB	'mov%W0 %1,%w0', 00H
	ORG $+2
$SG1566	DB	'mov%B0 %b1,%0', 00H
_DATA	ENDS
_TEXT	SEGMENT
_operands$ = 8
_output_30 PROC NEAR
; Line 475
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 478
	mov	eax, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2490368				; 00260000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1564
	mov	eax, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2555904				; 00270000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1564
	mov	eax, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1564
	mov	eax, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2097152				; 00200000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1563
$L1564:
	mov	eax, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1563
; Line 479
	mov	eax, OFFSET FLAT:$SG1565
	jmp	$L1562
; Line 480
$L1563:
	mov	eax, OFFSET FLAT:$SG1566
	jmp	$L1562
; Line 482
$L1562:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_output_30 ENDP
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+2
$SG1573	DB	'mov%L0 %1,%k0', 00H
	ORG $+2
$SG1574	DB	'mov%W0 %w1,%0', 00H
_DATA	ENDS
_TEXT	SEGMENT
_operands$ = 8
_output_31 PROC NEAR
; Line 488
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 491
	mov	eax, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2490368				; 00260000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1572
	mov	eax, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2555904				; 00270000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1572
	mov	eax, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1572
	mov	eax, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2097152				; 00200000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1571
$L1572:
	mov	eax, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1571
; Line 492
	mov	eax, OFFSET FLAT:$SG1573
	jmp	$L1570
; Line 493
$L1571:
	mov	eax, OFFSET FLAT:$SG1574
	jmp	$L1570
; Line 495
$L1570:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_output_31 ENDP
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+2
$SG1580	DB	00H
	ORG $+3
$SG1584	DB	00H
	ORG $+3
$SG1585	DB	00H
_DATA	ENDS
_TEXT	SEGMENT
_operands$ = 8
_insn$ = 12
_output_38 PROC NEAR
; Line 501
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 504
	mov	eax, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1579
	mov	eax, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [eax]
	cmp	DWORD PTR [eax+4], 8
	jl	$L1579
	mov	eax, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [eax]
	cmp	DWORD PTR [eax+4], 10			; 0000000aH
	jge	$L1579
; Line 506
	mov	eax, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	mov	eax, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [eax]
	push	eax
	call	_output_movsf
	add	esp, 8
; Line 507
	mov	eax, OFFSET FLAT:$SG1580
	jmp	$L1578
; Line 509
$L1579:
	mov	eax, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1581
	mov	eax, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [eax+4]
	cmp	DWORD PTR [eax+4], 8
	jl	$L1581
	mov	eax, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [eax+4]
	cmp	DWORD PTR [eax+4], 10			; 0000000aH
	jge	$L1581
; Line 511
	mov	eax, DWORD PTR _insn$[ebp]
	push	eax
	call	_top_dead_p
	add	esp, 4
	or	eax, eax
	je	$L1582
; Line 512
	mov	eax, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [eax]
	push	eax
	call	_fp_pop_df
	add	esp, 4
; Line 513
	jmp	$L1583
$L1582:
; Line 514
	mov	eax, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [eax]
	push	eax
	call	_fp_store_df
	add	esp, 4
$L1583:
; Line 515
	mov	eax, OFFSET FLAT:$SG1584
	jmp	$L1578
; Line 517
$L1581:
	mov	eax, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	push	8
	push	11					; 0000000bH
	push	34					; 00000022H
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	push	eax
	call	_output_movsf
	add	esp, 8
; Line 518
	mov	eax, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [eax]
	push	eax
	call	_fp_pop_df
	add	esp, 4
; Line 519
	mov	eax, OFFSET FLAT:$SG1585
	jmp	$L1578
; Line 521
$L1578:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_output_38 ENDP
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+3
$SG1592	DB	00H
_DATA	ENDS
_TEXT	SEGMENT
_operands$ = 8
_insn$ = 12
_output_39 PROC NEAR
; Line 527
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 530
	mov	eax, DWORD PTR _insn$[ebp]
	push	eax
	call	_top_dead_p
	add	esp, 4
	or	eax, eax
	je	$L1590
; Line 531
	mov	eax, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [eax]
	push	eax
	call	_fp_pop_sf
	add	esp, 4
; Line 532
	jmp	$L1591
$L1590:
; Line 533
	mov	eax, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [eax]
	push	eax
	call	_fp_store_sf
	add	esp, 4
$L1591:
; Line 534
	mov	eax, OFFSET FLAT:$SG1592
	jmp	$L1589
; Line 536
$L1589:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_output_39 ENDP
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+3
$SG1599	DB	'push%L0 %1', 00H
	ORG $+1
$SG1600	DB	'fild%L0 %1', 00H
	ORG $+1
$SG1601	DB	'add%L0 %1,%0', 00H
	ORG $+3
$SG1603	DB	'fild%L0 %1', 00H
	ORG $+1
$SG1607	DB	'fstp%S0 %0', 00H
	ORG $+1
$SG1608	DB	00H
_DATA	ENDS
_TEXT	SEGMENT
_operands$ = 8
_xops$1598 = -8
_output_40 PROC NEAR
; Line 542
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	push	ebx
	push	esi
	push	edi
; Line 547
	mov	eax, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2424832				; 00250000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1597
; Line 550
	mov	eax, DWORD PTR _operands$[ebp]
	push	eax
	push	OFFSET FLAT:$SG1599
	call	_output_asm_insn
	add	esp, 8
; Line 551
	mov	eax, DWORD PTR _stack_pointer_rtx
	push	eax
	push	4
	push	37					; 00000025H
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	mov	ecx, DWORD PTR _operands$[ebp]
	mov	DWORD PTR [ecx+4], eax
; Line 552
	mov	eax, DWORD PTR _operands$[ebp]
	push	eax
	push	OFFSET FLAT:$SG1600
	call	_output_asm_insn
	add	esp, 8
; Line 553
	mov	eax, DWORD PTR _stack_pointer_rtx
	mov	DWORD PTR _xops$1598[ebp], eax
; Line 554
	push	4
	push	0
	push	30					; 0000001eH
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _xops$1598[ebp+4], eax
; Line 555
	lea	eax, DWORD PTR _xops$1598[ebp]
	push	eax
	push	OFFSET FLAT:$SG1601
	call	_output_asm_insn
	add	esp, 8
; Line 557
	jmp	$L1602
$L1597:
; Line 558
	mov	eax, DWORD PTR _operands$[ebp]
	push	eax
	push	OFFSET FLAT:$SG1603
	call	_output_asm_insn
	add	esp, 8
$L1602:
; Line 560
	mov	eax, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1605
	mov	eax, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [eax]
	cmp	DWORD PTR [eax+4], 8
	jl	$L1606
	mov	eax, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [eax]
	cmp	DWORD PTR [eax+4], 10			; 0000000aH
	jl	$L1604
$L1606:
$L1605:
; Line 563
	mov	eax, OFFSET FLAT:$SG1607
	jmp	$L1596
; Line 565
$L1604:
	mov	eax, OFFSET FLAT:$SG1608
	jmp	$L1596
; Line 567
$L1596:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_output_40 ENDP
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+3
$SG1615	DB	'push%L0 %1', 00H
	ORG $+1
$SG1616	DB	'fild%L0 %1', 00H
	ORG $+1
$SG1617	DB	'add%L0 %1,%0', 00H
	ORG $+3
$SG1619	DB	'fild%L0 %1', 00H
	ORG $+1
$SG1623	DB	'fstp%Q0 %0', 00H
	ORG $+1
$SG1624	DB	00H
_DATA	ENDS
_TEXT	SEGMENT
_operands$ = 8
_xops$1614 = -8
_output_41 PROC NEAR
; Line 573
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	push	ebx
	push	esi
	push	edi
; Line 577
	mov	eax, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2424832				; 00250000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1613
; Line 580
	mov	eax, DWORD PTR _operands$[ebp]
	push	eax
	push	OFFSET FLAT:$SG1615
	call	_output_asm_insn
	add	esp, 8
; Line 581
	mov	eax, DWORD PTR _stack_pointer_rtx
	push	eax
	push	4
	push	37					; 00000025H
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	mov	ecx, DWORD PTR _operands$[ebp]
	mov	DWORD PTR [ecx+4], eax
; Line 582
	mov	eax, DWORD PTR _operands$[ebp]
	push	eax
	push	OFFSET FLAT:$SG1616
	call	_output_asm_insn
	add	esp, 8
; Line 583
	mov	eax, DWORD PTR _stack_pointer_rtx
	mov	DWORD PTR _xops$1614[ebp], eax
; Line 584
	push	4
	push	0
	push	30					; 0000001eH
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _xops$1614[ebp+4], eax
; Line 585
	lea	eax, DWORD PTR _xops$1614[ebp]
	push	eax
	push	OFFSET FLAT:$SG1617
	call	_output_asm_insn
	add	esp, 8
; Line 587
	jmp	$L1618
$L1613:
; Line 588
	mov	eax, DWORD PTR _operands$[ebp]
	push	eax
	push	OFFSET FLAT:$SG1619
	call	_output_asm_insn
	add	esp, 8
$L1618:
; Line 589
	mov	eax, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1621
	mov	eax, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [eax]
	cmp	DWORD PTR [eax+4], 8
	jl	$L1622
	mov	eax, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [eax]
	cmp	DWORD PTR [eax+4], 10			; 0000000aH
	jl	$L1620
$L1622:
$L1621:
; Line 592
	mov	eax, OFFSET FLAT:$SG1623
	jmp	$L1612
; Line 594
$L1620:
	mov	eax, OFFSET FLAT:$SG1624
	jmp	$L1612
; Line 596
$L1612:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_output_41 ENDP
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+3
$SG1629	DB	'fadd%z0 %0', 00H
	ORG $+1
$SG1630	DB	'fadd%z0 %0', 00H
_DATA	ENDS
_TEXT	SEGMENT
_operands$ = 8
_insn$ = 12
_output_47 PROC NEAR
; Line 602
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 603
	mov	eax, DWORD PTR _insn$[ebp]
	push	eax
	mov	eax, DWORD PTR _operands$[ebp]
	push	eax
	push	2
	push	OFFSET FLAT:$SG1629
	push	OFFSET FLAT:$SG1630
	call	_fp_call_internal
	add	esp, 20					; 00000014H
	jmp	$L1628
; Line 604
$L1628:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_output_47 ENDP
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+1
$SG1635	DB	'fadd%z0 %0', 00H
	ORG $+1
$SG1636	DB	'fadd%z0 %0', 00H
_DATA	ENDS
_TEXT	SEGMENT
_operands$ = 8
_insn$ = 12
_output_48 PROC NEAR
; Line 610
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 611
	mov	eax, DWORD PTR _insn$[ebp]
	push	eax
	mov	eax, DWORD PTR _operands$[ebp]
	push	eax
	push	2
	push	OFFSET FLAT:$SG1635
	push	OFFSET FLAT:$SG1636
	call	_fp_call_internal
	add	esp, 20					; 00000014H
	jmp	$L1634
; Line 612
$L1634:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_output_48 ENDP
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+1
$SG1641	DB	'fsubr%z0 %0', 00H
$SG1642	DB	'fsub%z0 %0', 00H
_DATA	ENDS
_TEXT	SEGMENT
_operands$ = 8
_insn$ = 12
_output_54 PROC NEAR
; Line 618
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 619
	mov	eax, DWORD PTR _insn$[ebp]
	push	eax
	mov	eax, DWORD PTR _operands$[ebp]
	push	eax
	push	2
	push	OFFSET FLAT:$SG1641
	push	OFFSET FLAT:$SG1642
	call	_fp_call_internal
	add	esp, 20					; 00000014H
	jmp	$L1640
; Line 620
$L1640:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_output_54 ENDP
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+1
$SG1647	DB	'fsubr%z0 %0', 00H
$SG1648	DB	'fsub%z0 %0', 00H
_DATA	ENDS
_TEXT	SEGMENT
_operands$ = 8
_insn$ = 12
_output_55 PROC NEAR
; Line 626
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 627
	mov	eax, DWORD PTR _insn$[ebp]
	push	eax
	mov	eax, DWORD PTR _operands$[ebp]
	push	eax
	push	2
	push	OFFSET FLAT:$SG1647
	push	OFFSET FLAT:$SG1648
	call	_fp_call_internal
	add	esp, 20					; 00000014H
	jmp	$L1646
; Line 628
$L1646:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_output_55 ENDP
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+1
$SG1655	DB	'imul%W0 %2,%0', 00H
	ORG $+2
$SG1656	DB	'imul%W0 %2,%1,%0', 00H
_DATA	ENDS
_TEXT	SEGMENT
_operands$ = 8
_output_56 PROC NEAR
; Line 634
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 640
	mov	eax, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1653
	mov	eax, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _operands$[ebp]
	mov	ecx, DWORD PTR [ecx]
	mov	ecx, DWORD PTR [ecx+4]
	cmp	DWORD PTR [eax+4], ecx
	jne	$L1653
	mov	eax, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2424832				; 00250000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1654
	mov	eax, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1653
$L1654:
; Line 642
	mov	eax, OFFSET FLAT:$SG1655
	jmp	$L1652
; Line 643
$L1653:
	mov	eax, OFFSET FLAT:$SG1656
	jmp	$L1652
; Line 645
$L1652:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_output_56 ENDP
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+3
$SG1663	DB	'imul%L0 %2,%0', 00H
	ORG $+2
$SG1664	DB	'imul%L0 %2,%1,%0', 00H
_DATA	ENDS
_TEXT	SEGMENT
_operands$ = 8
_output_57 PROC NEAR
; Line 651
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 657
	mov	eax, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1661
	mov	eax, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _operands$[ebp]
	mov	ecx, DWORD PTR [ecx]
	mov	ecx, DWORD PTR [ecx+4]
	cmp	DWORD PTR [eax+4], ecx
	jne	$L1661
	mov	eax, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2424832				; 00250000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L1662
	mov	eax, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1661
$L1662:
; Line 659
	mov	eax, OFFSET FLAT:$SG1663
	jmp	$L1660
; Line 660
$L1661:
	mov	eax, OFFSET FLAT:$SG1664
	jmp	$L1660
; Line 662
$L1660:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_output_57 ENDP
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+3
$SG1669	DB	'fmul%z0 %0', 00H
	ORG $+1
$SG1670	DB	'fmul%z0 %0', 00H
_DATA	ENDS
_TEXT	SEGMENT
_operands$ = 8
_insn$ = 12
_output_60 PROC NEAR
; Line 668
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 669
	mov	eax, DWORD PTR _insn$[ebp]
	push	eax
	mov	eax, DWORD PTR _operands$[ebp]
	push	eax
	push	2
	push	OFFSET FLAT:$SG1669
	push	OFFSET FLAT:$SG1670
	call	_fp_call_internal
	add	esp, 20					; 00000014H
	jmp	$L1668
; Line 671
$L1668:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_output_60 ENDP
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+1
$SG1675	DB	'fmul%z0 %0', 00H
	ORG $+1
$SG1676	DB	'fmul%z0 %0', 00H
_DATA	ENDS
_TEXT	SEGMENT
_operands$ = 8
_insn$ = 12
_output_61 PROC NEAR
; Line 677
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 678
	mov	eax, DWORD PTR _insn$[ebp]
	push	eax
	mov	eax, DWORD PTR _operands$[ebp]
	push	eax
	push	2
	push	OFFSET FLAT:$SG1675
	push	OFFSET FLAT:$SG1676
	call	_fp_call_internal
	add	esp, 20					; 00000014H
	jmp	$L1674
; Line 680
$L1674:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_output_61 ENDP
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+1
$SG1681	DB	'fdivr%z0 %0', 00H
$SG1682	DB	'fdiv%z0 %0', 00H
_DATA	ENDS
_TEXT	SEGMENT
_operands$ = 8
_insn$ = 12
_output_62 PROC NEAR
; Line 686
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 687
	mov	eax, DWORD PTR _insn$[ebp]
	push	eax
	mov	eax, DWORD PTR _operands$[ebp]
	push	eax
	push	2
	push	OFFSET FLAT:$SG1681
	push	OFFSET FLAT:$SG1682
	call	_fp_call_internal
	add	esp, 20					; 00000014H
	jmp	$L1680
; Line 689
$L1680:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_output_62 ENDP
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+1
$SG1687	DB	'fdivr%z0 %0', 00H
$SG1688	DB	'fdiv%z0 %0', 00H
_DATA	ENDS
_TEXT	SEGMENT
_operands$ = 8
_insn$ = 12
_output_63 PROC NEAR
; Line 695
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 696
	mov	eax, DWORD PTR _insn$[ebp]
	push	eax
	mov	eax, DWORD PTR _operands$[ebp]
	push	eax
	push	2
	push	OFFSET FLAT:$SG1687
	push	OFFSET FLAT:$SG1688
	call	_fp_call_internal
	add	esp, 20					; 00000014H
	jmp	$L1686
; Line 698
$L1686:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_output_63 ENDP
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+1
$SG1694	DB	'fchs', 00H
	ORG $+3
$SG1695	DB	'fchs', 00H
	ORG $+3
$SG1696	DB	'fstp%z0 %0', 00H
_DATA	ENDS
_TEXT	SEGMENT
_operands$ = 8
_output_80 PROC NEAR
; Line 704
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 705
	mov	eax, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1693
	mov	eax, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [eax]
	cmp	DWORD PTR [eax+4], 8
	jl	$L1693
	mov	eax, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [eax]
	cmp	DWORD PTR [eax+4], 10			; 0000000aH
	jge	$L1693
	mov	eax, OFFSET FLAT:$SG1694
	jmp	$L1692
$L1693:
	mov	eax, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	push	8
	push	11					; 0000000bH
	push	34					; 00000022H
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	push	eax
	call	_output_movf
	add	esp, 8
	mov	eax, DWORD PTR _operands$[ebp]
	push	eax
	push	OFFSET FLAT:$SG1695
	call	_output_asm_insn
	add	esp, 8
	mov	eax, OFFSET FLAT:$SG1696
	jmp	$L1692
; Line 706
$L1692:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_output_80 ENDP
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+1
$SG1702	DB	'fchs', 00H
	ORG $+3
$SG1703	DB	'fchs', 00H
	ORG $+3
$SG1704	DB	'fstp%z0 %0', 00H
_DATA	ENDS
_TEXT	SEGMENT
_operands$ = 8
_output_81 PROC NEAR
; Line 712
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 713
	mov	eax, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1701
	mov	eax, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [eax]
	cmp	DWORD PTR [eax+4], 8
	jl	$L1701
	mov	eax, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [eax]
	cmp	DWORD PTR [eax+4], 10			; 0000000aH
	jge	$L1701
	mov	eax, OFFSET FLAT:$SG1702
	jmp	$L1700
$L1701:
	mov	eax, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	push	8
	push	11					; 0000000bH
	push	34					; 00000022H
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	push	eax
	call	_output_movf
	add	esp, 8
	mov	eax, DWORD PTR _operands$[ebp]
	push	eax
	push	OFFSET FLAT:$SG1703
	call	_output_asm_insn
	add	esp, 8
	mov	eax, OFFSET FLAT:$SG1704
	jmp	$L1700
; Line 714
$L1700:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_output_81 ENDP
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+1
$SG1710	DB	'fabs', 00H
	ORG $+3
$SG1711	DB	'fabs', 00H
	ORG $+3
$SG1712	DB	'fstp%z0 %0', 00H
_DATA	ENDS
_TEXT	SEGMENT
_operands$ = 8
_output_82 PROC NEAR
; Line 720
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 721
	mov	eax, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1709
	mov	eax, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [eax]
	cmp	DWORD PTR [eax+4], 8
	jl	$L1709
	mov	eax, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [eax]
	cmp	DWORD PTR [eax+4], 10			; 0000000aH
	jge	$L1709
	mov	eax, OFFSET FLAT:$SG1710
	jmp	$L1708
$L1709:
	mov	eax, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	push	8
	push	11					; 0000000bH
	push	34					; 00000022H
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	push	eax
	call	_output_movf
	add	esp, 8
	mov	eax, DWORD PTR _operands$[ebp]
	push	eax
	push	OFFSET FLAT:$SG1711
	call	_output_asm_insn
	add	esp, 8
	mov	eax, OFFSET FLAT:$SG1712
	jmp	$L1708
; Line 722
$L1708:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_output_82 ENDP
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+1
$SG1718	DB	'fabs', 00H
	ORG $+3
$SG1719	DB	'fabs', 00H
	ORG $+3
$SG1720	DB	'fstp%z0 %0', 00H
_DATA	ENDS
_TEXT	SEGMENT
_operands$ = 8
_output_83 PROC NEAR
; Line 728
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 729
	mov	eax, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1717
	mov	eax, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [eax]
	cmp	DWORD PTR [eax+4], 8
	jl	$L1717
	mov	eax, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [eax]
	cmp	DWORD PTR [eax+4], 10			; 0000000aH
	jge	$L1717
	mov	eax, OFFSET FLAT:$SG1718
	jmp	$L1716
$L1717:
	mov	eax, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	push	8
	push	11					; 0000000bH
	push	34					; 00000022H
	call	_gen_rtx
	add	esp, 12					; 0000000cH
	push	eax
	call	_output_movf
	add	esp, 8
	mov	eax, DWORD PTR _operands$[ebp]
	push	eax
	push	OFFSET FLAT:$SG1719
	call	_output_asm_insn
	add	esp, 8
	mov	eax, OFFSET FLAT:$SG1720
	jmp	$L1716
; Line 730
$L1716:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_output_83 ENDP
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+1
$SG1726	DB	'sal%L0 %R0cl,%0', 00H
$SG1729	DB	'add%L0 %1,%1', 00H
	ORG $+3
$SG1730	DB	'sal%L0 %2,%1', 00H
_DATA	ENDS
_TEXT	SEGMENT
_operands$ = 8
_output_87 PROC NEAR
; Line 736
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 739
	mov	eax, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1725
; Line 740
	mov	eax, OFFSET FLAT:$SG1726
	jmp	$L1724
; Line 741
	jmp	$L1727
$L1725:
; Line 742
	mov	eax, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1728
	mov	eax, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1728
	mov	eax, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [eax+8]
	cmp	DWORD PTR [eax+4], 1
	jne	$L1728
; Line 743
	mov	eax, OFFSET FLAT:$SG1729
	jmp	$L1724
; Line 744
$L1728:
$L1727:
	mov	eax, OFFSET FLAT:$SG1730
	jmp	$L1724
; Line 746
$L1724:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_output_87 ENDP
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+3
$SG1736	DB	'sal%W0 %R0cl,%0', 00H
$SG1738	DB	'sal%W0 %2,%1', 00H
_DATA	ENDS
_TEXT	SEGMENT
_operands$ = 8
_output_88 PROC NEAR
; Line 752
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 755
	mov	eax, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1735
; Line 756
	mov	eax, OFFSET FLAT:$SG1736
	jmp	$L1734
; Line 757
	jmp	$L1737
$L1735:
; Line 758
	mov	eax, OFFSET FLAT:$SG1738
	jmp	$L1734
$L1737:
; Line 760
$L1734:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_output_88 ENDP
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+3
$SG1744	DB	'sal%B0 %R0cl,%0', 00H
$SG1746	DB	'sal%B0 %2,%1', 00H
_DATA	ENDS
_TEXT	SEGMENT
_operands$ = 8
_output_89 PROC NEAR
; Line 766
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 769
	mov	eax, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1743
; Line 770
	mov	eax, OFFSET FLAT:$SG1744
	jmp	$L1742
; Line 771
	jmp	$L1745
$L1743:
; Line 772
	mov	eax, OFFSET FLAT:$SG1746
	jmp	$L1742
$L1745:
; Line 774
$L1742:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_output_89 ENDP
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+3
$SG1752	DB	'sar%L0 %R0cl,%0', 00H
$SG1754	DB	'sar%L0 %2,%0', 00H
_DATA	ENDS
_TEXT	SEGMENT
_operands$ = 8
_output_90 PROC NEAR
; Line 780
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 783
	mov	eax, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1751
; Line 784
	mov	eax, OFFSET FLAT:$SG1752
	jmp	$L1750
; Line 785
	jmp	$L1753
$L1751:
; Line 786
	mov	eax, OFFSET FLAT:$SG1754
	jmp	$L1750
$L1753:
; Line 788
$L1750:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_output_90 ENDP
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+3
$SG1760	DB	'sar%W0 %R0cl,%0', 00H
$SG1762	DB	'sar%W0 %2,%0', 00H
_DATA	ENDS
_TEXT	SEGMENT
_operands$ = 8
_output_91 PROC NEAR
; Line 794
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 797
	mov	eax, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1759
; Line 798
	mov	eax, OFFSET FLAT:$SG1760
	jmp	$L1758
; Line 799
	jmp	$L1761
$L1759:
; Line 800
	mov	eax, OFFSET FLAT:$SG1762
	jmp	$L1758
$L1761:
; Line 802
$L1758:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_output_91 ENDP
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+3
$SG1768	DB	'sar%B0 %R0cl,%0', 00H
$SG1769	DB	'sar%B0 %2,%1', 00H
_DATA	ENDS
_TEXT	SEGMENT
_operands$ = 8
_output_92 PROC NEAR
; Line 808
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 811
	mov	eax, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1767
; Line 812
	mov	eax, OFFSET FLAT:$SG1768
	jmp	$L1766
; Line 813
$L1767:
; Line 814
	mov	eax, OFFSET FLAT:$SG1769
	jmp	$L1766
; Line 816
$L1766:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_output_92 ENDP
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+3
$SG1775	DB	'shl%L0 %R0cl,%0', 00H
$SG1777	DB	'shl%L0 %2,%1', 00H
_DATA	ENDS
_TEXT	SEGMENT
_operands$ = 8
_output_93 PROC NEAR
; Line 822
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 825
	mov	eax, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1774
; Line 826
	mov	eax, OFFSET FLAT:$SG1775
	jmp	$L1773
; Line 827
	jmp	$L1776
$L1774:
; Line 828
	mov	eax, OFFSET FLAT:$SG1777
	jmp	$L1773
$L1776:
; Line 830
$L1773:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_output_93 ENDP
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+3
$SG1783	DB	'shl%W0 %R0cl,%0', 00H
$SG1785	DB	'shl%W0 %2,%1', 00H
_DATA	ENDS
_TEXT	SEGMENT
_operands$ = 8
_output_94 PROC NEAR
; Line 836
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 839
	mov	eax, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1782
; Line 840
	mov	eax, OFFSET FLAT:$SG1783
	jmp	$L1781
; Line 841
	jmp	$L1784
$L1782:
; Line 842
	mov	eax, OFFSET FLAT:$SG1785
	jmp	$L1781
$L1784:
; Line 844
$L1781:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_output_94 ENDP
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+3
$SG1791	DB	'shl%B0 %R0cl,%0', 00H
$SG1793	DB	'shl%B0 %2,%1', 00H
_DATA	ENDS
_TEXT	SEGMENT
_operands$ = 8
_output_95 PROC NEAR
; Line 850
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 853
	mov	eax, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1790
; Line 854
	mov	eax, OFFSET FLAT:$SG1791
	jmp	$L1789
; Line 855
	jmp	$L1792
$L1790:
; Line 856
	mov	eax, OFFSET FLAT:$SG1793
	jmp	$L1789
$L1792:
; Line 858
$L1789:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_output_95 ENDP
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+3
$SG1799	DB	'shr%L0 %R0cl,%0', 00H
$SG1801	DB	'shr%L0 %2,%1', 00H
_DATA	ENDS
_TEXT	SEGMENT
_operands$ = 8
_output_96 PROC NEAR
; Line 864
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 867
	mov	eax, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1798
; Line 868
	mov	eax, OFFSET FLAT:$SG1799
	jmp	$L1797
; Line 869
	jmp	$L1800
$L1798:
; Line 870
	mov	eax, OFFSET FLAT:$SG1801
	jmp	$L1797
$L1800:
; Line 872
$L1797:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_output_96 ENDP
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+3
$SG1807	DB	'shr%W0 %%cl,%0', 00H
	ORG $+1
$SG1809	DB	'shr%W0 %2,%1', 00H
_DATA	ENDS
_TEXT	SEGMENT
_operands$ = 8
_output_97 PROC NEAR
; Line 878
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 881
	mov	eax, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1806
; Line 882
	mov	eax, OFFSET FLAT:$SG1807
	jmp	$L1805
; Line 883
	jmp	$L1808
$L1806:
; Line 884
	mov	eax, OFFSET FLAT:$SG1809
	jmp	$L1805
$L1808:
; Line 886
$L1805:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_output_97 ENDP
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+3
$SG1815	DB	'shr%B0 %%cl,%0', 00H
	ORG $+1
$SG1817	DB	'shr%B0 %2,%1', 00H
_DATA	ENDS
_TEXT	SEGMENT
_operands$ = 8
_output_98 PROC NEAR
; Line 892
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 895
	mov	eax, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1814
; Line 896
	mov	eax, OFFSET FLAT:$SG1815
	jmp	$L1813
; Line 897
	jmp	$L1816
$L1814:
; Line 898
	mov	eax, OFFSET FLAT:$SG1817
	jmp	$L1813
$L1816:
; Line 900
$L1813:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_output_98 ENDP
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+3
$SG1823	DB	'rol%L0 %%cl,%0', 00H
	ORG $+1
$SG1825	DB	'rol%L0 %2,%1', 00H
_DATA	ENDS
_TEXT	SEGMENT
_operands$ = 8
_output_99 PROC NEAR
; Line 906
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 909
	mov	eax, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1822
; Line 910
	mov	eax, OFFSET FLAT:$SG1823
	jmp	$L1821
; Line 911
	jmp	$L1824
$L1822:
; Line 912
	mov	eax, OFFSET FLAT:$SG1825
	jmp	$L1821
$L1824:
; Line 914
$L1821:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_output_99 ENDP
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+3
$SG1831	DB	'rol%W0 %%cl,%0', 00H
	ORG $+1
$SG1833	DB	'rol%W0 %2,%1', 00H
_DATA	ENDS
_TEXT	SEGMENT
_operands$ = 8
_output_100 PROC NEAR
; Line 920
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 923
	mov	eax, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1830
; Line 924
	mov	eax, OFFSET FLAT:$SG1831
	jmp	$L1829
; Line 925
	jmp	$L1832
$L1830:
; Line 926
	mov	eax, OFFSET FLAT:$SG1833
	jmp	$L1829
$L1832:
; Line 928
$L1829:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_output_100 ENDP
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+3
$SG1839	DB	'rol%B0 %%cl,%0', 00H
	ORG $+1
$SG1841	DB	'rol%B0 %2,%1', 00H
_DATA	ENDS
_TEXT	SEGMENT
_operands$ = 8
_output_101 PROC NEAR
; Line 934
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 937
	mov	eax, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1838
; Line 938
	mov	eax, OFFSET FLAT:$SG1839
	jmp	$L1837
; Line 939
	jmp	$L1840
$L1838:
; Line 940
	mov	eax, OFFSET FLAT:$SG1841
	jmp	$L1837
$L1840:
; Line 942
$L1837:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_output_101 ENDP
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+3
$SG1847	DB	'ror%L0 %%cl,%0', 00H
	ORG $+1
$SG1849	DB	'ror%L0 %2,%1', 00H
_DATA	ENDS
_TEXT	SEGMENT
_operands$ = 8
_output_102 PROC NEAR
; Line 948
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 951
	mov	eax, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1846
; Line 952
	mov	eax, OFFSET FLAT:$SG1847
	jmp	$L1845
; Line 953
	jmp	$L1848
$L1846:
; Line 954
	mov	eax, OFFSET FLAT:$SG1849
	jmp	$L1845
$L1848:
; Line 956
$L1845:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_output_102 ENDP
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+3
$SG1855	DB	'ror%W0 %%cl,%0', 00H
	ORG $+1
$SG1857	DB	'ror%W0 %2,%1', 00H
_DATA	ENDS
_TEXT	SEGMENT
_operands$ = 8
_output_103 PROC NEAR
; Line 962
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 965
	mov	eax, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1854
; Line 966
	mov	eax, OFFSET FLAT:$SG1855
	jmp	$L1853
; Line 967
	jmp	$L1856
$L1854:
; Line 968
	mov	eax, OFFSET FLAT:$SG1857
	jmp	$L1853
$L1856:
; Line 970
$L1853:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_output_103 ENDP
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+3
$SG1863	DB	'ror%B0 %%cl,%0', 00H
	ORG $+1
$SG1865	DB	'ror%B0 %2,%1', 00H
_DATA	ENDS
_TEXT	SEGMENT
_operands$ = 8
_output_104 PROC NEAR
; Line 976
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 979
	mov	eax, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L1862
; Line 980
	mov	eax, OFFSET FLAT:$SG1863
	jmp	$L1861
; Line 981
	jmp	$L1864
$L1862:
; Line 982
	mov	eax, OFFSET FLAT:$SG1865
	jmp	$L1861
$L1864:
; Line 984
$L1861:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_output_104 ENDP
_TEXT	ENDS
EXTRN	_cc_prev_status:BYTE
_DATA	SEGMENT
	ORG $+3
$SG1870	DB	'sete %0', 00H
_DATA	ENDS
_TEXT	SEGMENT
_output_105 PROC NEAR
; Line 990
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 992
	mov	eax, OFFSET FLAT:_cc_prev_status
	mov	ecx, OFFSET FLAT:_cc_status
	mov	edx, DWORD PTR [eax]
	mov	DWORD PTR [ecx], edx
	mov	edx, DWORD PTR [eax+4]
	mov	DWORD PTR [ecx+4], edx
	mov	edx, DWORD PTR [eax+8]
	mov	DWORD PTR [ecx+8], edx
	mov	eax, DWORD PTR [eax+12]
	mov	DWORD PTR [ecx+12], eax
; Line 993
	mov	eax, OFFSET FLAT:$SG1870
	jmp	$L1869
; Line 995
$L1869:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_output_105 ENDP
_TEXT	ENDS
_DATA	SEGMENT
$SG1875	DB	'setne %0', 00H
_DATA	ENDS
_TEXT	SEGMENT
_output_106 PROC NEAR
; Line 1001
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 1003
	mov	eax, OFFSET FLAT:_cc_prev_status
	mov	ecx, OFFSET FLAT:_cc_status
	mov	edx, DWORD PTR [eax]
	mov	DWORD PTR [ecx], edx
	mov	edx, DWORD PTR [eax+4]
	mov	DWORD PTR [ecx+4], edx
	mov	edx, DWORD PTR [eax+8]
	mov	DWORD PTR [ecx+8], edx
	mov	eax, DWORD PTR [eax+12]
	mov	DWORD PTR [ecx+12], eax
; Line 1004
	mov	eax, OFFSET FLAT:$SG1875
	jmp	$L1874
; Line 1006
$L1874:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_output_106 ENDP
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+3
$SG1881	DB	'seta %0', 00H
$SG1883	DB	'setg %0', 00H
_DATA	ENDS
_TEXT	SEGMENT
_output_107 PROC NEAR
; Line 1012
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 1014
	mov	eax, OFFSET FLAT:_cc_prev_status
	mov	ecx, OFFSET FLAT:_cc_status
	mov	edx, DWORD PTR [eax]
	mov	DWORD PTR [ecx], edx
	mov	edx, DWORD PTR [eax+4]
	mov	DWORD PTR [ecx+4], edx
	mov	edx, DWORD PTR [eax+8]
	mov	DWORD PTR [ecx+8], edx
	mov	eax, DWORD PTR [eax+12]
	mov	DWORD PTR [ecx+12], eax
; Line 1015
	test	BYTE PTR _cc_status+1, 8
	je	$L1880
	mov	eax, OFFSET FLAT:$SG1881
	jmp	$L1879
$L1880:
	test	BYTE PTR _cc_status, 8
	je	$L1882
	sub	eax, eax
	jmp	$L1879
$L1882:
	mov	eax, OFFSET FLAT:$SG1883
	jmp	$L1879
; Line 1017
$L1879:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_output_107 ENDP
_TEXT	ENDS
_DATA	SEGMENT
$SG1888	DB	'seta %0', 00H
_DATA	ENDS
_TEXT	SEGMENT
_output_108 PROC NEAR
; Line 1023
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 1024
	mov	eax, OFFSET FLAT:_cc_prev_status
	mov	ecx, OFFSET FLAT:_cc_status
	mov	edx, DWORD PTR [eax]
	mov	DWORD PTR [ecx], edx
	mov	edx, DWORD PTR [eax+4]
	mov	DWORD PTR [ecx+4], edx
	mov	edx, DWORD PTR [eax+8]
	mov	DWORD PTR [ecx+8], edx
	mov	eax, DWORD PTR [eax+12]
	mov	DWORD PTR [ecx+12], eax
; Line 1025
	mov	eax, OFFSET FLAT:$SG1888
	jmp	$L1887
; Line 1026
$L1887:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_output_108 ENDP
_TEXT	ENDS
_DATA	SEGMENT
$SG1894	DB	'setb %0', 00H
$SG1896	DB	'sets %0', 00H
$SG1897	DB	'setl %0', 00H
_DATA	ENDS
_TEXT	SEGMENT
_output_109 PROC NEAR
; Line 1032
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 1033
	mov	eax, OFFSET FLAT:_cc_prev_status
	mov	ecx, OFFSET FLAT:_cc_status
	mov	edx, DWORD PTR [eax]
	mov	DWORD PTR [ecx], edx
	mov	edx, DWORD PTR [eax+4]
	mov	DWORD PTR [ecx+4], edx
	mov	edx, DWORD PTR [eax+8]
	mov	DWORD PTR [ecx+8], edx
	mov	eax, DWORD PTR [eax+12]
	mov	DWORD PTR [ecx+12], eax
; Line 1034
	test	BYTE PTR _cc_status+1, 8
	je	$L1893
	mov	eax, OFFSET FLAT:$SG1894
	jmp	$L1892
$L1893:
	test	BYTE PTR _cc_status, 8
	je	$L1895
	mov	eax, OFFSET FLAT:$SG1896
	jmp	$L1892
$L1895:
	mov	eax, OFFSET FLAT:$SG1897
	jmp	$L1892
; Line 1035
$L1892:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_output_109 ENDP
_TEXT	ENDS
_DATA	SEGMENT
$SG1902	DB	'setb %0', 00H
_DATA	ENDS
_TEXT	SEGMENT
_output_110 PROC NEAR
; Line 1041
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 1042
	mov	eax, OFFSET FLAT:_cc_prev_status
	mov	ecx, OFFSET FLAT:_cc_status
	mov	edx, DWORD PTR [eax]
	mov	DWORD PTR [ecx], edx
	mov	edx, DWORD PTR [eax+4]
	mov	DWORD PTR [ecx+4], edx
	mov	edx, DWORD PTR [eax+8]
	mov	DWORD PTR [ecx+8], edx
	mov	eax, DWORD PTR [eax+12]
	mov	DWORD PTR [ecx+12], eax
; Line 1043
	mov	eax, OFFSET FLAT:$SG1902
	jmp	$L1901
; Line 1044
$L1901:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_output_110 ENDP
_TEXT	ENDS
_DATA	SEGMENT
$SG1908	DB	'setae %0', 00H
	ORG $+3
$SG1910	DB	'setns %0', 00H
	ORG $+3
$SG1911	DB	'setge %0', 00H
_DATA	ENDS
_TEXT	SEGMENT
_output_111 PROC NEAR
; Line 1050
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 1051
	mov	eax, OFFSET FLAT:_cc_prev_status
	mov	ecx, OFFSET FLAT:_cc_status
	mov	edx, DWORD PTR [eax]
	mov	DWORD PTR [ecx], edx
	mov	edx, DWORD PTR [eax+4]
	mov	DWORD PTR [ecx+4], edx
	mov	edx, DWORD PTR [eax+8]
	mov	DWORD PTR [ecx+8], edx
	mov	eax, DWORD PTR [eax+12]
	mov	DWORD PTR [ecx+12], eax
; Line 1052
	test	BYTE PTR _cc_status+1, 8
	je	$L1907
	mov	eax, OFFSET FLAT:$SG1908
	jmp	$L1906
$L1907:
	test	BYTE PTR _cc_status, 8
	je	$L1909
	mov	eax, OFFSET FLAT:$SG1910
	jmp	$L1906
$L1909:
	mov	eax, OFFSET FLAT:$SG1911
	jmp	$L1906
; Line 1053
$L1906:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_output_111 ENDP
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+3
$SG1916	DB	'setae %0', 00H
_DATA	ENDS
_TEXT	SEGMENT
_output_112 PROC NEAR
; Line 1059
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 1060
	mov	eax, OFFSET FLAT:_cc_prev_status
	mov	ecx, OFFSET FLAT:_cc_status
	mov	edx, DWORD PTR [eax]
	mov	DWORD PTR [ecx], edx
	mov	edx, DWORD PTR [eax+4]
	mov	DWORD PTR [ecx+4], edx
	mov	edx, DWORD PTR [eax+8]
	mov	DWORD PTR [ecx+8], edx
	mov	eax, DWORD PTR [eax+12]
	mov	DWORD PTR [ecx+12], eax
; Line 1061
	mov	eax, OFFSET FLAT:$SG1916
	jmp	$L1915
; Line 1062
$L1915:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_output_112 ENDP
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+3
$SG1922	DB	'setbe %0', 00H
	ORG $+3
$SG1924	DB	'setle %0', 00H
_DATA	ENDS
_TEXT	SEGMENT
_output_113 PROC NEAR
; Line 1068
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 1070
	mov	eax, OFFSET FLAT:_cc_prev_status
	mov	ecx, OFFSET FLAT:_cc_status
	mov	edx, DWORD PTR [eax]
	mov	DWORD PTR [ecx], edx
	mov	edx, DWORD PTR [eax+4]
	mov	DWORD PTR [ecx+4], edx
	mov	edx, DWORD PTR [eax+8]
	mov	DWORD PTR [ecx+8], edx
	mov	eax, DWORD PTR [eax+12]
	mov	DWORD PTR [ecx+12], eax
; Line 1071
	test	BYTE PTR _cc_status+1, 8
	je	$L1921
	mov	eax, OFFSET FLAT:$SG1922
	jmp	$L1920
$L1921:
	test	BYTE PTR _cc_status, 8
	je	$L1923
	sub	eax, eax
	jmp	$L1920
$L1923:
	mov	eax, OFFSET FLAT:$SG1924
	jmp	$L1920
; Line 1073
$L1920:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_output_113 ENDP
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+3
$SG1929	DB	'setbe %0', 00H
_DATA	ENDS
_TEXT	SEGMENT
_output_114 PROC NEAR
; Line 1079
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 1080
	mov	eax, OFFSET FLAT:_cc_prev_status
	mov	ecx, OFFSET FLAT:_cc_status
	mov	edx, DWORD PTR [eax]
	mov	DWORD PTR [ecx], edx
	mov	edx, DWORD PTR [eax+4]
	mov	DWORD PTR [ecx+4], edx
	mov	edx, DWORD PTR [eax+8]
	mov	DWORD PTR [ecx+8], edx
	mov	eax, DWORD PTR [eax+12]
	mov	DWORD PTR [ecx+12], eax
; Line 1081
	mov	eax, OFFSET FLAT:$SG1929
	jmp	$L1928
; Line 1082
$L1928:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_output_114 ENDP
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+3
$SG1935	DB	'ja %l0', 00H
	ORG $+1
$SG1937	DB	'jg %l0', 00H
_DATA	ENDS
_TEXT	SEGMENT
_output_117 PROC NEAR
; Line 1088
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 1089
	test	BYTE PTR _cc_status+1, 8
	je	$L1934
	mov	eax, OFFSET FLAT:$SG1935
	jmp	$L1933
$L1934:
	test	BYTE PTR _cc_status, 8
	je	$L1936
	sub	eax, eax
	jmp	$L1933
$L1936:
	mov	eax, OFFSET FLAT:$SG1937
	jmp	$L1933
; Line 1090
$L1933:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_output_117 ENDP
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+1
$SG1943	DB	'jb %l0', 00H
	ORG $+1
$SG1945	DB	'js %l0', 00H
	ORG $+1
$SG1946	DB	'jl %l0', 00H
_DATA	ENDS
_TEXT	SEGMENT
_output_120 PROC NEAR
; Line 1096
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 1097
	test	BYTE PTR _cc_status+1, 8
	je	$L1942
	mov	eax, OFFSET FLAT:$SG1943
	jmp	$L1941
$L1942:
	test	BYTE PTR _cc_status, 8
	je	$L1944
	mov	eax, OFFSET FLAT:$SG1945
	jmp	$L1941
$L1944:
	mov	eax, OFFSET FLAT:$SG1946
	jmp	$L1941
; Line 1098
$L1941:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_output_120 ENDP
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+1
$SG1952	DB	'jae %l0', 00H
$SG1954	DB	'jns %l0', 00H
$SG1955	DB	'jge %l0', 00H
_DATA	ENDS
_TEXT	SEGMENT
_output_122 PROC NEAR
; Line 1104
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 1105
	test	BYTE PTR _cc_status+1, 8
	je	$L1951
	mov	eax, OFFSET FLAT:$SG1952
	jmp	$L1950
$L1951:
	test	BYTE PTR _cc_status, 8
	je	$L1953
	mov	eax, OFFSET FLAT:$SG1954
	jmp	$L1950
$L1953:
	mov	eax, OFFSET FLAT:$SG1955
	jmp	$L1950
; Line 1106
$L1950:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_output_122 ENDP
_TEXT	ENDS
_DATA	SEGMENT
$SG1961	DB	'jbe %l0', 00H
$SG1963	DB	'jle %l0', 00H
_DATA	ENDS
_TEXT	SEGMENT
_output_125 PROC NEAR
; Line 1112
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 1113
	test	BYTE PTR _cc_status+1, 8
	je	$L1960
	mov	eax, OFFSET FLAT:$SG1961
	jmp	$L1959
$L1960:
	test	BYTE PTR _cc_status, 8
	je	$L1962
	sub	eax, eax
	jmp	$L1959
$L1962:
	mov	eax, OFFSET FLAT:$SG1963
	jmp	$L1959
; Line 1114
$L1959:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_output_125 ENDP
_TEXT	ENDS
_DATA	SEGMENT
$SG1969	DB	'jbe %l0', 00H
$SG1971	DB	'jle %l0', 00H
_DATA	ENDS
_TEXT	SEGMENT
_output_129 PROC NEAR
; Line 1120
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 1121
	test	BYTE PTR _cc_status+1, 8
	je	$L1968
	mov	eax, OFFSET FLAT:$SG1969
	jmp	$L1967
$L1968:
	test	BYTE PTR _cc_status, 8
	je	$L1970
	sub	eax, eax
	jmp	$L1967
$L1970:
	mov	eax, OFFSET FLAT:$SG1971
	jmp	$L1967
; Line 1122
$L1967:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_output_129 ENDP
_TEXT	ENDS
_DATA	SEGMENT
$SG1977	DB	'jae %l0', 00H
$SG1979	DB	'jns %l0', 00H
$SG1980	DB	'jge %l0', 00H
_DATA	ENDS
_TEXT	SEGMENT
_output_131 PROC NEAR
; Line 1128
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 1129
	test	BYTE PTR _cc_status+1, 8
	je	$L1976
	mov	eax, OFFSET FLAT:$SG1977
	jmp	$L1975
$L1976:
	test	BYTE PTR _cc_status, 8
	je	$L1978
	mov	eax, OFFSET FLAT:$SG1979
	jmp	$L1975
$L1978:
	mov	eax, OFFSET FLAT:$SG1980
	jmp	$L1975
; Line 1131
$L1975:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_output_131 ENDP
_TEXT	ENDS
_DATA	SEGMENT
$SG1986	DB	'jb %l0', 00H
	ORG $+1
$SG1988	DB	'js %l0', 00H
	ORG $+1
$SG1989	DB	'jl %l0', 00H
_DATA	ENDS
_TEXT	SEGMENT
_output_133 PROC NEAR
; Line 1137
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 1138
	test	BYTE PTR _cc_status+1, 8
	je	$L1985
	mov	eax, OFFSET FLAT:$SG1986
	jmp	$L1984
$L1985:
	test	BYTE PTR _cc_status, 8
	je	$L1987
	mov	eax, OFFSET FLAT:$SG1988
	jmp	$L1984
$L1987:
	mov	eax, OFFSET FLAT:$SG1989
	jmp	$L1984
; Line 1139
$L1984:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_output_133 ENDP
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+1
$SG1995	DB	'ja %l0', 00H
	ORG $+1
$SG1997	DB	'jg %l0', 00H
_DATA	ENDS
_TEXT	SEGMENT
_output_135 PROC NEAR
; Line 1145
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 1146
	test	BYTE PTR _cc_status+1, 8
	je	$L1994
	mov	eax, OFFSET FLAT:$SG1995
	jmp	$L1993
$L1994:
	test	BYTE PTR _cc_status, 8
	je	$L1996
	sub	eax, eax
	jmp	$L1993
$L1996:
	mov	eax, OFFSET FLAT:$SG1997
	jmp	$L1993
; Line 1147
$L1993:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_output_135 ENDP
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+1
$SG2002	DB	'jmp %*%0', 00H
_DATA	ENDS
_TEXT	SEGMENT
_output_138 PROC NEAR
; Line 1153
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 1156
	mov	DWORD PTR _cc_status, 0
	mov	DWORD PTR _cc_status+4, 0
	mov	DWORD PTR _cc_status+8, 0
; Line 1158
	mov	eax, OFFSET FLAT:$SG2002
	jmp	$L2001
; Line 1160
$L2001:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_output_138 ENDP
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+3
$SG2008	DB	'call %*%0', 00H
	ORG $+2
$SG2010	DB	'call %0', 00H
_DATA	ENDS
_TEXT	SEGMENT
_operands$ = 8
_output_139 PROC NEAR
; Line 1166
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 1170
	mov	eax, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2424832				; 00250000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L2007
	mov	eax, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2490368				; 00260000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L2007
	mov	eax, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2555904				; 00270000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L2007
	mov	eax, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L2007
	mov	eax, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2097152				; 00200000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L2007
; Line 1172
	mov	eax, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _operands$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 1173
	mov	eax, OFFSET FLAT:$SG2008
	jmp	$L2006
; Line 1175
	jmp	$L2009
$L2007:
; Line 1176
	mov	eax, OFFSET FLAT:$SG2010
	jmp	$L2006
$L2009:
; Line 1178
$L2006:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_output_139 ENDP
_TEXT	ENDS
_DATA	SEGMENT
$SG2016	DB	'call %*%1', 00H
	ORG $+2
$SG2018	DB	'call %1', 00H
$SG2025	DB	'%', 00H
	ORG $+2
$SG2026	DB	09H, 'fstp %sst (0)', 0aH, 00H
$SG2027	DB	00H
_DATA	ENDS
_TEXT	SEGMENT
_operands$ = 8
_insn$ = 12
_output_140 PROC NEAR
; Line 1184
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 1188
	mov	eax, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2424832				; 00250000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L2015
	mov	eax, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2490368				; 00260000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L2015
	mov	eax, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2555904				; 00270000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L2015
	mov	eax, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1966080				; 001e0000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L2015
	mov	eax, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2097152				; 00200000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	je	$L2015
; Line 1190
	mov	eax, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _operands$[ebp]
	mov	DWORD PTR [ecx+4], eax
; Line 1191
	mov	eax, DWORD PTR _operands$[ebp]
	push	eax
	push	OFFSET FLAT:$SG2016
	call	_output_asm_insn
	add	esp, 8
; Line 1193
	jmp	$L2017
$L2015:
; Line 1194
	mov	eax, DWORD PTR _operands$[ebp]
	push	eax
	push	OFFSET FLAT:$SG2018
	call	_output_asm_insn
	add	esp, 8
$L2017:
; Line 1197
	mov	eax, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	mov	ecx, 184549376				; 0b000000H
	and	ecx, -16777216				; ff000000H
	cmp	eax, ecx
	je	$L2020
	mov	eax, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	eax, DWORD PTR [eax]
	shl	eax, 8
	and	eax, -16777216				; ff000000H
	mov	ecx, 167772160				; 0a000000H
	and	ecx, -16777216				; ff000000H
	cmp	eax, ecx
	jne	$L2019
$L2020:
; Line 1201
	mov	eax, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 2228224				; 00220000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L2022
	mov	eax, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [eax]
	cmp	DWORD PTR [eax+4], 8
	jl	$L2023
	mov	eax, DWORD PTR _operands$[ebp]
	mov	eax, DWORD PTR [eax]
	cmp	DWORD PTR [eax+4], 10			; 0000000aH
	jl	$L2021
$L2023:
$L2022:
; Line 1202
	call	_abort
; Line 1203
$L2021:
	mov	eax, DWORD PTR _insn$[ebp]
	push	eax
	call	_top_dead_p
	add	esp, 4
	or	eax, eax
	je	$L2024
; Line 1205
	push	OFFSET FLAT:$SG2025
	push	OFFSET FLAT:$SG2026
	mov	eax, DWORD PTR _asm_out_file
	push	eax
	call	_fprintf
	add	esp, 12					; 0000000cH
; Line 1207
$L2024:
; Line 1208
$L2019:
	mov	eax, OFFSET FLAT:$SG2027
	jmp	$L2014
; Line 1210
$L2014:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_output_140 ENDP
_TEXT	ENDS
END
