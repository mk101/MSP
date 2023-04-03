import 'package:flutter/material.dart';

class App2 extends StatefulWidget {
  const App2({Key? key}) : super(key: key);

  @override
  State<App2> createState() => _App2State();
}

class _App2State extends State<App2> {
  final List<int> _models = [];
  int _number = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('App 2'),
      ),
      body: ListView.builder(
        itemCount: _models.length,
        itemBuilder: (context, index)
          => ListTile(
            title: Text(_models[index].toString()),
            onTap: () {
              setState(() {
                _models.removeAt(index);
              });
            },
          ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          setState(() {
            _number += 1;
            _models.add(_number);
          });
        },
      ),
    );
  }
}

