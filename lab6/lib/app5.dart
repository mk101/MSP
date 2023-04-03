import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class App5 extends StatefulWidget {
  const App5({Key? key}) : super(key: key);

  @override
  State<App5> createState() => _App5State();
}

class _App5State extends State<App5> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();

    _controller = TextEditingController();
    _prefs.then((prefs) => _controller.text = prefs.getString('text') ?? '');
  }

  @override
  void dispose() {
    super.dispose();

    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('App 5'),
      ),
      body: FutureBuilder(
        future: Future.wait([
          _prefs.then((prefs) => prefs.getBool('bool') ?? false),
          _prefs.then((prefs) => prefs.getString('text') ?? '')
        ]),
        builder: (context, snapshot) {
          switch(snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
              return const Center(child: CircularProgressIndicator());
            case ConnectionState.active:
            case ConnectionState.done:
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    TextField(
                      controller: _controller,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Text',
                      ),
                      onSubmitted: (str) async {
                        final prefs = await _prefs;
                        prefs.setString('text', _controller.text);
                      },
                    ),
                    Switch(value: snapshot.data![0] as bool, onChanged: (v) async {
                      final prefs = await _prefs;
                      prefs.setBool('bool', v);
                      setState(() {

                      });
                    })
                  ],
                ),
              );
          }
        },
      ),
    );
  }
}
