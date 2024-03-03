(String, int) getData() {
  return ("x", 5);
}

void main() {
  String x;
  int y;
  (x, y) = getData(); //return dua nilai
  print(x);
  print(y);
}
