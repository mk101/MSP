import 'package:flutter/material.dart';

import 'package:lab7/widget/traffic_light.dart';

class App1 extends StatefulWidget {
  const App1({Key? key}) : super(key: key);

  @override
  State<App1> createState() => _App1State();
}

class _App1State extends State<App1> with SingleTickerProviderStateMixin {
  final TrafficLightController _controller = TrafficLightController(
      redTime: 5,
      yellowTime: 2,
      greenTime: 10
  );

  late AnimationController _animationController;
  late Animation<double> _offset;


  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(vsync: this, duration: const Duration(seconds: 10));
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _offset = Tween<double>(begin: 0, end: MediaQuery.of(context).size.width - 50).animate(_animationController)
      ..addListener(() {
        setState(() {});
      });

    return Scaffold(
      appBar: AppBar(
        title: const Text('App 1'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            TrafficLight(
              onGreenStart: () {
                _animationController.forward();
              },
              onGreedEnd: () {
                _animationController.reset();
              },
              trafficLightController: _controller,
            ),
            Transform.translate(
              offset: Offset(_offset.value, 0),
              child: const Icon(Icons.directions_walk),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.start),
        onPressed: () {
          _controller.start();
        },
      ),
    );
  }
}
