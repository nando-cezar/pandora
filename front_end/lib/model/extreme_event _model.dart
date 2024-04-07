import 'package:flutter/material.dart';

import 'site_greatest_recurrence_model.dart';
import 'region_greatest_recurrence_model.dart';
import 'location_model.dart';

class ExtremeEventModel {
  final int code;
  final String codeFormatted;
  final String description;
  final String descriptionFormatted;
  final List<String> dataSource;
  final List<Location> locations;
  final List<SiteGreatestRecurrence> siteGreatestRecurrences;
  final List<RegionGreatestRecurrence> regionGreatestRecurrences;
  final Map<String, double> average;
  final double mediumDuration;
  final double probabilityOccurrence;
  final int totalLocationRecords;
  final int totalRecurrence;
  final Color color;
  bool isExpanded;

  ExtremeEventModel({
    required this.code,
    required this.codeFormatted,
    required this.description,
    required this.descriptionFormatted,
    required this.dataSource,
    required this.locations,
    required this.siteGreatestRecurrences,
    required this.regionGreatestRecurrences,
    required this.average,
    required this.mediumDuration,
    required this.probabilityOccurrence,
    required this.totalLocationRecords,
    required this.totalRecurrence,
    required this.color,
    this.isExpanded = false
  });
}