import 'dart:convert';

import 'package:project/secrets.dart';

import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:http/http.dart' as http;

import 'package:project/model/city.dart';
import 'package:project/model/weather.dart';
import 'package:project/page/search.dart';

class HomePage extends StatefulWidget {
  final City? city;

  const HomePage({Key? key, this.city}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Weather? _weather;
  List<Weather>? _futureWeather;

  String _temperatureSign = '°C';

  final _textStyle = const TextStyle(
    fontSize: 20.0
  );

  @override
  void initState() {
    super.initState();

    if (widget.city == null) {
      () async {
        Location location = new Location();
        bool serviceEnabled;
        PermissionStatus _permissionGranted;
        LocationData _locationData;

        serviceEnabled = await location.serviceEnabled();
        if (!serviceEnabled) {
          serviceEnabled = await location.requestService();
          if (!serviceEnabled) {
            return;
          }
        }

        _permissionGranted = await location.hasPermission();
        if (_permissionGranted == PermissionStatus.denied) {
          _permissionGranted = await location.requestPermission();
          if (_permissionGranted != PermissionStatus.granted) {
            return;
          }
        }

        _locationData = await location.getLocation();

        Uri uri = Uri.parse('https://api.openweathermap.org/data/2.5/weather?lat=${_locationData.latitude}&lon=${_locationData.longitude}&appid=$weatherApiKey&units=metric');

        Uri fUri = Uri.parse('https://api.openweathermap.org/data/2.5/forecast?lat=${_locationData.latitude}&lon=${_locationData.longitude}&appid=$weatherApiKey&units=metric');


        final forecast = jsonDecode((await http.get(fUri)).body);
        final w = (forecast['list'] as List).map((e) => Weather.fromJson(e)).toList();
        final _w = Weather.fromJson(jsonDecode((await http.get(uri)).body));
        setState(() {
          _weather = _w;
          _futureWeather = w;
        });
      }
      ();
      return;
    }

    () async {
      Uri uri = Uri.parse('https://api.openweathermap.org/data/2.5/weather?lat=${widget.city!.lat}&lon=${widget.city!.lon}&appid=$weatherApiKey&units=metric');

      Uri fUri = Uri.parse('https://api.openweathermap.org/data/2.5/forecast?lat=${widget.city!.lat}&lon=${widget.city!.lon}&appid=$weatherApiKey&units=metric');


      final forecast = jsonDecode((await http.get(fUri)).body);
      final w = (forecast['list'] as List).map((e) => Weather.fromJson(e)).toList();
      final _w = Weather.fromJson(jsonDecode((await http.get(uri)).body));
      setState(() {
        _weather = _w;
        _futureWeather = w;
      });
    } ();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _weather == null || _futureWeather == null ? const Center(child: CircularProgressIndicator(),) :  CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            floating: false,
            snap: false,
            expandedHeight: 260.0,
            title: Text(widget.city != null ? widget.city!.name : _weather!.name),
            centerTitle: true,
            flexibleSpace: FlexibleSpaceBar(
              background: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.only(top: 48.0, left: 8.0, right: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${_weather!.temperature > 0 ? '+' : ''}${_weather!.temperature.round()}$_temperatureSign',
                        style: const TextStyle(fontSize: 42.0, fontWeight: FontWeight.bold),
                      ),
                      Text(_weather!.type, style: _textStyle,),
                      Text('Feels like ${_weather!.feelsLike > 0 ? '+' : ''}${_weather!.feelsLike}$_temperatureSign', style: _textStyle,),
                      Text('Pressure ${_weather!.pressure} hPa', style: _textStyle,),
                      Text('Humidity ${_weather!.humidity}%', style: _textStyle,),
                      Text('Wing ${_weather!.windSpeed} m/s ${_weather!.windDeg}°', style: _textStyle,)
                    ],
                  ),
                ),
              ),
            ),
            actions: <Widget>[
              widget.city == null ? IconButton(
                icon: const Icon(Icons.search),
                onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const SearchPage())),
              ) : Container(),
            ],
          ),
          SliverList(delegate: SliverChildBuilderDelegate(
              childCount: _futureWeather!.length,
                  (context, index) => ExpansionTile(
                    title: Text('${_futureWeather![index].time.day}.${_futureWeather![index].time.month} ${_futureWeather![index].time.hour}:${_futureWeather![index].time.minute}  ${_futureWeather![index].temperature > 0 ? '+' : ''}${_futureWeather![index].temperature.round()}$_temperatureSign  ${_futureWeather![index].type}'),
                    leading: Image.network('http://openweathermap.org/img/w/${_futureWeather![index].icon}.png'),
                    children: [
                      Text('Feels like ${_futureWeather![index].feelsLike > 0 ? '+' : ''}${_futureWeather![index].feelsLike}$_temperatureSign'),
                      Text('Pressure ${_futureWeather![index].pressure} hPa'),
                      Text('Humidity ${_futureWeather![index].humidity}%'),
                      Text('Wing ${_futureWeather![index].windSpeed} m/s ${_futureWeather![index].windDeg}°')
                    ],
              )),
          )
        ],
      ),
    );
  }
}

