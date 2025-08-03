const scores = {
  1: 'aeioulnrst',
  2: 'dg',
  3: 'bcmp',
  4: 'fhvwy',
  5: 'k',
  8: 'jx',
  10: 'qz',
};

int score(String word) {
  int sc = 0;
  void score_letter(String chr) {
    for (final key in scores.keys) {
      if (scores[key]!.contains(chr)) {
        sc += key;
        break;
      }
    }
}
  for (final chr in word.toLowerCase().split('')) {
    score_letter(chr);
  }
    
  return sc;
}