import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pandora_front/app/data/repository/position_repository.dart';


class PositionController extends GetxController {
  double latitude = 0.0;
  double longitude = 0.0;

  final PositionRepository positionRepository;

  PositionController({required this.positionRepository});

  getLocationData() async {
    if (getLatitude() == 0.0 && getLongitude() == 0.0) {
      final position = await positionRepository.getPosition();
      updateLatLng(position.latitude, position.longitude);
    } else {
      Get.snackbar(
        'Information',
        'Updated location',
        icon: const Icon(Icons.info_outline),
      );
    }
  }

  void updateLatLng(double newLatitude, double newLongitude){
    latitude = newLatitude;
    longitude = newLongitude;
  }

  double getLatitude() =>  latitude;

  double getLongitude() =>  longitude;

}
