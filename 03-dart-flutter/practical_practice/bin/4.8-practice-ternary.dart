// 8. The output of the code below is:
void main() {
  var x1 = [1, 2, 3];
  var x2 = x1.map((mhs) => mhs == 2 ? -20 : mhs).toList();
  print(x2);
}

// Output: [1, -20, 3]