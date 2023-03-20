import 'package:flutter/material.dart';
import 'package:web_browser/web_browser.dart';

class App7 extends StatelessWidget {
  const App7({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('App 7'),
      ),
      body: const Browser(
        initialUriString: 'https://flutter.dev/',
      ),
    );
  }
}
