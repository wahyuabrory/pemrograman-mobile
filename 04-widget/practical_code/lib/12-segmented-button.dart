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

class MyAppState extends State<MyApp> {
  //mana yang dipilih
  Set<Sizes> selection = <Sizes>{Sizes.large, Sizes.extraLarge};

  @override
  Widget build(Object context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      home: Scaffold(
        body: Center(
            child: SegmentedButton<Sizes>(
          segments: const <ButtonSegment<Sizes>>[
            ButtonSegment<Sizes>(value: Sizes.extraSmall, label: Text('XS')),
            ButtonSegment<Sizes>(value: Sizes.small, label: Text('S')),
            ButtonSegment<Sizes>(value: Sizes.medium, label: Text('M')),
            ButtonSegment<Sizes>(
              value: Sizes.large,
              label: Text('L'),
            ),
            ButtonSegment<Sizes>(value: Sizes.extraLarge, label: Text('XL')),
          ],
          selected: selection,
          onSelectionChanged: (Set<Sizes> newSelection) {
            setState(() {
              selection = newSelection;
            });
          },
          multiSelectionEnabled: true,
        )
        ),
      ),
    );
  }
}
