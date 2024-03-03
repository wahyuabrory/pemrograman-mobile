// 7. What's the output of this code bellow?
void main() {
  List<int> x = [1, 2, 3, 4, 5, 6];
  var evenFilter = x.where((int x) => x % 2 == 0).map((int x) => x * x).toList();

  print(evenFilter);
}

// The code filters even numbers from list x, squares them, and returns the result as a list.
