//Build Quinty (99-03-01) Patch
architecture snes.cpu

include "./asm/macros.asm"

output "./roms/quinty990301_patched.sfc", create
seekFile(0)
fill $200000,$FF	//Expand to 2MB
seekFile(0)
insert "./roms/quinty990301.sfc"

include "./asm/arcade.asm"
include "./asm/options.asm"
include "./asm/normal.asm"
include "./asm/credits.asm"
