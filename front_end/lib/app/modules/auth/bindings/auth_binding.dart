import 'package:get/get.dart';
import 'package:pandora_front/app/data/repository/auth_repository.dart';
import 'package:pandora_front/app/modules/auth/controllers/auth_controller.dart';

class AuthBinding implements Bindings {
  @override
  void dependencies() {
    _registerRepositories();
    _registerControllers();
  }

  void _registerRepositories() {
    Get.lazyPut<AuthRepository>(
      () => AuthRepository(),
    );
  }

  void _registerControllers() {
    Get.lazyPut<AuthController>(
      () => AuthController(
        repository: Get.find<AuthRepository>(),
      ),
    );
  }
}
