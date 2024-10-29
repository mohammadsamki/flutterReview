import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/second': (context) => SecondScreen(),
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  List userData = ['Ahmad', 25, 'Male', '2002-01-01'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home Screen")),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/second', arguments: userData);
          },
          child: Text("Go to Second Screen"),
        ),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Retrieving arguments passed from HomeScreen
    final args = ModalRoute.of(context)?.settings.arguments as List;

    return Scaffold(
      appBar: AppBar(title: Text("Second Screen")),
      body: Center(
        child: Column(
          children: [
            Text(args[0]),
            Text(args[2]),
            Text(args[3]),
          ],
        ),
      ),
    );
  }
}
