import 'package:flutter/material.dart';

class App3 extends StatefulWidget {
  const App3({Key? key}) : super(key: key);

  @override
  State<App3> createState() => _App3State();
}

class _App3State extends State<App3> {
  late TextEditingController _controller;
  late TextEditingController _alertController;
  
  @override
  void initState() {
    super.initState();
    
    _controller = TextEditingController();
    _alertController = TextEditingController();
  }
  
  @override
  void dispose() {
    _controller.dispose();
    _alertController.dispose();

    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('App 3'),
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
              onPressed: () => showDialog(context: context, builder: (context) => AlertDialog(
                title: const Text('Dialog'),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Text',
                      ),
                      controller: _alertController,
                    ),
                  ],
                ),
                actions: <Widget>[
                  TextButton(
                    onPressed: () => Navigator.pop(context, 'Cancel'),
                    child: const Text('Cancel'),
                  ),
                  TextButton(
                    onPressed: () {
                      _controller.text = _alertController.text;
                      Navigator.pop(context, 'OK');
                    },
                    child: const Text('OK'),
                  ),
                ],
              )),
            )
          ],
        ),
      ),
    );
  }
}
