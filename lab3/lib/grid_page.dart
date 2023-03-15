import 'package:flutter/material.dart';

import 'package:lab3/rect.dart';

class GridPage extends StatelessWidget {
  final double size;
  const GridPage({Key? key, this.size = 60}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Grid page"),
      ),
      body: GridView.count(
        crossAxisCount: 3,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
        padding: const EdgeInsets.all(8),
        children: [
          Rect(color: Colors.red, size: size),
          Rect(color: Colors.green, size: size),
          Rect(color: Colors.blue, size: size),
          Rect(color: Colors.pink, size: size),
          Container(),
          Rect(color: Colors.black, size: size)
        ],
      ),
    );
  }
}

