import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pandora_front/app/controller/local_data_controller.dart';
import 'package:pandora_front/app/controller/position_controller.dart';
import 'package:pandora_front/app/data/model/extreme_event_model.dart';
import 'package:pandora_front/app/data/repository/data_repository.dart';

class DataController extends GetxController {
  final PositionController positionController;
  final DataRepository dataRepository;
  final LocalDataController localDataController;
  List<ExtremeEventModel> _items = <ExtremeEventModel>[];

  DataController({
    required this.dataRepository,
    required this.positionController,
    required this.localDataController,
  });

  Future<void> getGeneralData() async {
    var position = await positionController.getLocationData();

    if (localDataController.getLatitude() == 1.0 && localDataController.getLongitude() == 1.0) {
      localDataController.updateLatitude(position.latitude);
      localDataController.updateLongitude(position.longitude);
    }

    await dataRepository
        .getGeneralData(
      latitude: localDataController.getLatitude(),
      longitude: localDataController.getLongitude(),
      pastDays: localDataController.getPastDays(),
      forecastDays: localDataController.getForecastDays(),
    )
        .then((value) async {
      updateItems(value.events);
      Get.snackbar(
        'success'.tr,
        'success_message'.tr,
        icon: const Icon(Icons.check),
      );
    }).catchError((e) {
      Get.snackbar(
        'error'.tr,
        e.toString(),
        icon: const Icon(Icons.cancel_outlined),
      );
    });
  }

  updatePastDays(int value) {
    localDataController.updatePastDays(value);
  }

  updateForecastDays(int value) {
    localDataController.updateForecastDays(value);
  }

  updateItems(List<ExtremeEventModel> items) => _items = items;

  double getPastDays() => localDataController.getPastDays().toDouble();

  double getForecastDays() => localDataController.getForecastDays().toDouble();

  List<ExtremeEventModel> getItems() => _items;

  ExtremeEventModel getItem(int i) => _items[i];
}
