import 'package:flutter/material.dart';

import 'package:basics/gorouter/routes.dart';

final _router = createRouter();

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
    );
  }
}
