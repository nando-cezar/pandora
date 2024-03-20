import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../controller/position_controller.dart';
import '../model/weather_model.dart';

class WeatherService {
  final PositionController _controllerPosition = Get.put(PositionController());
  static final String API_OPEN_WEATHER_MAP_URL = dotenv.env['API_OPEN_WEATHER_MAP_URL']!;
  final String apiOpenWeatherKey;

  WeatherService(this.apiOpenWeatherKey);

  Future<Weather>  getCurrentWeather() async {

    final String apiUrl =
        '$API_OPEN_WEATHER_MAP_URL?'
        'lat=${_controllerPosition.latitude.value}&'
        'lon=${_controllerPosition.longitude.value}&'
        'appid=$apiOpenWeatherKey&'
        'units=metric';

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
}
