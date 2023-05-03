import 'package:flutter/material.dart';

import 'package:lab8/model/strings.dart';

class App2 extends StatefulWidget {
  const App2({Key? key}) : super(key: key);

  @override
  State<App2> createState() => _App2State();
}

class _App2State extends State<App2> {
  final _strings = Strings();
  late TextEditingController _controller;
  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextField(
            controller: _controller,
          ),
          OutlinedButton(
            child: const Text('Add word'),
            onPressed: () => setState(() {
              if (_controller.text.trim().isNotEmpty) {
                _strings.add(_controller.text);
              }
            }),
          ),
          OutlinedButton(
            child: const Text('Remove word'),
            onPressed: () => setState(() {
              _strings.pop();
            }),
          ),
          Text(_strings.strings)
        ],
      ),
    );
  }
}
