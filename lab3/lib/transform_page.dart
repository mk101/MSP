import 'package:flutter/material.dart';
import 'dart:math';

import 'package:lab3/rect.dart';

class TransformPage extends StatelessWidget {
  final double size;
  const TransformPage({Key? key, this.size = 60}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transform page'),
      ),
      body: Row (
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Rect(color: Colors.black, size: size,),
                const Text('A')
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Transform.rotate(
                  angle: -pi / 4,
                  child: Transform.scale(
                    scaleY: .5,
                    child: Rect(color: Colors.black, size: size,),
                  ),
                ),
                const Text('B')
              ],
            ),
          )
        ],
      ),
    );
  }
}

