// Mengimpor paket dart:convert yang menyediakan fungsi untuk melakukan encoding dan decoding data seperti JSON.
import 'dart:convert';

// Mendeklarasikan fungsi main() yang merupakan titik masuk utama dari program.
void main() {
  // Mendefinisikan sebuah string JSON yang berisi informasi transkrip mahasiswa.
  String jsonString = '''
  {
    "nama": "Moh. Wahyu Abrory",
    "nim": "22082010075",
    "jurusan": "sistem informasi",
    "transkrip": [
      {
        "kodeMataKuliah": "MK001",
        "namaMataKuliah": "Pemrograman Web",
        "sks": 3,
        "nilai": "A-"
      },
      {
        "kodeMataKuliah": "MK002",
        "namaMataKuliah": "Pemrograman Web",
        "sks": 4,
        "nilai": "A"
      },
      {
        "kodeMataKuliah": "MK003",
        "namaMataKuliah": "Statistika Komputasi",
        "sks": 3,
        "nilai": "A"
      },
      {
        "kodeMataKuliah": "MK004",
        "namaMataKuliah": "Algortima",
        "sks": 3,
        "nilai": "A-"
      }
    ]
  }
  ''';

  // Mendekode string JSON menjadi objek Map Dart menggunakan fungsi jsonDecode dari paket dart:convert.
  Map<String, dynamic> transkrip = jsonDecode(jsonString);

  // Menginisialisasi variabel totalSks dan totalNilai dengan nilai awal 0.
  double totalSks = 0;
  double totalNilai = 0;

  // Memulai perulangan untuk setiap mata kuliah dalam array transkrip.
  for (var mataKuliah in transkrip['transkrip']) {
    // Mengonversi nilai sks dari setiap mata kuliah menjadi tipe data double.
    double sks = mataKuliah['sks'].toDouble();
    // Memanggil fungsi _hitungNilaiAngka untuk mendapatkan nilai angka dari nilai huruf setiap mata kuliah.
    double nilaiAngka = _hitungNilaiAngka(mataKuliah['nilai']);
    // Menambahkan sks ke totalSks dan sks * nilaiAngka ke totalNilai.
    totalSks += sks;
    totalNilai += sks * nilaiAngka;
  }

  // Menghitung IPK dengan membagi totalNilai dengan totalSks.
  double ipk = totalNilai / totalSks;
  // Mencetak nilai IPK.
  print('IPK: $ipk');
}

// Mendeklarasikan fungsi _hitungNilaiAngka yang menerima parameter String nilai.
double _hitungNilaiAngka(String nilai) {
  // Setiap case akan memetakan nilai huruf ke nilai angka yang sesuai.
  switch (nilai) {
    case 'A':
      return 4.0;
    case 'A-':
      return 3.7;
    case 'B+':
      return 3.3;
    case 'B':
      return 3.0;
    case 'B-':
      return 2.7;
    case 'C+':
      return 2.3;
    case 'C':
      return 2.0;
    case 'C-':
      return 1.7;
    case 'D':
      return 1.0;

    // Jika tidak ada nilai huruf yang cocok, maka nilai angka ditetapkan sebagai 0.0.
    default:
      return 0.0;
  }
}
