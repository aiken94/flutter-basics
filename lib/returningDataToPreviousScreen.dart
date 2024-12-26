import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'app',
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _selection = 'None';

  // user select?
  _startSelectionScreen() async {
    final result = await Navigator.push(
        context, MaterialPageRoute(builder: (context) => SelectionScreen()));

    setState(() {
      _selection = result ?? 'None';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('SELECTION WAS: $_selection'),
            SizedBox(height: 20),
            ElevatedButton(
              child: Text('Go to Option Screen'),
              onPressed: _startSelectionScreen,
            )
          ],
        ),
      ),
    );
  }
}

class SelectionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Select an Option')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context, 'OPTION ONE');
                },
                child: Text('OPTION ONE')),
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context, 'OPTION TWO');
                },
                child: Text('OPTION TWO')),
          ],
        ),
      ),
    );
  }
}
