void main() {
  List<int> numbers = [1, 2, 3, 4, 5];
  List<int> squaredEvens =
      numbers.where((int x) => x % 2 == 0).map((int x) => x * x).toList();
  print(squaredEvens);
}
