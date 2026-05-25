//Macros

//Seek HiROM Address
macro seekAddr(n) {
  origin ({n} & $1FFFFF)
  base {n}
}

//Seek File Offset (HiROM Base)
macro seekFile(n) {
  origin {n}
  base ((origin() & $1FFFFF) | 0xC00000)
}

macro copyMVN(src, dst, size) {
  rep #$30
  ldx.w #{src}&$FFFF
  ldy.w #{dst}&$FFFF
  lda.w #{size}-1
  mvn {dst}>>16={src}>>16
}