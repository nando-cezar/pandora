import 'package:get/get.dart';
import 'package:pandora_front/app/controller/local_data_controller.dart';
import 'package:pandora_front/app/controller/position_controller.dart';
import 'package:pandora_front/app/data/provider/forecast_weather_provider.dart';
import 'package:pandora_front/app/data/provider/local_data_provider.dart';
import 'package:pandora_front/app/data/repository/forecast_weather_repository.dart';
import 'package:pandora_front/app/data/repository/local_data_repository.dart';
import 'package:pandora_front/app/data/repository/position_repository.dart';
import 'package:pandora_front/app/modules/forecast_weather/controllers/forecast_weather_controller.dart';
import 'package:http/http.dart' as http;

class ForecastWeatherBinding implements Bindings {
  @override
  void dependencies() {
    _registerRepositories();
    _registerControllers();
  }

  void _registerRepositories() {
    Get.lazyPut<PositionRepository>(
      () => PositionRepository(),
    );
    Get.lazyPut<LocalDataRepository>(
      () => LocalDataRepository(
        localDataProvider: LocalDataProvider(),
      ),
    );
    Get.lazyPut<ForecastWeatherRepository>(
      () => ForecastWeatherRepository(
        forecastWeatherProvider: ForecastWeatherProvider(
          httpClient: http.Client(),
        ),
      ),
    );
  }

  void _registerControllers() {
    Get.lazyPut<PositionController>(
      () => PositionController(
        positionRepository: Get.find<PositionRepository>(),
      ),
    );
    Get.lazyPut<LocalDataController>(
      () => LocalDataController(
        localDataRepository: Get.find<LocalDataRepository>(),
      ),
    );
    Get.lazyPut<ForecastWeatherController>(
      () => ForecastWeatherController(
        repository: Get.find<ForecastWeatherRepository>(),
        positionController: Get.find<PositionController>(),
        localDataController: Get.find<LocalDataController>(),
      ),
    );
  }
}
