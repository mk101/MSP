import 'package:flutter/material.dart';
import 'package:lab5/app2_second.dart';

class App2FirstPage extends StatefulWidget {
  const App2FirstPage({Key? key}) : super(key: key);

  @override
  State<App2FirstPage> createState() => _App2FirstPageState();
}

class _App2FirstPageState extends State<App2FirstPage> {
  App2SecondPage? _secondPage = const App2SecondPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('App2 First'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            OutlinedButton(
              child: const Text('Attach page'),
              onPressed: () {
                setState(() {
                  _secondPage ??= const App2SecondPage();
                });

                Navigator.push(context, MaterialPageRoute(builder: (context) => _secondPage!));
              },
            ),

            OutlinedButton(
              child: const Text('Detach page'),
              onPressed: () {
                setState(() {
                  _secondPage = null;
                });
              },
            )
          ],
        ),
      ),
    );
  }
}
