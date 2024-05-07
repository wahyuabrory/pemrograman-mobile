import 'package:flutter/material.dart'; // Mengimpor library dasar Flutter untuk membangun antarmuka pengguna.
import 'package:http/http.dart'
    as http; // Mengimpor library untuk melakukan permintaan HTTP.
import 'dart:convert'; // Mengimpor library untuk mengonversi data JSON.
import 'package:flutter_bloc/flutter_bloc.dart'; // Mengimpor library untuk mengimplementasikan pola manajemen keadaan menggunakan BLoC (Business Logic Component).
import 'package:url_launcher/url_launcher.dart'; // Mengimpor library untuk meluncurkan URL.

void main() {
  runApp(
      const MyApp()); // Memulai aplikasi Flutter dengan widget MyApp sebagai root widget.
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Membangun dan mengonfigurasi aplikasi menggunakan MaterialApp.
    return MaterialApp(
      title: 'Daftar Universitas di ASEAN', // Menentukan judul aplikasi.
      theme: ThemeData(
        // Mengatur tema aplikasi.
        primarySwatch: Colors.indigo, // Warna utama aplikasi.
        brightness: Brightness.light, // Kecerahan tema aplikasi.
        fontFamily:
            'Roboto', // Mengatur jenis huruf yang akan digunakan di seluruh aplikasi.
      ),
      home: BlocProvider(
        // Memberikan akses ke Cubit (komponen BLoC) ke seluruh aplikasi.
        create: (context) =>
            UniversitiesCubit(), // Membuat instance dari UniversitiesCubit.
        child:
            const UniversitiesScreen(), // Menetapkan UniversitiesScreen sebagai halaman utama.
      ),
    );
  }
}

class UniversitiesScreen extends StatelessWidget {
  const UniversitiesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Membangun antarmuka pengguna untuk tampilan utama aplikasi.
    return Scaffold(
      // Mengatur layout dasar aplikasi.
      appBar: AppBar(
        // Membangun app bar (bilah aplikasi) di bagian atas layar.
        title: const Text('Daftar Universitas di ASEAN'), // Judul app bar.
        centerTitle: true, // Menyelaraskan judul app bar ke tengah.
      ),
      body: Container(
        // Konten utama aplikasi berada di dalam container.
        color: Colors.indigo[50], // Memberikan warna latar belakang container.
        child: Column(
          // Mengatur tata letak vertikal untuk menempatkan widget di dalamnya.
          children: [
            // Menyusun widget secara vertikal.
            const SizedBox(height: 20), // Spasi kosong vertikal.
            const CountryDropdown(), // Menambahkan widget CountryDropdown.
            const SizedBox(height: 20), // Spasi kosong vertikal.
            const Expanded(
                child:
                    UniversitiesList()), // Menambahkan widget UniversitiesList yang diperluas untuk mengisi ruang kosong.
          ],
        ),
      ),
    );
  }
}

class CountryDropdown extends StatefulWidget {
  const CountryDropdown({Key? key}) : super(key: key);

  @override
  State<CountryDropdown> createState() => _CountryDropdownState();
}

class _CountryDropdownState extends State<CountryDropdown> {
  String? _selectedCountry; // Variabel untuk menyimpan negara yang dipilih.
  final List<String> _aseanCountries = [
    // List negara-negara ASEAN.
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
    // Membangun tampilan dropdown negara.
    return Padding(
      padding: const EdgeInsets.all(
          16.0), // Padding untuk ruang putih di sekeliling dropdown.
      child: Container(
        // Membungkus dropdown dengan kontainer untuk membuat bayangan dan latar belakang.
        decoration: BoxDecoration(
          // Mengatur dekorasi kontainer.
          borderRadius:
              BorderRadius.circular(8.0), // Mengatur sudut bulatan kontainer.
          color: Colors.white, // Mengatur warna latar belakang kontainer.
          boxShadow: [
            // Menambahkan bayangan di sekitar kontainer.
            BoxShadow(
              color:
                  Colors.grey.withOpacity(0.5), // Warna dan opasitas bayangan.
              spreadRadius: 2, // Meratakan bayangan.
              blurRadius: 4, // Menentukan seberapa kabur bayangan.
              offset: const Offset(0, 2), // Menentukan posisi bayangan.
            ),
          ],
        ),
        child: Padding(
          // Padding untuk ruang putih di dalam kontainer.
          padding: const EdgeInsets.symmetric(
              horizontal: 16.0), // Padding horizontal.
          child: DropdownButton<String>(
            // Membuat dropdown button dengan daftar negara ASEAN.
            value: _selectedCountry, // Menetapkan nilai dropdown.
            onChanged: (String? value) {
              // Menangani perubahan nilai dropdown.
              setState(() {
                // Memperbarui tampilan ketika nilai dropdown berubah.
                _selectedCountry = value; // Menetapkan negara yang dipilih.
              });
              context // Memberikan akses ke UniversititesCubit.
                  .read<UniversitiesCubit>()
                  .fetchUniversities(value ??
                      'Indonesia'); // Memanggil fungsi fetchUniversities dengan negara yang dipilih.
            },
            items:
                _aseanCountries.map<DropdownMenuItem<String>>((String value) {
              // Membuat daftar item dropdown dari list negara ASEAN.
              return DropdownMenuItem<String>(
                // Membuat item dropdown.
                value: value, // Menetapkan nilai item dropdown.
                child: Text(
                  // Menampilkan teks item dropdown.
                  value, // Nilai item dropdown.
                  style: const TextStyle(
                      color: Colors.indigo), // Mengatur gaya teks.
                ),
              );
            }).toList(), // Mengonversi hasil pemetaan menjadi list.
          ),
        ),
      ),
    );
  }
}

class UniversitiesCubit extends Cubit<List<dynamic>> {
  UniversitiesCubit()
      : super(
            []); // Mendefinisikan constructor dan memberikan nilai awal keadaan.

  Future<void> fetchUniversities(String country) async {
    // Mengambil data universitas dari server.
    try {
      final response = await http.get(Uri.parse(
          // Mengirim permintaan GET ke server untuk mendapatkan data universitas.
          'http://universities.hipolabs.com/search?country=$country'));
      if (response.statusCode == 200) {
        // Memeriksa kode status respon.
        emit(jsonDecode(
            response.body)); // Mengirimkan data universitas ke listeners.
      } else {
        // Jika tidak berhasil mendapatkan data.
        throw Exception(
            'Gagal memuat data universitas'); // Melakukan throw exception.
      }
    } catch (e) {} // Menangani exception.
  }
}

class UniversitiesList extends StatelessWidget {
  const UniversitiesList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Membangun tampilan daftar universitas.
    return BlocBuilder<UniversitiesCubit, List<dynamic>>(
      // Membuat builder untuk UniversititesCubit.
      builder: (context, universities) {
        // Menentukan bagaimana widget akan dirender berdasarkan keadaan Cubit.
        if (universities.isEmpty) {
          // Jika daftar universitas kosong.
          return const Center(
            // Menampilkan indikator loading.
            child:
                CircularProgressIndicator(), // Menampilkan indikator loading melingkar.
          );
        }
        return ListView.builder(
          // Membangun daftar universitas menggunakan ListView.builder.
          itemCount:
              universities.length, // Menentukan jumlah item dalam daftar.
          itemBuilder: (BuildContext context, int index) {
            // Membangun setiap item dalam daftar.
            final university =
                universities[index]; // Mengambil universitas dari daftar.
            return Padding(
              // Memberikan padding pada setiap item dalam daftar.
              padding: const EdgeInsets.symmetric(
                  vertical: 8.0,
                  horizontal: 16.0), // Padding vertikal dan horizontal.
              child: Card(
                // Menggunakan Card untuk menyajikan data universitas.
                elevation: 4.0, // Memberikan elevasi pada card.
                shape: RoundedRectangleBorder(
                  // Mengatur bentuk card.
                  borderRadius: BorderRadius.circular(
                      12.0), // Mengatur sudut bulatan card.
                ),
                child: ListTile(
                  // Menampilkan data universitas dalam bentuk ListTile.
                  tileColor:
                      Colors.white, // Memberikan warna latar belakang ListTile.
                  title: Text(
                    // Menampilkan nama universitas.
                    university['name'], // Mengambil nama universitas dari data.
                    style: const TextStyle(
                      // Mengatur gaya teks untuk nama universitas.
                      fontWeight: FontWeight.bold, // Mengatur ketebalan teks.
                      color: Colors.indigo, // Mengatur warna teks.
                    ),
                  ),
                  subtitle: GestureDetector(
                    // Menangani ketika pengguna mengetuk subtitle.
                    onTap: () {
                      // Menangani aksi ketika subtitle diklik.
                      _launchURL(university['web_pages']
                          [0]); // Meluncurkan URL situs web universitas.
                    },
                    child: Text(
                      // Menampilkan URL situs web universitas sebagai subtitle.
                      university['web_pages']
                          [0], // Mengambil URL situs web universitas dari data.
                      style: const TextStyle(
                        // Mengatur gaya teks untuk subtitle.
                        color: Colors.blue, // Mengatur warna teks.
                        decoration:
                            TextDecoration.underline, // Mengatur dekorasi teks.
                      ),
                    ),
                  ),
                  trailing: const Icon(Icons
                      .arrow_forward_ios), // Menambahkan ikon di sebelah kanan.
                ),
              ),
            );
          },
        );
      },
    );
  }

  void _launchURL(String url) async {
    // Meluncurkan URL situs web universitas.
    if (await canLaunch(url)) {
      // Memeriksa apakah URL dapat diluncurkan.
      await launch(url); // Meluncurkan URL.
    } else {
      // Jika tidak dapat meluncurkan URL.
      throw 'Could not launch $url'; // Melemparkan exception.
    }
  }
}
