class Location {
  final String? markerID;
  final String? uid;
  final String? address;
  final String? state;
  final String? region;
  final double? latitude;
  final double? longitude;
  final String? type;

  Location({
    this.markerID,
    this.uid,
    this.address,
    this.state,
    this.region,
    this.latitude,
    this.longitude,
    this.type,
  });

  Map<String, dynamic> toFirestore() {
    return {
      if (markerID != null) "markerID": markerID,
      if (uid != null) "uid": uid,
      if (address != null) "address": address,
      if (address != null) "state": state,
      if (address != null) "region": region,
      if (latitude != null) "latitude": latitude,
      if (longitude != null) "longitude": longitude,
      if (type != null) "type": type,
      'icon': _getIcon(type!),
      'image': _getImage(type!)
    };
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