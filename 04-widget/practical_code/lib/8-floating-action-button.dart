import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

//isian dari drop down
List<DropdownMenuEntry<String>> items =
    <String>['pagi', 'siang'].map<DropdownMenuEntry<String>>((String value) {
  return DropdownMenuEntry<String>(
    label: value,
    value: value,
  );
}).toList();

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final TextEditingController salamController = TextEditingController();
  String? pilihanSalam;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          floatingActionButton: FloatingActionButton(
              onPressed: () {},
              backgroundColor: Colors.red,
              child: const Icon(Icons.dangerous)),
          body: Center(
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              DropdownMenu<String>(
                initialSelection: "pagi",
                controller: salamController,
                label: const Text('Salam'),
                dropdownMenuEntries: items,
                onSelected: (String? salam) {
                  setState(() {
                    pilihanSalam = salam;
                  });
                },
              ),
              Text("Pilihan : $pilihanSalam") //tampilkan hasil
            ]),
          )),
    );
  }
}
