import 'package:flutter/material.dart';

import 'package:lab6/app1.dart';
import 'package:lab6/app2.dart';
import 'package:lab6/app3.dart';
import 'package:lab6/app4.dart';
import 'package:lab6/app5.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
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

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            OutlinedButton(
              child: const Text('App 1'),
              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const App1())),
            ),
            OutlinedButton(
              child: const Text('App 2'),
              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const App2())),
            ),
            OutlinedButton(
              child: const Text('App 3'),
              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const App3())),
            ),
            OutlinedButton(
              child: const Text('App 4'),
              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const App4())),
            ),
            OutlinedButton(
              child: const Text('App 5'),
              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const App5())),
            ),
          ],
        ),
      )
    );
  }
}
