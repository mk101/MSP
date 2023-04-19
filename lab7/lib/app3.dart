import 'dart:async';
import 'package:flutter/material.dart';

import 'package:lab7/widget/timer.dart';

class App3 extends StatefulWidget {
  const App3({Key? key}) : super(key: key);

  @override
  State<App3> createState() => _App3State();
}

class _App3State extends State<App3> {
  late Stopwatch stopwatch;

  @override
  void initState() {
    stopwatch = Stopwatch();

    final t = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('App 3'),
      ),
      body: Column(
        children: [
          TimerWidget(
              seconds: stopwatch.elapsed.inSeconds.remainder(60),
              minutes: stopwatch.elapsed.inMinutes.remainder(60),
              hours: stopwatch.elapsed.inHours.remainder(60)
          ),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: const Icon(Icons.play_arrow),
                onPressed: () => stopwatch.start(),
              ),
              IconButton(
                icon: const Icon(Icons.pause),
                onPressed: () => stopwatch.stop(),
              ),
              IconButton(
                icon: const Icon(Icons.stop),
                onPressed: () {
                  stopwatch.reset();
                  stopwatch.stop();
                },
              )
            ],
          )
        ],
      ),
    );
  }
}

