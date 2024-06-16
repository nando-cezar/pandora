import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:pandora_front/app/controller/position_controller.dart';
import 'package:pandora_front/app/data/model/forecast_weather_model.dart';
import 'package:pandora_front/app/data/repository/forecast_weather_repository.dart';

class ForecastWeatherController extends GetxController {
  final ForecastWeatherRepository repository;
  final PositionController positionController;
  ForecastWeatherModel forecastWeatherModel = ForecastWeatherModel.mock();

  static String dataOpenWeatherKey = dotenv.env['DATA_OPEN_WEATHER_KEY']!;

  ForecastWeatherController({
    required this.repository,
    required this.positionController,
  });

  Future<void> getCurrentForecastWeather() async {
    var position = await positionController.getLocationData();

    await repository
        .getCurrentForecastWeather(
      latitude: position.latitude,
      longitude: position.longitude,
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
