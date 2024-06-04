import 'package:get/get.dart';
import 'package:pandora_front/app/controller/position_controller.dart';
import 'package:pandora_front/app/data/provider/forecast_weather_provider.dart';
import 'package:pandora_front/app/data/repository/forecast_weather_repository.dart';
import 'package:pandora_front/app/data/repository/position_repository.dart';
import 'package:pandora_front/app/modules/forecast_weather/controllers/forecast_weather_controller.dart';
import 'package:http/http.dart' as http;

class ForecastWeatherBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ForecastWeatherController>(
      () => ForecastWeatherController(
        forecastWeatherRepository: ForecastWeatherRepository(
          forecastWeatherProvider: ForecastWeatherProvider(
            httpClient: http.Client(),
          ),
        ),
      ),
    );
    Get.lazyPut<PositionController>(
      () => PositionController(
        positionRepository: PositionRepository(),
      ),
    );
  }
}
