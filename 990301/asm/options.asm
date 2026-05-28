//Options Menu Patches

//Fix Exit crash
_fix_options_exit:
	sta $7EDA3D
	stz $1BEE		//Fix
	rtl

enqueue pc
seekAddr($818ED9)
	jsl _fix_options_exit
dequeue pc
