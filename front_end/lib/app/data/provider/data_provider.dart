import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'package:pandora_front/app/data/model/extreme_event_wrapper.dart';

class DataProvider {
  final String _apiPandoraCorrelationUrl =
      dotenv.env['API_PANDORA_CORRELATION_URL']!;
  final String _apiPandoraKey = dotenv.env['API_PANDORA_KEY']!;
  final http.Client httpClient;
  final _logger = Logger();

  DataProvider({required this.httpClient});

  Future<ExtremeEventWrapper> getGeneralData(
    double latitude,
    double longitude,
    int pastDays,
    int forecastDays,
  ) async {
    final String apiUrl =
        '$_apiPandoraCorrelationUrl?'
        'Latitude=$latitude&'
        'Longitude=$longitude&'
        'Timezone=America/Sao_Paulo&'
        'PastDays=$pastDays&'
        'ForecastDays=$forecastDays&'
        'Token=$_apiPandoraKey';

    try {
      var response = await httpClient.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        _logInfo("Successfully fetched data from API.");
        return ExtremeEventWrapper.fromJson(jsonDecode(response.body));
      } else {
        _handleError(response.statusCode);
      }
    } catch (error) {
      _handleError(error.toString());
    }

    throw Exception('error_load_data'.tr);
  }

  void _handleError(dynamic error) {
    _logger.e("DataProvider Error", error: error);
    throw Exception('error_load_data'.tr);
  }

  void _logInfo(String message) {
    _logger.i("DataProvider: $message");
  }
}
