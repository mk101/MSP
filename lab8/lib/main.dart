import 'package:flutter/material.dart';

import 'package:lab8/page/app1.dart';
import 'package:lab8/page/app2.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          children: [
            OutlinedButton(
              child: const Text('App 1'),
              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const App1())),
            ),
            OutlinedButton(
              child: const Text('App 2'),
              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const App2())),
            ),
          ],
        ),
      )
    );
  }
}
