//Normal Mode

//RAM:
//$7EDA43 - ??? (something about 0x4000)
//$7EDA5F - World
//$7EDA49 - Round

//Force Palettes per Stage
//The problem is that it keeps the palette from the Round splash screen
seekAddr($908100)
force_palette:
	//force palette only on Round ?-10
	lda $7EDA49
	cmp.w #9
	bne _force_palette_cont
	lda $7EDA5F
	asl
	tax
	jmp (_table_palette,x)
_force_palette_cont:
+;	jsl $82EFDF
	rtl
_pal_round09:
	//Force Palette for Jenny (Round 0-10)
	copyMVN($C62060, $7EDC55, 0x20)
	copyMVN($C62060, $7EDE55, 0x20)
	jmp _force_palette_cont

_table_palette:
	dw _pal_round09
	dw _force_palette_cont
	dw _force_palette_cont
	dw _force_palette_cont
	dw _force_palette_cont
	dw _force_palette_cont
	dw _force_palette_cont
	dw _force_palette_cont
	dw _force_palette_cont
	dw _force_palette_cont

seekAddr($82EFD9)
	jsl force_palette
