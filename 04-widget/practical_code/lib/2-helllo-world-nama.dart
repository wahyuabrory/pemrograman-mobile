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
            Text('Masukan Nama :'),
            TextField(
              controller: textEditController, //controller
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _nama = textEditController.text; //akses text via controller
                }); //refresh
              },
              child: const Text('Klik Ini'),
            ),
            Text('Halo $_nama'), //hasil disini
          ],
        )), //column center
      ), //Scaffold
    ); //Material APP
  }
}