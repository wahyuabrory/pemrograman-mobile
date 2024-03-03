// 9. Based on this list, create a new list to calculate taxes (15% for income < 10, and 20% for income >= 10).
void main() {
  List<Map<String, dynamic>> pegawai = [
    {"Nama": "Budi", "Gaji": 5},
    {"Nama": "Wati", "Gaji": 17}
  ];

  List<Map<String, dynamic>> pajak = [
    for (var p in pegawai)
      {
        "Nama": p["Nama"],
        "Gaji": p["Gaji"],
        "Pajak": p["Gaji"] < 10 ? p["Gaji"] * 0.15 : p["Gaji"] * 0.20
      }
  ];

  print(pajak);
}

// Output: [{Nama: Budi, Gaji: 5, Pajak: 0.75}, {Nama: Wati, Gaji: 17, Pajak: 3.4000000000000004}]