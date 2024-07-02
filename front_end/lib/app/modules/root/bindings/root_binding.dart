import 'package:get/get.dart';
import 'package:pandora_front/app/modules/root/controllers/root_controller.dart';

class RootBinding implements Bindings {
  @override
  void dependencies() {
    _registerControllers();
  }

  void _registerControllers() {
    Get.lazyPut<RootController>(
      () => RootController(),
    );
  }
}
