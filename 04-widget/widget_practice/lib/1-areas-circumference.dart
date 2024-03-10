import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Persegi Panjang Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const PersegiPanjangCalculator(),
    );
  }
}

class PersegiPanjangCalculator extends StatefulWidget {
  const PersegiPanjangCalculator({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _PersegiPanjangCalculatorState createState() =>
      _PersegiPanjangCalculatorState();
}

class _PersegiPanjangCalculatorState extends State<PersegiPanjangCalculator> {
  TextEditingController panjangController = TextEditingController();
  TextEditingController lebarController = TextEditingController();
  double luas = 0.0;
  double keliling = 0.0;

  void hitung() {
    double panjang = double.parse(panjangController.text);
    double lebar = double.parse(lebarController.text);

    setState(() {
      luas = panjang * lebar;
      keliling = 2 * (panjang + lebar);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Persegi Panjang Calculator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextField(
              controller: panjangController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Panjang',
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: lebarController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Lebar',
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: hitung,
              child: const Text('Hitung'),
            ),
            const SizedBox(height: 20),
            Text(
              'Luas: $luas',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 10),
            Text(
              'Keliling: $keliling',
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
