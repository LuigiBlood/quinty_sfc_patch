//Macros

//Seek HiROM Address
macro seekAddr(n) {
  origin ({n} & $0FFFFF)
  base {n}
}

//Seek File Offset (HiROM Base)
macro seekFile(n) {
  origin {n}
  base ((origin() & $0FFFFF) | 0xC00000)
}
