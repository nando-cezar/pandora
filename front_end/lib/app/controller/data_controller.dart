import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pandora_front/app/controller/position_controller.dart';
import 'package:pandora_front/app/data/model/extreme_event_model.dart';
import 'package:pandora_front/app/data/repository/auth_repository.dart';
import 'package:pandora_front/app/data/repository/data_repository.dart';
import 'package:pandora_front/app/data/repository/local_data_repository.dart';

class DataController extends GetxController {
  final AuthRepository authRepository;
  final PositionController positionController;
  final DataRepository dataRepository;
  final LocalDataRepository localDataRepository;
  List<ExtremeEventModel> _items = <ExtremeEventModel>[];

  DataController({
    required this.dataRepository,
    required this.authRepository,
    required this.positionController,
    required this.localDataRepository,
  });

  Future<void> getGeneralData() async {
    await positionController.getLocationData();

    print(localDataRepository.getDouble('latitude'));
    print(localDataRepository.getDouble('longitude'));
    print(localDataRepository.getInt('pastDays'));
    print(localDataRepository.getInt('forecastDays'));

    await dataRepository
        .getGeneralData(
      latitude: localDataRepository.getDouble('latitude'),
      longitude: localDataRepository.getDouble('longitude'),
      pastDays: localDataRepository.getInt('pastDays'),
      forecastDays: localDataRepository.getInt('forecastDays'),
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
    localDataRepository.saveInt('pastDays', value);
  }

  updateForecastDays(int value) {
    localDataRepository.saveInt('forecastDays', value);
  }

  updateItems(List<ExtremeEventModel> items) => _items = items;

  double getPastDays() => localDataRepository.getInt('pastDays').toDouble();

  double getForecastDays() => localDataRepository.getInt('forecastDays').toDouble();

  List<ExtremeEventModel> getItems() => _items;

  ExtremeEventModel getItem(int i) => _items[i];
}
