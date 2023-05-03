import 'dart:convert';
import 'package:project/secrets.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:project/model/city.dart';
import 'package:project/page/home.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<City> _cities = [];
  late TextEditingController _controller;

  @override
  void initState() {
    _controller = TextEditingController();
    super.initState();
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
        title: const Text('Search'),
      ),
      body: ListView(
        children: [
          TextField(
            controller: _controller,
            decoration: const InputDecoration(
              icon: Icon(Icons.search),
              hintText: 'Type city\'s name'
            ),
          ),
          ..._cities.map((e) => ListTile(
            title: Text('${e.name}, ${e.country}'),
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(city: e,))),
          ))
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: Text('Search'),
        icon: Icon(Icons.search),
        onPressed: () async {
          String name = _controller.text.trim();
          if (name.isEmpty) {
            return;
          }

          Uri uri = Uri.parse('http://api.openweathermap.org/geo/1.0/direct?q=$name&limit=10&appid=$weatherApiKey');
          final response = await http.get(uri);
          final json = jsonDecode(response.body);

          setState(() {
            _cities = (json as List).map((e) => City.fromJson(e)).toList();
          });
        },
      ),
    );
  }
}

