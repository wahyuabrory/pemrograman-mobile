import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  MyAppState createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  final textEditController = TextEditingController();
  String _nama = "";

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    textEditController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
            Image.network(
              'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg',
              height: 150,
            ),
            Text('Masukan Nama :'),
            TextField(
              controller: textEditController, //controller
            ),
            Padding(
              padding: EdgeInsets.all(20), //20 pixel ke semua arah
              child: ElevatedButton(
                onPressed: () {},
                child: const Text('   Login   '),
                style: ElevatedButton.styleFrom(
                    textStyle: const TextStyle(fontSize: 20),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    )),
              ),
            ),
            Text(
              'Halo $_nama',
              style: const TextStyle(
                  fontSize: 30, fontWeight: FontWeight.bold, color: Colors.red),
            ), //hasil disini
          ],
        )), //column center
      ), //Scaffold
    ); //Material APP
  }
}
