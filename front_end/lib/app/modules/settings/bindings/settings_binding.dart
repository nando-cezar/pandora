import 'package:get/get.dart';
import 'package:pandora_front/app/modules/auth/controllers/auth_controller.dart';
import 'package:pandora_front/app/modules/settings/controllers/settings_controller.dart';

class SettingsBinding implements Bindings {
  @override
  void dependencies() {
    _registerControllers();
  }

  void _registerControllers() {
    Get.lazyPut<SettingsController>(
      () => SettingsController(
        authController: Get.find<AuthController>(),
      ),
    );
  }
}
