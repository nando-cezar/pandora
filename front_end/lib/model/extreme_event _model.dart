import 'package:flutter/material.dart';

class ExtremeEventModel {
  final int code;
  final String codeFormatted;
  final String description;
  final String descriptionFormatted;
  final List<String> dataSource;
  final Map<String, double> mean;
  final Map<String, dynamic> siteGreatestRecurrence;
  final String regionGreatestRecurrence;
  final int totalRecordsRegionGreatestRecurrence;
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
    required this.mean,
    required this.siteGreatestRecurrence,
    required this.regionGreatestRecurrence,
    required this.totalRecordsRegionGreatestRecurrence,
    required this.mediumDuration,
    required this.probabilityOccurrence,
    required this.totalLocationRecords,
    required this.totalRecurrence,
    required this.color,
    this.isExpanded = false
  });
}