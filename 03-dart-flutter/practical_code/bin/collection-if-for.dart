void main() {
  List<int> x1 = [1, 2, 3];
  List<int> x2 = [0, for (int x in x1) if (x==2) -1 else x ];
  print(x2);
}