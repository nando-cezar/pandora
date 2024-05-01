import 'package:get/get.dart';
import 'package:pandora_front/app/modules/parameters/controllers/parameters_controller.dart';

class ParamatersBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ParamatersController>(() => ParamatersController());
  }
}
