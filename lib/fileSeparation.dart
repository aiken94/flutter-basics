import 'package:flutter/material.dart';
import 'package:basics/separated_home_screen.dart';

// IMPORT HOME_SCREEN DART

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'my app',
      home: HomeScreen(),
    );
  }
}
