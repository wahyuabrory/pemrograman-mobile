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
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            Container(
                decoration: BoxDecoration(border: Border.all()),
                padding: EdgeInsets.all(14),
                child: Text('Hello World 1!')),
            Container(
                decoration: BoxDecoration(border: Border.all()),
                padding: EdgeInsets.all(14),
                child: Text('Hello World 2!')),
            Container(
                decoration: BoxDecoration(border: Border.all()),
                padding: EdgeInsets.all(14),
                child: Text('Hello World 3!')),
          ]),
        ),
      ),
    );
  }
}
