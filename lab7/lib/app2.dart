import 'package:flutter/material.dart';
import 'dart:math' as math;

class App2 extends StatefulWidget {
  const App2({Key? key}) : super(key: key);

  @override
  State<App2> createState() => _App2State();
}

class _App2State extends State<App2> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _offset;
  late Animation<double> _rotate;
  late Animation<Color?> _color;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: const Duration(seconds: 5));

    _offset = Tween<double>(begin: 0, end: 100).animate(_controller);
    _rotate = Tween<double>(begin: 0, end: 1).animate(_controller);
    _color = ColorTween(begin: Colors.blue, end: Colors.red).animate(_controller);

    _controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('App 2'),
      ),
      body: Align(
        alignment: Alignment.topCenter,
        child: Transform.translate(
          offset: Offset(0, _offset.value),
          child: Transform.rotate(
            angle: math.pi * _rotate.value,
            child: GestureDetector(
              child: Text(
                'Hello world',
                style: TextStyle(
                  color: _color.value
                ),
              ),
              onTapDown: (details) => _controller.forward(),
              onTapUp: (details) => _controller.reverse(),
            ),
          ),
        ),
      ),
    );
  }
}
