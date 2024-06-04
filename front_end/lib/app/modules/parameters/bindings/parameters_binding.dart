import 'package:get/get.dart';
import 'package:pandora_front/app/controller/data_controller.dart';
import 'package:pandora_front/app/controller/position_controller.dart';
import 'package:pandora_front/app/data/provider/data_provider.dart';
import 'package:pandora_front/app/data/repository/data_repository.dart';
import 'package:pandora_front/app/data/repository/position_repository.dart';
import 'package:pandora_front/app/modules/parameters/controllers/parameters_controller.dart';
import 'package:http/http.dart' as http;

class ParamatersBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ParamatersController>(() => ParamatersController());
    Get.lazyPut(
      () => PositionController(
        positionRepository: PositionRepository(),
      ),
    );
    Get.lazyPut(
      () => DataController(
        dataRepository: DataRepository(
          dataProvider: DataProvider(
            httpClient: http.Client(),
          ),
        ),
      ),
    );
  }
}
