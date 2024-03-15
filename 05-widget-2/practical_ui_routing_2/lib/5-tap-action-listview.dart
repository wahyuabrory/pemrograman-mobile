import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  List<String> data = []; //data untuk listview

  @override
  void initState() {
    super.initState();
    // isi data listview
    for (int i = 0; i < 20; i++) {
      data.add("Data ke $i ");
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Welcome to Flutter'),
        ),
        body: Center(
          //gunakan listview builder
          child: ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              return Card(
                  child: ListTile(
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    duration: Duration(seconds: 1),
                    content: Text('Halo ${data[index]}'),
                  ));
                },
                title: Text(data[index]),
              ));
            },
          ),
        ),
      ),
    );
  }
}
