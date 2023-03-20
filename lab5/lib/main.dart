import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:lab5/counter.dart';
import 'package:lab5/app1.dart';
import 'package:lab5/app2_first.dart';
import 'package:lab5/app3.dart';
import 'package:lab5/app4.dart';
import 'package:lab5/app5.dart';
import 'package:lab5/app6.dart';
import 'package:lab5/app7.dart';
import 'package:lab5/app8.dart';
import 'package:lab5/app9.dart';
import 'package:lab5/app10.dart';
import 'package:lab5/app11.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Counter())
      ],
      child: const MyApp()
    )
  );
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

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            OutlinedButton(
              child: const Text('App 1'),
              onPressed: () {
                context.read<Counter>().increment();
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const App1())
                );
              },
            ),

            OutlinedButton(
              child: const Text('App 2'),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const App2FirstPage())
                );
              },
            ),

            OutlinedButton(
              child: const Text('App 3'),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const App3())
                );
              },
            ),

            OutlinedButton(
              child: const Text('App 4'),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const App4())
                );
              },
            ),

            OutlinedButton(
              child: const Text('App 5'),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const App5())
                );
              },
            ),

            OutlinedButton(
              child: const Text('App 6'),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const App6())
                );
              },
            ),

            OutlinedButton(
              child: const Text('App 7'),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const App7())
                );
              },
            ),

            OutlinedButton(
              child: const Text('App 8'),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const App8())
                );
              },
            ),

            OutlinedButton(
              child: const Text('App 9'),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const App9())
                );
              },
            ),

            OutlinedButton(
              child: const Text('App 10'),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const App10())
                );
              },
            ),

            OutlinedButton(
              child: const Text('App 11'),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const App11())
                );
              },
            ),
          ],
        ),
      )
    );
  }
}
