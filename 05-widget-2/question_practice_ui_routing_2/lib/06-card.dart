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
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // Data contoh dalam bentuk List<Map<String, String>>
  final List<Map<String, String>> data = [
    {'name': 'Abrory', 'hobby': 'Coding'},
    {'name': 'Alfan', 'hobby': 'Gaming'},
    {'name': 'Dirga', 'hobby': 'Music'},
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: data.length,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          child: ListTile(
            onTap: () {},
            leading: Image.network(
              'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg',
            ),
            trailing: const Icon(Icons.more_vert),
            title: Text(data[index]['name']!),
            subtitle: Text(data[index]['hobby']!),
            tileColor: Colors.white70,
          ),
        );
      },
    );
  }
}


