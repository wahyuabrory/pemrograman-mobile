import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Data Mahasiswa',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const InputMahasiswa(),
    );
  }
}

class InputMahasiswa extends StatefulWidget {
  const InputMahasiswa({super.key});

  @override
  InputMahasiswaState createState() => InputMahasiswaState();
}

class InputMahasiswaState extends State<InputMahasiswa> {
  final _formKey = GlobalKey<FormState>();

  String nama = '';
  String gender = '';
  bool sudahBekerja = false;
  double tinggiBadan = 160;
  List<String> makananFavorit = [];
  String? pekerjaanOrtu;
  String? provinsiAsal;

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      print('Nama: $nama');
      print('Jenis Kelamin: $gender');
      print('Sudah Bekerja: $sudahBekerja');
      print('Tinggi Badan: $tinggiBadan');
      print('Makanan Favorit: $makananFavorit');
      print('Pekerjaan Orang Tua: $pekerjaanOrtu');
      print('Provinsi Asal: $provinsiAsal');
    }
  }

  final List<String> jenisKelamin = ['Laki-laki', 'Perempuan'];
  final List<String> daftarMakanan = [
    'Pizza',
    'Lasagne',
    'Burger',
    'Spaghetti',
    'Fettucine Alfredo',
    'Pasta'
  ];
  final List<String> pekerjaanOrangTua = [
    'Data Scientist',
    'Software Developer',
    'Businessman',
    'Lawyer',
    'Banker',
    'Crypto Trader',
    'Restaurateur'
  ];
  final List<String> daftarProvinsi = [
    'Lampung',
    'Nusa Tenggara Barat',
    'Bali',
    'Sulawesi Utara',
    'DKI Jakarta'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Input Data Mahasiswa'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Nama'),
                  onChanged: (value) {
                    setState(() {
                      nama = value;
                    });
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Nama tidak boleh kosong';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                const Text('Jenis Kelamin'),
                Column(
                  children: jenisKelamin.map((jenis) {
                    return RadioListTile(
                      title: Text(jenis),
                      value: jenis,
                      groupValue: gender,
                      onChanged: (value) {
                        setState(() {
                          gender = value.toString();
                        });
                      },
                    );
                  }).toList(),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Sudah Bekerja?'),
                    Switch(
                      value: sudahBekerja,
                      onChanged: (value) {
                        setState(() {
                          sudahBekerja = value;
                        });
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Tinggi Badan'),
                    Text('${tinggiBadan.toStringAsFixed(0)} cm'),
                  ],
                ),
                Slider(
                  min: 100,
                  max: 200,
                  divisions: 100,
                  value: tinggiBadan,
                  onChanged: (value) {
                    setState(() {
                      tinggiBadan = value;
                    });
                  },
                ),
                const SizedBox(height: 10),
                const Text('Makanan Favorit'),
                Column(
                  children: daftarMakanan.map((makanan) {
                    return CheckboxListTile(
                      title: Text(makanan),
                      value: makananFavorit.contains(makanan),
                      onChanged: (checked) {
                        setState(() {
                          if (checked!) {
                            makananFavorit.add(makanan);
                          } else {
                            makananFavorit.remove(makanan);
                          }
                        });
                      },
                    );
                  }).toList(),
                ),
                const SizedBox(height: 10),
                DropdownButtonFormField(
                  decoration:
                      const InputDecoration(labelText: 'Pekerjaan Orang Tua'),
                  value: pekerjaanOrtu,
                  items: pekerjaanOrangTua.map((pekerjaan) {
                    return DropdownMenuItem(
                      value: pekerjaan,
                      child: Text(pekerjaan),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      pekerjaanOrtu = value.toString();
                    });
                  },
                ),
                const SizedBox(height: 10),
                DropdownButtonFormField(
                  decoration: const InputDecoration(labelText: 'Provinsi Asal'),
                  value: provinsiAsal,
                  items: daftarProvinsi.map((provinsi) {
                    return DropdownMenuItem(
                      value: provinsi,
                      child: Text(provinsi),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      provinsiAsal = value.toString();
                    });
                  },
                  validator: (value) {
                    if (value == null) {
                      return 'Provinsi tidak boleh kosong';
                    }
                    return null; //
                  },
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _submitForm,
                  child: const Text('Submit'),
                )
              ],
            )),
      ),
    );
  }
}
