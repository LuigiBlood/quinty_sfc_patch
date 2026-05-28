//Arcade Mode Patches

//--Fix Title Screen
//Related to loading graphic assets, but is loading too much, for now only loads one
enqueue pc
seekAddr($8088AA)
	nop
	nop
dequeue pc

//--Fix Uninitialized RAM
arcade_init:
	jsl $808891
	lda.w #0
	ldx.w #$0100
-;	sta $7E31DF,x
	dex; dex
	bne -
	rtl

enqueue pc
seekAddr($81901B)
	jsl arcade_init
dequeue pc

//--Force Palettes in Arcade Mode Stages
force_palette_extra:
	//force palette only on Round ?-10
	pha; phx; phy
	lda $7EDA49
	cmp.w #9
	bne _force_palette_extra_cont
	lda $7EDA5F
	asl
	tax
	jmp (_table_palette_extra,x)
_force_palette_extra_cont:
+;	ply; plx; pla
	jsl $80B63A
	rtl
_pal_round09_extra:
	//Force Palette for Jenny (Round 0-10)
	copyMVN($C62060, $7EDC55, 0x20)
	copyMVN($C62060, $7EDE55, 0x20)
	jmp _force_palette_extra_cont

_pal_round59_extra:
	//Force Palette for Artist (Round 5-10)
	copyMVN($C625C0, $7EDC55, 0x20)
	copyMVN($C625C0, $7EDE55, 0x20)
	jmp _force_palette_extra_cont

_pal_round39_extra:
	//Force Palette for Acrobat (Round 3-10)
	copyMVN($C62580, $7EDC55, 0x20)
	copyMVN($C62580, $7EDE55, 0x20)
	jmp _force_palette_extra_cont

_pal_round19_extra:
	//Force Palette for Ballerina (Round 1-10)
	copyMVN($C626C0, $7EDC55, 0x20)
	copyMVN($C626C0, $7EDE55, 0x20)
	jmp _force_palette_extra_cont

_table_palette_extra:
	dw _pal_round09_extra
	dw _pal_round19_extra
	dw _force_palette_extra_cont
	dw _pal_round39_extra
	dw _force_palette_extra_cont
	dw _pal_round59_extra
	dw _force_palette_extra_cont
	dw _force_palette_extra_cont
	dw _force_palette_extra_cont
	dw _force_palette_extra_cont


enqueue pc
seekAddr($81A9D1)
	jsl force_palette_extra
dequeue pc
