import 'package:flutter/material.dart';
import 'package:lab8/model/counter.dart';

class App1 extends StatefulWidget {
  const App1({Key? key}) : super(key: key);

  @override
  State<App1> createState() => _App1State();
}

class _App1State extends State<App1> {
  final _counter = Counter(42);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('App 1'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('${_counter.value}'),
            OutlinedButton(
              child: const Text('Increment'),
              onPressed: () => setState(() {
                _counter.increment();
              }),
            ),
            OutlinedButton(
              child: const Text('Reset'),
              onPressed: () => setState(() {
                _counter.reset();
              }),
            ),
          ],
        ),
      ),
    );
  }
}
