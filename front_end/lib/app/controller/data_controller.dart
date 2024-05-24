import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pandora_front/app/controller/position_controller.dart';
import 'package:pandora_front/app/data/model/extreme_event_model.dart';
import 'package:pandora_front/app/data/repository/data_repository.dart';
import 'package:pandora_front/app/data/repository/position_repository.dart';

class DataController extends GetxController {
  List<ExtremeEventModel> _items = <ExtremeEventModel>[];
  int _pastDays = 1;
  int _forecastDays = 5;

  final positionController = Get.put(
    PositionController(
      positionRepository: PositionRepository(),
    ),
  );

  final DataRepository dataRepository;

  DataController({required this.dataRepository});

  Future<void> getGeneralData() async {
    await positionController.getLocationData();
    await dataRepository
        .getGeneralData(
      latitude: positionController.getLatitude(),
      longitude: positionController.getLongitude(),
      pastDays: _pastDays,
      forecastDays: _forecastDays,
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

  updatePastDays(int pastDays){
    _pastDays = pastDays;
  }

  updateForecastDays(int forecastDays){
    _forecastDays = forecastDays;
  }

  updateItems(List<ExtremeEventModel> items) => _items = items;

  double getPastDays() => _pastDays.toDouble();

  double getForecastDays() => _forecastDays.toDouble();

  List<ExtremeEventModel> getItems() => _items;

  ExtremeEventModel getItem(int i) => _items[i];

}
