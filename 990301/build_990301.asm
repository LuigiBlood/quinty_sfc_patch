//Build Quinty (99-03-01) Patch
architecture snes.cpu

include "./asm/macros.asm"

output "./roms/quinty990301_patched.sfc", create
seekFile(0)
fill $100000,$FF	//1MB
seekFile(0)
insert "./roms/quinty990301.sfc"
