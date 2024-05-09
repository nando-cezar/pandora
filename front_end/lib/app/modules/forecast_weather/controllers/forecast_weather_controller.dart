import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:pandora_front/app/controller/position_controller.dart';
import 'package:pandora_front/app/data/model/forecast_weather_model.dart';
import 'package:pandora_front/app/data/repository/forecast_weather_repository.dart';
import 'package:pandora_front/app/data/repository/position_repository.dart';

class ForecastWeatherController extends GetxController {
  ForecastWeatherModel forecastWeatherModel = ForecastWeatherModel.mock();

  static String dataOpenWeatherKey = dotenv.env['DATA_OPEN_WEATHER_KEY']!;
  final positionController = Get.put(
    PositionController(
      positionRepository: PositionRepository(),
    ),
  );
  final ForecastWeatherRepository forecastWeatherRepository;

  ForecastWeatherController({required this.forecastWeatherRepository});

  Future<void> getCurrentForecastWeather() async {
    await positionController.getLocationData();

    await forecastWeatherRepository
        .getCurrentForecastWeather(
      latitude: positionController.getLatitude(),
      longitude: positionController.getLongitude(),
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
