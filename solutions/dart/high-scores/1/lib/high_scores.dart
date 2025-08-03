import 'dart:math';
class HighScores {
  List<int> scores;
  HighScores(this.scores);

  int latest() {
    return scores.last;
  }

  int personalBest() {
    return scores.reduce((ths, nxt) => ths > nxt ? ths : nxt);
  }

  List<int> personalTopThree() {
    final srted = List<int>.from(scores)
      ..sort((a,b) => b.compareTo(a));
    return srted.sublist(0, min(srted.length,3));
  }
}
