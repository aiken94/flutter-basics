import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HOME SCREEN'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            const Text('This is Home Screen'),
            const SizedBox(height: 16.0),
            ElevatedButton(
              child: const Text('Go to Screen One'),
              onPressed: () => context.go('/screen_one'),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              child: const Text('Go to Screen Two'),
              onPressed: () => context.go('/screen_two'),
            )
          ],
        ),
      ),
    );
  }
}
