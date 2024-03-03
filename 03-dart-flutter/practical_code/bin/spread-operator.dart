void main() {
  List x1 = [1, 2, 3];
  List x2 = [...x1, 4];
  List x3 = [0, ...x1];
  List? x4;
  List x5 = [1, ...?x4]; //bisa null
  print(x2);
  print(x3);
  print(x5);
}
