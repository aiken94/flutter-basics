import 'package:flutter/material.dart';

// IMPORT HOME_SCREEN DART

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'my app',
        home: Scaffold(
            appBar: AppBar(
              title: const Text('ASSET HOME SCREEN'),
            ),
            body: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Image.asset('assets/mobile-app-mock.jpg',
                      width: 300, height: 300),
                  const SizedBox(
                    height: 16.0,
                  ),
                  Image.network(
                      'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
                      width: 300,
                      height: 300),
                  const SizedBox(
                    height: 16.0,
                  ),
                ],
              ),
            )));
  }
}
