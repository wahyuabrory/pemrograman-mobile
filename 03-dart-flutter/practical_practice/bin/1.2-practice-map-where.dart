// 2. Based on the example above, combine the uppercase transformation and selection process in one statement. After converting to uppercase, select only those containing "UD".
void main() {
  var listMhs = ["Wati", "Budi", "budi"];
  var listMhs2 = listMhs.map((mhs) => mhs.toUpperCase()).where((mhs) => mhs.contains("UD")).toList();
  print(listMhs2);
}

// Output [BUDI, BUDI]


