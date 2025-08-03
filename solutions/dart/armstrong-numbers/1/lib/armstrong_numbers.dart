class ArmstrongNumbers {
  bool isArmstrongNumber (String numstr) {
    final Iterable<BigInt> digits = numstr.runes.map((asc) => BigInt.from(asc - 48));
    return BigInt.parse(numstr) == digits.fold(BigInt.from(0),(acc, digit) => acc + (digit).pow(digits.length));
  }
}
