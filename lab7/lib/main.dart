import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:lab7/counter.dart';
import 'package:lab7/app1.dart';
import 'package:lab7/app2.dart';
import 'package:lab7/app3.dart';
import 'package:lab7/app4.dart';


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
              onPressed: () {
                context.read<Counter>().increment();
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const App4())
                );
              },
            ),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
