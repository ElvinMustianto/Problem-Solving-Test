void main() {
  print(generateA000124(5));
  print(generateA000124(7));
  print(generateA000124(10));
}

List<int> generateA000124(int n) {
  return List.generate(n, (i) => (i * (i + 1)) ~/ 2 + 1);
}
