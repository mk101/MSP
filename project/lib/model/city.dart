
class City {
  final double lat;
  final double lon;

  final String name;
  final String country;

  const City({required this.lat, required this.lon, required this.name, required this.country});

  bool isValid() => name != '__Null__';

  /// @param json should be first element of api response array
  /// {@see https://openweathermap.org/api/geocoding-api} API response example
  factory City.fromJson(Map<String, dynamic> json) {
    return City(
        lat: json['lat'] ?? 0.0,
        lon: json['lon'] ?? 0.0,
        name: json['name'] ?? '__Null__',
        country: json['country'] ?? '__Null__'
    );
  }
}