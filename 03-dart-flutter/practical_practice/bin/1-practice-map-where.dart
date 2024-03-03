// 1.What's the output of this code bellow?
void main() {
  List<int> l1 = [1, 2, 3];
  var l2 = l1.map((e) => 2 * e).map((e) => "x$e");
  print(l2);
}

// Output: (x2, x4, x6)
