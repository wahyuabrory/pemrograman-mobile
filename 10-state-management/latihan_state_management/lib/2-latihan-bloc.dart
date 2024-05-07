import 'package:flutter/material.dart'; // Mengimport library flutter untuk membuat UI.
import 'dart:convert'; // Mengimport library dart:convert untuk parsing JSON.
import 'package:http/http.dart' as http; // Mengimport library http dari package http untuk melakukan HTTP requests.
import 'package:flutter_bloc/flutter_bloc.dart'; // Mengimport library flutter_bloc untuk menggunakan state management dengan Bloc.

class University {
  // Membuat class model University untuk merepresentasikan data universitas.
  final String name; // Nama universitas.
  final String? stateProvince; // Provinsi tempat universitas berada (opsional).
  final List<String> domains; // Domain-domain universitas.
  final List<String> webPages; // Halaman web universitas.
  final String alphaTwoCode; // Kode dua huruf untuk negara universitas.
  final String country; // Nama negara universitas.

  University({
    // Constructor untuk inisialisasi objek University.
    required this.name,
    this.stateProvince,
    required this.domains,
    required this.webPages,
    required this.alphaTwoCode,
    required this.country,
  });

  factory University.fromJson(Map<String, dynamic> json) {
    // Factory method untuk membuat objek University dari JSON.
    return University(
      name: json['name'], // Mengambil nama universitas dari JSON.
      stateProvince:
          json['state-province'], // Mengambil provinsi dari JSON (opsional).
      domains: List<String>.from(
          json['domains']), // Mengambil domain-domain universitas dari JSON.
      webPages: List<String>.from(
          json['web_pages']), // Mengambil halaman web universitas dari JSON.
      alphaTwoCode:
          json['alpha_two_code'], // Mengambil kode dua huruf negara dari JSON.
      country: json['country'], // Mengambil nama negara universitas dari JSON.
    );
  }
}

abstract class UniversityEvent {} // Abstract class untuk event-event Bloc.

class FetchUniversitiesEvent extends UniversityEvent {
  // Event untuk fetching daftar universitas berdasarkan negara.
  final String country; // Negara tujuan pengambilan daftar universitas.
  FetchUniversitiesEvent(
      this.country); // Constructor untuk inisialisasi event dengan negara tujuan.
}

class UniversityBloc extends Bloc<UniversityEvent, List<University>> {
  // Bloc untuk manajemen state daftar universitas.
  UniversityBloc() : super([]) {
    // Constructor untuk inisialisasi Bloc dengan state awal berupa list kosong.
    on<FetchUniversitiesEvent>(
        _fetchUniversities); // Menangani event FetchUniversitiesEvent dengan method _fetchUniversities.
  }

  Future<void> _fetchUniversities(
    // Method untuk fetching daftar universitas dari API.
    FetchUniversitiesEvent event, // Event FetchUniversitiesEvent.
    Emitter<List<University>> emit, // Emitter untuk memancarkan state baru.
  ) async {
    try {
      final universities = await _fetchUniversitiesFromApi(
          event.country); // Memanggil method untuk fetching daftar universitas.
      emit(universities); // Memancarkan daftar universitas yang telah di-fetch.
    } catch (e) {
      print('Error: $e'); // Menangkap error jika terjadi.
      emit([]); // Memancarkan list kosong jika terjadi error.
    }
  }

  Future<List<University>> _fetchUniversitiesFromApi(String country) async {
    // Method untuk fetching daftar universitas dari API.
    final response = await http.get(
        // Melakukan HTTP GET request ke API universitas berdasarkan negara.
        Uri.parse('http://universities.hipolabs.com/search?country=$country'));

    if (response.statusCode == 200) {
      // Jika response berhasil (status code 200).
      final List<dynamic> data = jsonDecode(
          response.body); // Mendecode response body menjadi List<dynamic>.
      return data
          .map((json) => University.fromJson(json))
          .toList(); // Mengubah data JSON menjadi list objek University.
    } else {
      throw Exception(
          'Failed to load universities'); // Melempar exception jika gagal fetching data universitas.
    }
  }
}

void main() {
  // Method main untuk menjalankan aplikasi.
  runApp(const MyApp()); // Menjalankan aplikasi Flutter.
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // Widget MyApp sebagai root aplikasi.
  @override
  Widget build(BuildContext context) {
    // Method untuk membangun UI aplikasi.
    return MaterialApp(
      // Menginisialisasi MaterialApp sebagai root widget aplikasi.
      home: BlocProvider(
        // Membungkus root widget dengan BlocProvider untuk menyediakan Bloc ke seluruh aplikasi.
        create: (context) =>
            UniversityBloc(), // Membuat instance UniversityBloc dan menyediakannya ke aplikasi.
        child:
            const UniversitiesPage(), // Menampilkan halaman utama UniversitiesPage sebagai child.
      ),
    );
  }
}

class UniversitiesPage extends StatefulWidget {
  const UniversitiesPage({super.key});

  // Widget UniversitiesPage sebagai halaman utama.
  @override
  _UniversitiesPageState createState() =>
      _UniversitiesPageState(); // Membuat state untuk UniversitiesPage.
}

class _UniversitiesPageState extends State<UniversitiesPage> {
  // State untuk widget UniversitiesPage.
  final List<String> _aseanCountries = [
    // Daftar negara-negara di ASEAN.
    'Indonesia',
    'Singapore',
    'Malaysia',
    'Thailand',
    'Philippines',
    'Vietnam',
    'Myanmar',
    'Cambodia',
    'Brunei',
    'Laos',
  ];

  String _selectedCountry = 'Indonesia'; // Negara yang dipilih secara default.

  @override
  void initState() {
    // Method initState dipanggil saat state pertama kali dibuat.
    super.initState();
    context.read<UniversityBloc>().add(FetchUniversitiesEvent(
        _selectedCountry)); // Memanggil event untuk fetch daftar universitas saat initState.
  }

  @override
  Widget build(BuildContext context) {
    // Method untuk membangun UI halaman UniversitiesPage.
    return Scaffold(
      // Scaffold sebagai kerangka halaman utama.
      appBar: AppBar(
        // AppBar sebagai app bar di bagian atas halaman.
        title: const Text('ASEAN Universities'), // Judul app bar.
      ),
      body: Column(
        // Column untuk menyusun widget secara vertikal.
        children: [
          Padding(
            // Padding untuk memberikan jarak pada bagian atas dropdown.
            padding: const EdgeInsets.all(16.0),
            child: DropdownButton<String>(
              // DropdownButton untuk memilih negara ASEAN.
              value: _selectedCountry, // Nilai yang sedang dipilih.
              onChanged: (String? newValue) {
                // Event saat nilai dropdown berubah.
                setState(() {
                  // Memperbarui state ketika nilai dropdown berubah.
                  _selectedCountry =
                      newValue!; // Mengupdate negara yang dipilih.
                  context // Mengakses Bloc dan mengirim event untuk fetch daftar universitas berdasarkan negara yang dipilih.
                      .read<UniversityBloc>()
                      .add(FetchUniversitiesEvent(newValue));
                });
              },
              items:
                  _aseanCountries.map<DropdownMenuItem<String>>((String value) {
                // Membuat dropdown item dari daftar negara ASEAN.
                return DropdownMenuItem<String>(
                  value: value, // Nilai dropdown item.
                  child: Text(value), // Label dropdown item.
                );
              }).toList(),
            ),
          ),
          BlocBuilder<UniversityBloc, List<University>>(
            // BlocBuilder untuk mengakses state Bloc dan membangun UI berdasarkan state.
            builder: (context, universities) {
              // Builder yang dipanggil setiap kali state Bloc berubah.
              if (universities.isEmpty) {
                // Jika daftar universitas kosong, tampilkan CircularProgressIndicator.
                return const CircularProgressIndicator();
              }
              return Expanded(
                // Expanded untuk memperluas ListView agar memenuhi sisa ruang yang tersedia.
                child: ListView.builder(
                  // ListView untuk menampilkan daftar universitas.
                  itemCount: universities
                      .length, // Jumlah item dalam daftar universitas.
                  itemBuilder: (context, index) {
                    // Builder untuk mengatur item dalam daftar.
                    final university = universities[
                        index]; // Mengambil universitas pada indeks tertentu.
                    return Padding(
                      // Padding untuk memberikan jarak antar item.
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        // Card untuk menampilkan informasi universitas.
                        child: Padding(
                          // Padding dalam Card.
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            // Column untuk menyusun informasi universitas secara vertikal.
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                // Text untuk menampilkan nama universitas.
                                university.name,
                                style: const TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 8.0),
                              Row(
                                // Row untuk menampilkan State/Province universitas.
                                children: [
                                  const Text('State/Province: '),
                                  Text(university.stateProvince ??
                                      'N/A'), // Menampilkan 'N/A' jika tidak ada State/Province.
                                ],
                              ),
                              Row(
                                // Row untuk menampilkan domains universitas.
                                children: [
                                  const Text('Domains: '),
                                  Text(university.domains.join(
                                      ', ')), // Menggabungkan domain-domain universitas menjadi satu string.
                                ],
                              ),
                              Row(
                                // Row untuk menampilkan web pages universitas.
                                children: [
                                  const Text('Web Pages: '),
                                  Text(university.webPages.join(
                                      ', ')), // Menggabungkan web pages universitas menjadi satu string.
                                ],
                              ),
                              Row(
                                // Row untuk menampilkan Alpha Two Code universitas.
                                children: [
                                  const Text('Alpha Two Code: '),
                                  Text(university
                                      .alphaTwoCode), // Menampilkan Alpha Two Code universitas.
                                ],
                              ),
                              Row(
                                // Row untuk menampilkan nama negara universitas.
                                children: [
                                  const Text('Country: '),
                                  Text(university
                                      .country), // Menampilkan nama negara universitas.
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
