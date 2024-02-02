import 'package:flutter/material.dart';
import 'package:text_plus/text_plus.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: TextPlusExample(),
    );
  }
}

class TextPlusExample extends StatelessWidget {
  const TextPlusExample({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: TextPlus('Hello *world*!, this is *bold* text *example*.'),
      ),
    );
  }
}
