import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hello App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Hello'),
        ),
        body: Center(
          child: ListView(padding: const EdgeInsets.all(20), children: const [
            Text('Hello World 1a'),
            Divider(
              height: 30,
            ),
            Text('Hello World 1b'),
            Divider(
              height: 30,
            ),
            Text('Hello World 1c'),
          ]),
        ),
      ),
    );
  }
}
