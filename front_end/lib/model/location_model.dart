class Location {
  final String address;
  final double latitude;
  final double longitude;

  Location({
    required this.address,
    required this.latitude,
    required this.longitude,
});

  factory Location.fromJson(Map<String, dynamic> json){

    final String city = json['results'][0]['components']['city'];
    final String state = json['results'][0]['components']['state'];
    final String country = json['results'][0]['components']['country'];

    return Location(
      address: "$city, $state, $country",
      latitude: json['results'][0]['geometry']['lat'].toDouble(),
      longitude: json['results'][0]['geometry']['lng'].toDouble(),
    );
  }


}