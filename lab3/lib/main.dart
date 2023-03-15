import 'package:flutter/material.dart';
import 'package:lab3/animation_page.dart';
import 'package:lab3/grid_page.dart';

import 'package:lab3/three_squares_page.dart';
import 'package:lab3/five_squares_page.dart';
import 'package:lab3/transform_page.dart';

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

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late TextEditingController _firstController;
  late TextEditingController _secondController;


  @override
  void initState() {
    super.initState();

    _firstController = TextEditingController();
    _secondController = TextEditingController();
  }


  @override
  void dispose() {
    _firstController.dispose();
    _secondController.dispose();
    
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: [
            MaterialButton(
                child: const Text('3 squares'),
                onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const ThreeSquaresPage(size: 60,)))
            ),
            MaterialButton(
                child: const Text('5 squares'),
                onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const FiveSquaresPage(size: 60,)))
            ),
            MaterialButton(
                child: const Text('5 squares grid'),
                onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const GridPage(size: 60,)))
            ),
            MaterialButton(
                child: const Text('transform page'),
                onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const TransformPage(size: 60,)))
            ),
            MaterialButton(
                child: const Text('animation page'),
                onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const AnimationPage(size: 60,)))
            ),

            MaterialButton(
              child: const Text('Dialog'),
              onPressed: () => showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text('Dialog'),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextField(
                        controller: _firstController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'First number',
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: TextField(
                          controller: _secondController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Second number',
                          ),
                        ),
                      ),
                    ],
                  ),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('Cancel'),
                    ),
                    TextButton(
                      onPressed: () {
                        print(int.parse(_firstController.text) + int.parse(_secondController.text));
                        Navigator.pop(context);
                      },
                      child: const Text('OK'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      )
    );
  }
}
