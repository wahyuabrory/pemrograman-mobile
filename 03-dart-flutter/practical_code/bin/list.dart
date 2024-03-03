void main() {
  List<int> mylist = [1, 2, 3];
  mylist.add(4);
  print("Jumlah elemen list: ${mylist.length}");
  //loop semua komponen dalam list, mirip for each
  for (int val in mylist) {
    print(val);
  }
  //cara lain loop elemen
  print("Cara lain loop");
  mylist.forEach((val) {
    print(val);
  });
  print("Cara lain lebih singkat");
  mylist.forEach((val) => print(val));
}
