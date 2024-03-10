import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hello App',
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Hello'),
          ),
          body:
              const BodyApp()), //contoh pemisahan nilai atribut di class terpisah
    );
  }
}

class BodyApp extends StatelessWidget {
  const BodyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          const snackBar = SnackBar(
            duration: Duration(seconds: 20),
            content: Text('Halo ini snack bar'),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        },
        child: const Text("Tap ini"),
      ),
    );
  }
}
