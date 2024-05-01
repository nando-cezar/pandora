import 'package:get/get.dart';
import 'package:pandora_front/app/controller/map_controller.dart';
import 'package:pandora_front/app/data/repository/forecast_tile_repository.dart';
import 'package:pandora_front/app/modules/world_map/controllers/forecast_tile_controller.dart';
import 'package:pandora_front/app/modules/world_map/controllers/world_map_controller.dart';

class WorldMapBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WorldMapController>(
      () => WorldMapController(
        repository: ForecastTileRepository(),
      ),
    );
    Get.lazyPut<ForecastTileController>(() => ForecastTileController());
    Get.lazyPut<MapController>(() => MapController());
  }
}
