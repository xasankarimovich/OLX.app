import 'package:flutter/material.dart';
import 'main_pages.dart';

void main() => runApp(const OlxApp());

class OlxApp extends StatelessWidget {
  const OlxApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}
