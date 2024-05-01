import 'package:uuid/uuid.dart';

class LocationModel {
  String? markerID;
  String? uid;
  String? address;
  String? state;
  String? region;
  double? latitude;
  double? longitude;
  String? type;

  LocationModel({
    required this.markerID,
    required this.uid,
    required this.address,
    required this.state,
    required this.region,
    required this.latitude,
    required this.longitude,
    required this.type,
  });

  LocationModel.fromJson(dynamic data, String descriptionType){
    markerID = const Uuid().v4();
    uid = data['id'];
    address = data['address'];
    state = data['state'];
    region = data['region'];
    latitude = data['latitude'].toDouble();
    longitude = data['longitude'].toDouble();
    type = descriptionType;
  }

  Map<String, Object> toJson() {
    final Map<String, Object> json = <String, Object>{};

    void addIfPresent(String fieldName, Object? value) {
      if (value != null) {
        json[fieldName] = value;
      }
    }

    addIfPresent('markerID', markerID);
    addIfPresent('uid', uid);
    addIfPresent('address', address);
    addIfPresent('state', state);
    addIfPresent('region', region);
    addIfPresent('latitude', latitude);
    addIfPresent('longitude', longitude);
    addIfPresent('type', type);
    addIfPresent('icon', _getIcon(type!));
    addIfPresent('image', _getImage(type!));

    return json;
  }

  _getIcon(String target) {
    switch (target) {
      case 'Cold wave':
        return 'assets/images/marker_blue.png';
      case 'Flash flood':
        return 'assets/images/marker_turquoise.png';
      case 'Flood, General':
        return 'assets/images/marker_red.png';
      case 'Heat wave':
        return 'assets/images/marker_orange.png';
      case 'Riverine flood':
        return 'assets/images/marker_black.png';
      case 'Storm, General':
        return 'assets/images/marker_purple.png';
      case 'Tropical cyclone':
        return 'assets/images/marker_green.png';
      default:
        return 'assets/images/marker_yellow.png';
    }
  }

  _getImage(String target) {
    switch (target) {
      case 'Cold wave':
        return 'assets/images/extreme_events/cold_wave.jpeg';
      case 'Flash flood':
        return 'assets/images/extreme_events/flash_flood.jpg';
      case 'Flood, General':
        return 'assets/images/extreme_events/flood_general.jpg';
      case 'Heat wave':
        return 'assets/images/extreme_events/heat_wave.jpg';
      case 'Riverine flood':
        return 'assets/images/extreme_events/riverine_flood.png';
      case 'Storm, General':
        return 'assets/images/extreme_events/storm_general.jpeg';
      case 'Tropical cyclone':
        return 'assets/images/extreme_events/tropical_cyclone.jpg';
      default:
        return 'assets/images/extreme_events/weather.jpg';
    }
  }
}
