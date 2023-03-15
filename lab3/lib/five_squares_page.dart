import 'package:flutter/material.dart';

import 'package:lab3/rect.dart';

class FiveSquaresPage extends StatelessWidget {
  final double size;
  const FiveSquaresPage({Key? key, this.size = 60}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Five squares page'),
      ),
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Rect(color: Colors.red, size: size,),
              ),
              Rect(color: Colors.pink, size: size,)
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Rect(color: Colors.green, size: size),
          ),
          Column(children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Rect(color: Colors.blue, size: size),
            ),
            Rect(color: Colors.black, size: size)
          ],)
        ],
      ),
    );
  }
}
