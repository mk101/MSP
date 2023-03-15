import 'package:flutter/material.dart';

import 'package:lab3/rect.dart';

class ThreeSquaresPage extends StatelessWidget {
  final double size;

  const ThreeSquaresPage({Key? key, this.size = 60}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Three squares page'),
      ),
      body: Row(
        children: [
          const Rect(color: Colors.red),
          Stack(
            children: [
              Transform.translate(
                offset: Offset(0, size / 2),
                child: Rect(color: Colors.green, size: size),
              ),
              Transform.translate(
                offset: Offset(size / 2, 0),
                child: Rect(color: Colors.blue, size: size, child: const Center(child: Text('Квадрат', style: TextStyle(color: Colors.white)))),
              )
            ],
          )
        ],
      ),
    );
  }
}

