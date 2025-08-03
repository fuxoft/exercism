class Leap {
  bool leapYear(year) {
    bool divisible(x) {
      return year % x == 0;
    }
    if (divisible(100)) {
      return divisible(400);
    }
    return divisible(4);
  }
}
