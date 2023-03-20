import 'package:flutter/material.dart';
import 'package:backdrop/backdrop.dart';

class App9 extends StatefulWidget {
  const App9({Key? key}) : super(key: key);

  @override
  State<App9> createState() => _App9State();
}

class _App9State extends State<App9> {
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
    var items = ['First', 'Second', 'Third'];

    return BackdropScaffold(
      appBar: BackdropAppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('App 9'),
        actions: const <Widget>[
          BackdropToggleButton(
            icon: AnimatedIcons.list_view,
          )
        ],
      ),
      backLayer: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, i) => ListTile(
          title: Text(items.elementAt(i), style: const TextStyle(color: Colors.white),),
          onTap: () {
            _controller.text = items.elementAt(i);
            Backdrop.of(context).fling();
          },
        ),
      ),
      frontLayer: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                  labelText: 'Selected',
              ),
              readOnly: true,
              controller: _controller,
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: const Text('Show'),
        icon: const Icon(Icons.expand_less),
        onPressed: () => showModalBottomSheet(
          context: context,
          builder: (context) => SizedBox(
            height: 200,
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, i) => ListTile(
                title: Text(items.elementAt(i)),
                onTap: () {
                  _controller.text = items.elementAt(i);
                  Navigator.pop(context);
                },
              ),
            ),
          )
        ),
      ),
    );
  }
}
