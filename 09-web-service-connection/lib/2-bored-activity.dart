// Mengimpor paket flutter/material.dart yang menyediakan sejumlah widget dan utilitas untuk membangun antarmuka pengguna (UI) Flutter.
import 'package:flutter/material.dart';
// Mengimpor paket http dan menamakannya sebagai http untuk melakukan permintaan HTTP.
import 'package:http/http.dart' as http;
// Mengimpor paket dart:convert yang menyediakan fungsi untuk melakukan encoding dan decoding data seperti JSON.
import 'dart:convert';

// Fungsi main() yang merupakan titik masuk utama dari aplikasi Flutter. Memanggil fungsi runApp() dengan instance MyApp().
void main() {
  runApp(const MyApp());
}

// menampung data hasil pemanggilan API
class Activity {
  String aktivitas;
  String jenis;

  Activity({required this.aktivitas, required this.jenis}); //constructor

  //map dari json ke atribut
  factory Activity.fromJson(Map<String, dynamic> json) {
    return Activity(
      aktivitas: json['activity'],
      jenis: json['type'],
    );
  }
}

// Mendefinisikan kelas MyApp yang merupakan widget utama dalam aplikasi Flutter. Kelas ini mewarisi StatefulWidget dan mengimplementasikan metode createState() yang mengembalikan instance MyAppState().
class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  late Future<Activity> futureActivity; //menampung hasil

  //late Future<Activity>? futureActivity;
  String url = "https://www.boredapi.com/api/activity";

  // mengembalikan objek Future<Activity> dengan nilai default.
  Future<Activity> init() async {
    return Activity(aktivitas: "", jenis: "");
  }

  //fetch data
  Future<Activity> fetchData() async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      // jika server mengembalikan 200 OK (berhasil),
      // parse json
      return Activity.fromJson(jsonDecode(response.body));
    } else {
      // jika gagal (bukan  200 OK),
      // lempar exception
      throw Exception('Gagal load');
    }
  }

  @override
  void initState() {
    super.initState();
    futureActivity = init();
  }

  @override
  Widget build(Object context) {
    return MaterialApp(
        home: Scaffold(
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Padding(
            padding: EdgeInsets.only(bottom: 20),
            child: ElevatedButton(
              // menampilkan button dengan text "Saya bosan ..."
              onPressed: () {
                setState(() {
                  futureActivity = fetchData();
                });
              },
              child: Text("Saya bosan ..."),
            ),
          ),
          // menampilkan hasil pemanggilan API
          FutureBuilder<Activity>(
            future: futureActivity,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Center(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                      Text(snapshot.data!.aktivitas), // menampilkan aktivitas
                      Text(
                          "Jenis: ${snapshot.data!.jenis}") // menampilkan jenis
                    ]));
                // menampilkan pesan error jika terjadi error
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }
              // default: loading spinner.
              return const CircularProgressIndicator();
            },
          ),
        ]),
      ),
    ));
  }
}
