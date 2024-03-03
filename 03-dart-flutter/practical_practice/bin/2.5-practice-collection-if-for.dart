// 5. Create a code that, based on the input list of strings, generates a list of string lengths.
void main() {
  List<String> s1 = ["satu", "dua", "sebelas"];
  var stringLengths = [for (String str in s1) str.length];

  print(stringLengths);
}
// Output: [4, 3, 7]
