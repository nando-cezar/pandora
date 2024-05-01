class RegionGreatestRecurrenceModel {
  String? region;
  int? recurrence;

  RegionGreatestRecurrenceModel({
    required this.region,
    required this.recurrence,
  });

  RegionGreatestRecurrenceModel.fromJson(dynamic data) {
    region = data['region'];
    recurrence = data['recurrence'];
  }

  Object toJson() {
    final Map<String, Object> json = <String, Object>{};

    void addIfPresent(String fieldName, Object? value) {
      if (value != null) {
        json[fieldName] = value;
      }
    }

    addIfPresent('region', region);
    addIfPresent('recurrence', recurrence);

    return json;
  }
}
