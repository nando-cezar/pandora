import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'package:pandora_front/app/data/model/extreme_event_wrapper.dart';

class DataProvider {
  final String _apiPandoraCorrelationUrl = dotenv.env['API_PANDORA_CORRELATION_URL']!;
  final String _apiPandoraKey = dotenv.env['API_PANDORA_KEY']!;
  final _logger = Logger();

  Future<ExtremeEventWrapper> getGeneralData(
      double latitude,
      double longitude,
      int pastDays,
      int forecastDays
      ) async {
    final String apiUrl = '$_apiPandoraCorrelationUrl?'
        'Latitude=$latitude&'
        'Longitude=$longitude&'
        'Timezone=America/Sao_Paulo&'
        'PastDays=$pastDays&'
        'ForecastDays=$forecastDays&'
        'Token=$_apiPandoraKey';

    try {
      final http.Response response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        _logger.i("DataProvider: Successfully!");
        return ExtremeEventWrapper.fromJson(jsonDecode(response.body));
      } else {
        _logger.e("Error log", error: response.statusCode);
        throw Exception('error_load_data'.tr);
      }
    } catch (error) {
      _logger.e("Error log", error: error);
      throw Exception('error_load_data'.tr);
    }
  }
}
