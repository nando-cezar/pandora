import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pandora_front/app/data/repository/local_data_repository.dart';
import 'package:pandora_front/app/data/repository/position_repository.dart';

class PositionController extends GetxController {

  final PositionRepository positionRepository;
  final LocalDataRepository localDataRepository;

  PositionController({
    required this.positionRepository,
    required this.localDataRepository,
  });

  getLocationData() async {
    if (getLatitude() == 1.0 && getLongitude() == 1.0) {
      final position = await positionRepository.getPosition();
      updateLatitude(position.latitude);
      updateLongitude(position.longitude);
    } else {
      Get.snackbar(
        'info'.tr,
        'update_location'.tr,
        icon: const Icon(Icons.info_outline),
      );
    }
  }

  updateLatitude(double value) => localDataRepository.saveDouble('latitude', value);

  updateLongitude(double value) => localDataRepository.saveDouble('longitude', value);

  double getLatitude() => localDataRepository.getDouble('latitude');

  double getLongitude() => localDataRepository.getDouble('longitude');
}
