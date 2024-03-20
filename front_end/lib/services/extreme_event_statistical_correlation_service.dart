import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../controller/position_controller.dart';
import '../model/extreme_event_statistical_correlation_model.dart';

class ExtremeEventStatisticalCorrelationService {
  final PositionController _controllerPosition = Get.put(PositionController());
  static final String API_PANDORA_CORRELATION_URL = dotenv.env['API_PANDORA_CORRELATION_URL']!;
  final String apiPandoraKey;

  ExtremeEventStatisticalCorrelationService(this.apiPandoraKey);

  Future<ExtremeEventStatisticalCorrelation> getStatisticalCorrelation() async {
    Map<String, String> headers = {

    };

    final String apiUrl =
        '$API_PANDORA_CORRELATION_URL?'
        'Latitude=-12.8842389&'
        'Longitude=-38.4237578&'
        'Timezone=America/Sao_Paulo&'
        'PastDays=0&'
        'ForecastDays=5&'
        'Token=5d2c5c09e23ad9f7dc0600259554cee595256644';

    try {
      final http.Response response = await http.get(Uri.parse(apiUrl), headers: headers);
      print(response.statusCode);
      print(response.body);
      if (response.statusCode == 200) {
        return ExtremeEventStatisticalCorrelation.fromJson(jsonDecode(response.body));
      } else {
        throw Exception('Failed to load weather data: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to load weather data: $e');
    }
  }
}
