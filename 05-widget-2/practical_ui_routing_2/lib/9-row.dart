import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Row Example',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Row Example'),
        ),
        body: Center(
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Container(
                decoration: BoxDecoration(border: Border.all()),
                padding: const EdgeInsets.all(14),
                child: const Text('Hello World 1!')),
            Container(
                decoration: BoxDecoration(border: Border.all()),
                padding: const EdgeInsets.all(14),
                child: const Text('Hello World 2!')),
            Container(
                decoration: BoxDecoration(border: Border.all()),
                padding: const EdgeInsets.all(14),
                child: const Text('Hello World 3!')),
          ]),
        ),
      ),
    );
  }
}
