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
  final _formKey = GlobalKey<FormState>();

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
        home: Form(
          key: _formKey,
          child: Scaffold(
            appBar: AppBar(
              title: const Text('Hello'),
            ),
            body: Center(
                child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Masukan Nama :'),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Tidak boleh kosong';
                    }
                    return null;
                  },
                  controller: textEditController, //controller
                ),
                Padding(
                  padding: EdgeInsets.all(20), //20 pixel ke semua arah
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        setState(() {
                          _nama = textEditController.text;
                        }); //refresh
                      }
                    },
                    child: const Text('Klik Ini'),
                  ),
                ),
                Text(
                  'Halo $_nama',
                  style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.red),
                ), //hasil disini
              ],
            )), //column center
          ),
        )); //Material APP
  }
}
