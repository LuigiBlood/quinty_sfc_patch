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
