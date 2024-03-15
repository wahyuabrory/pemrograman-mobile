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
          child: Stack(children: [
            Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(border: Border.all()),
                padding: EdgeInsets.all(14),
                child: Text('Hello World 1a')),
            Container(
                width: 200,
                decoration: BoxDecoration(border: Border.all()),
                padding: EdgeInsets.all(14),
                child: Text('Hello World xxx')),
          ]),
        ),
      ),
    );
  }
}
