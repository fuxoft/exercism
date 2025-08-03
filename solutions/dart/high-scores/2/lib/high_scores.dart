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
      ..sort();
    return srted.reversed.take(3).toList();
  }
}
