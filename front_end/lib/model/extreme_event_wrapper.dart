import 'extreme_event _model.dart';

class ExtremeEventWrapper {
  final List<ExtremeEventModel> events;

  ExtremeEventWrapper({required this.events});

  factory ExtremeEventWrapper.fromJson(Map<String, dynamic> json) {
    List<ExtremeEventModel> eventList = [];

    if (json.containsKey('content') && json['content'] is List) {
      json['content'].forEach((item) {
        ExtremeEventModel event = ExtremeEventModel(
          code: item['code'].toInt(),
          code_formatted: item['code_formatted'].toString(),
          description: item['description'].toString(),
          description_formatted: item['description_formatted'].toString(),
          data_source: (item['data_source'] is List)
              ? List.from(item['data_source'])
              : [],
          mean: (item['central_measurement_data']['mean'] is Map)
              ? Map<String, double>.from(item['central_measurement_data']['mean'])
              : {},
          site_greatest_recurrence: (item['site_greatest_recurrence'] is Map)
              ? Map<String, dynamic>.from(item['site_greatest_recurrence'])
              : {},
          medium_duration: item['medium_duration'].toDouble(),
          probability_occurrence: item['probability_occurrence'].toDouble(),
          total_location_records: item['total_location_records'].toInt(),
          total_recurrence: item['total_recurrence'].toInt(),
        );
        eventList.add(event);
      });
    }

    return ExtremeEventWrapper(events: eventList);
  }
}