import 'package:flutter/material.dart'; // Mengimpor pustaka Flutter untuk menggunakan berbagai komponen UI.

import 'package:http/http.dart'
    as http; // Mengimpor pustaka http dari package http dan menamainya sebagai http.

import 'dart:convert'; // Mengimpor pustaka dart:convert untuk mengonversi data JSON.

void main() {
  // Fungsi main yang merupakan titik masuk utama aplikasi.
  runApp(
      const MyApp()); // Menjalankan aplikasi dengan widget MyApp sebagai root.
}

class MyApp extends StatelessWidget {
  // Mendefinisikan kelas MyApp sebagai StatelessWidget.
  const MyApp({Key? key}) : super(key: key); // Konstruktor MyApp.

  @override
  Widget build(BuildContext context) {
    // Mendefinisikan tampilan aplikasi.
    return MaterialApp(
      // Mengembalikan MaterialApp sebagai tampilan utama.
      title: 'Daftar Universitas di Indonesia', // Judul aplikasi.
      home: Scaffold(
        // Menggunakan Scaffold sebagai struktur utama.
        appBar: AppBar(
          // Membuat app bar dengan judul.
          title:
              const Text('Daftar Universitas di Indonesia'), // Judul app bar.
          iconTheme: const IconThemeData(
              color: Colors.white), // Tema ikon pada app bar.
          backgroundColor: Colors.teal, // Warna latar belakang app bar.
        ),
        body: const UniversitiesList(), // Menampilkan daftar universitas.
      ),
    );
  }
}

class UniversitiesList extends StatefulWidget {
  // Mendefinisikan kelas UniversitiesList sebagai StatefulWidget.
  const UniversitiesList({Key? key})
      : super(key: key); // Konstruktor UniversitiesList.

  @override
  _UniversitiesListState createState() =>
      _UniversitiesListState(); // Membuat instance dari _UniversitiesListState.
}

class _UniversitiesListState extends State {
  // Mendefinisikan kelas _UniversitiesListState sebagai State.
  List<dynamic> _universities =
      []; // Variabel untuk menyimpan data universitas.

  @override
  void initState() {
    // Metode initState untuk melakukan inisialisasi.
    super.initState(); // Memanggil metode initState dari superclass.
    _fetchUniversities(); // Memanggil metode _fetchUniversities untuk mengambil data universitas.
  }

  Future<void> _fetchUniversities() async {
    // Metode untuk mengambil data universitas dari API.
    try {
      final response = await http
          .get(Uri.parse(// Mengirimkan permintaan GET ke API universitas.
              'http://universities.hipolabs.com/search?country=Indonesia'));
      if (response.statusCode == 200) {
        // Jika permintaan berhasil.
        setState(() {
          // Memperbarui state dengan data universitas yang diterima.
          _universities = jsonDecode(response.body); // Mendekode respons JSON.
        });
      } else {
        // Jika permintaan gagal.
        throw Exception(
            'Gagal memuat data universitas'); // Menampilkan pesan kesalahan.
      }
    } catch (e) {
      // Menangani kesalahan ketika mengambil data universitas.
      ScaffoldMessenger.of(context).showSnackBar(
        // Menampilkan snackbar dengan pesan kesalahan.
        SnackBar(
          content: Text(e.toString()), // Menampilkan pesan kesalahan.
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // Mendefinisikan tampilan daftar universitas.
    return _universities
            .isEmpty // Mengembalikan widget berdasarkan status data universitas.
        ? const Center(
            child:
                CircularProgressIndicator()) // Jika data universitas kosong, tampilkan indikator loading.
        : ListView.builder(
            // Jika data universitas tersedia, tampilkan daftar universitas.
            itemCount:
                _universities.length, // Jumlah item dalam daftar universitas.
            itemBuilder: (BuildContext context, int index) {
              // Membuat item daftar universitas.
              final university = _universities[
                  index]; // Mendapatkan data universitas pada indeks tertentu.
              return Padding(
                // Menambahkan padding pada setiap item.
                padding:
                    const EdgeInsets.all(8.0), // Padding untuk setiap sisi.
                child: ClipRRect(
                  // Menggunakan ClipRRect untuk membulatkan sudut card.
                  borderRadius: BorderRadius.circular(
                      24), // Memberikan sudut bulat pada card.
                  child: Card(
                    // Menggunakan Card untuk menampilkan data universitas.
                    elevation: 4, // Mengatur elevasi card.
                    child: ListTile(
                      // Menampilkan data universitas dalam ListTile.
                      tileColor: Colors.teal[100], // Warna latar belakang tile.
                      title: Text(
                        // Menampilkan nama universitas.
                        university[
                            'name'], // Mengambil nama universitas dari data.
                        style: const TextStyle(
                            fontWeight: FontWeight.bold), // Mengatur gaya teks.
                      ),
                      subtitle: Text(university['web_pages']
                          [0]), // Menampilkan halaman web universitas.
                      trailing: const Icon(Icons
                          .arrow_forward_ios), // Menambahkan ikon panah ke kanan.
                    ),
                  ),
                ),
              );
            },
          );
  }
}
