import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: const FlutterLogo(),
          backgroundColor: Colors.blueGrey,
          title: const Text('My App'),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.account_circle_rounded),
              onPressed: () {
                // Aksi ketika ikon akun ditekan
              },
            ),
            IconButton(
              icon: const Icon(Icons.settings),
              onPressed: () {
                // Aksi ketika ikon pengaturan ditekan
              },
            ),
          ],
        ),
        body: const Center(
          child: Text('Ini adalah konten utama'),
        ),
      ),
    );
  }
}
