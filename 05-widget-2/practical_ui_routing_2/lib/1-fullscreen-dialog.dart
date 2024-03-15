import 'package:flutter/material.dart';

void main() => runApp(new MaterialApp(home: new MyApp()));

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('My App'),
        ),
        body: Center(
            child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              onPressed: () => tampilkanDialog(context),
              child: const Text('Klik Ini'),
            ),
          ],
        )), //column center
      ), //Scaffold
    ); //Material APP
  }

  void tampilkanDialog(BuildContext context) {
    showDialog<void>(
      context: context,
      builder: (BuildContext context) => Dialog.fullscreen(
        child: Center(
            child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Padding(
                padding: EdgeInsets.all(20), child: Text("Dialog Fullscreen")),
            ElevatedButton(
              onPressed: () => Navigator.pop(context, 'Cancel'),
              child: const Text('Tutup'),
            ),
          ],
        )), //column cent
      ),
    );
  }
}
