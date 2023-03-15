import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

enum PopupItem {one, two, three}

class _MyHomePageState extends State<MyHomePage> {
  bool _isPressed = false;
  int _counter = 0;
  PopupItem? _selectedItem = PopupItem.one;
  bool _switchValue = false;
  double _sliderValue = 42;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView(
        padding: const EdgeInsets.all(8.0),
        children: [
          const TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Label',
              hintText: 'Placeholder'
            ),
          ),

          OutlinedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.resolveWith((states) => _isPressed ? Colors.black45 : null)
            ),
            child: const Text('Button'),
            onPressed: () => setState(() {
              _isPressed = !_isPressed;
            }),
          ),
          Center(
            child: Text(
              _isPressed ? 'Pressed' : "Released"
            ),
          ),

          OutlinedButton(
            child: Text('Pressed $_counter times'),
            onPressed: () => setState(() {
              _counter += 1;
            }),
          ),

          TextButton(
            child: const Text('Date'),
            onPressed: () async {
              DateTime? date = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(2000),
                lastDate: DateTime.now()
              );

              print(date.toString());
            },
          ),

          TextButton(
            child: const Text('Time'),
            onPressed: () async {
              TimeOfDay? time = await showTimePicker(context: context, initialTime: TimeOfDay.now());
              print(time.toString());
            },
          ),

          PopupMenuButton(
            child: const Text('Select'),
            itemBuilder: (context) => <PopupMenuEntry<PopupItem>>[
              const PopupMenuItem(
                value: PopupItem.one,
                child: Text('One'),
              ),
              const PopupMenuItem(
                value: PopupItem.two,
                child: Text('Two'),
              ),
              const PopupMenuItem(
                value: PopupItem.three,
                child: Text('Three'),
              ),
            ],
            onSelected: (PopupItem item) {
              setState(() {
              _selectedItem = item;
              });
              print(_selectedItem);
            },
          ),

          SwitchListTile(
            value: _switchValue,
            onChanged: (v) => setState(() {
              _switchValue = v;
            }),
            title: Text(_switchValue ? 'Selected' : 'Not selected'),
          ),

          Slider(
            value: _sliderValue,
            min: 0,
            max: 100,
            onChanged: (v) => setState(() {
              _sliderValue = v;
            })
          ),
          Center(child: Text('Current value: $_sliderValue'))
        ],
      ),
    );
  }
}
