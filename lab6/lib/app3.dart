import 'package:flutter/material.dart';
import 'package:xml/xml.dart';
import 'package:http/http.dart' as http;

class _Valute {
  final String name;
  final double value;

  const _Valute(this.name, this.value);
}

class App3 extends StatefulWidget {
  const App3({Key? key}) : super(key: key);

  @override
  State<App3> createState() => _App3State();
}

class _App3State extends State<App3> {

  List<_Valute>? _valutes;

  @override
  void initState() {
    super.initState();

    _initValutes();
  }

  Future<void> _initValutes() async {
    final response = await http.get(Uri.http('www.cbr.ru', '/scripts/XML_daily_eng.asp'));
    if (response.statusCode != 200) {
      return;
    }

    var result = <_Valute>[];

    final document = XmlDocument.parse(response.body);
    final valCurs = document.findElements('ValCurs').first;
    final valutes = valCurs.findElements('Valute');
    for (final valute in valutes) {

      result.add(
        _Valute(
          valute.findElements('Name').first.text,
          double.parse(valute.findElements('Value').first.text.replaceAll(',', '.'))
        )
      );
    }

    setState(() {
      _valutes = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('App 3'),
      ),
      body: _valutes == null
          ? const Center(child: CircularProgressIndicator(),)
          : ListView.builder(
              itemCount: _valutes!.length,
              itemBuilder: (context, index)
                => ListTile(
                  title: Text(_valutes![index].name),
                  subtitle: Text(_valutes![index].value.toString()),
                ),
            ),
    );
  }
}
