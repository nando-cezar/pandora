import 'package:get/get.dart';
import 'package:pandora_front/app/controller/map_controller.dart';
import 'package:pandora_front/app/controller/position_controller.dart';
import 'package:pandora_front/app/data/provider/forecast_tile_provider.dart';
import 'package:pandora_front/app/data/provider/local_data_provider.dart';
import 'package:pandora_front/app/data/repository/forecast_tile_repository.dart';
import 'package:pandora_front/app/data/repository/local_data_repository.dart';
import 'package:pandora_front/app/data/repository/position_repository.dart';
import 'package:pandora_front/app/modules/world_map/controllers/forecast_tile_controller.dart';
import 'package:pandora_front/app/modules/world_map/controllers/world_map_controller.dart';
import 'package:http/http.dart' as http;

class WorldMapBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MapController>(() => MapController());
    Get.lazyPut<PositionController>(
      () => PositionController(
        positionRepository: PositionRepository(),
        localDataRepository: LocalDataRepository(
          localDataProvider: LocalDataProvider(),
        ),
      ),
    );
    Get.lazyPut<ForecastTileController>(() => ForecastTileController());
    Get.lazyPut<WorldMapController>(
      () => WorldMapController(
        repository: ForecastTileRepository(
          forecastTileProvider: ForecastTileProvider(
            httpClient: http.Client(),
          ),
        ),
        mapController: Get.find<MapController>(),
        positionController: Get.find<PositionController>(),
        forecastTileController: Get.find<ForecastTileController>(),
      ),
    );
  }
}
