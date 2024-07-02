import 'package:get/get.dart';
import 'package:pandora_front/app/modules/initial/controllers/initial_controller.dart';

class InitialBinding implements Bindings {
  @override
  void dependencies() {
    _registerControllers();
  }

  void _registerControllers() {
    Get.lazyPut<InitialController>(
      () => InitialController(),
    );
  }
}
