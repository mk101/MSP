import 'package:flutter/material.dart';

class App5 extends StatefulWidget {
  const App5({Key? key}) : super(key: key);

  @override
  State<App5> createState() => _App5State();
}

class _App5State extends State<App5> {
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
        title: const Text('App 5'),
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
                  TimeOfDay? time = await showTimePicker(context: context, initialTime: TimeOfDay.now());

                  if (time != null) {
                    _controller.text = time.toString();
                  }
                }
            )
          ],
        ),
      ),
    );
  }
}
