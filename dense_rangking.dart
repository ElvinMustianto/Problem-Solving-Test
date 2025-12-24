void main() {
  print(denseRanking(
    [100, 100, 50, 40, 40, 20, 10],
    [5, 25, 50, 120],
  ));

  print(denseRanking(
    [100, 90, 90, 80],
    [70, 80, 105],
  ));

  print(denseRanking(
    [200, 150, 150, 100],
    [50, 150, 250],
  ));
}

List<int> denseRanking(List<int> scores, List<int> gitsScores) {
  List<int> uniqueScores = scores.toSet().toList()
    ..sort((a, b) => b.compareTo(a));

  List<int> result = [];

  for (int gitsScore in gitsScores) {
    int rank = 1;
    for (int score in uniqueScores) {
      if (gitsScore < score) {
        rank++;
      } else {
        break;
      }
    }
    result.add(rank);
  }

  return result;
}
