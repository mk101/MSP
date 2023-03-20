import 'package:flutter/material.dart';

class App4 extends StatefulWidget {
  const App4({Key? key}) : super(key: key);

  @override
  State<App4> createState() => _App4State();
}

class _App4State extends State<App4> {
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
        title: const Text('App 4'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Text',
              ),
              readOnly: true,
              controller: _controller,
            ),

            OutlinedButton(
              child: const Text('Show dialog'),
              onPressed: () async {
                DateTime? date = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2025)
                );

                if (date != null) {
                  _controller.text = date.toString();
                }
              }
            )
          ],
        ),
      ),
    );
  }
}
