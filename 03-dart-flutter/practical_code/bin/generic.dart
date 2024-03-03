List myIntList = []; //list dynamic
void main() {
  myIntList.add("xx"); // string bisa masuk
  myIntList.add(123); // int bisa masuk juga
  print(myIntList);
}

// List<int> myIntList = []; //pasti list integer
// void main() {
//   myIntList.add("xx"); // <--  gagal saat compile
//   myIntList.add(123);
//   print(myIntList);
// }

// Map<String,int> myMap ={};
// void main() {
//   myMap["Budi"] = 5;
//   myMap[2]      = 4;  // <--  gagal saat compile
// }
