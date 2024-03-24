class ExtremeEventModel {
  final int code;
  final String code_formatted;
  final String description;
  final String description_formatted;
  final List<String> data_source;
  final Map<String, double> mean;
  final Map<String, dynamic> site_greatest_recurrence;
  final double medium_duration;
  final double probability_occurrence;
  final int total_location_records;
  final int total_recurrence;
  bool isExpanded;

  ExtremeEventModel({
    required this.code,
    required this.code_formatted,
    required this.description,
    required this.description_formatted,
    required this.data_source,
    required this.mean,
    required this.site_greatest_recurrence,
    required this.medium_duration,
    required this.probability_occurrence,
    required this.total_location_records,
    required this.total_recurrence,
    this.isExpanded = false
  });
}