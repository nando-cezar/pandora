import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MarkerModel {
  final String? id;
  final String? address;
  final String? type;
  final DateTime? timestamp;
  final double? latitude;
  final double? longitude;
  final String? icon;

  MarkerModel(
      {this.id,
      this.address,
      this.type,
      this.timestamp,
      this.latitude,
      this.longitude,
      this.icon});

  factory MarkerModel.fromFirestore(
    String type,
    DocumentSnapshot<Map<String, dynamic>> snapshot,
  ) {
    final data = snapshot.data();
    return MarkerModel(
      id: '${data?['id']}_${data?['position'].latitude}_${data?['position'].longitude}',
      address: data?['address'],
      type: type,
      timestamp: data?['timestamp'].toDate(),
      latitude: data?['position'].latitude,
      longitude: data?['position'].longitude,
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (id != null) "id": id,
      if (address != null) "address": address,
      if (type != null) "type": type,
      if (timestamp != null) "timestamp": timestamp,
      if (latitude != null) "latitude": latitude,
      if (longitude != null) "longitude": longitude,
      'icon': _getIcon(type!)
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
}
