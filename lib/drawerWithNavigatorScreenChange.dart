import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Home Screen'),
        ),
        body: const Center(child: Text('My Home Page')),
        drawer: Drawer(
          child: ListView(children: [
            const SizedBox(
              height: 60.0,
              child: DrawerHeader(
                decoration: BoxDecoration(color: Colors.blue),
                child: Text('Drawer Header'),
              ),
            ),
            ListTile(
              title: const Text('Item One'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ItemOnePage()));
              },
            ),
            ListTile(
              title: const Text('Item Two'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ItemTwoPage()));
              },
            )
          ]),
        ));
  }
}

class ItemOnePage extends StatelessWidget {
  const ItemOnePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Item One'),
      ),
      body: const Center(
        child: Text('ITEM ONE SCREEN'),
      ),
    );
  }
}

class ItemTwoPage extends StatelessWidget {
  const ItemTwoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Item Two'),
      ),
      body: const Center(
        child: Text('ITEM TWO SCREEN'),
      ),
    );
  }
}
