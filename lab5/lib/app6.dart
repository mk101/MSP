import 'package:flutter/material.dart';
import 'package:collection/collection.dart';

class _Model {
  final String _title;
  final DateTime _date;

  const _Model(this._title, this._date);

  DateTime get date => _date;
  String get title => _title;
}

class App6 extends StatefulWidget {
  const App6({Key? key}) : super(key: key);

  @override
  State<App6> createState() => _App6State();
}

class _App6State extends State<App6> {

  List<_Model> mockModels() => [
    _Model('Сделать дело', DateTime(2017, 2, 17)),
    _Model('Гулять смело', DateTime(2017, 2, 17)),
    _Model('Прочитать книгу', DateTime(2017, 2, 16)),
    _Model('Сходить на учёбу', DateTime(2017, 2, 15)),
  ];

  @override
  Widget build(BuildContext context) {
    var group = groupBy(mockModels(), (m) => m.date);

    return Scaffold(
      appBar: AppBar(
        title: const Text('App 6'),
      ),
      body: ListView.builder(
        itemCount: group.keys.length,
        itemBuilder: (context, i) {
          DateTime key = group.keys.elementAt(i);
          var children = group[key]!.map((e) => ListTile(title: Text(e.title),)).toList();
          return ExpansionTile(
            title: Text('${key.day}.${key.month}.${key.year}'),
            children: children,
          );
        },

      ),
    );
  }
}
