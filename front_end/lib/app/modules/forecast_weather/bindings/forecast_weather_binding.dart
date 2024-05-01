import 'package:get/get.dart';
import 'package:pandora_front/app/data/repository/forecast_weather_repository.dart';
import 'package:pandora_front/app/modules/forecast_weather/controllers/forecast_weather_controller.dart';

class ForecastWeatherBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ForecastWeatherController>(
      () => ForecastWeatherController(
        forecastWeatherRepository: ForecastWeatherRepository(),
      ),
    );
  }
}
