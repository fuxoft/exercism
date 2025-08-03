class EggCounter {
  int count(int num) {
    int sum = 0;
    while (num != 0) {
      sum += num & 1;
      num >>= 1;
    }
    return sum;
  }
}
