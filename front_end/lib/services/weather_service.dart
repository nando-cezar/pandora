import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import '../model/weather_model.dart';

class WeatherService {
  static String API_OPEN_WEATHER_MAP_URL = dotenv.env['API_OPEN_WEATHER_MAP_URL']!;
  final String apiOpenWeatherKey;

  WeatherService(this.apiOpenWeatherKey);

  Future<Weather> getCurrentWeather() async {
    final Position position = await _getPosition();
    final String apiUrl = '$API_OPEN_WEATHER_MAP_URL?lat=${position.latitude}&lon=${position.longitude}&appid=$apiOpenWeatherKey&units=metric';

    try {
      final http.Response response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        return Weather.fromJson(jsonDecode(response.body));
      } else {
        throw Exception('Failed to load weather data: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to load weather data: $e');
    }
  }

  Future<Position> _getPosition() async {
    LocationPermission permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    return Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
  }
}
