import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class App4 extends StatefulWidget {
  const App4({Key? key}) : super(key: key);

  @override
  State<App4> createState() => _App4State();
}

class _App4State extends State<App4> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();

    _controller = TextEditingController();
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
        title: const Text('App 4'),
      ),
      body: FutureBuilder(
        future: _prefs.then((SharedPreferences prefs) => prefs.getStringList('notes') ?? []),
        builder: (context, snapshot) {
          switch(snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
              return const Center(child: CircularProgressIndicator());
            case ConnectionState.active:
            case ConnectionState.done:
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return ListTile(title: Text(snapshot.data![index]),);
                },
              );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => showDialog(context: context, builder: (context) => AlertDialog(
          title: const Text('Create note'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Note',
                ),
                controller: _controller,
              )
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'Cancel'),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                if (_controller.text.trim().isNotEmpty) {
                  _prefs.then((prefs) {
                    final local = prefs.getStringList('notes') ?? [];
                    local.add(_controller.text.trim());

                    prefs.setStringList('notes', local);

                    setState(() {});
                  });
                }
                Navigator.pop(context, 'OK');
              },
              child: const Text('OK'),
            ),
          ],
        )),
      ),
    );
  }
}
