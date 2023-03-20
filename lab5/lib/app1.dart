import 'package:flutter/material.dart';

import 'package:lab5/counter.dart';
import 'package:provider/provider.dart';

class App1 extends StatelessWidget {
  const App1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('App 1'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            OutlinedButton(
              child: const Text('Backward'),
              onPressed: () {
                context.read<Counter>().decrement();
                Navigator.pop(context);
              },
            ),
            OutlinedButton(
              child: const Text('Forward'),
              onPressed: () {
                context.read<Counter>().increment();
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const App1())
                );
              },
            ),

            Text('Stack depth: ${context.watch<Counter>().count}')
          ],
        ),
      ),
    );
  }
}

