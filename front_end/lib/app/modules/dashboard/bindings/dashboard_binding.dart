import 'package:get/get.dart';
import 'package:pandora_front/app/controller/data_controller.dart';
import 'package:pandora_front/app/controller/map_controller.dart';
import 'package:pandora_front/app/data/repository/data_repository.dart';
import 'package:pandora_front/app/modules/dashboard/controllers/dashboard_controller.dart';

class DashboardBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashboardController>(() => DashboardController());
    Get.lazyPut<MapController>(() => MapController());
    Get.lazyPut<DataController>(
      () => DataController(
        dataRepository: DataRepository(),
      ),
    );
  }
}
