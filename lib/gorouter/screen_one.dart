import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ScreenOne extends StatelessWidget {
  const ScreenOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SCREEN ONE'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            const Text('This is Screen One'),
            const SizedBox(height: 16.0),
            ElevatedButton(
              child: const Text('Go to Screen Two'),
              onPressed: () => context.go('/screen_two'),
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
