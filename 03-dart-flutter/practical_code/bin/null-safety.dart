// void main() {
//   int x;
//   print(x); //error saat compile karena x bernilai null
// }

// void main() {
//   int? x;
//   if (x != null) {
//     //harus tambah pengecekan
//     print(x + 2);
//   }
// }

// void main() {
//   int? x;
//   print(x! +
//       2); //HATI-HATI tidak akan error saat compile, tapi error saat runtime
// }

void main() {
  int? x;
  int y = x ??= 0 + 2;
  print(y);
}
