import 'package:get/get.dart';
import 'package:pandora_front/app/controller/data_controller.dart';
import 'package:pandora_front/app/controller/local_data_controller.dart';
import 'package:pandora_front/app/controller/map_controller.dart';
import 'package:pandora_front/app/controller/position_controller.dart';
import 'package:pandora_front/app/data/provider/data_provider.dart';
import 'package:pandora_front/app/data/provider/local_data_provider.dart';
import 'package:pandora_front/app/data/repository/data_repository.dart';
import 'package:pandora_front/app/data/repository/local_data_repository.dart';
import 'package:pandora_front/app/data/repository/position_repository.dart';
import 'package:pandora_front/app/modules/dashboard/controllers/dashboard_controller.dart';
import 'package:http/http.dart' as http;

class DashboardBinding implements Bindings {
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
    Get.lazyPut<DataRepository>(
      () => DataRepository(
        dataProvider: DataProvider(
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
    Get.lazyPut<DataController>(() => DataController(
          dataRepository: Get.find<DataRepository>(),
          positionController: Get.find<PositionController>(),
          localDataController: Get.find<LocalDataController>(),
        ));
    Get.lazyPut<MapController>(
      () => MapController(),
    );
    Get.lazyPut<DashboardController>(
      () => DashboardController(
        dataController: Get.find<DataController>(),
        mapController: Get.find<MapController>(),
      ),
    );
  }
}
