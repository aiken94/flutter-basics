import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ScreenTwo extends StatelessWidget {
  const ScreenTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SCREEN TWO'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            const Text('This is Screen Two'),
            const SizedBox(height: 16.0),
            ElevatedButton(
              child: const Text('Go to Screen One'),
              onPressed: () => context.go('/screen_one'),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              child: const Text('Go to Home Screen'),
              onPressed: () => context.go('/'),
            ),
          ],
        ),
      ),
    );
  }
}
