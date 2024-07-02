import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'package:pandora_front/app/data/model/forecast_weather_model.dart';

class ForecastWeatherProvider {
  final String _dataOpenWeatherUrl = dotenv.env['DATA_OPEN_WEATHER_URL']!;
  final http.Client httpClient;
  final _logger = Logger();

  ForecastWeatherProvider({required this.httpClient});

  Future<ForecastWeatherModel> getCurrentForecastWeather(
      double latitude,
      double longitude,
      String token,
      ) async {
    final String apiUrl = '$_dataOpenWeatherUrl?'
        'lat=$latitude&'
        'lon=$longitude&'
        'appid=$token&units=metric';

    try {
      var response = await httpClient.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        _logInfo("Successfully fetched current forecast weather data.");
        return ForecastWeatherModel.fromJson(jsonDecode(response.body));
      } else {
        _handleError(response.statusCode);
      }
    } catch (error) {
      _handleError(error.toString());
    }

    // Em caso de erro, lançar uma exceção genérica
    throw Exception('error_load_data'.tr);
  }

  void _handleError(dynamic error) {
    _logger.e("ForecastWeatherProvider Error", error: error);
    throw Exception('error_load_data'.tr);
  }

  void _logInfo(String message) {
    _logger.i("ForecastWeatherProvider: $message");
  }
}
