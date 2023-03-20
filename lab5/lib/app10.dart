import 'package:flutter/material.dart';

class App10 extends StatelessWidget {
  const App10({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var items = ['First', 'Second', 'Third'];

    return Scaffold(
      appBar: AppBar(
        title: const Text('App 10'),
        actions: [
          PopupMenuButton<String>(
            onSelected: (value) => print(value),
            itemBuilder: (context) => items.map((e) => PopupMenuItem<String>(value: items.indexOf(e).toString(), child: Text(e),)).toList(),
          )
        ],
      ),
    );
  }
}
