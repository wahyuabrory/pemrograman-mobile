void main() {
  List<int> x1 = [1, 2, 3];
  List<int> x2 = [0, for (int x in x1) x];
  print(x2);
}
