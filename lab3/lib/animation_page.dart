import 'package:flutter/material.dart';

import 'package:lab3/rect.dart';

class AnimationPage extends StatefulWidget {
  final double size;
  const AnimationPage({Key? key, this.size = 60}) : super(key: key);

  @override
  State<AnimationPage> createState() => _AnimationPageState();
}

class _AnimationPageState extends State<AnimationPage> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _offset;
  late Animation<double> _scale;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(duration: const Duration(seconds: 5),vsync: this);
    _offset = Tween<double>(begin: .0, end: 180.0).animate(_controller)
      ..addListener(() {
        setState(() {});
      });
    _scale = Tween<double>(begin: 60.0, end: 170.0).animate(_controller);

    _controller.forward();
    _controller.addListener(() {
      if (_controller.isCompleted) {
        _controller.repeat();
      }
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
        title: const Text('Animation Page'),
      ),
      body: Column(
        children: [
          Transform.translate(
            offset: Offset(0, _offset.value),
            child: Rect(color: Colors.green, size: _scale.value,),
          )
        ],
      ),
    );
  }
}
