import 'package:flutter/material.dart';

class LayarKedua extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Screen 2'),
        ),
        body: Center(
            child: ElevatedButton(
          child: const Text("Ini screen kedua, tap icon back di app bar"),
          onPressed: () {
            Navigator.of(context).pop();
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
    return MaterialApp(title: 'Test Route', home: MyHome());
  }
}

//perlu  dipisah karena Navigator perlu punya parent Material App
class MyHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Test Route'),
      ),
      body: Center(
        child: ElevatedButton(
            child: const Text('Ke screen Kedua'),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return LayarKedua();
              }));
            }),
      ),
    );
  }
}