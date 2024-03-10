import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  MyAppState createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  final textEditController = TextEditingController();
  String _nama = "";
  String pilihanSalam = "pagi";
  String pilihanSalamOut = "";

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    textEditController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<DropdownMenuItem<String>> salam = [];
    var itm1 = const DropdownMenuItem<String>(
      value: "pagi",
      child: Text("selamat pagi"),
    );
    var itm2 = const DropdownMenuItem<String>(
      value: "siang",
      child: Text("selamat siang"),
    );
    salam.add(itm1);
    salam.add(itm2);

    return MaterialApp(
      title: 'Hello App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Hello'),
        ),
        body: Center(
            child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            DropdownButton(
              value: pilihanSalam,
              items: salam,
              onChanged: (String? newValue) {
                setState(() {
                  if (newValue != null) {
                    pilihanSalam = newValue;
                  }
                });
              },
            ),
            const Text('Masukan Nama :'),
            TextField(
              controller: textEditController, //controller
            ),
            Padding(
              padding: const EdgeInsets.all(20), //20 pixel ke semua arah
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    _nama = textEditController.text; //akses text via controller
                    pilihanSalamOut = pilihanSalam;
                  }); //refresh
                },
                child: const Text('Klik Ini'),
              ),
            ),
            Text(
              _nama != "" ? 'Halo $_nama  selamat $pilihanSalamOut' : "",
              style: const TextStyle(
                  fontSize: 30, fontWeight: FontWeight.bold, color: Colors.red),
            ), //hasil di sini
          ],
        )), //column center
      ), //Scaffold
    ); //Material APP
  }
}
