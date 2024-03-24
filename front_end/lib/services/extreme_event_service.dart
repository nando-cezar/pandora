import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:pandora_front/components/bar_graph/individual_bar.dart';
import '../components/bar_graph/bar_data.dart';
import '../controller/position_controller.dart';
import '../model/extreme_event_statistical_correlation_model.dart';

class ExtremeEventStatisticalCorrelationService {
  final PositionController _controllerPosition = Get.put(PositionController());
  static final String API_PANDORA_CORRELATION_URL = dotenv.env['API_PANDORA_CORRELATION_URL']!;
  final String apiPandoraKey;

  ExtremeEventStatisticalCorrelationService(this.apiPandoraKey);

  Future<List<IndividualBar>> getStatisticalCorrelation() async {

    final String apiUrl =
        '$API_PANDORA_CORRELATION_URL?'
        'Latitude=${_controllerPosition.latitude.value}&'
        'Longitude=${_controllerPosition.longitude.value}&'
        'Timezone=America/Sao_Paulo&'
        'PastDays=0&'
        'ForecastDays=5&'
        'Token=$apiPandoraKey';

    try {
      final http.Response response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        var data = ExtremeEventStatisticalCorrelation.fromJson(jsonDecode(response.body));
        var myBarData = BarData(
          cold_wave: data.cold_wave,
          flash_flood: data.flash_flood,
          flood_general: data.flood_general,
          heat_wave: data.heat_wave,
          riverine_flood: data.riverine_flood,
          storm_general: data.storm_general,
          tropical_cyclone: data.tropical_cyclone,
        );

        return myBarData.initializeBarData();
      } else {
        throw Exception('Failed to load data: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to load data: $e');
    }
  }
}
