// 3. Create a map that transforms the elements of a list into their squares. For example, if the input is [1, 2, 3], the mapping result should be [1, 4, 9].
void main() {
  List<int> inputList = [1, 2, 3];
  var squaredMap = inputList.map((e) => e * e).toList();
  print(squaredMap);
}

// Output: [1, 4, 9]

