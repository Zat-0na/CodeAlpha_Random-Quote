import 'package:flutter/material.dart';
import 'package:quote_generator/random_quote.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quote Generator',
      theme: ThemeData(),
      home: const RandomGenerator(),
    );
  }
}
