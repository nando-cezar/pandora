import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../controller/position_controller.dart';
import '../model/weather_model.dart';

class WeatherService {
  final _controllerPosition = Get.put(PositionController());
  static final String dataOpenWeatherUrl = dotenv.env['DATA_OPEN_WEATHER_URL']!;
  final String apiOpenWeatherKey;

  WeatherService(this.apiOpenWeatherKey);

  Future<WeatherModel> getCurrentWeather() async {

    final String apiUrl =
        '$dataOpenWeatherUrl?'
        'lat=${_controllerPosition.getLatitude()}&'
        'lon=${_controllerPosition.getLongitude()}&'
        'appid=$apiOpenWeatherKey&'
        'units=metric';

    try {
      final http.Response response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        return WeatherModel.fromJson(jsonDecode(response.body));
      } else {
        throw Exception('Failed to load weather data: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to load weather data: $e');
    }
  }
}
