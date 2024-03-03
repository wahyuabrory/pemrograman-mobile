Map<String, int> umur = {"rudi": 17, "susi": 12};
void main() {
  //loop key
  for (String nama in umur.keys) {
    print(nama);
    print(umur[nama]);
  }
}
