import 'package:flutter/material.dart';
import 'package:pandora_front/model/marker_model.dart';

import 'extreme_event _model.dart';

class ExtremeEventWrapper {
  final List<ExtremeEventModel> events;

  ExtremeEventWrapper({required this.events});

  factory ExtremeEventWrapper.fromJson(Map<String, dynamic> json) {
    List<ExtremeEventModel> eventList = [];

    if (json.containsKey('content') && json['content'] is List) {
      json['content'].forEach((item) {
        List<MarkerModel> locationMarkers = [];
        (item['locations'] as List).forEach((location) {
          MarkerModel marker = MarkerModel(
            id: '${location['id']}_${location['latitude'].toDouble()}_${location['longitude'].toDouble()}',
            address: location['address'],
            type: item['description'].toString(),
            latitude: location['latitude'].toDouble(),
            longitude: location['longitude'].toDouble(),
          );
          locationMarkers.add(marker);
        });

        ExtremeEventModel event = ExtremeEventModel(
            code: item['code'].toInt(),
            codeFormatted: item['code_formatted'].toString(),
            description: item['description'].toString(),
            descriptionFormatted: item['description_formatted'].toString(),
            dataSource: (item['data_source'] is List)
                ? List.from(item['data_source'])
                : [],
            locations: locationMarkers,
            mean: (item['central_measurement_data']['mean'] is Map)
                ? Map<String, double>.from(
                    item['central_measurement_data']['mean'])
                : {},
            siteGreatestRecurrence: (item['site_greatest_recurrence'] is Map)
                ? Map<String, dynamic>.from(item['site_greatest_recurrence'])
                : {},
            mediumDuration: item['medium_duration'].toDouble(),
            probabilityOccurrence: item['probability_occurrence'].toDouble(),
            totalLocationRecords: item['total_location_records'].toInt(),
            totalRecurrence: item['total_recurrence'].toInt(),
            regionGreatestRecurrence:
                item['region_greatest_recurrence']['region'].toString(),
            totalRecordsRegionGreatestRecurrence:
                item['region_greatest_recurrence']['recurrence'].toInt(),
            color: _getColor(item['code'].toInt()));
        eventList.add(event);
      });
    }
    return ExtremeEventWrapper(events: eventList);
  }

  static Color _getColor(int code) {
    switch (code) {
      case 0:
        return Colors.blue;
      case 1:
        return Colors.cyan;
      case 2:
        return Colors.redAccent;
      case 3:
        return Colors.orangeAccent;
      case 4:
        return Colors.black45;
      case 5:
        return Colors.purpleAccent;
      case 6:
        return Colors.green;
      default:
        return Colors.yellow;
    }
  }
}
