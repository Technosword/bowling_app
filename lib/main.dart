import 'package:flutter/material.dart';

import 'home.dart';

void main() {
  runApp(const BowlingApp());
}

class BowlingApp extends StatelessWidget {
  const BowlingApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bowling App',
      theme: ThemeData(primaryColor: Colors.black12),
      home: const HomeScreen(),
    );
  }
}
