// 6. Create a list of squares of even elements from the input list.
void main() {
  List<int> inputList = [1, 2, 3, 4, 5, 6];
  var evenSquares = [
    for (int num in inputList)
      if (num % 2 == 0) num * num
  ];

  print(evenSquares);
}

// Output: [4, 16, 36]
