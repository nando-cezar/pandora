import 'package:pandora_front/model/probability_model.dart';

class ExtremeEventModel {
  int id;
  String description;
  Probability temperature_max;
  Probability temperature_min;
  Probability apparent_temperature_max;
  Probability apparent_temperature_min;
  Probability precipitation_sum;
  Probability rain_sum;
  Probability snowfall_sum;
  Probability precipitation_hours;
  Probability wind_speed_10m_max;

  bool isExpanded;

  ExtremeEventModel({
    required this.id,
    required this.description,
    required this.temperature_max,
    required this.temperature_min,
    required this.apparent_temperature_max,
    required this.apparent_temperature_min,
    required this.precipitation_sum,
    required this.rain_sum,
    required this.snowfall_sum,
    required this.precipitation_hours,
    required this.wind_speed_10m_max,
    this.isExpanded = false,
  });

  static List<ExtremeEventModel> generateItems(int numberOfItems) {
    return List<ExtremeEventModel>.generate(numberOfItems, (index) {
      return ExtremeEventModel(
        id: index + 1,
        description: 'Extreme Event ${index + 1}',
        temperature_max: Probability(
          mean: 11.0,
          median: 11.0,
          mode: 11.0,
          max: 990.0,
          min: -1.80,
        ),
        temperature_min: Probability(
          mean: 11.0,
          median: 11.0,
          mode: 11.0,
          max: 990.0,
          min: -1.80,
        ),
        apparent_temperature_max: Probability(
          mean: 11.0,
          median: 11.0,
          mode: 11.0,
          max: 990.0,
          min: -1.80,
        ),
        apparent_temperature_min: Probability(
          mean: 11.0,
          median: 11.0,
          mode: 11.0,
          max: 990.0,
          min: -1.80,
        ),
        precipitation_sum: Probability(
          mean: 11.0,
          median: 11.0,
          mode: 11.0,
          max: 990.0,
          min: -1.80,
        ),
        rain_sum: Probability(
          mean: 11.0,
          median: 11.0,
          mode: 11.0,
          max: 990.0,
          min: -1.80,
        ),
        snowfall_sum: Probability(
          mean: 11.0,
          median: 11.0,
          mode: 11.0,
          max: 990.0,
          min: -1.80,
        ),
        precipitation_hours: Probability(
          mean: 11.0,
          median: 11.0,
          mode: 11.0,
          max: 990.0,
          min: -1.80,
        ),
        wind_speed_10m_max: Probability(
          mean: 11.0,
          median: 11.0,
          mode: 11.0,
          max: 990.0,
          min: -1.80,
        ),
      );
    });
  }
}
