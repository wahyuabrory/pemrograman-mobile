import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Wrap Example'),
        ),
        body: Center(
          child: Container(
            width: 200,
            child: const Wrap(
              spacing: 10,
              children: [
                Text("satusatustu"),
                Text("dudududuaua"),
                Text("tigasigaga"),
                Text("empatempat"),
                Text("lialima"),
                Text("enamenam"),
                Text("tujuh"),
                Text("delapan"),
                Text("sembilan"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
