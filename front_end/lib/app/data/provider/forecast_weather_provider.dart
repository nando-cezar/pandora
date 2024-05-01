import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'package:pandora_front/app/data/model/forecast_weather_model.dart';

class ForecastWeatherProvider {
  final String _dataOpenWeatherUrl = dotenv.env['DATA_OPEN_WEATHER_URL']!;
  final _logger = Logger();

  Future<ForecastWeatherModel> getCurrentForecastWeather(
      double latitude,
      double longitude,
      String token
      ) async {

    final String apiUrl =
        '$_dataOpenWeatherUrl?'
        'lat=$latitude&'
        'lon=$longitude&'
        'appid=$token&'
        'units=metric';

    try {
      final http.Response response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        _logger.i("ForecastWeatherProvider: Successfully!");
        return ForecastWeatherModel.fromJson(jsonDecode(response.body));
      } else {
        _logger.e("Error log", error: response.statusCode);
        throw Exception('Failed to load weather data');
      }
    } catch (error) {
      _logger.e("Error log", error: error);
      throw Exception('Failed to load weather data');
    }
  }
}
