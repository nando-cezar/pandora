import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pandora_front/app/data/repository/position_repository.dart';


class PositionController extends GetxController {
  double _latitude = 0.0;
  double _longitude = 0.0;

  final PositionRepository positionRepository;

  PositionController({required this.positionRepository});

  getLocationData() async {
    if (getLatitude() == 0.0 && getLongitude() == 0.0) {
      final position = await positionRepository.getPosition();
      updateLatLng(position.latitude, position.longitude);
    } else {
      Get.snackbar(
        'info'.tr,
        'update_location'.tr,
        icon: const Icon(Icons.info_outline),
      );
    }
  }

  void updateLatLng(double newLatitude, double newLongitude){
    _latitude = newLatitude;
    _longitude = newLongitude;
  }

  double getLatitude() =>  _latitude;

  double getLongitude() =>  _longitude;

}
