//Credits

//RAM:
//$7E1D48 - Current Credits Sub State
//$7E1D4A - Current Credits State
//Problems: 07 (Mimie), 09 (Spinners)

//The entire problem is about when the player is turning, the input for it is held a bit too long, and displaces the player intended
//THIS FIX SUCKS, it is absolutely getting around the problem

credits_fix:
	lda $1D4A
	cmp.w #$03+1
	beq _credits_init
	cmp.w #$07+1	//Mimie
	beq _credits_fix_mimie
	cmp.w #$09+1
	beq _credits_fix_spinners
	bra _credits_normal
_credits_fix_mimie:
	lda $1D48
	cmp.w #3
	bne _credits_normal
	lda $7FFFFE
	cmp.w #7
	bne _credits_fix_plus
_credits_fix_clear:
	lda.w #$0000
	jsl $80CB2F
	ldy $1D84
	lda $1DA6,y
	rtl
_credits_fix_plus:
	lda $7FFFFE
	inc
	sta $7FFFFE
_credits_normal:
	ldy $1D84
	lda $1DA6,y
	rtl
_credits_init:
	lda.w #0
	sta $7FFFFE
	bra _credits_normal
_credits_fix_spinners:
	lda $1D48
	cmp.w #3
	bne _credits_normal
	lda $7FFFFE
	cmp.w #16
	bne _credits_fix_plus
	bra _credits_fix_clear

//Hijack routine in relation to turning
enqueue pc
seekAddr($839CF8)
	jsl credits_fix
	nop; nop
dequeue pc
