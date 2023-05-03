
class Weather {
  final num temperature;
  final num feelsLike;

  final String type;

  final int pressure;
  final int humidity;

  final num windSpeed;
  final int windDeg;

  final DateTime time;
  final String name;

  final String icon;

  Weather({
    required this.temperature,
    required this.feelsLike,
    required this.type,
    required this.pressure,
    required this.humidity,
    required this.windSpeed,
    required this.windDeg,
    required this.time,
    required this.name,
    required this.icon
  });

  bool isValid() => type.isNotEmpty;

  /// {@see https://openweathermap.org/current} API response example
  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      temperature: json['main']['temp'] ?? 0.0,
      feelsLike: json['main']['feels_like'] ?? 0.0,
      type: json['weather'][0]['main'] ?? '',
      pressure: json['main']['pressure'] ?? 0,
      humidity: json['main']['humidity'] ?? 0,
      windSpeed: json['wind']['speed'] ?? 0.0,
      windDeg: json['wind']['deg'] ?? 0,
      time: DateTime.fromMillisecondsSinceEpoch(json['dt'] * 1000, isUtc: true),
      name: json['name'] ?? 'null',
      icon: json['weather'][0]['icon']
    );
  }
}
