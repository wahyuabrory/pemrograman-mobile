import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Flutter Demo",
        home: Scaffold(
          appBar: AppBar(
            title: const Text("Card"),
          ),
          body: const MyHomePage(),
        ));
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        child: ListTile(
            onTap: () {},
            leading: Image.network(
                'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg'),
            trailing: const Icon(Icons.more_vert),
            title: const Text('Judul'),
            subtitle: const Text("ini Subjudul"),
            tileColor: Colors.white70));
  }
}
