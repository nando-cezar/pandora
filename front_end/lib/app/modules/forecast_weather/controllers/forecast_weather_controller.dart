import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:pandora_front/app/controller/local_data_controller.dart';
import 'package:pandora_front/app/controller/position_controller.dart';
import 'package:pandora_front/app/data/model/forecast_weather_model.dart';
import 'package:pandora_front/app/data/repository/forecast_weather_repository.dart';

class ForecastWeatherController extends GetxController {
  final ForecastWeatherRepository repository;
  final PositionController positionController;
  final LocalDataController localDataController;
  ForecastWeatherModel forecastWeatherModel = ForecastWeatherModel.mock();

  static String dataOpenWeatherKey = dotenv.env['DATA_OPEN_WEATHER_KEY']!;

  ForecastWeatherController({
    required this.repository,
    required this.positionController,
    required this.localDataController,
  });

  Future<void> getCurrentForecastWeather() async {
    var position = await positionController.getLocationData();

    if (localDataController.getLatitude() == 1.0 && localDataController.getLongitude() == 1.0) {
      localDataController.updateLatitude(position.latitude);
      localDataController.updateLongitude(position.longitude);
    }

    await repository
        .getCurrentForecastWeather(
      latitude: localDataController.getLatitude(),
      longitude: localDataController.getLongitude(),
      token: dataOpenWeatherKey,
    )
        .then((value) {
      Get.snackbar(
        'success'.tr,
        'success_message'.tr,
        icon: const Icon(Icons.check),
      );
      _updateData(value);
    }).catchError((e) {
      Get.snackbar(
        'error'.tr,
        e.toString(),
        icon: const Icon(Icons.cancel_outlined),
      );
    });
  }

  void _updateData(ForecastWeatherModel value) {
    forecastWeatherModel = value;
  }
}
