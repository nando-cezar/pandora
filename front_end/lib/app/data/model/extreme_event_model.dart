import 'package:flutter/material.dart';
import 'package:pandora_front/app/data/model/location_model.dart';
import 'package:pandora_front/app/data/model/region_greatest_recurrence_model.dart';
import 'package:pandora_front/app/data/model/site_greatest_recurrence_model.dart';


class ExtremeEventModel {
  int? code;
  String? codeFormatted;
  String? description;
  String? descriptionFormatted;
  List<String>? dataSource;
  List<LocationModel>? locations;
  List<SiteGreatestRecurrenceModel>? siteGreatestRecurrences;
  List<RegionGreatestRecurrenceModel>? regionGreatestRecurrences;
  double? mediumDuration;
  List<double>? probabilityOccurrence;
  int? totalLocationRecords;
  int? totalRecurrence;
  Color? color;
  bool isExpanded = false;

  ExtremeEventModel({
    required this.code,
    required this.codeFormatted,
    required this.description,
    required this.descriptionFormatted,
    required this.dataSource,
    required this.locations,
    required this.siteGreatestRecurrences,
    required this.regionGreatestRecurrences,
    required this.mediumDuration,
    required this.probabilityOccurrence,
    required this.totalLocationRecords,
    required this.totalRecurrence,
  });

  ExtremeEventModel.fromJson(dynamic data) {
    List<LocationModel> locationList = [];
    List<SiteGreatestRecurrenceModel> siteList = [];
    List<RegionGreatestRecurrenceModel> regionList = [];

    code = data['code'].toInt();
    codeFormatted = data['code_formatted'].toString();
    description = data['description'].toString();
    descriptionFormatted = data['description_formatted'].toString();
    dataSource = (data['data_source'] is List)
    ? List.from(data['data_source'])
        : [];
    for (var snapshot in (data['locations'] as List)) {
      var object = LocationModel.fromJson(snapshot, description!);
      locationList.add(object);
    }
    for (var snapshot in (data['site_greatest_recurrences'] as List)) {
      var object = SiteGreatestRecurrenceModel.fromJson(snapshot);
      siteList.add(object);
    }
    for (var snapshot in (data['region_greatest_recurrences'] as List)) {
      var object = RegionGreatestRecurrenceModel.fromJson(snapshot);
      regionList.add(object);
    }
    locations = locationList;
    siteGreatestRecurrences = siteList;
    regionGreatestRecurrences = regionList;
    mediumDuration = data['medium_duration'].toDouble();
    probabilityOccurrence = (data['probability_occurrence'] is List)
    ? List.from(data['probability_occurrence'])
        : [];
    totalLocationRecords = data['total_location_records'].toInt();
    totalRecurrence = data['total_recurrence'].toInt();
    color = _getColor(code!);
  }

  Object toJson() {
    final Map<String, Object> json = <String, Object>{};

    void addIfPresent(String fieldName, Object? value) {
      if (value != null) {
        json[fieldName] = value;
      }
    }

    addIfPresent('code', code);
    addIfPresent('codeFormatted', codeFormatted);
    addIfPresent('description', description);
    addIfPresent('descriptionFormatted', descriptionFormatted);
    addIfPresent('dataSource', dataSource);
    addIfPresent('locations', locations);
    addIfPresent('siteGreatestRecurrences', siteGreatestRecurrences);
    addIfPresent('regionGreatestRecurrences', regionGreatestRecurrences);
    addIfPresent('mediumDuration', mediumDuration);
    addIfPresent('probabilityOccurrence', probabilityOccurrence);
    addIfPresent('totalLocationRecords', totalLocationRecords);
    addIfPresent('totalRecurrence', totalRecurrence);

    return json;
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