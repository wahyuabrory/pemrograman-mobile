import 'package:flutter/material.dart';

class LayarKedua extends StatelessWidget {
  const LayarKedua({Key? key, required this.pesan}) : super(key: key);
  final String pesan;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Screen 2'),
        ),
        body: Center(
            child: ElevatedButton(
          child: Text("Ini screen kedua, ada pesan: $pesan"),
          onPressed: () {
            Navigator.of(context).pop("ini data dari screen 2");
          },
        )));
  }
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(title: 'Test Route', home: MyHome());
  }
}

//perlu  dipisah karena Navigator perlu punya parent Material App
class MyHome extends StatefulWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return MyHomeState();
  }
}

class MyHomeState extends State<MyHome> {
  String _hasil = "";

  set hasil(String hasil) {
    _hasil = hasil;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Test Route'),
      ),
      body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        ElevatedButton(
            child: const Text('Ke screen Kedua'),
            onPressed: () async {
              hasil = await Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) {
                return const LayarKedua(pesan: "haloo ini pesan dari screen 1");
              }));
            }),
        Text(" Hasil: $_hasil")
      ])),
    );
  }
}
