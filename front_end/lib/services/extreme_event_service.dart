import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import '../model/extreme_event_wrapper.dart';

class ExtremeEventService {
  static final String API_PANDORA_CORRELATION_URL = dotenv.env['API_PANDORA_CORRELATION_URL']!;

  static Future<ExtremeEventWrapper> getGeneralData(double latitude, double longitude, String token) async {

    final String apiUrl =
        '$API_PANDORA_CORRELATION_URL?'
        'Latitude=$latitude&'
        'Longitude=$longitude&'
        'Timezone=America/Sao_Paulo&'
        'PastDays=0&'
        'ForecastDays=14&'
        'Token=$token';

    try {
      final http.Response response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        return ExtremeEventWrapper.fromJson(jsonDecode(response.body));
      } else {
        throw Exception('Failed to load data: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to load data: $e');
    }
  }
}
