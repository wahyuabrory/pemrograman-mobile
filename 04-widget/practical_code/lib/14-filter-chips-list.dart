import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

enum Sizes { extraSmall, small, medium, large, extraLarge }

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

enum JenisMakanan {
  sunda,
  yogya,
  solo,
  chinese,
  sumsel,
  padang,
  jepang,
  korea,
  western,
  betawi,
  tegal,
  menado,
  gorontalo,
  aceh,
  medan,
  seafood
}

class MyAppState extends State<MyApp> {
  //mana yang dipilih
  Set<JenisMakanan> filters = <JenisMakanan>{};

  @override
  Widget build(Object context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      home: Scaffold(
          body: Column(children: [
        Container(
            decoration: BoxDecoration(border: Border.all()),
            padding: EdgeInsets.all(14),
            width: 300,
            child: Wrap(
              spacing: 10,
              children: JenisMakanan.values
                  .map((JenisMakanan j) => FilterChip(
                        label: Text(j.name),
                        selected: filters.contains(j),
                        onSelected: (bool val) {
                          setState(() {
                            if (val) {
                              filters.add(j);
                            } else {
                              filters.remove(j);
                            }
                          });
                        },
                      ))
                  .toList(),
            )),
        Container(height: 10.0),
        Text(
          'Hasil: ${filters.map((JenisMakanan e) => e.name).join(', ')}',
        ),
      ])),
    );
  }
}
