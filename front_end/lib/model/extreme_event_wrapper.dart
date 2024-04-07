import 'package:flutter/material.dart';
import 'package:pandora_front/model/location_model.dart';
import 'package:pandora_front/model/region_greatest_recurrence_model.dart';
import 'package:pandora_front/model/site_greatest_recurrence_model.dart';
import 'package:uuid/uuid.dart';

import 'extreme_event _model.dart';

class ExtremeEventWrapper {
  final List<ExtremeEventModel> events;

  ExtremeEventWrapper({required this.events});

  factory ExtremeEventWrapper.fromJson(Map<String, dynamic> json) {
    List<ExtremeEventModel> eventList = [];

    if (json.containsKey('resource') && json['resource'] is List) {
      json['resource'].forEach((item) {
        List<Location> locationMarkers = [];
        for (var location in (item['locations'] as List)) {
          Location marker = Location(
            markerID: const Uuid().v4(),
            uid: location['id'],
            address: location['address'],
            state: location['state'],
            region: location['region'],
            latitude: location['latitude'].toDouble(),
            longitude: location['longitude'].toDouble(),
            type: item['description'].toString(),
          );
          locationMarkers.add(marker);
        }

        List<SiteGreatestRecurrence> siteGreatestRecurrences = [];
        for (var location in (item['site_greatest_recurrences'] as List)) {
          SiteGreatestRecurrence site = SiteGreatestRecurrence(
            address: location['address'],
            state: location['state'],
            region: location['region'],
            subtotalRecords: location['subtotal_records']
          );
          siteGreatestRecurrences.add(site);
        }

        List<RegionGreatestRecurrence> regionGreatestRecurrences = [];
        for (var location in (item['region_greatest_recurrences'] as List)) {
          RegionGreatestRecurrence region = RegionGreatestRecurrence(
              region: location['region'],
              recurrence: location['recurrence']
          );
          regionGreatestRecurrences.add(region);
        }

        ExtremeEventModel event = ExtremeEventModel(
            code: item['code'].toInt(),
            codeFormatted: item['code_formatted'].toString(),
            description: item['description'].toString(),
            descriptionFormatted: item['description_formatted'].toString(),
            dataSource: (item['data_source'] is List)
                ? List.from(item['data_source'])
                : [],
            locations: locationMarkers,
            average: (item['central_measurement_data']['mean'] is Map)
                ? Map<String, double>.from(
                item['central_measurement_data']['mean'])
                : {},
            siteGreatestRecurrences: siteGreatestRecurrences,
            mediumDuration: item['medium_duration'].toDouble(),
            probabilityOccurrence: item['probability_occurrence'].toDouble(),
            totalLocationRecords: item['total_location_records'].toInt(),
            totalRecurrence: item['total_recurrence'].toInt(),
            regionGreatestRecurrences: regionGreatestRecurrences,
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
