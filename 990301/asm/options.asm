//Options Menu Patches

//Fix Exit crash
seekAddr($908000)
_fix_options_exit:
	sta $7EDA3D
	stz $1BEE		//Fix
	rtl

seekAddr($818ED9)
	jsl _fix_options_exit
