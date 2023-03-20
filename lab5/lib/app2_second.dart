import 'package:flutter/material.dart';

class App2SecondPage extends StatelessWidget {
  const App2SecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('App2 Second'),
      ),
      body: Column(
        children: [
          OutlinedButton(
            child: const Text('Back'),
            onPressed: () => Navigator.pop(context),
          )
        ],
      ),
    );
  }
}
