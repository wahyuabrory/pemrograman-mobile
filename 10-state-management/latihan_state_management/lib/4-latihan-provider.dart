import 'package:flutter/material.dart'; // Mengimpor pustaka dasar Flutter untuk membangun antarmuka pengguna.
import 'package:http/http.dart'
    as http; // Mengimpor pustaka untuk melakukan permintaan HTTP.
import 'dart:convert'; // Mengimpor pustaka untuk mengkodekan dan mendekodekan data JSON.
import 'package:provider/provider.dart'; // Mengimpor pustaka untuk manajemen status di aplikasi Flutter.
import 'package:url_launcher/url_launcher.dart'; // Mengimpor pustaka untuk meluncurkan URL.

void main() {
  runApp(const MyApp()); // Fungsi untuk menjalankan aplikasi Flutter.
}

class UniversitiesProvider extends ChangeNotifier {
  List<dynamic> _universities = []; // List untuk menyimpan data universitas.

  List<dynamic> get universities =>
      _universities; // Getter untuk mendapatkan daftar universitas.

  Future<void> fetchUniversities(String country) async {
    try {
      final response = await http.get(Uri.parse(
          'http://universities.hipolabs.com/search?country=$country')); // Melakukan permintaan HTTP untuk mendapatkan data universitas dari API.
      if (response.statusCode == 200) {
        // Jika status code adalah 200 (OK), artinya permintaan berhasil.
        _universities = jsonDecode(response
            .body); // Mendekodekan respons JSON dan menyimpannya dalam variabel _universities.
        notifyListeners(); // Memperingatkan pendengar status bahwa ada perubahan di dalam objek.
      } else {
        throw Exception(
            'Gagal memuat data universitas'); // Melempar pengecualian jika gagal memuat data universitas.
      }
    } catch (e) {
      // Tangani kesalahan di sini
    }
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      // Membungkus aplikasi dengan ChangeNotifierProvider untuk manajemen status.
      create: (context) =>
          UniversitiesProvider(), // Membuat instance dari UniversitiesProvider untuk status manajemen.
      child: MaterialApp(
        title: 'Daftar Universitas di ASEAN', // Judul aplikasi.
        theme: ThemeData(
          primarySwatch: Colors.indigo, // Warna primer tema aplikasi.
          brightness: Brightness.light, // Kecerahan tema aplikasi.
          fontFamily: 'Roboto', // Jenis huruf tema aplikasi.
        ),
        home: const UniversitiesScreen(), // Menetapkan halaman awal aplikasi.
      ),
    );
  }
}

class UniversitiesScreen extends StatelessWidget {
  const UniversitiesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Menyediakan kerangka kerja dasar untuk halaman.
      appBar: AppBar(
        // Membuat AppBar sebagai bagian atas halaman.
        title: const Text('Daftar Universitas di ASEAN'), // Judul AppBar.
        centerTitle: true, // Posisi judul ditengah.
      ),
      body: Container(
        // Wadah untuk konten halaman.
        color: Colors.indigo[50], // Warna latar belakang konten.
        child: const Column(
          // Menyusun widget dalam kolom.
          children: [
            SizedBox(height: 20), // Jarak antara widget.
            CountryDropdown(), // Menampilkan dropdown negara ASEAN.
            SizedBox(height: 20), // Jarak antara widget.
            Expanded(
                child: UniversitiesList()), // Menampilkan daftar universitas.
          ],
        ),
      ),
    );
  }
}

class CountryDropdown extends StatefulWidget {
  const CountryDropdown({super.key});

  @override
  State<CountryDropdown> createState() => _CountryDropdownState();
}

class _CountryDropdownState extends State<CountryDropdown> {
  String? _selectedCountry; // Negara yang dipilih dari dropdown.
  final List<String> _aseanCountries = [
    // Daftar negara ASEAN.
    'Indonesia',
    'Singapura',
    'Malaysia',
    'Thailand',
    'Filipina',
    'Vietnam',
    'Myanmar',
    'Kamboja',
    'Laos',
    'Brunei Darussalam'
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      // Memberikan jarak dari tepi.
      padding: const EdgeInsets.all(16.0),
      child: Container(
        // Wadah untuk dropdown.
        decoration: BoxDecoration(
          // Dekorasi untuk tampilan dropdown.
          borderRadius: BorderRadius.circular(8.0), // Sudut bulat.
          color: Colors.white, // Warna latar belakang.
          boxShadow: [
            // Efek bayangan.
            BoxShadow(
              color: Colors.grey.withOpacity(0.5), // Warna bayangan.
              spreadRadius: 2, // Penyebaran bayangan.
              blurRadius: 4, // Kecerahan bayangan.
              offset: const Offset(0, 2), // Posisi bayangan.
            ),
          ],
        ),
        child: Padding(
          // Memberikan jarak dalam wadah.
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: DropdownButton<String>(
            // Widget dropdown.
            value: _selectedCountry, // Nilai yang dipilih.
            onChanged: (String? value) {
              // Saat nilai berubah.
              setState(() {
                // Mengubah status.
                _selectedCountry = value; // Memperbarui nilai yang dipilih.
              });
              context // Mengakses provider untuk mendapatkan daftar universitas berdasarkan negara yang dipilih.
                  .read<UniversitiesProvider>()
                  .fetchUniversities(
                      value ?? 'Indonesia'); // Memuat daftar universitas.
            },
            items:
                _aseanCountries.map<DropdownMenuItem<String>>((String value) {
              // Membuat item dropdown dari daftar negara ASEAN.
              return DropdownMenuItem<String>(
                value: value, // Nilai item.
                child: Text(
                  // Widget teks untuk item.
                  value, // Nilai item.
                  style: const TextStyle(color: Colors.indigo), // Gaya teks.
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}

class UniversitiesList extends StatelessWidget {
  const UniversitiesList({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<UniversitiesProvider>(
      // Mendengarkan perubahan di dalam provider.
      builder: (context, provider, child) {
        if (provider.universities.isEmpty) {
          // Jika daftar universitas kosong.
          return const Center(
            // Tampilkan indikator loading.
            child: CircularProgressIndicator(),
          );
        }
        return ListView.builder(
          // Membuat daftar universitas.
          itemCount: provider.universities.length, // Jumlah item.
          itemBuilder: (BuildContext context, int index) {
            // Membangun item daftar.
            final university = provider
                .universities[index]; // Mengambil universitas dari daftar.
            return Padding(
              // Memberikan jarak dari tepi.
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
              child: Card(
                // Widget kartu untuk menampilkan universitas.
                elevation: 4.0, // Efek angkat kartu.
                shape: RoundedRectangleBorder(
                  // Bentuk kartu.
                  borderRadius: BorderRadius.circular(12.0), // Sudut bulat.
                ),
                child: ListTile(
                  // Widget daftar untuk menampilkan informasi universitas.
                  tileColor: Colors.white, // Warna latar belakang daftar.
                  title: Text(
                    // Judul universitas.
                    university['name'], // Nama universitas.
                    style: const TextStyle(
                      // Gaya teks.
                      fontWeight: FontWeight.bold, // Tebal.
                      color: Colors.indigo, // Warna teks.
                    ),
                  ),
                  subtitle: GestureDetector(
                    // Widget interaktif untuk mengklik URL universitas.
                    onTap: () {
                      _launchURL(university['web_pages']
                          [0]); // Meluncurkan URL universitas.
                    },
                    child: Text(
                      // URL universitas.
                      university['web_pages'][0], // URL universitas.
                      style: const TextStyle(
                        // Gaya teks.
                        color: Colors.blue, // Warna teks.
                        decoration: TextDecoration.underline, // Garis bawah.
                      ),
                    ),
                  ),
                  trailing: const Icon(
                      Icons.arrow_forward_ios), // Ikon panah ke kanan.
                ),
              ),
            );
          },
        );
      },
    );
  }

  void _launchURL(String url) async {
    // Fungsi untuk meluncurkan URL.
    if (await canLaunch(url)) {
      // Jika URL dapat diluncurkan.
      await launch(url); // Meluncurkan URL.
    } else {
      throw 'Could not launch $url'; // Melempar pengecualian jika URL tidak dapat diluncurkan.
    }
  }
}
