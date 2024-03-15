import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Test Drawer',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  HomePageState createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  int idx = 0;

  static const List<Center> halaman = [
    Center(child: Text("satu")),
    Center(child: Text("dua")),
    Center(child: Text("tiga")),
  ];

  void gantiItem(int index) {
    setState(() {
      idx = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Test Drawer.")),
        body: halaman[idx],
        drawer: Drawer(
            child: ListView(
          children: [
            const DrawerHeader(child: Text("Ini Header")),
            ListTile(
                title: const Text("item1"),
                onTap: () {
                  gantiItem(0);
                }),
            ListTile(
                title: const Text("item2"),
                onTap: () {
                  gantiItem(1);
                }),
            ListTile(
                title: const Text("item3"),
                onTap: () {
                  gantiItem(2);
                })
          ],
        )));
  }
}
