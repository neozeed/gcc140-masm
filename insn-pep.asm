	TITLE	insn-pep.c
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
COMM	_peep_operand:DWORD:02H
_DATA	ENDS
PUBLIC	_peephole
_TEXT	SEGMENT
; File insn-pep.c
_ins1$ = 8
_peephole PROC NEAR
; Line 16
	push	ebp
	mov	ebp, esp
	sub	esp, 16					; 00000010H
	push	ebx
	push	esi
	push	edi
; Line 21
	mov	eax, DWORD PTR _ins1$[ebp]
	cmp	DWORD PTR [eax+12], 0
	je	$L372
	mov	eax, DWORD PTR _ins1$[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	eax, DWORD PTR [eax]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, 1048576				; 00100000H
	and	ecx, -65536				; ffff0000H
	cmp	eax, ecx
	jne	$L372
; Line 22
	sub	eax, eax
	jmp	$L367
; Line 24
$L372:
	sub	eax, eax
	jmp	$L367
; Line 25
$L367:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_peephole ENDP
_TEXT	ENDS
END
