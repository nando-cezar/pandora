class SiteGreatestRecurrenceModel {
  String? address;
  String? state;
  String? region;
  int? subtotalRecords;

  SiteGreatestRecurrenceModel({
    required this.address,
    required this.state,
    required this.region,
    required this.subtotalRecords,
  });

  SiteGreatestRecurrenceModel.fromJson(dynamic data){
    address = data['address'];
    state = data['state'];
    region = data['region'];
    subtotalRecords = data['subtotalRecords'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, Object>{};

    void addIfPresent(String fieldName, Object? value) {
      if (value != null) {
        json[fieldName] = value;
      }
    }

    addIfPresent('address', address);
    addIfPresent('state', state);
    addIfPresent('region', region);
    addIfPresent('subtotalRecords', subtotalRecords);

    return json;
  }
}
