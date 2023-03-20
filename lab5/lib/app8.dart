import 'package:flutter/material.dart';

class _Model {
  final String _title;
  final String _content;

  const _Model(this._title, this._content);

  String get content => _content;
  String get title => _title;
}

class App8 extends StatelessWidget {
  const App8({Key? key}) : super(key: key);

  List<_Model> _getModels() {
    return [
      const _Model('First', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.'),
      const _Model('Second', 'Aenean ut pretium lorem.'),
      const _Model('Third', 'Mauris sagittis odio ac eros porttitor, vitae malesuada ipsum pellentesque.')
    ];
  }

  @override
  Widget build(BuildContext context) {
    var models = _getModels();
    return DefaultTabController(
      length: models.length,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('App 8'),
          bottom: TabBar(
            tabs: models.map((e) => Tab(text: e.title,)).toList(),
          ),
        ),
        body: TabBarView(
          children: models.map((e) => Text(e.content)).toList(),
        ),
      ),
    );
  }
}
