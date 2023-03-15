import 'package:flutter/material.dart';

class Rect extends StatelessWidget {
  final Color color;
  final double size;
  final Widget? child;

  const Rect({Key? key, required this.color, this.size = 60, this.child }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      width: size,
      height: size,
      child: child,
    );
  }
}
