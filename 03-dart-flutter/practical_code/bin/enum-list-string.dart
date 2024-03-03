enum jenisMhs {mhsS1, mhsS2, mhsS3} 
List<String> namaJenisMhs = jenisMhs.values.map((jenisMhs m) {return (m.name);}).toList();
void main(List<String> args) {
  print(namaJenisMhs);
}